package app.sqzass.patches.all.spoofing

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.shared.constStringLoad
import app.sqzass.patches.shared.findConstArgInvokes
import app.sqzass.patches.shared.forceInvokeResult
import app.sqzass.patches.shared.methodReferenceOf
import app.sqzass.patches.shared.patchMatchingMethods
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import java.util.logging.Logger

private val logger = Logger.getLogger("DevOptionsAdbMaskPatch")

private val ADB_SETTING_KEYS = setOf("adb_enabled", "development_settings_enabled")
private val SETTINGS_READ_METHODS = setOf("getInt", "getString", "getLong")

// System properties whose values reveal an adb/debug capable build.
private val SYSTEM_PROPERTY_RESULTS = mapOf(
    "ro.debuggable" to "0",
    "ro.secure" to "1",
    "service.adb.root" to "0",
)

private fun isSettingsRead(instruction: Instruction): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass.startsWith("Landroid/provider/Settings$") &&
        reference.name in SETTINGS_READ_METHODS
}

private fun isSystemPropertiesGet(instruction: Instruction): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass == "Landroid/os/SystemProperties;" &&
        reference.name == "get" &&
        reference.returnType == "Ljava/lang/String;"
}

@Suppress("unused")
val devOptionsAdbMaskPatch = bytecodePatch(
    name = "Mask developer options and ADB state",
    description = "Hides developer state: reports adb_enabled and development settings as off and forces debug-revealing system properties to production values.",
    default = false,
) {
    category("Spoofing")

    val maskAdbOption = booleanOption(
        key = "maskAdbState",
        default = true,
        title = "Mask ADB State",
        description = "Force Settings reads of adb_enabled to report disabled.",
    )
    val maskDevSettingsOption = booleanOption(
        key = "maskDeveloperSettings",
        default = true,
        title = "Mask Developer Settings",
        description = "Force Settings reads of development_settings_enabled to report disabled.",
    )
    val maskSystemPropertiesOption = booleanOption(
        key = "maskSystemProperties",
        default = true,
        title = "Mask Debug System Properties",
        description = "Force ro.debuggable, ro.secure, and service.adb.root reads to report production values.",
    )

    execute {
        val maskAdb = maskAdbOption.value == true
        val maskDev = maskDevSettingsOption.value == true
        val maskProps = maskSystemPropertiesOption.value == true
        if (!maskAdb && !maskDev && !maskProps) {
            logger.info("All options disabled.")
            return@execute
        }

        val patched = patchMatchingMethods(
            isCandidate = { method ->
                method.implementation?.instructions?.let { raw ->
                    val instructions = raw.toList()
                    ((maskAdb || maskDev) && findConstArgInvokes(
                        instructions,
                        { ADB_SETTING_KEYS.contains(constStringLoad(it)) },
                        ::isSettingsRead,
                    ).isNotEmpty()) ||
                        (maskProps && SYSTEM_PROPERTY_RESULTS.keys.any { key ->
                            findConstArgInvokes(
                                instructions,
                                { constStringLoad(it) == key },
                                ::isSystemPropertiesGet,
                            ).isNotEmpty()
                        })
                } == true
            },
        ) { instructions ->
            var count = 0

            if (maskAdb || maskDev) {
                val forced = findConstArgInvokes(
                    instructions,
                    { ADB_SETTING_KEYS.contains(constStringLoad(it)) },
                    ::isSettingsRead,
                )
                for (index in forced.sortedDescending()) {
                    val returnType = methodReferenceOf(instructions.getOrNull(index) ?: continue)?.returnType
                    if (forceInvokeResult(instructions, index) { register ->
                            when (returnType) {
                                "J" -> "const-wide v$register, 0x0"
                                "Ljava/lang/String;" -> "const-string v$register, \"0\""
                                else -> "const/4 v$register, 0x0"
                            }
                        }
                    ) {
                        count++
                    }
                }
            }

            if (maskProps) {
                for ((key, result) in SYSTEM_PROPERTY_RESULTS) {
                    for (index in findConstArgInvokes(
                        instructions,
                        { constStringLoad(it) == key },
                        ::isSystemPropertiesGet,
                    ).sortedDescending()) {
                        if (forceInvokeResult(instructions, index) { register ->
                                "const-string v$register, \"$result\""
                            }
                        ) {
                            count++
                        }
                    }
                }
            }

            count
        }

        logger.info("Applied $patched developer state masking replacements.")
    }
}