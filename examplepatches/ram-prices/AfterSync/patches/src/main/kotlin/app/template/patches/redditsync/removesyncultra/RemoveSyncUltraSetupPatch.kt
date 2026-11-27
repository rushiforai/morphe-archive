package app.template.patches.redditsync.removesyncultra

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.redditsync.removerestorepurchases.fingerprints.preferencesUltraFragmentFingerprint
import app.template.patches.redditsync.removerestorepurchases.removeRestorePurchasesPatch
import app.template.patches.redditsync.removesyncultra.fingerprints.preferencesCommentViewCustomizationFragmentFingerprint
import app.template.patches.redditsync.removeultracloudbackup.removeUltraCloudBackupSetupPatch
import app.template.patches.redditsync.removewebsitepreviews.removeWebsitePreviewsSetupPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Bytecode half of removeSyncUltraResourcesPatch. Confirmed by hand via apktool:
 *
 * 1. PreferencesUltraFragment's setup method (Lpa/l1;->s4) wires up paint/tag/support/
 *    removed/translate by key and toggles several category/row visibilities, all in one
 *    contiguous, single-entry/single-exit 72-instruction run (anchored on the unique
 *    "ultra_cloud_section" string, ending right before the method moves on to unrelated
 *    Ultra-signup/manage-card logic). This whole run is removed outright: with the "Sync
 *    Ultra" entry point gone from cat_root.xml, this method never runs again, but leaving
 *    dead findPreference-by-key lookups pointed at now-deleted XML keys is exactly the
 *    pattern that has caused real crashes elsewhere in this project, so it's stripped for
 *    good measure rather than left as unreachable-but-fragile code.
 *
 * 2. Four of that method's private per-preference click handlers — l4 (paint, opens the
 *    Lja/e; bottom sheet), m4 (tag, Lka/e;), o4 (removed, Laa/f;), and p4 (translate, opens
 *    https://translate.google.com) — are relocated onto PreferencesCommentViewCustomizationFragment
 *    (Lpa/v;, the "Comments" screen under "Appearance" — NOT PreferencesCommentsFragment/
 *    Lpa/w;, the separately-named "Comment options" screen an earlier version of this patch
 *    mistakenly targeted) verbatim, by copying their MutableMethod object and only changing
 *    its defining class — their instructions/register count are untouched, since their
 *    bodies only call generic, inherited Fragment methods (Q0/I0) plus static helpers taking
 *    a Class/Context/FragmentManager, nothing specific to Lpa/l1. (The other two handlers on
 *    this method, n4/"ultra_support" and q4/"ultra_cloud", are NOT moved — "Support the
 *    dev!" is being deleted outright per request, and "ultra_cloud" was already dead code
 *    from an earlier shipped patch.) The originals are left in place on Lpa/l1; as harmless
 *    orphaned dead code, matching this project's established "can't excise methods/classes
 *    outright, orphaning is the practical equivalent" precedent — nothing calls them anymore
 *    once the s4() block above is gone.
 *
 * 3. PreferencesCommentViewCustomizationFragment (Lpa/v;) is made to implement the same
 *    (renamed) Preference.OnPreferenceClickListener interface used throughout this app,
 *    Landroidx/preference/Preference$d;, by adding a brand-new override method (name "a",
 *    matching that interface's single abstract method — confirmed by hand from one of the
 *    existing R8-synthetic listener classes, Lpa/f1;->a) that dispatches by the clicked
 *    preference's key (Preference->r()Ljava/lang/String;, confirmed by hand to be getKey()
 *    from androidx/preference/Preference.smali) to the four relocated handlers above.
 *
 *    This new method is built from scratch via ImmutableMethod/ImmutableMethodImplementation
 *    rather than by copying an existing method's MutableMethod object, specifically to
 *    control its register count directly: an earlier version of this patch copied
 *    Lpa/f1;->a (which only reserves 1 local register, .locals 1, on top of its 2 parameter
 *    registers) and then cleared and replaced its body with code needing 2 scratch
 *    registers — MutableMethodImplementation's register count is fixed at construction and
 *    can't be bumped after the fact, so the extra scratch register silently aliased the
 *    method's own parameter register instead of getting its own slot. This shipped as
 *    v1.12.1 and crashed on a real device with a VerifyError ("tried to get class from
 *    non-reference register v1 (type=Boolean)") the moment the fragment loaded. Building
 *    the implementation with an explicit register count (2 locals + 2 parameter registers =
 *    4) up front avoids the whole class of bug.
 *
 * 4. PreferencesCommentViewCustomizationFragment's setup method (Lpa/v;->C3) gets four new
 *    findPreference+setOnPreferenceClickListener blocks — one per relocated key — added
 *    right before its return-void, using the exact same findPreference
 *    (Landroidx/preference/d;->y) and setOnPreferenceClickListener
 *    (Landroidx/preference/Preference;->A0) calls already used throughout this app, passing
 *    the fragment itself (p0) as the listener. Unlike the new "a" method above, this reuses
 *    C3()'s own existing register frame (it already declares .locals 2 and its own body
 *    already uses v0/v1 as scratch registers the same way) rather than introducing new ones,
 *    so it isn't at risk of the same register-aliasing bug.
 *
 * Confirmed the hard way on a real device (the resource-patch equivalent of the ordering
 * half of this same lesson broke removeUltraCloudBackupResourcesPatch — see
 * removeSyncUltraResourcesPatch.kt): the 72-instruction span removed in step 1 is only
 * exactly 72 instructions once removeWebsitePreviewsSetupPatch's "ultra_enhancements" block
 * (4 instructions) and removeUltraCloudBackupSetupPatch's "ultra_cloud" block (6
 * instructions) have already been removed — both sit inside that same span in the unpatched
 * method. Depends on both (and, for consistency, on removeRestorePurchasesPatch too, even
 * though its block sits entirely before this patch's anchor) so the count is correct
 * regardless of the patcher's chosen execution order.
 */
val removeSyncUltraSetupPatch = bytecodePatch(
    name = "Remove Sync Ultra screen",
    description = "Relocates \"Translate text\"/\"Restore removed comments\"/\"Paint " +
        "users\"/\"Tag users\" click behavior onto the Comments settings screen, and " +
        "strips the now-pointless preference-wiring setup code from the Sync Ultra " +
        "screen. This is the bytecode fix \"Remove Sync Ultra screen (resources)\" " +
        "needs to avoid a crash — select that patch too (or select this one, which " +
        "pulls it in automatically).",
    default = true,
) {
    dependsOn(removeSyncUltraResourcesPatch)
    dependsOn(removeWebsitePreviewsSetupPatch)
    dependsOn(removeUltraCloudBackupSetupPatch)
    dependsOn(removeRestorePurchasesPatch)

    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        // 1. Strip the 72-instruction contiguous setup block from Lpa/l1;->s4()V.
        val ultraMethod = preferencesUltraFragmentFingerprint.method
        val ultraImpl = ultraMethod.implementation!!

        val blockStart = ultraImpl.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "ultra_cloud_section"
        }
        if (blockStart == -1) {
            error(
                "Could not find the \"ultra_cloud_section\" setup code in " +
                    "PreferencesUltraFragment. This build's method structure may differ " +
                    "from what was inspected — re-check with apktool.",
            )
        }
        repeat(72) { ultraImpl.removeInstruction(blockStart) }

        // 2. Relocate the paint/tag/removed/translate click handlers onto Lpa/v;.
        val ultraClass = preferencesUltraFragmentFingerprint.classDef
        val viewCustomizationClass = preferencesCommentViewCustomizationFragmentFingerprint.classDef

        fun relocateHandler(methodName: String): MutableMethod {
            val original = ultraClass.directMethods.firstOrNull { it.name == methodName }
                ?: error(
                    "Could not find PreferencesUltraFragment's \"$methodName\" click " +
                        "handler. This build's method structure may differ from what was " +
                        "inspected — re-check with apktool.",
                )
            val moved = MutableMethod(original)
            moved.definingClass = "Lpa/v;"
            viewCustomizationClass.directMethods.add(moved)
            return moved
        }

        relocateHandler("l4") // paint -> Lja/e;
        relocateHandler("m4") // tag -> Lka/e;
        relocateHandler("o4") // removed -> Laa/f;
        relocateHandler("p4") // translate -> https://translate.google.com

        // 3. Make Lpa/v; implement Preference$d via a brand-new "a" override method, built
        // with an explicit register count (2 scratch locals + 2 parameter registers) so the
        // scratch registers below get their own slots instead of aliasing p0/p1.
        viewCustomizationClass.interfaces.add("Landroidx/preference/Preference\$d;")

        val listenerTemplate = mutableClassDefBy("Lpa/f1;")
            .virtualMethods.firstOrNull { it.name == "a" }
            ?: error(
                "Could not find Lpa/f1;->a's click-listener method to use as a signature " +
                    "template. This build's method structure may differ from what was " +
                    "inspected — re-check with apktool.",
            )

        val dispatchDefinition = ImmutableMethod(
            "Lpa/v;",
            "a",
            listenerTemplate.parameters,
            listenerTemplate.returnType,
            listenerTemplate.accessFlags,
            listenerTemplate.annotations,
            listenerTemplate.hiddenApiRestrictions,
            ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList()),
        )
        val dispatch = MutableMethod(dispatchDefinition)
        dispatch.addInstructions(
            """
                invoke-virtual {p1}, Landroidx/preference/Preference;->r()Ljava/lang/String;
                move-result-object v0
                const-string v1, "ultra_paint"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :check_tag
                invoke-direct {p0, p1}, Lpa/v;->l4(Landroidx/preference/Preference;)Z
                move-result p1
                return p1
                :check_tag
                const-string v1, "ultra_tag"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :check_translate
                invoke-direct {p0, p1}, Lpa/v;->m4(Landroidx/preference/Preference;)Z
                move-result p1
                return p1
                :check_translate
                const-string v1, "ultra_translate"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :check_removed
                invoke-direct {p0, p1}, Lpa/v;->p4(Landroidx/preference/Preference;)Z
                move-result p1
                return p1
                :check_removed
                const-string v1, "ultra_removed"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :no_match
                invoke-direct {p0, p1}, Lpa/v;->o4(Landroidx/preference/Preference;)Z
                move-result p1
                return p1
                :no_match
                const/4 v1, 0x0
                return v1
            """,
        )
        viewCustomizationClass.virtualMethods.add(dispatch)

        // 4. Wire the four relocated preferences to the new listener in Lpa/v;->C3()V.
        val viewCustomizationMethod = preferencesCommentViewCustomizationFragmentFingerprint.method
        val viewCustomizationImpl = viewCustomizationMethod.implementation!!
        val returnIndex = viewCustomizationImpl.instructions.indexOfFirst { it.opcode == Opcode.RETURN_VOID }
        if (returnIndex == -1) {
            error(
                "Could not find the final return-void in " +
                    "PreferencesCommentViewCustomizationFragment's C3(). This build's " +
                    "method structure may differ from what was inspected — re-check with " +
                    "apktool.",
            )
        }

        fun wireClickListener(key: String) = """
            const-string v0, "$key"
            invoke-virtual {p0, v0}, Landroidx/preference/d;->y(Ljava/lang/CharSequence;)Landroidx/preference/Preference;
            move-result-object v0
            invoke-virtual {v0, p0}, Landroidx/preference/Preference;->A0(Landroidx/preference/Preference${'$'}d;)V
        """

        viewCustomizationMethod.addInstructions(
            returnIndex,
            wireClickListener("ultra_translate") +
                wireClickListener("ultra_removed") +
                wireClickListener("ultra_paint") +
                wireClickListener("ultra_tag"),
        )
    }
}
