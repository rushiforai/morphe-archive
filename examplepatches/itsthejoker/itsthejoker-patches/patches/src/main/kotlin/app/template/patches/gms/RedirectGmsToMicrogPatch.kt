package app.template.patches.gms

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.gms.Constants.ACTIONS
import app.template.patches.gms.Constants.AUTHORITIES
import app.template.patches.gms.Constants.PERMISSIONS
import app.template.patches.gms.Constants.VENDOR
import app.template.patches.shared.Constants.COMPATIBILITY_ROOST
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31c
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

/**
 * Redirects Roost's Google Play Services usage to a microG variant ("microG RE") so a
 * re-signed (Morphe-patched) build can log in with Google. Minimal, self-contained port of
 * Morphe's `shared/misc/gms/GmsCoreSupportPatch` (no extension / package-rename / settings).
 *
 * REQUIRES microG RE (package `app.revanced.android.gms`) installed on the device.
 * Enabling this without microG present will break all Google Play Services calls, so it is
 * opt-in.
 *
 * What it does:
 *  - Rewrites every `com.google.android.gms` (and related GMS action/permission/authority,
 *    plus `content://` GMS provider) string reference in the bytecode to the microG vendor
 *    (`app.revanced.*`), so the app binds to microG instead of real Play Services.
 *  - Forces the bundled Play-Services availability checks to report success, so Roost
 *    accepts microG.
 *
 * Pairs with [gmsSpoofManifestPatch], which adds the manifest metadata microG reads to
 * spoof Roost's original package + signature to Google (defeating the OAuth "code 10").
 */
@Suppress("unused")
val redirectGmsToMicrogPatch = bytecodePatch(
    name = "Redirect Google login to microG",
    description = "Routes Roost's Google Play Services calls to microG RE so a patched " +
        "install can sign in with Google. Requires microG RE (app.revanced.android.gms) installed.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ROOST)

    dependsOn(gmsSpoofManifestPatch)

    execute {
        // Exact whole-string replacements: original GMS string -> microG-vendored string.
        val vendorMap = buildMap {
            put("com.google", VENDOR)
            put("com.google.android.gms", "$VENDOR.android.gms")
            // No vendor prefix for whatever reason (matches the reference patch).
            put("subscribedfeeds", "$VENDOR.subscribedfeeds")
            (PERMISSIONS + ACTIONS + AUTHORITIES).forEach { original ->
                put(original, original.replace("com.google", VENDOR))
            }
        }

        // content:// GMS provider URIs -> microG-vendored authority, preserving any path suffix.
        fun contentUrisTransform(str: String): String? {
            if (!str.startsWith("content://")) return null
            for (authority in AUTHORITIES) {
                val prefix = "content://$authority"
                if (str.startsWith(prefix)) {
                    return "content://${authority.replace("com.google", VENDOR)}" + str.substring(prefix.length)
                }
            }
            val subFeeds = "content://subscribedfeeds"
            if (str.startsWith(subFeeds)) {
                return "content://$VENDOR.subscribedfeeds" + str.substring(subFeeds.length)
            }
            return null
        }

        fun transform(str: String): String? = vendorMap[str] ?: contentUrisTransform(str)

        // Single pass over every string-bearing class; classes are made mutable only when a
        // replacement is actually needed (lazy), to avoid bloating the recompile.
        getAllClassesWithStrings().forEach { classDef ->
            var mutableClass: MutableClass? = null

            classDef.methods.forEach classLoop@{ method ->
                val instructions = method.implementation?.instructions ?: return@classLoop
                var mutableMethod: MutableMethod? = null

                instructions.forEachIndexed { index, instruction ->
                    val stringReference = (instruction as? Instruction21c)?.reference as? StringReference
                        ?: (instruction as? Instruction31c)?.reference as? StringReference
                        ?: return@forEachIndexed

                    val newString = transform(stringReference.string) ?: return@forEachIndexed

                    if (mutableClass == null) mutableClass = mutableClassDefBy(classDef)
                    if (mutableMethod == null) {
                        mutableMethod = mutableClass!!.methods.first { candidate ->
                            candidate.name == method.name &&
                                candidate.returnType == method.returnType &&
                                candidate.parameterTypes.size == method.parameterTypes.size &&
                                candidate.parameterTypes.indices.all {
                                    candidate.parameterTypes[it].toString() == method.parameterTypes[it].toString()
                                }
                        }
                    }

                    mutableMethod!!.replaceInstruction(
                        index,
                        BuilderInstruction21c(
                            Opcode.CONST_STRING,
                            (instruction as OneRegisterInstruction).registerA,
                            ImmutableStringReference(newString),
                        ),
                    )
                }
            }
        }

        // Accept microG as a valid Play Services provider:
        // isGooglePlayServicesAvailable(...) -> 0 (ConnectionResult.SUCCESS).
        // Best-effort (methodOrNull): microG already reports itself available via the
        // redirect above, so if this fingerprint ever misses it must not abort the patch.
        GooglePlayUtilityFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
