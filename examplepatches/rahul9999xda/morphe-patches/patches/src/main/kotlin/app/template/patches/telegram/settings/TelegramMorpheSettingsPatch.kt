package app.template.patches.telegram.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.TelegramR8MorpheSettingsRowsNormalFingerprint
import app.template.patches.telegram.TelegramR8MorpheSettingsRowsWebFingerprint
import app.template.patches.telegram.signature.telegramSpoofDependency
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element

// Preserve historical fingerprints as an independent fallback.
private val telegramSettingsRowsLegacyFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/p91;", name = "b0", returnType = "V",
    parameters = listOf("Lorg/telegram/ui/p91;", "Ljava/util/ArrayList;"),
)
private val telegramWebSettingsRowsLegacyFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/t91;", name = "b0", returnType = "V",
    parameters = listOf("Lorg/telegram/ui/t91;", "Ljava/util/ArrayList;"),
)
private val postInitApplicationFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ApplicationLoader;", name = "postInitApplication",
    returnType = "V", parameters = emptyList(),
)
private val telegramApplicationOnCreateFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/t0;", name = "onCreate", returnType = "V", parameters = emptyList(),
)
private val telegramWebApplicationOnCreateFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/s0;", name = "onCreate", returnType = "V", parameters = emptyList(),
)

private val morpheSettingsActivityManifestPatch = resourcePatch(
    name = "Register Morphe Settings Activity",
    description = "Registers the in-app Morphe settings Activity in the target Telegram manifest.",
) {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            require(applications.length > 0) { "AndroidManifest.xml has no application element" }
            val application = applications.item(0) as Element
            val androidNs = "http://schemas.android.com/apk/res/android"
            val activityName = "app.template.extension.telegram.MorpheSettingsActivity"
            var found = false
            val children = application.childNodes
            for (i in 0 until children.length) {
                val element = children.item(i) as? Element ?: continue
                if (element.tagName == "activity" &&
                    element.getAttributeNS(androidNs, "name") == activityName) {
                    element.setAttributeNS(androidNs, "android:exported", "false")
                    element.setAttributeNS(androidNs, "android:launchMode", "singleTop")
                    found = true
                    break
                }
            }
            if (!found) {
                val activity = doc.createElement("activity")
                activity.setAttributeNS(androidNs, "android:name", activityName)
                activity.setAttributeNS(androidNs, "android:exported", "false")
                activity.setAttributeNS(androidNs, "android:launchMode", "singleTop")
                application.appendChild(activity)
            }
        }
    }
}

private fun settingsRowInstructions(componentClass: String, factoryMethod: String, contextField: String): String = """
    # v0 is reused by Telegram's builder and can contain a TextView at its
    # normal exit. Restore the original fragment from p0 before resolving its Activity.
    move-object/from16 v0, p0
    move-object/from16 v1, p1
    sget-object v4, $contextField:Landroid/content/Context;
    invoke-static {v0, v4}, Lapp/template/extension/telegram/MorpheSettingsEntry;->createSettingsRow(Ljava/lang/Object;Landroid/content/Context;)Landroid/view/View;
    move-result-object v0
    invoke-static {v0}, Lorg/telegram/ui/Components/$componentClass;->$factoryMethod(Landroid/view/View;)Lorg/telegram/ui/Components/$componentClass;
    move-result-object v2
    # v1 is the low-register alias of the ArrayList parameter (p1), copied
    # at the beginning of this static builder. Both verified methods keep v1
    # below the 35c invoke register limit (26 Android / 24 Web registers).
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
""".trimIndent()

/**
 * Add the row on every method exit. The audited current row builders each contain
 * two RETURN_VOID sites: one early exit and one normal completion. Insert in reverse
 * index order so earlier instruction indices remain stable.
 */

@Suppress("unused")
val telegramMorpheSettingsPatch = bytecodePatch(
    name = "Morphe Settings",
    description = "Adds Morphe Settings to Telegram Android and Telegram Web and initializes forwarding at startup.",
) {
    compatibleWith(TELEGRAM_COMPATIBILITY, TELEGRAM_WEB_COMPATIBILITY)
    // Morphe COPY uses Telegram's native copy/drop-author send path. It must receive
    // the same narrow noforwards bypass implementation as the standalone patch.
    dependsOn(telegramSpoofDependency(), morpheSettingsActivityManifestPatch)

    execute {
/**
 * Resolve the editable method through the patcher's mutable class API. Fingerprint.methodOrNull
 * returns a read-only Method in this Morphe Patcher version, so it must only be used to
 * establish that the target exists; mutations are performed on mutableClassDefBy(...).
 */
fun patchSettingsBuilder(
    targetClass: String,
    targetMethod: String,
    componentClass: String,
    factoryMethod: String,
    contextField: String,
    minRegisters: Int,
) {
    var targetFound = false
    classDefForEach { classDef ->
        if (classDef.type != targetClass) return@classDefForEach
        targetFound = true

        val mutableMethod = mutableClassDefBy(classDef).methods.firstOrNull { method ->
            method.name == targetMethod &&
                method.parameterTypes.map { it.toString() } == listOf(targetClass, "Ljava/util/ArrayList;") &&
                method.returnType == "V"
        } ?: error("Could not resolve editable settings builder $targetClass->$targetMethod")

        val implementation = requireNotNull(mutableMethod.instructionsOrNull) {
            "Settings builder $targetClass->$targetMethod has no implementation"
        }
        val returnIndexes = implementation.mapIndexedNotNull { index, instruction ->
            index.takeIf { instruction.opcode == Opcode.RETURN_VOID }
        }
        require(returnIndexes.size == 2) {
            "Unexpected $targetClass->$targetMethod control flow: expected 2 RETURN_VOID sites, found ${returnIndexes.size}"
        }
        require(mutableMethod.implementation!!.registerCount >= minRegisters) {
            "Unexpected $targetClass->$targetMethod register layout: expected at least $minRegisters registers, found ${mutableMethod.implementation!!.registerCount}"
        }
        val instructions = settingsRowInstructions(componentClass, factoryMethod, contextField)
        returnIndexes.asReversed().forEach { index ->
            mutableMethod.addInstructions(index, instructions)
        }
    }
    require(targetFound) { "Could not find Settings builder class $targetClass in the target APK" }
}


        val currentAndroid = TelegramR8MorpheSettingsRowsNormalFingerprint.methodOrNull
        val currentWeb = TelegramR8MorpheSettingsRowsWebFingerprint.methodOrNull
        val legacyAndroid = telegramSettingsRowsLegacyFingerprint.methodOrNull
        val legacyWeb = telegramWebSettingsRowsLegacyFingerprint.methodOrNull

        require(listOf(currentAndroid, currentWeb, legacyAndroid, legacyWeb).count { it != null } == 1) {
            "Could not uniquely resolve the Telegram Android/Web Morphe Settings row builder"
        }

        when {
            currentAndroid != null -> patchSettingsBuilder(
                "Lorg/telegram/ui/v41;", "f0", "k51", "m", "Lorg/telegram/messenger/t0;->b", 24,
            )
            currentWeb != null -> patchSettingsBuilder(
                "Lorg/telegram/ui/y41;", "f0", "j51", "m", "Lorg/telegram/messenger/s0;->b", 24,
            )
            currentAndroid == null && currentWeb == null && legacyAndroid != null && legacyWeb == null -> patchSettingsBuilder(
                "Lorg/telegram/ui/p91;", "b0", "r71", "l", "Lorg/telegram/messenger/ApplicationLoader;->applicationContext", 22,
            )
            currentAndroid == null && currentWeb == null && legacyWeb != null && legacyAndroid == null -> patchSettingsBuilder(
                "Lorg/telegram/ui/t91;", "b0", "g71", "l", "Lorg/telegram/messenger/ApplicationLoader;->applicationContext", 22,
            )
            else -> error("Could not uniquely resolve the Telegram Android or Telegram Web Morphe Settings row builder")
        }

        when {
            currentAndroid != null -> requireNotNull(telegramApplicationOnCreateFingerprint.methodOrNull) {
                "Missing Telegram Android Application.onCreate()V"
            }
            currentWeb != null -> requireNotNull(telegramWebApplicationOnCreateFingerprint.methodOrNull) {
                "Missing Telegram Web Application.onCreate()V"
            }
            else -> requireNotNull(postInitApplicationFingerprint.methodOrNull) {
                "Missing legacy ApplicationLoader.postInitApplication()V"
            }
        }
        val startupClass = when {
            currentAndroid != null -> "Lorg/telegram/messenger/t0;"
            currentWeb != null -> "Lorg/telegram/messenger/s0;"
            else -> "Lorg/telegram/messenger/ApplicationLoader;"
        }
        val startupName = if (currentAndroid != null || currentWeb != null) "onCreate" else "postInitApplication"
        var startupFound = false
        classDefForEach { classDef ->
            if (classDef.type != startupClass) return@classDefForEach
            startupFound = true
            val startupMethod = mutableClassDefBy(classDef).methods.firstOrNull {
                it.name == startupName && it.parameterTypes.isEmpty() && it.returnType == "V"
            } ?: error("Could not resolve editable startup method $startupClass->$startupName()V")
            val startupInstructions = requireNotNull(startupMethod.instructionsOrNull) {
                "Startup method $startupClass->$startupName()V has no implementation"
            }
            val startupReturnIndexes = startupInstructions.mapIndexedNotNull { index, instruction ->
                index.takeIf { instruction.opcode == Opcode.RETURN_VOID }
            }
            val startupReturnIndex = if (currentAndroid != null || currentWeb != null) {
                require(startupReturnIndexes.size == 2) {
                    "Unexpected current-R8 startup control flow: expected widget early-return plus normal RETURN_VOID, found ${startupReturnIndexes.size}"
                }
                // Current R8 Android/Web Application.onCreate have an early exit
                // followed by the normal app-start return. Inject only on normal startup.
                startupReturnIndexes.last()
            } else {
                require(startupReturnIndexes.size == 1) {
                    "Unexpected legacy ApplicationLoader.postInitApplication control flow: expected one RETURN_VOID, found ${startupReturnIndexes.size}"
                }
                startupReturnIndexes.single()
            }
            val runtimeInstallInstructions = when {
                currentAndroid != null -> """
                    const/4 v0, 0x0
                    invoke-static {v0}, Lapp/template/extension/telegram/MorpheForwardingRuntime;->install(I)V
                """.trimIndent()
                currentWeb != null -> """
                    const/4 v0, 0x1
                    invoke-static {v0}, Lapp/template/extension/telegram/MorpheForwardingRuntime;->install(I)V
                """.trimIndent()
                else -> "invoke-static {}, Lapp/template/extension/telegram/MorpheForwardingRuntime;->install()V"
            }
            // Insert at the validated normal return selected above, never at the
            // final instruction blindly: current-R8 methods have a throw handler.
            startupMethod.addInstructions(startupReturnIndex, runtimeInstallInstructions)
        }
        require(startupFound) { "Could not find Telegram Application startup class $startupClass" }
    }
}
