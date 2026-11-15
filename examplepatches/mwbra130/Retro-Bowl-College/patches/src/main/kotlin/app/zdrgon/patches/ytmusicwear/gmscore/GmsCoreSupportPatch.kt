package app.zdrgon.patches.ytmusicwear.gmscore

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.zdrgon.patches.ytmusicwear.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC_WEAR
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger
import org.w3c.dom.Element

private const val FROM_PACKAGE_NAME = "com.google.android.apps.youtube.music"
private const val GMS_CORE_PACKAGE_NAME = "app.revanced.android.gms"

// Google's signing certificate (SHA-1), the same value the official
// Morphe GmsCore support patch spoofs for YouTube Music. MicroG reads
// it from the patched app's manifest and presents it to Google's auth
// servers, so the app is treated as the genuine Google-signed build.
private const val SPOOFED_PACKAGE_SIGNATURE = "afb0fed5eeaebdd86f56a97742f4b6b33ef59875"

private const val VENDOR = "app.revanced"

/**
 * YouTube Music (Wear OS) — GmsCore support.
 *
 * Wear port of the core of the official Morphe "GmsCore support" patch
 * (MorpheApp/morphe-patches, shared/misc/gms), adapted to what the
 * Wear build actually needs and verified against the Wear dex on
 * 2026-11-13:
 *
 * - Every dex const-string naming Google Play services — the GMS
 *   package, the "com.google" account type, and the official patch's
 *   permission / intent-action / authority sets (GmsCoreConstants) —
 *   is rewritten to its app.revanced (MicroG) equivalent, so the app's
 *   bundled GMS client talks to MicroG-RE on the watch instead of the
 *   real Play services, which rejects re-signed builds. Census on the
 *   Wear dex before writing this: "com.google" in 20 methods,
 *   "com.google.android.gms" in 42, plus the c2dm / cast / phenotype /
 *   wearable actions and authorities and 3 content:// authority URIs.
 * - The two Play-services availability gates are pinned off
 *   (GooglePlayUtility returns SUCCESS, ServiceCheck returns early);
 *   both fingerprints match exactly one Wear method each
 *   (Llwy;->b / Llwy;->d — see Fingerprints.kt).
 * - The inline resource dependency adds the signature-spoofing
 *   meta-data MicroG requires and a <queries> entry so the app can
 *   see MicroG under Android package-visibility rules, and retargets
 *   the manifest's c2dm strings to MicroG.
 *
 * Deliberate differences from the phone patch:
 * - NO package rename and no clone: the watch app keeps its original
 *   package name, so the stock app must be uninstalled first. The
 *   rename exists on the phone to coexist with the stock app; on the
 *   watch it would additionally break the system-level Wear account
 *   and companion integration points for no benefit.
 * - No extension and no settings integration: the phone patch's
 *   watchdog/settings live in an extension merged into the phone app's
 *   MusicActivity, which the Wear app does not contain.
 * - No Prime-method transform and no GNP registration rewrite: both
 *   exist only to fix up the renamed package name, which does not
 *   change here.
 *
 * Requires MicroG-RE (app.revanced.android.gms) installed on the
 * watch with a Google account in it — on Wear OS that means the
 * MicroG-RE fork build with the account transferred from the phone,
 * because stock MicroG-RE's WebView login crashes on the watch.
 */
@Suppress("unused")
val gmsCoreSupportWearPatch = bytecodePatch(
    name = "GmsCore support",
    description = "Routes the app's Google services calls to MicroG (app.revanced.android.gms) instead of real Google Play services, so a re-signed build can sign in. Requires MicroG-RE with a signed-in account on the watch, and the stock app uninstalled first (the package name is not changed). Experimental: verified against 9.45.41-WEAR_RELEASE by dex scan, not yet tested on a watch.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC_WEAR)

    // ── Manifest half ────────────────────────────────────────────────
    // Inline rawResourcePatch dependency, the Crossy Road pattern: it
    // is created inside dependsOn() so PatchLoader never lists it as
    // a separate patch — the Manager shows exactly one "GmsCore
    // support" entry, and the two halves ship together or not at all.
    dependsOn(
        rawResourcePatch(
            name = "GmsCore support (manifest)",
            description = "Manifest half of GmsCore support: signature spoofing meta-data, MicroG package visibility, c2dm retargeting.",
            default = true
        ) {
            compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC_WEAR)

            execute {
                val logger = Logger.getLogger(this::class.java.name)

                document("AndroidManifest.xml").use { doc ->
                    val manifest = doc.documentElement
                        ?: throw PatchException("YT Music Wear GmsCore: manifest has no root element.")

                    // Retarget c2dm strings wherever they appear as
                    // attribute values (the only rename-independent
                    // entry in the official patch's transformation
                    // map; the package/authority rewrites it pairs
                    // with are no-ops here because the package name
                    // does not change).
                    var retargeted = 0
                    val all = doc.getElementsByTagName("*")
                    for (i in 0 until all.length) {
                        val element = all.item(i) as Element
                        val attrs = element.attributes
                        for (j in 0 until attrs.length) {
                            val attr = attrs.item(j)
                            if (attr.nodeValue.contains("com.google.android.c2dm")) {
                                attr.nodeValue =
                                    attr.nodeValue.replace("com.google.android.c2dm", "$VENDOR.android.c2dm")
                                retargeted++
                            }
                        }
                    }

                    // Signature / package spoofing meta-data inside
                    // <application>, read by MicroG at token time.
                    val applications = doc.getElementsByTagName("application")
                    if (applications.length == 0) {
                        throw PatchException("YT Music Wear GmsCore: no <application> element in the manifest.")
                    }
                    val application = applications.item(0) as Element

                    fun addMetaData(name: String, value: String) {
                        val meta = doc.createElement("meta-data")
                        meta.setAttribute("android:name", name)
                        meta.setAttribute("android:value", value)
                        application.appendChild(meta)
                    }

                    addMetaData("$GMS_CORE_PACKAGE_NAME.SPOOFED_PACKAGE_NAME", FROM_PACKAGE_NAME)
                    addMetaData("$GMS_CORE_PACKAGE_NAME.SPOOFED_PACKAGE_SIGNATURE", SPOOFED_PACKAGE_SIGNATURE)
                    addMetaData("app.revanced.MICROG_PACKAGE_NAME", GMS_CORE_PACKAGE_NAME)

                    // Package visibility: without a <queries> entry
                    // the app cannot resolve MicroG's services on
                    // Android 11+ (Wear OS 6 included). Create the
                    // element if the manifest has none.
                    var queries = doc.getElementsByTagName("queries").let {
                        if (it.length > 0) it.item(0) as Element else null
                    }
                    if (queries == null) {
                        queries = doc.createElement("queries")
                        manifest.appendChild(queries)
                    }
                    val queryPackage = doc.createElement("package")
                    queryPackage.setAttribute("android:name", GMS_CORE_PACKAGE_NAME)
                    queries.appendChild(queryPackage)

                    logger.info(
                        "YT Music Wear GmsCore (manifest): spoofing meta-data added, " +
                            "MicroG <queries> entry added, $retargeted c2dm attribute(s) retargeted."
                    )
                }
            }
        }
    )

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        // Pin the two Play-services availability gates first. A
        // fingerprint that stops matching throws here, before any
        // string is touched — never ship a half-patch silently.
        GooglePlayUtilityWearFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent()
        )
        ServiceCheckWearFingerprint.method.addInstructions(0, "return-void")

        // Exact-string replacement table, built the same way the
        // official patch builds it.
        val replacements = mutableMapOf<String, String>()
        replacements["com.google"] = VENDOR
        replacements["com.google.android.gms"] = "$VENDOR.android.gms"
        for (s in GmsCoreConstants.PERMISSIONS + GmsCoreConstants.ACTIONS + GmsCoreConstants.AUTHORITIES) {
            replacements[s] = s.replace("com.google", VENDOR)
        }

        fun contentUriReplacement(value: String): String? {
            for (authority in GmsCoreConstants.AUTHORITIES) {
                val prefix = "content://$authority"
                if (value == prefix || value.startsWith("$prefix/")) {
                    return "content://" + authority.replace("com.google", VENDOR) +
                        value.removePrefix(prefix)
                }
            }
            return null
        }

        fun replacementFor(value: String): String? =
            replacements[value] ?: contentUriReplacement(value)

        // Two-phase sweep (the bundle's installer-patch pattern):
        // find candidate classes on the immutable defs first, only
        // proxy classes that actually contain a target string.
        var rewritten = 0
        classDefForEach { classDef ->
            val hasTarget = classDef.methods.any { method ->
                method.instructionsOrNull?.any { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? StringReference
                    ref != null && replacementFor(ref.string) != null
                } == true
            }
            if (!hasTarget) return@classDefForEach

            mutableClassDefBy(classDef).methods.forEach { method ->
                val insns = method.instructionsOrNull?.toList() ?: return@forEach
                insns.forEachIndexed { index, insn ->
                    if (insn.opcode != Opcode.CONST_STRING && insn.opcode != Opcode.CONST_STRING_JUMBO) {
                        return@forEachIndexed
                    }
                    val ref = (insn as? ReferenceInstruction)?.reference as? StringReference
                        ?: return@forEachIndexed
                    val newValue = replacementFor(ref.string) ?: return@forEachIndexed
                    val register = (insn as OneRegisterInstruction).registerA
                    method.replaceInstruction(index, "const-string v$register, \"$newValue\"")
                    rewritten++
                }
            }
        }

        if (rewritten == 0) {
            throw PatchException("YT Music Wear GmsCore: no GMS strings were rewritten; refusing to ship a no-op patch.")
        }
        logger.info("YT Music Wear GmsCore: rewrote $rewritten GMS string constant(s) to MicroG equivalents.")
    }
}
