package app.template.patches.daylio

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_DAYLIO
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Daylio 1.72.0 (291) - the only advertising this build actually has.
//
// Daylio ships no ad network. It ships its own promotion engine, and two of its surfaces look
// exactly like advertising to a user:
//
//   1. a BetterHelp partner banner with an "Ad" badge ("Starting therapy can be scary...", 20% off,
//      "Get started" / "Don't Show Again"). The copy lives in Daylio's own resources
//      (better_help_dialog_title, _text_1, _text_2, _button_1, _button_2) and the screen is
//      res/layout/dialog_better_help.xml. Nothing is fetched to show it - which is why removing the
//      ad permissions in an earlier round never made it go away.
//   2. cross-promotion cards for Daylio's own sibling apps - "Try Our New App / My Diary", Better
//      Weight, Nutrilio - shown as banner cards on the More screen and the main screen.
//
// Everything below is an INSERTION in front of an existing decision point. No method body is
// replaced and no signature, register count, annotation or try/catch block is touched, so the rest
// of the app keeps running exactly as it does in the build that is confirmed working on the phone.
//
//   1. Lnet/daylio/views/entities/AppBannerType;->a()Ljava/util/ArrayList;
//        builds the shuffled list of promo cards to consider. Empty list = nothing to show.
//   2. Lov6;->e(Z)V
//        renders the promo banner row (reads AppBannerType.values(), "try_our_new_app", the promo
//        titles, sets the row's visibility). Returns immediately when asked to SHOW (p1 != 0); the
//        hide path (p1 == 0) still runs untouched. Lov6 is an R8-merged class - it also carries an
//        OkHttp interceptor - so only this one method is touched, never the class.
//   3. Lq48;->f(Lp48;)Ljava/lang/Object;
//        the one shared preference reader. Answers FALSE for Q3 (IS_BETTER_HELP_TOP_BAR_ICON_POSSIBLE),
//        which is what decides the BetterHelp icon's visibility.
//   4. Ls49;->onClick(Landroid/view/View;)V
//        the click listener whose BetterHelp case inflates dialog_better_help (layout 0x7f0d0123 -
//        the only place in the whole app that references it). Returns before the dialog is built, so
//        no trigger can open it. s49 is a switch dispatcher for many unrelated clicks, so this
//        returns at ONE case, not at the top of the method.
//
// The Enable premium card also inserts into q48.f(); both insertions only prepend an
// "if this is my key, answer X" prologue and fall through for every other key, so they compose in
// either order and neither can shadow the other's key.

private val appBannerTypes = Fingerprint(
    definingClass = "Lnet/daylio/views/entities/AppBannerType;",
    name = "a",
    returnType = "Ljava/util/ArrayList;",
    parameters = emptyList(),
)

private val promoBannerRow = Fingerprint(
    definingClass = "Lov6;",
    name = "e",
    returnType = "V",
    parameters = listOf("Z"),
)

private val betterHelpClick = Fingerprint(
    definingClass = "Ls49;",
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)

private val promoPreferenceGet = Fingerprint(
    definingClass = "Lq48;", name = "f", returnType = "Ljava/lang/Object;", parameters = listOf("Lp48;"),
)

/**
 * The More tab's controller, `j0()` - it binds the menu rows. "More Great Apps" is one of them and
 * it is a plain LinearLayout (id 0x7f0a0732) with a click listener, not a preference, so it has to
 * be hidden at the point where it is handed that listener.
 */
private val moreScreenRowBinder = Fingerprint(
    definingClass = "Lsz7;", name = "j0", returnType = "V", parameters = emptyList(),
)

/** LinearLayout holding the "More Great Apps" row in res/layout/fragment_settings.xml. */
private const val MORE_GREAT_APPS_ROW = 0x7f0a0732

/** res/layout/dialog_better_help.xml - referenced exactly once in the whole app. */
private const val BETTER_HELP_LAYOUT = 0x7f0d0123

internal val hidePartnerAdsOption = booleanOption(
    key = "hidePartnerAds",
    default = true,
    title = "Hide the BetterHelp partner banner",
    description = "Removes the BetterHelp icon from the main screen's top bar and disables the " +
        "partner offer screen behind it. Daylio's own screens are not affected.",
)

internal val hideAppPromosOption = booleanOption(
    key = "hideAppPromos",
    default = true,
    title = "Hide the \"try our other app\" cards",
    description = "Removes the cross-promotion cards for Daylio's own apps (My Diary, Better Weight, " +
        "Nutrilio) from the More screen and the main screen, and hides the \"More Great Apps\" row " +
        "that opens a screen of four of their app cards.",
)

internal val removeDaylioPromos = bytecodePatch(
    name = "Remove promos & partner ads",
    description = "Removes Daylio's built-in advertising: the BetterHelp partner offer, the " +
        "cross-promotion cards for the developer's other apps, and the \"More Great Apps\" row " +
        "that opens a screen of their app catalogue. Daylio has no ad network; the journal, " +
        "statistics and backups are untouched.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DAYLIO)

    // These two calls are what ATTACH an option to the patch. Reading `.value` alone works (it
    // falls back to the declared default) but the switch never reaches the Manager: without them
    // the bundle reports 7 options instead of 9 and the card shows no toggles at all.
    hidePartnerAdsOption()
    hideAppPromosOption()

    execute {
        check(
            packageMetadata.packageName == "net.daylio" &&
                packageMetadata.versionName == "1.72.0" &&
                packageMetadata.versionCode == "291",
        ) { "This patch targets Daylio 1.72.0 (291)." }

        if (hideAppPromosOption.value == true) {
            // ---- 1. the list of promo cards to consider -----------------------------------------
            val builder = appBannerTypes.method
            // Re-patching an already-patched APK is normal for users, and every edit below is
            // wrapped in its own "am I already here?" test so a second pass changes nothing.
            // Shape of the first three instructions only - the original body still follows the
            // prologue, so the method is longer than three instructions after the first pass.
            val bannerAlreadyDone = builder.instructions.toList().let { ins ->
                ins.size >= 3 && ins[0].opcode == Opcode.NEW_INSTANCE &&
                    ins[1].opcode == Opcode.INVOKE_DIRECT && ins[2].opcode == Opcode.RETURN_OBJECT
            }
            if (bannerAlreadyDone) {
                println("Daylio promos: promo card list already emptied - leaving it.")
            } else {
                val walksOwnFields = builder.instructions.any { i ->
                    val reference = (i as? ReferenceInstruction)?.reference
                    reference is FieldReference &&
                        reference.definingClass == "Lnet/daylio/views/entities/AppBannerType;"
                }
                check(walksOwnFields) {
                    "Daylio promos: AppBannerType.a() no longer walks AppBannerType's own fields - the " +
                        "promo list changed shape, refusing to patch blind."
                }
                builder.addInstructionsWithLabels(
                    0,
                    """
                        new-instance v0, Ljava/util/ArrayList;
                        invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                        return-object v0
                    """,
                )
                println("Daylio promos: promo card list emptied.")
            }

            // ---- 2. the banner row renderer ------------------------------------------------------
            val row = promoBannerRow.method
            val rowAlreadyDone = row.instructions.toList().let { ins ->
                ins.size >= 2 && ins[0].opcode == Opcode.IF_NEZ && ins[1].opcode == Opcode.RETURN_VOID
            }
            if (rowAlreadyDone) {
                println("Daylio promos: banner row guard already in place - leaving it.")
            } else {
                val rendersPromo = row.instructions.any { i ->
                    val reference = (i as? ReferenceInstruction)?.reference
                    reference is MethodReference && reference.name == "values" &&
                        reference.definingClass == "Lnet/daylio/views/entities/AppBannerType;"
                }
                check(rendersPromo) {
                    "Daylio promos: the More/main banner row no longer reads AppBannerType.values() - " +
                        "refusing to patch blind."
                }
                row.addInstructionsWithLabels(
                    0,
                    """
                        if-nez p1, :daylio_promo_row_body
                        return-void
                        :daylio_promo_row_body
                        nop
                    """,
                )
                println("Daylio promos: cross-promotion banner row disabled (hide path kept).")
            }

            // ---- 2b. the "More Great Apps" row, which opens a screen of four app cards --------
            // Nothing else in the app launches MoreGreatAppsActivity (checked: the only reference
            // outside the activity itself is this row's click listener), and the activity declares
            // no intent filter, so it is not reachable from outside the app either.
            val binder = moreScreenRowBinder.method
            val binderInstructions = binder.instructions.toList()
            val rowRefs = binderInstructions.withIndex().filter { (_, i) ->
                (i as? NarrowLiteralInstruction)?.narrowLiteral == MORE_GREAT_APPS_ROW
            }
            check(rowRefs.size == 1) {
                "Daylio promos: expected exactly one reference to the More Great Apps row in the " +
                    "More screen binder, found ${rowRefs.size} - refusing to patch blind."
            }
            val lookup = rowRefs.single().index
            val findById = (binderInstructions.getOrNull(lookup + 1) as? ReferenceInstruction)
                ?.reference as? MethodReference
            check(findById?.name == "findViewById" && findById.definingClass == "Landroid/view/View;") {
                "Daylio promos: the More Great Apps row id is no longer followed by findViewById - " +
                    "refusing to patch blind."
            }
            check(binderInstructions.getOrNull(lookup + 2)?.opcode == Opcode.MOVE_RESULT_OBJECT) {
                "Daylio promos: unexpected view lookup shape for the More Great Apps row."
            }
            val alreadyHidden = binderInstructions.getOrNull(lookup + 3)?.opcode == Opcode.CONST_16 &&
                (binderInstructions[lookup + 3] as? NarrowLiteralInstruction)?.narrowLiteral == 8 &&
                binderInstructions.getOrNull(lookup + 4)?.opcode == Opcode.INVOKE_VIRTUAL
            val rowRegister = (binderInstructions[lookup + 2] as OneRegisterInstruction).registerA
            // The register that held the view id is dead once findViewById has consumed it, and the
            // very next instruction reassigns it. Use it as the scratch register for the visibility
            // constant - using the view's own register here would overwrite the reference and then
            // call setVisibility on an int (a crash the first time the More screen opens).
            val scratch = (binderInstructions[lookup] as OneRegisterInstruction).registerA
            check(scratch != rowRegister) {
                "Daylio promos: the row lookup reuses its own destination register - refusing."
            }
            val next = binderInstructions.getOrNull(lookup + 3) as? OneRegisterInstruction
            check(next != null && next.registerA == scratch) {
                "Daylio promos: the id register is not reused right after the row lookup, so it is " +
                    "not provably free - refusing to patch blind."
            }
            if (alreadyHidden) {
                println("Daylio promos: \"More Great Apps\" row already hidden - leaving it.")
            } else {
                binder.addInstructions(
                    lookup + 3,
                    """
                        const/16 v$scratch, 0x8
                        invoke-virtual {v$rowRegister, v$scratch}, Landroid/view/View;->setVisibility(I)V
                    """,
                )
                println("Daylio promos: \"More Great Apps\" row hidden.")
            }
        }

        if (hidePartnerAdsOption.value == true) {
            // ---- 3. the top-bar icon, through the one shared preference reader --------------------
            // The reader is a generic getter, so the key has to be checked where it is DECLARED:
            // the preference holder class, not the reader's body.
            val holder = promoPreferenceGet.classDef
            check(holder.fields.any { it.name == "Q3" && it.type == "Lp48;" }) {
                "Daylio promos: IS_BETTER_HELP_TOP_BAR_ICON_POSSIBLE (q48.Q3) is gone or changed " +
                    "type - refusing to patch blind."
            }
            val reader = promoPreferenceGet.method
            // The generic getter never mentions Q3 itself, so ANY read of q48.Q3 in this method is
            // our pin. (Position is not usable: the premium card prepends its own prologue first,
            // so on a re-patch the Q3 block is no longer at index 0.)
            val iconAlreadyPinned = reader.instructions.any { i ->
                i.opcode == Opcode.SGET_OBJECT && (i as? ReferenceInstruction)?.reference.let {
                    it is FieldReference && it.definingClass == "Lq48;" && it.name == "Q3"
                }
            }
            if (iconAlreadyPinned) {
                println("Daylio promos: BetterHelp icon already pinned off - leaving it.")
            } else {
                reader.addInstructionsWithLabels(
                    0,
                    """
                        sget-object v0, Lq48;->Q3:Lp48;
                        if-ne p0, v0, :daylio_promo_reader_body
                        sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                        return-object v0
                        :daylio_promo_reader_body
                        nop
                    """,
                )
                println("Daylio promos: BetterHelp top-bar icon pinned off (q48.Q3).")
            }

            // ---- 4. the offer screen itself ------------------------------------------------------
            val click = betterHelpClick.method
            val instructions = click.instructions.toList()
            val layoutLoads = instructions.withIndex().filter { (_, i) ->
                (i as? NarrowLiteralInstruction)?.narrowLiteral == BETTER_HELP_LAYOUT
            }
            check(layoutLoads.size == 1) {
                "Daylio promos: expected exactly one reference to res/layout/dialog_better_help in the " +
                    "BetterHelp click listener, found ${layoutLoads.size} - refusing to patch blind."
            }
            val at = layoutLoads.single().index
            val buildsDialog = instructions.drop(at + 1).take(6).any { i ->
                val reference = (i as? ReferenceInstruction)?.reference as? MethodReference
                reference?.name == "e" && reference.parameterTypes == listOf("I", "Z") &&
                    reference.definingClass == "Lud5;"
            }
            check(buildsDialog) {
                "Daylio promos: the dialog_better_help id is no longer followed by the dialog builder - " +
                    "refusing to patch blind."
            }
            val dismissAlreadyThere = instructions.getOrNull(at - 1)?.opcode == Opcode.RETURN_VOID
            if (dismissAlreadyThere) {
                println("Daylio promos: BetterHelp offer screen already unreachable - leaving it.")
            } else {
                click.addInstructionsWithLabels(at, "return-void")
                println("Daylio promos: BetterHelp offer screen unreachable.")
            }
        }
    }
}
