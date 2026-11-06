package app.swiftbackup.patches.blacklist

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/** Match the normalization boundary, where loading and saving both truncate the blacklist. */
object BlacklistStorageLimitFingerprint : Fingerprint(
    returnType = "Lorg/swiftapps/swiftbackup/blacklist/data/BlacklistData;",
    parameters = listOf("Lorg/swiftapps/swiftbackup/blacklist/data/BlacklistData;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    filters = listOf(
        methodCall(
            definingClass = "Lorg/swiftapps/swiftbackup/blacklist/data/BlacklistData;",
            name = "getItems"
        ),
        literal(100)
    )
)

/** The shared click listener's unique limit message pins the blacklist screen's add-button guard. */
object BlacklistAddLimitFingerprint : Fingerprint(
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    filters = listOf(literal(100), string(" (100/100)"))
)

/** The per-app overflow menu has its own gate, separate from the blacklist screen's add button. */
object BlacklistAppMenuLimitFingerprint : Fingerprint(
    definingClass = "Lpj;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        methodCall(
            definingClass = "Lorg/swiftapps/swiftbackup/blacklist/data/BlacklistData;",
            name = "getItems"
        ),
        literal(100)
    )
)

/** Selection changes enforce the maximum again and refresh the selection counter in the dialog. */
object BlacklistSelectionLimitFingerprint : Fingerprint(
    definingClass = "Lsr0;",
    name = "onClick",
    parameters = listOf("Landroid/content/DialogInterface;", "I", "Z"),
    returnType = "V",
    filters = listOf(literal(100))
)

/** Pin counter-only edits to the verified shared callback branches; other callbacks also use the number 100. */
object BlacklistToolbarCountFingerprint : Fingerprint(
    definingClass = "Lhj;",
    name = "invoke",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
    filters = listOf(methodCall(definingClass = "Lorg/swiftapps/swiftbackup/common/Const;", name = "p"))
)

/** The initial multi-selection dialog title has a separate maximum from its item-change listener. */
object BlacklistDialogCountFingerprint : Fingerprint(
    definingClass = "Lox;",
    name = "invoke",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
    filters = listOf(methodCall(definingClass = "Lorg/swiftapps/swiftbackup/common/Const;", name = "p"))
)
