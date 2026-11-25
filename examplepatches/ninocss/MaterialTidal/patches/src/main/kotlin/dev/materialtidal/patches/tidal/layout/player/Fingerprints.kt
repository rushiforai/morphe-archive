package dev.materialtidal.patches.tidal.layout.player

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal object MainActivityFullPlayerFingerprint : Fingerprint(
    definingClass = "Lcom/aspiro/wamp/MainActivity;",
    returnType = "V",
    filters = listOf(
        string("com.aspiro.wamp.MainActivity.FullPlayer (MainActivity.kt:376)"),
        methodCall(
            definingClass = "Ljava/lang/Boolean;",
            name = "booleanValue",
            returnType = "Z",
        ),
    ),
)

internal object PlayerMarketUiFlagClinitFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    filters = listOf(
        string("player-market-ui"),
    ),
)

internal object PlayerScreenContentFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.playerscreen.ui.PlayerScreenContent (PlayerScreen.kt:175)"),
    ),
)

// ---- Play Queue & Suggested Tracks ----

private const val PLAY_QUEUE_DIALOG_TYPE = "Lcom/aspiro/wamp/nowplaying/view/playqueue/c;"
private const val PLAY_QUEUE_SUGGESTIONS_FRAGMENT_TYPE = "Lcom/aspiro/wamp/nowplaying/view/suggestions/a;"
private const val PLAY_QUEUE_TOUCH_CALLBACK_TYPE =
    "Lcom/aspiro/wamp/nowplaying/view/playqueue/touchmanagement/ItemTouchHelperCallbackImpl;"

internal object PlayQueueDialogOnViewCreatedFingerprint : Fingerprint(
    definingClass = PLAY_QUEUE_DIALOG_TYPE,
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
)

internal object PlayQueueDialogOnDestroyViewFingerprint : Fingerprint(
    definingClass = PLAY_QUEUE_DIALOG_TYPE,
    name = "onDestroyView",
    parameters = emptyList(),
    returnType = "V",
)

internal object PlayQueueHeaderDelegateBindFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/Object;", "Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;"),
    returnType = "V",
    custom = { method, classDef ->
        method.name == "c" && classDef.methods.any { m ->
            m.name == "<init>" && m.implementation?.instructions?.any { insn ->
                ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.let { f ->
                    f.definingClass == "Lcom/aspiro/wamp/R\$layout;" && f.name == "now_playing_cell_header"
                } == true
            } == true
        }
    },
)

internal object PlayQueueItemDelegateBindFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/Object;", "Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;"),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setOnTouchListener",
        ),
    ),
    custom = { method, classDef ->
        method.name == "c" &&
            !classDef.type.startsWith("Lcom/aspiro/wamp/nowplaying/view/suggestions/") &&
            classDef.methods.any { m ->
                m.name == "<init>" && m.implementation?.instructions?.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.let { f ->
                        f.definingClass == "Lcom/aspiro/wamp/R\$layout;" && f.name == "now_playing_cell_item"
                    } == true
                } == true
            }
    },
)

internal object PlayQueueSuggestionsOnViewCreatedFingerprint : Fingerprint(
    definingClass = PLAY_QUEUE_SUGGESTIONS_FRAGMENT_TYPE,
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
)

internal object PlayQueueTouchCallbackInitFingerprint : Fingerprint(
    definingClass = PLAY_QUEUE_TOUCH_CALLBACK_TYPE,
    name = "<init>",
    returnType = "V",
)

internal object PlayQueueTouchCallbackOnMoveFingerprint : Fingerprint(
    definingClass = PLAY_QUEUE_TOUCH_CALLBACK_TYPE,
    name = "onMove",
    parameters = listOf(
        "Landroidx/recyclerview/widget/RecyclerView;",
        "Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;",
        "Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;",
    ),
    returnType = "Z",
)

internal object PlayQueueTouchCallbackClearViewFingerprint : Fingerprint(
    definingClass = PLAY_QUEUE_TOUCH_CALLBACK_TYPE,
    name = "clearView",
    parameters = listOf(
        "Landroidx/recyclerview/widget/RecyclerView;",
        "Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;",
    ),
    returnType = "V",
)

internal object NavigatorInitFingerprint : Fingerprint(
    definingClass = "Lzlc;",
    name = "<init>",
    returnType = "V",
)

internal object SleepTimerControllerInitFingerprint : Fingerprint(
    definingClass = "Lcom/tidal/android/feature/sleeptimer/domain/SleepTimerController;",
    name = "<init>",
    returnType = "V",
)
