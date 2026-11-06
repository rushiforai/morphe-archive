package app.template.patches.reddit.removeads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.REDDIT_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Remove Ads — Reddit (com.reddit.frontpage)
 *
 * Verified against Reddit 2026.42.0 (versionCode 2642021, 16 Oct 2026).
 *
 * Kills promoted posts in feed list surfaces and banner ads (incl. their
 * placeholder slots) in comment threads. Layers:
 *
 *   1. Listing.<init>          → filter `children` through RedditFeedHelper
 *      (drops every ILink with getPromoted() == true). VERIFIED intact.
 *   2. SubmittedListing.<init> → same filter; class removed in 2026.16.0+,
 *      auto-skips via runCatching (confirmed absent in 2026.42.0).
 *   3. CommentsViewModel ad loader (P(ZLcbc;I)V) → early return-void kill.
 *   4. CommentsAdState.adsLoadCompleted (<init> iput-boolean ->h:Z) → force
 *      true so empty ad placeholders also vanish (2026.04+ behavior).
 *
 * The former "AdPostSection p5 sections" layer was REMOVED for 2026.42.0:
 * the class layout changed upstream (p5 is now an Lvwp; model, not a
 * sections List). See Fingerprints.kt removal notes.
 *
 * All filtering logic lives in the .mpe extension (RedditFeedHelper) — the
 * smali injected here is only argument shuffle + invoke-static.
 */
private const val HELPER =
    "Lapp/template/extension/extension/RedditFeedHelper;"

@Suppress("unused")
val redditRemoveAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Hides promoted posts in feeds and banner ads in comment threads.",
    default = true,
) {
    compatibleWith(REDDIT_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {

        // ── Layer 1 & 2: feed listings ───────────────────────────────────────
        // instructionMatches.first().index = the `->children` field write
        // (iput-object p1, p0, ->children:java/util/List).
        // registerA = the incoming `children` param register; wrap it in the
        // filter and store the filtered list back into the same register
        // (same type List→List, so reusing the param register is ART-safe).
        fun filterChildren(fingerprint: Fingerprint) {
            fingerprint.let {
                it.method.apply {
                    val index = it.instructionMatches.first().index
                    val register = getInstruction<TwoRegisterInstruction>(index).registerA

                    addInstructions(
                        index,
                        """
                            invoke-static { v$register }, $HELPER->hideOldPostAds(Ljava/util/List;)Ljava/util/List;
                            move-result-object v$register
                        """
                    )
                }
            }
        }

        filterChildren(ListingFingerprint)

        // SubmittedListing vanished in 2026.16.0+ — optional layer, Doom's
        // standard runCatching guard (never hard-fail a whole patch for one
        // version-specific class).
        runCatching { SubmittedListingFingerprint.method }
            .onSuccess { filterChildren(SubmittedListingFingerprint) }
            .onFailure {
                println(
                    "Remove ads: SubmittedListing not found " +
                        "(expected on Reddit 2026.16.0+), skipping layer 2."
                )
            }

        // ── Layer 3: comment banner ad loader — entry-point kill ─────────────
        // Injected at index 0; original body remains below and is simply never
        // reached when the helper returns true (if-eqz = branch-if-zero, so
        // helper==true falls through to return-void). Short-circuiting without
        // clearBody keeps register frames provably untouched.
        CommentsViewModelAdLoaderFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $HELPER->hideCommentAds()Z
                move-result v0
                if-eqz v0, :show
                return-void
                :show
                nop
            """
        )

        // ── Layer 4: comment ad placeholders (Reddit 2026.04+) ───────────────
        // CommentsAdState.adsLoadCompleted gates placeholder rendering. The
        // data class' constructor stores it via IPUT_BOOLEAN — OR the value
        // with the helper right before the field write so placeholders never
        // render. Field reference is recovered from toString() (verified in
        // 2026.42.0: toString ", adsLoadCompleted=" → iget ->h:Z; ctor writes
        // `iput-boolean p8, p0, ->h:Z`).
        runCatching { CommentsAdStateToStringFingerprint.method }.getOrNull()?.let { toStringMethod ->
            val adsLoadCompletedField = toStringMethod.findFieldAfterString(", adsLoadCompleted=")

            Fingerprint(
                definingClass = CommentsAdStateToStringFingerprint.originalClassDef.type,
                name = "<init>",
                returnType = "V",
                filters = listOf(
                    fieldAccess(
                        opcode = Opcode.IPUT_BOOLEAN,
                        reference = adsLoadCompletedField
                    )
                )
            ).let {
                it.method.apply {
                    val index = it.instructionMatches.last().index
                    val register = getInstruction<TwoRegisterInstruction>(index).registerA

                    addInstructions(
                        index,
                        """
                            invoke-static { v$register }, $HELPER->hideCommentAds(Z)Z
                            move-result v$register
                        """
                    )
                }
            }
        } ?: println("Remove ads: CommentsAdState not found (pre-2026.04 APK?), skipping layer 4.")

        // ── Layer 5: adaptive-feed AdPostSection ad units (Reddit 2026.42.x) ─
        // 2026.42.0 no longer serves feed ads through Listing children/ILink —
        // sponsored units are AdPostSection composables
        // (class whose toString begins "AdPostSection(linkId="). Upstream's
        // p5 sections-list filter cannot be used: in this build p5 is an
        // Lvwp; media model, NOT a List (injecting there would VerifyError).
        // Instead: resolve the section's render composables by signature
        // (obfuscation-proof — names change per build) and no-op them with a
        // framework-safe early return-void. Kills rendering AND ad-impression
        // callbacks inside, without touching any data model.
        runCatching {
            val adSectionClassDef = AdPostSectionToStringFingerprint.originalClassDef

            fun renderName(pred: (List<String>) -> Boolean): String =
                adSectionClassDef.methods.firstOrNull { m ->
                    m.returnType == "V" &&
                        AccessFlags.PUBLIC.isSet(m.accessFlags) &&
                        AccessFlags.FINAL.isSet(m.accessFlags) &&
                        pred(m.parameterTypes.map { it.toString() })
                }?.name
                    ?: throw PatchException("Remove ads: AdPostSection render signature not found")

            listOf<(List<String>) -> Boolean>(
                // c(Ls4j; Lgbc; I)V  — compact layout (~2.3k smali on 2026.42.0)
                { t -> t.size == 3 && t[0].startsWith("L") && t[1].startsWith("L") && t[2] == "I" },
                // e(L…; Function0; L…; L…; Ls4j; Lwpy; Lawx; Function0; Lgbc; I)V — full layout
                { t -> t.size == 10 && t.count { it == "Lkotlin/jvm/functions/Function0;" } == 2 },
            ).forEach { pred ->
                val name = renderName(pred)
                Fingerprint(
                    definingClass = adSectionClassDef.type,
                    name = name,
                    returnType = "V",
                    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
                ).method.addInstructions(0, "return-void")
                println("Remove ads: AdPostSection render '$name' no-opped.")
            }
        }.onFailure {
            println("Remove ads: AdPostSection layer skipped: ${it.message}")
        }
    }
}

/**
 * Locate the field reference rendered after [prefix] inside a data class
 * toString(): walk instructions after the `const-string` literal and return
 * the first instance-field read (that is the backing field, e.g. the smali
 * `->adsLoadCompleted:Z` of the obfuscated class — verified `->h:Z` on
 * Lria; in Reddit 2026.42.0).
 *
 * Compact re-implementation of MorpheApp's findFieldFromToString so this
 * bundle stays dependency-free.
 */
private fun MutableMethod.findFieldAfterString(prefix: String): FieldReference {
    val instructions = implementation?.instructions
        ?: throw PatchException("toString() has no implementation body")

    var prefixFound = false
    for (instruction in instructions) {
        if (!prefixFound) {
            val reference = (instruction as? ReferenceInstruction)?.reference
            if (instruction.opcode == Opcode.CONST_STRING &&
                reference is StringReference &&
                reference.string.startsWith(prefix.trimStart())
            ) {
                prefixFound = true
            }
            continue
        }

        if (instruction.opcode == Opcode.IGET || instruction.opcode == Opcode.IGET_BOOLEAN) {
            val reference = (instruction as? ReferenceInstruction)?.reference
            if (reference is FieldReference) return reference
        }
    }

    throw PatchException(
        "Could not find field for toString() prefix: $prefix. " +
            "Re-verify the anchor string in a fresh apktool dump."
    )
}
