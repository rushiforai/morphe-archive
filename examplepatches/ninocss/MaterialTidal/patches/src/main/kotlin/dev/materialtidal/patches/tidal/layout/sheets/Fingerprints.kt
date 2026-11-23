package dev.materialtidal.patches.tidal.layout.sheets

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode

internal object BottomSheetDialogOnStartFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/material/bottomsheet/BottomSheetDialog;",
    name = "onStart",
    parameters = emptyList(),
    returnType = "V",
)

internal object ContextMenuAdapterOnBindFingerprint : Fingerprint(
    name = "onBindViewHolder",
    parameters = listOf("Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;", "I"),
    returnType = "V",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET,
            definingClass = "Lcom/tidal/android/contextmenu/R\$dimen;",
            name = "context_menu_title_margin",
        ),
        fieldAccess(
            opcode = Opcode.SGET,
            definingClass = "Lcom/tidal/android/contextmenu/R\$dimen;",
            name = "context_menu_icon_margin",
        ),
    ),
    custom = { _, classDef ->
        classDef.superclass == "Landroidx/recyclerview/widget/ListAdapter;"
    },
)

internal object ListPopupWindowShowFingerprint : Fingerprint(
    definingClass = "Landroidx/appcompat/widget/ListPopupWindow;",
    name = "show",
    parameters = emptyList(),
    returnType = "V",
)

internal object MenuAdapterGetViewFingerprint : Fingerprint(
    definingClass = "Landroidx/appcompat/view/menu/MenuAdapter;",
    name = "getView",
    parameters = listOf("I", "Landroid/view/View;", "Landroid/view/ViewGroup;"),
    returnType = "Landroid/view/View;",
)

internal object AlertControllerInstallContentFingerprint : Fingerprint(
    definingClass = "Landroidx/appcompat/app/AlertController;",
    name = "installContent",
    parameters = emptyList(),
    returnType = "V",
)

internal object ComposeModalBottomSheetContentFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/material3/ModalBottomSheetKt;",
    name = "ModalBottomSheetContent-IQkwcL4",
    returnType = "V",
)

internal object ComposeSheetBottomTokensClinitFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/material3/tokens/SheetBottomTokens;",
    name = "<clinit>",
    parameters = emptyList(),
    returnType = "V",
)

internal object ComposeDropdownMenuContentFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/material3/MenuKt;",
    name = "DropdownMenuContent-Qj0Zi0g",
    returnType = "V",
)

internal object ComposeMenuTokensClinitFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/material3/tokens/MenuTokens;",
    name = "<clinit>",
    parameters = emptyList(),
    returnType = "V",
)

internal object ComposeMenuKtClinitFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/material3/MenuKt;",
    name = "<clinit>",
    parameters = emptyList(),
    returnType = "V",
)

internal object ComposeAlertDialogContentFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/material3/AlertDialogKt;",
    name = "AlertDialogContent-4hvqGtA",
    returnType = "V",
)

internal object ComposeModalBottomSheetDialogWrapperInitFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/material3/ModalBottomSheetDialogWrapper;",
    name = "<init>",
    returnType = "V",
)

internal object ComposeDialogWrapperInitFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/ui/window/DialogWrapper;",
    name = "<init>",
    returnType = "V",
)
