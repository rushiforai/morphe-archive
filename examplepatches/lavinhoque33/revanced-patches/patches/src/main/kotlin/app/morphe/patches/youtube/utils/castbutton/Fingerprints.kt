package app.morphe.patches.youtube.utils.castbutton

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import app.morphe.patches.shared.mapping.ResourceType
import app.morphe.patches.shared.mapping.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val CAST_ENTRY_POINT_FLAG = 45690090L
internal const val CAST_AWARENESS_FLAG = 45759129L
internal const val CAST_AWARENESS_ALTERNATE_FLAG = 45758238L
internal const val CAST_COMPANION_CLICK_FLAG = 45673420L
internal const val CAST_COMPANION_ALTERNATE_CLICK_FLAG = 45823676L

private const val MDX_ENTRY_POINT_BUTTON =
    "Lcom/google/android/libraries/youtube/mdx/mediaroute/entrypoint/MdxEntryPointButton;"

internal object MenuItemInitializeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        resourceLiteral(ResourceType.LAYOUT, "castmediaroutebutton"),
        methodCall(name = "setShowAsAction"),
    ),
)

internal object MenuItemVisibilityFingerprint : Fingerprint(
    classFingerprint = MenuItemInitializeFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(methodCall(name = "setVisible")),
)

internal object ModernMenuItemVisibilityFingerprint : Fingerprint(
    classFingerprint = MenuItemInitializeFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(methodCall(name = "setVisible")),
)

// Before 21.30 these flags are exposed through config accessors rather than inlined at call sites.
internal fun castFlagAccessor(flag: Long) = Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(literal(flag)),
)

internal object ToolbarCastEntryPointFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/view/MenuItem;"),
    filters = listOf(methodCall(name = "getActionView"), checkCast(MDX_ENTRY_POINT_BUTTON)),
)

internal object ToolbarCastSelectionFingerprint : Fingerprint(
    parameters = listOf("L", "L", "L"),
    filters = listOf(
        literal(45826964L),
        literal(CAST_ENTRY_POINT_FLAG),
        methodCall(opcode = Opcode.INVOKE_INTERFACE, parameters = emptyList(), returnType = "Ljava/lang/Object;"),
    ),
)

internal object ToolbarCompanionButtonFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/MenuItem;", "Landroid/content/Context;"),
    filters = listOf(
        newInstance("Landroid/support/v7/widget/AppCompatImageButton;"),
        resourceLiteral(ResourceType.STRING, "mdx_accessibility_cast_entry_point_name"),
        methodCall(name = "setActionView"),
    ),
)

internal object ToolbarCompanionButtonIdFingerprint : Fingerprint(
    classFingerprint = ToolbarCompanionButtonFingerprint,
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(resourceLiteral(ResourceType.ID, "menu_cast")),
)

internal object ToolbarMenuCreateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroid/view/Menu;",
        "Landroid/view/MenuInflater;",
        "L",
        "Landroid/util/SparseArray;",
        "I",
        "Landroid/content/Context;",
    ),
    filters = listOf(string("Unhandled menu item %s")),
)
