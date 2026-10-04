package com.dmoniak.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.Opcode
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import java.util.logging.Logger

@Suppress("unused")
val universalGmsCoreSupportPatch = bytecodePatch(
    name = "GmsCore (MicroG) Support (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Redirects Google Play Services (GMS) dependencies to GmsCore / MicroG (app.revanced.android.gms / org.microg.gms.core), enabling Google account login and push notifications on non-rooted devices for morphed Google and third-party apps.",
) {
    // Universal patch: Applies to any app requiring Google Play Services / MicroG redirection
    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUniversalGmsCoreSupportLogic(logger)
    }
}

private const val GMS_CORE_VENDOR_GROUP_ID = "app.revanced"
private const val GMS_CORE_PACKAGE = "app.revanced.android.gms"

private val EXACT_STRING_REPLACEMENTS = mapOf(
    // 1. Account type redirection:
    // Changing "com.google" to "app.revanced" routes AccountManager queries and account creation
    // to GmsCore rather than Android system settings, preventing "Account already exists" conflict.
    "com.google" to GMS_CORE_VENDOR_GROUP_ID,
    "com.google.android.gms" to GMS_CORE_PACKAGE,

    // 2. Content provider authorities:
    "com.google.android.gms.auth.accounts" to "$GMS_CORE_PACKAGE.auth.accounts",
    "com.google.android.gms.chimera" to "$GMS_CORE_PACKAGE.chimera",
    "com.google.android.gms.fonts" to "$GMS_CORE_PACKAGE.fonts",
    "com.google.android.gms.phenotype" to "$GMS_CORE_PACKAGE.phenotype",
    "com.google.android.gsf.gservices" to "$GMS_CORE_VENDOR_GROUP_ID.gsf.gservices",
    "com.google.android.gsf.subscribedfeeds" to "$GMS_CORE_VENDOR_GROUP_ID.gsf.subscribedfeeds",
    "com.google.settings" to "$GMS_CORE_VENDOR_GROUP_ID.settings",
)

private val AUTHORITIES = setOf(
    "com.google.android.gms.auth.accounts",
    "com.google.android.gms.chimera",
    "com.google.android.gms.fonts",
    "com.google.android.gms.phenotype",
    "com.google.android.gsf.gservices",
    "com.google.android.gsf.subscribedfeeds",
    "com.google.settings",
)

private val GMS_ACTION_AND_PERMISSION_PREFIXES = listOf(
    "com.google.android.c2dm.",
    "com.google.android.gms.",
    "com.google.android.gsf.",
    "com.google.android.googleapps.",
    "com.google.android.gtalkservice.",
    "com.google.android.location.",
    "com.google.android.contextmanager.",
    "com.google.android.providers.gsf.",
    "com.google.iid.",
)

private fun transformGmsString(str: String): String? {
    // 0. Do NOT replace Google Play Services version metadata key
    if (str == "com.google.android.gms.version") return null

    // 1. Check exact match replacements
    EXACT_STRING_REPLACEMENTS[str]?.let { return it }

    // 2. Check content:// URIs matching authorities
    if (str.startsWith("content://")) {
        for (auth in AUTHORITIES) {
            val prefix = "content://$auth"
            if (str.startsWith(prefix)) {
                val redirectedAuth = auth.replace("com.google", GMS_CORE_VENDOR_GROUP_ID)
                return str.replace(prefix, "content://$redirectedAuth")
            }
        }
    }

    // 3. Check GMS actions and permissions prefixes
    for (prefix in GMS_ACTION_AND_PERMISSION_PREFIXES) {
        if (str.startsWith(prefix)) {
            return str.replace("com.google", GMS_CORE_VENDOR_GROUP_ID)
        }
    }

    return null
}

fun BytecodePatchContext.executeUniversalGmsCoreSupportLogic(logger: Logger) {
    logger.info("Executing Universal GmsCore / MicroG Support patch...")
    var redirectedStrings = 0
    var hookedAvailabilityMethods = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        // Skip Android framework & Kotlin standard libraries
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. Hook GoogleApiAvailability & GooglePlayServicesUtil to always return SUCCESS (0)
        if (
            type == "Lcom/google/android/gms/common/GoogleApiAvailability;" ||
            type == "Lcom/google/android/gms/common/GoogleApiAvailabilityLight;" ||
            type == "Lcom/google/android/gms/common/GooglePlayServicesUtil;" ||
            type == "Lcom/google/android/gms/common/GooglePlayServicesUtilLight;"
        ) {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                if (mName == "isGooglePlayServicesAvailable" && method.returnType == "I") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedAvailabilityMethods++
                        logger.info("[GmsCore Support] Hooked ${classDef.type}->${method.name} -> ConnectionResult.SUCCESS (0)")
                    } catch (e: Exception) {
                        logger.fine("[GmsCore Support] Failed to hook ${method.name}: ${e.message}")
                    }
                }
                if (mName == "isUserResolvableError" && method.returnType == "Z") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedAvailabilityMethods++
                        logger.info("[GmsCore Support] Hooked ${classDef.type}->${method.name} -> false")
                    } catch (e: Exception) {
                        logger.fine("[GmsCore Support] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 2. Perform GMS string and dependency redirections
        for (method in classDef.methods.toList()) {
            val impl = method.implementation ?: continue
            val mutableMethod by lazy { mutableClass.findMutableMethodOf(method) }

            for ((index, instruction) in impl.instructions.withIndex()) {
                val isStringOpcode = instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO
                if (instruction is ReferenceInstruction && isStringOpcode) {
                    val ref = instruction.reference
                    if (ref is StringReference) {
                        val str = ref.string
                        val transformed = transformGmsString(str)
                        if (transformed != null && transformed != str) {
                            try {
                                val reg = (instruction as? OneRegisterInstruction)?.registerA ?: 0

                                val newInstruction = if (instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                                    BuilderInstruction31c(
                                        Opcode.CONST_STRING_JUMBO,
                                        reg,
                                        ImmutableStringReference(transformed)
                                    )
                                } else {
                                    BuilderInstruction21c(
                                        Opcode.CONST_STRING,
                                        reg,
                                        ImmutableStringReference(transformed)
                                    )
                                }
                                mutableMethod.replaceInstruction(index, newInstruction)
                                redirectedStrings++
                            } catch (e: Exception) {
                                logger.warning("[GmsCore Support] Failed string replace for '$str' in ${classDef.type}->${method.name}: ${e.message}")
                            }
                        }
                    }
                }
            }
        }
    }

    logger.info("[GmsCore Support] Finished: $redirectedStrings GMS references redirected, $hookedAvailabilityMethods availability methods hooked.")
}

