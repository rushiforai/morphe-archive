package io.github.hiosdra.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element

/**
 * Manifest half of GmsCore support: makes the microG package visible to the app
 * (Android 11+ package visibility) and adds the metadata microG reads to spoof
 * the original package name and signature back to Google.
 */
private val movieParadiseGmsCoreResourcePatch = resourcePatch(
    name = "Movie Paradise - GmsCore manifest",
    description = "Adds microG package visibility and signature-spoofing metadata to the manifest.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MOVIE_PARADISE)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement

            fun Element.children() = (0 until childNodes.length)
                .mapNotNull { childNodes.item(it) as? Element }

            // Make microG visible to PackageManager / service resolution.
            val queries = root.children().firstOrNull { it.tagName == "queries" }
                ?: manifest.createElement("queries").also { root.appendChild(it) }
            val microgVisible = queries.children()
                .any { it.tagName == "package" && it.getAttribute("android:name") == MICROG_PACKAGE }
            if (!microgVisible) {
                manifest.createElement("package").also {
                    it.setAttribute("android:name", MICROG_PACKAGE)
                    queries.appendChild(it)
                }
            }

            // Signature/package spoofing metadata read by microG.
            val application = root.children().firstOrNull { it.tagName == "application" }
                ?: error("Movie Paradise application node was not found in AndroidManifest.xml")

            fun addMeta(name: String, value: String) {
                val exists = application.children()
                    .any { it.tagName == "meta-data" && it.getAttribute("android:name") == name }
                if (!exists) {
                    manifest.createElement("meta-data").also {
                        it.setAttribute("android:name", name)
                        it.setAttribute("android:value", value)
                        application.appendChild(it)
                    }
                }
            }

            addMeta("$GMS_CORE_VENDOR.android.gms.SPOOFED_PACKAGE_NAME", MOVIE_PARADISE_PACKAGE)
            addMeta("$GMS_CORE_VENDOR.android.gms.SPOOFED_PACKAGE_SIGNATURE", MOVIE_PARADISE_ORIGINAL_SIGNATURE)
            addMeta("$GMS_CORE_VENDOR.MICROG_PACKAGE_NAME", MICROG_PACKAGE)
        }
    }
}

/**
 * GmsCore (MicroG-RE) support for Movie Paradise.
 *
 * Redirects the app's Google Play Services references to the microG package so
 * Google sign-in works without stock Play Services. This is a bespoke port of
 * Morphe's shared GmsCore support (itself forked from ReVanced), trimmed to what
 * a Flutter app needs: bytecode string/authority redirects, GMS-availability
 * short-circuits, a manifest patch, and a microG-presence check. Requires
 * [movieParadisePairipBypassPatch] so the repackaged build launches.
 *
 * NOT verified on-device in this environment: whether Google sign-in ultimately
 * succeeds depends on MicroG-RE accepting the spoofed signature for a
 * third-party (non-Google) OAuth client. Test with `adb logcat` on a device that
 * has MicroG-RE installed.
 */
@Suppress("unused")
val movieParadiseGmsCoreSupportPatch = bytecodePatch(
    name = "Movie Paradise - GmsCore support (microG login)",
    description = "Routes Google Play Services through microG (MicroG-RE) so Google sign-in works without stock Play Services.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MOVIE_PARADISE)
    dependsOn(movieParadisePairipBypassPatch)
    dependsOn(movieParadiseGmsCoreResourcePatch)
    extendWith("extensions/extension.mpe")

    // GoogleApiAvailability.isGooglePlayServicesAvailable(...) — returns 0 (SUCCESS).
    val googlePlayUtilityFingerprint = Fingerprint(
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
        returnType = "I",
        parameters = listOf("L", "I"),
        strings = listOf("This should never happen.", "MetadataValueReader", "com.google.android.gms"),
    )

    // Basement service check that throws "Google Play Services not available".
    val serviceCheckFingerprint = Fingerprint(
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
        returnType = "V",
        parameters = listOf("L", "I"),
        strings = listOf("Google Play Services not available"),
    )

    val mainActivityOnCreateFingerprint = Fingerprint(
        definingClass = MOVIE_PARADISE_MAIN_ACTIVITY,
        name = "onCreate",
        returnType = "V",
        parameters = listOf("Landroid/os/Bundle;"),
    )

    execute {
        // Exact-match string replacements: every const-string equal to a GMS
        // identifier is rewritten to the microG vendor. Mirrors Morphe's
        // shared patch, reimplemented on the public patcher API.
        val exactReplacements = HashMap<String, String>().apply {
            put("com.google", GMS_CORE_VENDOR)
            put("com.google.android.gms", "$GMS_CORE_VENDOR.android.gms")
            put("subscribedfeeds", "$GMS_CORE_VENDOR.subscribedfeeds")
            (MovieParadiseGmsConstants.PERMISSIONS +
                MovieParadiseGmsConstants.ACTIONS +
                MovieParadiseGmsConstants.AUTHORITIES).forEach { identifier ->
                put(identifier, identifier.replace("com.google", GMS_CORE_VENDOR))
            }
        }

        fun transform(value: String): String? {
            exactReplacements[value]?.let { return it }

            if (value.startsWith("content://")) {
                for (authority in MovieParadiseGmsConstants.AUTHORITIES) {
                    val prefix = "content://$authority"
                    if (value.startsWith(prefix)) {
                        return value.replace(
                            prefix,
                            "content://${authority.replace("com.google", GMS_CORE_VENDOR)}",
                        )
                    }
                }
                val subscribedFeeds = "content://subscribedfeeds"
                if (value.startsWith(subscribedFeeds)) {
                    return value.replace(subscribedFeeds, "content://$GMS_CORE_VENDOR.subscribedfeeds")
                }
            }

            return null
        }

        getAllClassesWithStrings().forEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            mutableClass.methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                // Snapshot: replacing a const-string keeps the instruction count,
                // so indices stay valid across in-place replacement.
                implementation.instructions.toList().forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.CONST_STRING &&
                        instruction.opcode != Opcode.CONST_STRING_JUMBO
                    ) {
                        return@forEachIndexed
                    }
                    val stringReference = (instruction as? ReferenceInstruction)
                        ?.reference as? StringReference ?: return@forEachIndexed
                    val replacement = transform(stringReference.string) ?: return@forEachIndexed
                    val register = (instruction as OneRegisterInstruction).registerA

                    method.replaceInstruction(
                        index,
                        BuilderInstruction21c(
                            Opcode.CONST_STRING,
                            register,
                            ImmutableStringReference(replacement),
                        ),
                    )
                }
            }
        }

        // Short-circuit the "is GMS available?" gates so the app proceeds to bind
        // microG's redirected services instead of bailing out.
        serviceCheckFingerprint.matchOrNull()?.method?.addInstructions(0, "return-void")
        googlePlayUtilityFingerprint.matchOrNull()?.method?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // Warn the user at startup if microG is missing.
        mainActivityOnCreateFingerprint.matchOrNull()?.method?.addInstructions(
            0,
            "invoke-static/range { p0 .. p0 }, $GMS_EXTENSION_CLASS->checkGmsCore(Landroid/app/Activity;)V",
        )
    }
}
