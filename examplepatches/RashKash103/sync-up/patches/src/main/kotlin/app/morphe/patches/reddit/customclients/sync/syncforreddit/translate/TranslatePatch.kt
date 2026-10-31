package app.morphe.patches.reddit.customclients.sync.syncforreddit.translate

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.getReference
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patches.reddit.customclients.sync.syncforreddit.settings.fadeDisabledRowsPatch
import app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.notes.notesInTheHeaderPatch
import com.android.tools.smali.dexlib2.iface.instruction.Instruction

private const val WRAPPER_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/fragments/preferences/PreferenceWrapperFragment;"

private const val SCREEN_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/translate/TranslationScreen;"

private const val SCREEN_FOR_METHOD = "screenFor(I)Lpa/d;"

private const val TITLE_FOR_METHOD = "titleFor(I)Ljava/lang/String;"

private const val NOW_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/translate/TranslateNow;"

private const val INSTEAD_METHOD =
    "instead(Lda/d;Ljava/lang/String;Ljava/lang/String;)V"

private const val SHEET_CLASS_DESCRIPTOR = "Lda/d;"

private const val STORED_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/translate/Stored;"

private const val BEFORE_STORING_METHOD = "beforeStoring(Ljava/lang/Object;)V"

private const val BEFORE_STORING_ONE_METHOD =
    "beforeStoringOne(Landroid/content/ContentValues;)V"

private const val EXTENSION_PACKAGE = "Lapp/morphe/extension/"

private const val PROVIDER_CLASS =
    "Lcom/laurencedawson/reddit_sync/provider/RedditProvider;"

private const val COMMENT_BUTTONS_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/translate/CommentButtons;"

private const val ON_BIND_METHOD = "onBind(Ljava/lang/Object;Lxa/d;)V"

private const val COMMENT_HOLDER_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/viewholders/comments/CommentHolder;"

/** Where a comment is given to the row that draws it, buttons and all. */
private val drawsACommentFingerprint = Fingerprint(
    definingClass = COMMENT_HOLDER_CLASS,
    parameters = listOf("Lxa/d;"),
    returnType = "V",
    custom = { method, _ -> method.implementation != null },
)

private const val COMMENT_MENU_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/translate/CommentMenu;"

private const val ADD_THREAD_METHOD = "addTranslateThread(Ljava/lang/Object;)V"

private const val TAPPED_METHOD = "tapped(Ljava/lang/Object;Ljava/lang/Object;)Z"

/** One entry of such a sheet, which is what the menu is handed when one is tapped. */
private const val AN_ENTRY = "Lcom/laurencedawson/reddit_sync/ui/fragment_dialogs/bottom/" +
    "material_dialogs/base/AbstractSelectionDialogBottomSheet${'$'}h;"

/** Where a comment's menu is told which of its entries was tapped. */
private val commentMenuTappedFingerprint = Fingerprint(
    parameters = listOf(
        AN_ENTRY,
    ),
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == COMMENT_MENU_SHEET && method.name == "r0"
    },
)

private const val LABELS_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/translate/Labels;"

private const val FOR_COMMENT_METHOD = "forComment(Lxa/d;)Ljava/lang/String;"

private const val READY_THE_ROW_METHOD = "readyTheRow(Ljava/lang/Object;)V"

private const val POST_MENU_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/fragment_dialogs/bottom/PostMoreBottomSheetFragment;"

/** What Sync calls the row it shows for translating a post. */
private const val THE_TRANSLATE_ROW = "mTranslate"

/** What Sync calls the setting for the translate entry in a comment's quick actions. */
private const val THE_QUICK_ACTION = "comment_action_translate"

/**
 * Where each quick action is asked whether it is to be offered. The translate one is asked two
 * things, as the menus are: whether it is switched on, and whether the copy is paid for.
 */
private val offersTheQuickActionFingerprint = Fingerprint(
    parameters = listOf("I"),
    returnType = "Z",
    custom = { method, _ ->
        val instructions = method.implementation?.instructions?.toList() ?: emptyList()
        val asked = instructions.indexOfFirst {
            it.getReference<FieldReference>()?.name == THE_QUICK_ACTION
        }
        asked >= 0 && (asked until minOf(asked + 5, instructions.size)).any { at ->
            val called = instructions[at].getReference<MethodReference>()
            called != null && called.returnType == "Z" && called.parameterTypes.isEmpty()
        }
    },
)

/** The model a menu is about, of which each of these sheets holds exactly one. */
private const val THE_CONTENT = "Lxa/d;"

/** The sheet a comment's own menu is, found by what one of its entries says. */
private lateinit var COMMENT_MENU_SHEET: String

/**
 * Where a comment's menu builds its entries, one of which is the one that translates. Found by
 * what that entry says rather than by the class, which has no name of its own left.
 */
private val namesTheCommentRowFingerprint = Fingerprint(
    parameters = emptyList(),
    returnType = "V",
    custom = { method, _ ->
        method.indexOfFirstInstruction {
            getReference<StringReference>()?.string?.startsWith(TRANSLATE_ROW_INSTEAD) == true
        } >= 0
    },
)

/** Where a post's menu is made ready, which is where its rows are shown and named. */
private val postMenuFingerprint = Fingerprint(
    definingClass = POST_MENU_CLASS,
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
    custom = { method, _ ->
        method.indexOfFirstInstruction {
            getReference<FieldReference>()?.name == THE_TRANSLATE_ROW
        } >= 0
    },
)

private const val WITHOUT_THE_SHEET_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/translate/WithoutTheSheet;"

private const val INSTEAD_OF_THE_SHEET_METHOD =
    "instead(Ljava/lang/Class;Ljava/lang/Object;Landroid/os/Bundle;)Z"

private const val INSTEAD_OF_ALL_METHOD =
    "insteadOfAll(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)Z"

/**
 * Where a sheet about one post or comment is opened, given its id rather than a bundle. The
 * sheet that translates a whole thread is opened this way.
 *
 * <p>The class carries four of these, one per kind of thing a sheet can be opened about, and
 * they are alike in everything but the key they put the argument under and what they complain
 * about when it is missing. The complaint is the only whole string that tells them apart, so it
 * is what this matches on; the shape alone would take whichever came first.
 */
private val opensASheetAboutOneFingerprint = Fingerprint(
    parameters = listOf(
        "Ljava/lang/Class;",
        "Landroidx/fragment/app/FragmentManager;",
        "Ljava/lang/String;",
    ),
    returnType = "V",
    strings = listOf("Missing post ID: "),
    custom = { method, classDef ->
        classDef.type == SHOWS_A_SHEET_CLASS && method.implementation != null
    },
)

/**
 * Where a sheet is opened: the kind of it, the manager to open it with, and what to open it
 * with. Every way into the translating sheet goes through this one.
 */
private const val SHOWS_A_SHEET_CLASS = "Ls9/g;"

private val opensASheetFingerprint = Fingerprint(
    parameters = listOf(
        "Ljava/lang/Class;",
        "Landroidx/fragment/app/FragmentManager;",
        "Landroid/os/Bundle;",
    ),
    returnType = "V",
    strings = listOf("Missing arguments: "),
)

private const val IN_PLACE_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/translate/InPlace;"

private const val INSTEAD_OF_COMPOSING_METHOD =
    "instead(Lxa/d;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"

/** What Sync writes at the end of a translation, and draws as a picture from a dead domain. */
private const val NAMES_THE_SERVICE = "[Translated by Google](translate)"

/**
 * Where what is stored after a translation is composed, once for a post and once for a comment.
 *
 * <p>Only the class is taken from this; both of them are rewritten afterwards by walking it. The
 * two are alike apart from which body they read, so the one that reads the body as written is
 * named here to settle which is matched. Leaving it to the shape alone matches both and takes
 * whichever came first, which is the same class either way but is not something to rely on.
 */
private val composesWhatIsStoredFingerprint = Fingerprint(
    parameters = listOf("Lxa/d;", "Ljava/lang/String;", "Ljava/lang/String;"),
    returnType = "Ljava/lang/String;",
    strings = listOf(NAMES_THE_SERVICE),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it.getReference<MethodReference>()?.let { reference ->
                reference.definingClass == "Lxa/d;" && reference.parameterTypes.isEmpty() &&
                        reference.returnType == "Ljava/lang/String;" && reference.name == "o"
            } == true
        } == true
    },
)

/**
 * The two ways back into the sheet. They are accessors the compiler wrote so that the sheet
 * could reach its own private methods from a callback, which leaves them open to the package
 * and to nothing else. The extension is not in that package, so they are opened here.
 */
private val WAYS_BACK_IN = setOf("x4", "v4")

private const val SETTINGS_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/translate/TranslationSettings;"

private const val OFFERED_METHOD = "offered()Z"

/** What Sync calls the row, naming a service that is no longer necessarily the one used. */
private const val TRANSLATE_ROW = "Translate comment with Google"

private const val TRANSLATE_ROW_INSTEAD = "Translate comment"

/** Whether the feature has been turned on from afar, which nothing here waits on. */
private val turnedOnFromAfarFingerprint = Fingerprint(
    parameters = emptyList(),
    returnType = "Z",
    strings = listOf("ultra_translate"),
)

/**
 * Where Sync asks for a translation. It has worked out the text and what it is written in by
 * this point, and what comes back goes on to be written where the app reads its text from, so
 * this is the one step to answer differently.
 */
private val asksForATranslationFingerprint = Fingerprint(
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == "Lda/d;" && method.indexOfFirstInstruction {
            getReference<MethodReference>()
                ?.definingClass
                ?.startsWith("Lcom/google/mlkit/nl/translate/") == true
        } >= 0
    },
)

/** What every screen of the settings is looked up in, and what it says when it does not know. */
private const val UNKNOWN_SCREEN = "Unsupported preference fragment."

/**
 * Sync's own list of which fragment belongs to which screen of the settings. It answers with a
 * fragment for every id it knows and throws for every other, so a screen of ours has to be
 * answered before it gets there.
 */
private val screenForFingerprint = Fingerprint(
    parameters = listOf("I"),
    returnType = "Landroidx/fragment/app/Fragment;",
    strings = listOf(UNKNOWN_SCREEN),
)

/** The same list again, for the name shown at the top of a screen, and it throws the same way. */
private val titleForFingerprint = Fingerprint(
    parameters = emptyList(),
    returnType = "Ljava/lang/String;",
    strings = listOf(UNKNOWN_SCREEN),
)

/**
 * The id of the screen being shown, which the name is looked up by.
 *
 * <p>The class has two methods of this shape, and taking either would have been arbitrary: the
 * screen it is showing is held in a field and read out, while the other answers with a layout id
 * written into it. Reading the field is what makes this the right one, so that is what is
 * matched on rather than the shape alone.
 */
private val screenIdFingerprint = Fingerprint(
    parameters = emptyList(),
    returnType = "I",
    custom = { method, classDef ->
        classDef.type.endsWith("preferences/PreferenceWrapperFragment;") &&
                method.implementation?.instructions?.toList()?.let { instructions ->
                    instructions.size == 2 && instructions.first().opcode == Opcode.IGET
                } == true
    },
)

@Suppress("unused")
val translatePatch = bytecodePatch(
    name = "Translate posts and comments",
    description = "Translates a post or comment where it sits, on this device or through DeepL " +
            "or Google Cloud.",
    default = true
) {
    dependsOn(
        sharedExtensionPatch,
        translationSettingsPatch,
        notesInTheHeaderPatch,
        fadeDisabledRowsPatch,
    )

    compatibleWith(*SyncForRedditCompatible)

    execute {
        // Every one of these is called from the app's own classes, in packages of their own. A
        // class that is not public is refused at the moment it is first called, which is on a
        // device and long after this. Refused here instead.
        listOf(
            SETTINGS_CLASS_DESCRIPTOR,
            NOW_CLASS_DESCRIPTOR,
            IN_PLACE_CLASS_DESCRIPTOR,
            WITHOUT_THE_SHEET_CLASS_DESCRIPTOR,
            STORED_CLASS_DESCRIPTOR,
            LABELS_CLASS_DESCRIPTOR,
            COMMENT_BUTTONS_CLASS_DESCRIPTOR,
            COMMENT_MENU_CLASS_DESCRIPTOR,
            SCREEN_CLASS_DESCRIPTOR,
        ).forEach { reached ->
            val extension = classDefByOrNull(reached)
                ?: throw PatchException("$reached is not in the app to be called")
            if (extension.accessFlags and AccessFlags.PUBLIC.value == 0) {
                throw PatchException("$reached is not public, so the app cannot call it")
            }
        }

        screenForFingerprint.method.apply {
            // Answered before Sync looks, and only for the one id that is ours: for every other
            // the screen is null and Sync goes on to look the id up as it always did.
            addInstructionsWithLabels(
                0,
                """
                invoke-static       { p1 }, $SCREEN_CLASS_DESCRIPTOR->$SCREEN_FOR_METHOD
                move-result-object  v0
                if-eqz              v0, :not_ours
                return-object       v0
                """,
                ExternalLabel("not_ours", getInstruction<Instruction>(0)),
            )
        }

        // The name at the top of it, looked up in the same list and throwing the same way. The
        // id is not passed here, so it is asked of the screen itself.
        val screenId = screenIdFingerprint.originalMethod.name

        titleForFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                invoke-virtual      { p0 }, $WRAPPER_CLASS->$screenId()I
                move-result         v0
                invoke-static       { v0 }, $SCREEN_CLASS_DESCRIPTOR->$TITLE_FOR_METHOD
                move-result-object  v0
                if-eqz              v0, :not_ours
                return-object       v0
                """,
                ExternalLabel("not_ours", getInstruction<Instruction>(0)),
            )
        }

        // Asked of the service that was chosen, into the language that was chosen, and only
        // once for the same text. What comes back goes back the way it always did.
        asksForATranslationFingerprint.method.apply {
            addInstructions(
                0,
                """
                invoke-static       { p0, p1, p2 }, $NOW_CLASS_DESCRIPTOR->$INSTEAD_METHOD
                return-void
                """
            )
        }

        mutableClassDefBy(SHEET_CLASS_DESCRIPTOR).methods
            .filter { it.name in WAYS_BACK_IN }
            .also {
                if (it.size != WAYS_BACK_IN.size) {
                    throw PatchException("The sheet no longer has both ways back into it")
                }
            }
            .forEach { wayBackIn ->
                wayBackIn.accessFlags = wayBackIn.accessFlags and
                        (AccessFlags.PRIVATE.value or AccessFlags.PROTECTED.value).inv() or
                        AccessFlags.PUBLIC.value
            }

        // Reading a thread again writes what an author wrote over a translation, and the post
        // turns back for as long as it takes to notice and undo it. Every row the app stores
        // passes through here first, so a translation still standing is put back into the row
        // before any of it is written and there is nothing to see.
        // A row on its own is caught where it is stored.
        var storesRows = 0
        mutableClassDefBy(PROVIDER_CLASS).methods.forEach { storing ->
            if (storing.name != "insert" || storing.implementation == null
                    || storing.parameters.size != 2) {
                return@forEach
            }
            storing.addInstructions(
                0,
                "invoke-static { p2 }, $STORED_CLASS_DESCRIPTOR->$BEFORE_STORING_ONE_METHOD"
            )
            storesRows++
        }

        // A thread's worth of them arrives together, and cannot be caught where they are
        // stored: what assembles an injected call builds a method around it out of the
        // parameters of the method it is going into, and will not read an array among them —
        // which is exactly what storing many rows takes. So they are caught on the way in
        // instead, at each place that hands them over.
        classDefForEach { candidate ->
            candidate.methods.forEach eachMethod@{ method ->
                val instructions = method.implementation?.instructions?.toList()
                    ?: return@eachMethod
                if (candidate.type.startsWith(EXTENSION_PACKAGE)) {
                    return@eachMethod
                }

                val handedOver = instructions.indexOfFirst {
                    val called = it.getReference<MethodReference>() ?: return@indexOfFirst false
                    called.name == "bulkInsert" &&
                            called.definingClass == "Landroid/content/ContentResolver;"
                }
                if (handedOver < 0) return@eachMethod

                val rows = (instructions[handedOver] as FiveRegisterInstruction).registerE

                mutableClassDefBy(candidate.type).methods.first {
                    it.name == method.name &&
                            it.parameters.map { each -> each.type } ==
                            method.parameters.map { each -> each.type }
                }.addInstructions(
                    handedOver,
                    "invoke-static { v$rows }, $STORED_CLASS_DESCRIPTOR->$BEFORE_STORING_METHOD"
                )
                storesRows++
            }
        }

        if (storesRows < 2) {
            throw PatchException("Rows are not stored the way they were, found $storesRows")
        }

        // The row of buttons under a comment is a fixed set, laid out in the layout for it and
        // held in a field each. There is no translating among them and no setting that adds
        // one, so one is put at the end of the row as each comment is bound. Injected where the
        // comment arrives rather than where the row is finished with, so that what is handed
        // over is still what was passed in.
        drawsACommentFingerprint.method.addInstructions(
            0,
            "invoke-static { p0, p1 }, $COMMENT_BUTTONS_CLASS_DESCRIPTOR->$ON_BIND_METHOD"
        )

        // The quick action under a comment is asked the same pair of questions the menus are,
        // and the paid-copy one is answered here too. Whether the action is offered at all
        // stays Sync's own setting for it.
        offersTheQuickActionFingerprint.method.apply {
            val switchedOn = indexOfFirstInstructionOrThrow {
                getReference<FieldReference>()?.name == THE_QUICK_ACTION
            }
            val paidFor = indexOfFirstInstructionOrThrow(switchedOn) {
                opcode == Opcode.INVOKE_STATIC &&
                        getReference<MethodReference>()?.returnType == "Z" &&
                        getReference<MethodReference>()?.parameterTypes?.isEmpty() == true
            }
            replaceInstruction(
                paidFor,
                "invoke-static { }, $SETTINGS_CLASS_DESCRIPTOR->$OFFERED_METHOD"
            )
        }

        // Translating something already translated puts back what was written, so neither
        // entry should still offer to translate it. Sync renames an entry itself where the same
        // is true of saving, through the method used here.
        postMenuFingerprint.method.apply {
            // Sync only reaches the entry down one branch of this method, and a menu opened
            // over a feed does not go down it. The end of the method is on every path — there
            // is one way out of it — and the sheet is still in the register it began in there,
            // which is read off the last thing done to it rather than assumed.
            val last = implementation!!.instructions.count() - 1
            val holdingTheSheet = (last downTo 0).first { at ->
                getInstruction(at).opcode == Opcode.IGET_OBJECT &&
                        getInstruction(at).getReference<FieldReference>()?.definingClass ==
                        POST_MENU_CLASS
            }
            val sheet = getInstruction<TwoRegisterInstruction>(holdingTheSheet).registerB

            addInstructions(
                last,
                "invoke-static { v$sheet }, $LABELS_CLASS_DESCRIPTOR->$READY_THE_ROW_METHOD"
            )
        }

        // A comment's menu is handed what its entry says, so what it says is answered instead.
        // The register it is handed in carries nothing else, so writing over it is safe where
        // writing over any other register around here would not be.
        val commentMenu = namesTheCommentRowFingerprint.originalClassDef
        COMMENT_MENU_SHEET = commentMenu.type
        val theComment = commentMenu.fields.single { it.type == THE_CONTENT }

        namesTheCommentRowFingerprint.method.apply {
            val says = indexOfFirstInstructionOrThrow {
                getReference<StringReference>()?.string?.startsWith(TRANSLATE_ROW_INSTEAD) == true
            }
            val saysInto = getInstruction<OneRegisterInstruction>(says).registerA
            val sheet = implementation!!.registerCount - 1

            addInstructions(
                says + 1,
                """
                iget-object v$saysInto, v$sheet, ${commentMenu.type}->${theComment.name}:$THE_CONTENT
                invoke-static { v$saysInto }, $LABELS_CLASS_DESCRIPTOR->$FOR_COMMENT_METHOD
                move-result-object v$saysInto
                """
            )
        }

        // A comment's menu offers the comment and the whole thread and nothing between, so an
        // entry for the conversation under this one goes in after the app's own are built.
        namesTheCommentRowFingerprint.method.apply {
            // Beside the entry for the comment itself, and not at the end of the method: the
            // way out of it is jumped to directly, so anything put in front of the way out is
            // reached only by the path that failed.
            val says = indexOfFirstInstructionOrThrow {
                getReference<StringReference>()?.string?.startsWith(TRANSLATE_ROW_INSTEAD) == true
            }
            val kept = indexOfFirstInstructionOrThrow(says) {
                opcode == Opcode.IPUT_OBJECT &&
                        getReference<FieldReference>()?.definingClass == COMMENT_MENU_SHEET
            }
            val sheet = getInstruction<TwoRegisterInstruction>(kept).registerB

            addInstructions(
                kept + 1,
                "invoke-static { v$sheet }, $COMMENT_MENU_CLASS_DESCRIPTOR->$ADD_THREAD_METHOD"
            )
        }

        commentMenuTappedFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                invoke-static { p0, p1 }, $COMMENT_MENU_CLASS_DESCRIPTOR->$TAPPED_METHOD
                move-result v0
                if-eqz v0, :not_ours
                return-void
                """,
                ExternalLabel("not_ours", getInstruction(0))
            )
        }

        // Opening a sheet to translate in, only to close it again the moment the translation
        // is one already made, reads as the screen flinching. Everything the sheet is given is
        // in the arguments it would have been opened with, so the opening is taken over. Saying
        // no leaves the sheet to open exactly as it would have.
        opensASheetFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                invoke-static { p0, p1, p2 }, $WITHOUT_THE_SHEET_CLASS_DESCRIPTOR->$INSTEAD_OF_THE_SHEET_METHOD
                move-result v0
                if-eqz v0, :the_sheet_then
                return-void
                """,
                ExternalLabel("the_sheet_then", getInstruction(0))
            )
        }

        // Sync has a sheet of its own for translating a whole thread, and it is opened by the
        // id of the post rather than with a bundle. What it does is what was replaced for one
        // comment — English whatever was asked for, wifi before a model, and the text as drawn
        // — so the opening of that one is taken over as well.
        opensASheetAboutOneFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                invoke-static { p0, p1, p2 }, $WITHOUT_THE_SHEET_CLASS_DESCRIPTOR->$INSTEAD_OF_ALL_METHOD
                move-result v0
                if-eqz v0, :the_sheet_then
                return-void
                """,
                ExternalLabel("the_sheet_then", getInstruction(0))
            )
        }

        // What is stored after a translation is composed twice over, once for a post and once
        // for a comment, from the same three things and to the same shape. Both are replaced:
        // only the translation is stored now, and what was written is kept aside instead of
        // being left above it under a rule.
        val composes = composesWhatIsStoredFingerprint.originalClassDef
        var replaced = 0

        mutableClassDefBy(composes.type).methods.forEach { composing ->
            val says = composing.implementation?.instructions?.any {
                it.getReference<StringReference>()?.string == NAMES_THE_SERVICE
            } ?: false
            if (!says) return@forEach

            composing.addInstructions(
                0,
                """
                invoke-static { p0, p1, p2 }, $IN_PLACE_CLASS_DESCRIPTOR->$INSTEAD_OF_COMPOSING_METHOD
                move-result-object p2
                return-object p2
                """
            )
            replaced++
        }

        if (replaced != 2) {
            throw PatchException("Expected a post and a comment to be composed, found $replaced")
        }

        // Whether translation is offered is ours to answer. Sync asks two things before it
        // offers it, one after the other: whether the copy is paid for, and whether the feature
        // was turned on from afar. Neither bears on translating on the device or with one's own
        // key, so both are answered from the setting instead. The pair is only replaced where
        // the two questions sit together, which is the two menus that offer translating; the
        // paid-copy question is asked all over the app and is left alone everywhere else.
        val offered = "invoke-static { }, $SETTINGS_CLASS_DESCRIPTOR->$OFFERED_METHOD"

        val turnedOnFromAfar = turnedOnFromAfarFingerprint.originalMethod
        val askedFromAfar = turnedOnFromAfar.name
        val askedFromAfarBy = turnedOnFromAfar.definingClass

        val gates = mutableListOf<Triple<ClassDef, Method, Pair<Int, Int>>>()

        classDefForEach { candidate ->
            if (candidate.type == askedFromAfarBy) return@classDefForEach

            candidate.methods.forEach eachMethod@{ method ->
                val instructions =
                    method.implementation?.instructions?.toList() ?: return@eachMethod

                val fromAfar = instructions.indexOfFirst {
                    val called = it.getReference<MethodReference>() ?: return@indexOfFirst false
                    called.name == askedFromAfar && called.definingClass == askedFromAfarBy
                }
                if (fromAfar < 0) return@eachMethod

                // The paid-copy question, asked a few instructions earlier and branched on.
                val paidFor = (maxOf(0, fromAfar - 4) until fromAfar).lastOrNull { at ->
                    val called = instructions[at].getReference<MethodReference>()
                    instructions[at].opcode == Opcode.INVOKE_STATIC &&
                            called != null &&
                            called.returnType == "Z" &&
                            called.parameterTypes.isEmpty() &&
                            called.definingClass != askedFromAfarBy
                } ?: return@eachMethod

                gates += Triple(candidate, method, paidFor to fromAfar)
            }
        }

        gates.forEach { (candidate, method, asked) ->
            mutableClassDefBy(candidate).methods.first {
                it.name == method.name &&
                        it.parameters.map { parameter -> parameter.type } ==
                        method.parameters.map { parameter -> parameter.type }
            }.apply {
                replaceInstruction(asked.first, offered)
                replaceInstruction(asked.second, offered)

                // Sync names the service it uses in the row it draws, and it is no longer the
                // one doing the work.
                implementation!!.instructions.toList().forEachIndexed { at, instruction ->
                    if (instruction.opcode != Opcode.CONST_STRING) return@forEachIndexed
                    val said = instruction.getReference<StringReference>()?.string
                    if (said != TRANSLATE_ROW) return@forEachIndexed

                    val register = (instruction as OneRegisterInstruction).registerA
                    replaceInstruction(at, "const-string v$register, \"$TRANSLATE_ROW_INSTEAD\"")
                }
            }
        }

    }
}
