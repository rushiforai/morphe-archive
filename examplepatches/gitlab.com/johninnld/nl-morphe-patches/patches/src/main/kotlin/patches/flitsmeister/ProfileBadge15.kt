package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode

private const val MENU_HEADER = "Lwwb;->b(ZLjava/lang/String;Landroid/graphics/Bitmap;Landroidx/compose/ui/graphics/painter/Painter;Ls39;Ljava/lang/String;Ls39;Ljava/lang/String;ZLandroidx/compose/runtime/Composer;I)V"
private const val BADGE_FACTORY = "Lxy0;->a(Lfoi;Landroidx/compose/runtime/Composer;)Lyy0;"
private const val PRO_BADGE = "Lfoi\$b;->a:Lfoi\$b;"

/** Use the existing PRO artwork for the local menu profile badge. Run after
 * notice guards so this presentation choice composes with their exact layouts.
 * Account data, entitlement providers and the shared badge factory stay intact.
 */
context(context: BytecodePatchContext)
internal fun applyProfileBadge15() {
    val method = exact("Lwwb;", "b", "V", "Z", "Ljava/lang/String;", "Landroid/graphics/Bitmap;",
        "Landroidx/compose/ui/graphics/painter/Painter;", "Ls39;", "Ljava/lang/String;", "Ls39;",
        "Ljava/lang/String;", "Z", "Landroidx/compose/runtime/Composer;", "I").method
    val plan = when (method.instructions.size) {
        751 -> MethodPlan(MENU_HEADER, 51, 751, listOf(
            Guard(478, Opcode.CHECK_CAST, listOf(9), "Lfoi;"),
            Guard(479, Opcode.INVOKE_STATIC, listOf(9, 11), BADGE_FACTORY),
            Guard(480, Opcode.MOVE_RESULT_OBJECT, listOf(9)),
            Guard(485, Opcode.INVOKE_INTERFACE, listOf(11), "Landroidx/compose/runtime/Composer;->endNode()V"),
        ), listOf(Edit(479, "insert", "sget-object v9, $PRO_BADGE")), mapOf(BADGE_FACTORY to 1))
        755 -> MethodPlan(MENU_HEADER, 51, 755, listOf(
            Guard(478, Opcode.CHECK_CAST, listOf(9), "Lfoi;"),
            Guard(479, Opcode.INSTANCE_OF, listOf(13, 9), "Lfoi\$b;"),
            Guard(480, Opcode.IF_NEZ, listOf(13), target = 489),
            Guard(481, Opcode.INSTANCE_OF, listOf(13, 9), "Lfoi\$c;"),
            Guard(482, Opcode.IF_NEZ, listOf(13), target = 489),
            Guard(483, Opcode.INVOKE_STATIC, listOf(9, 11), BADGE_FACTORY),
            Guard(484, Opcode.MOVE_RESULT_OBJECT, listOf(9)),
            Guard(489, Opcode.INVOKE_INTERFACE, listOf(11), "Landroidx/compose/runtime/Composer;->endNode()V"),
        ), listOf(
            Edit(479, "replace", "const/4 v13, 0x0"),
            Edit(481, "replace", "const/4 v13, 0x0"),
            Edit(483, "insert", "sget-object v9, $PRO_BADGE"),
        ), mapOf(BADGE_FACTORY to 1))
        else -> error("Changed Flitsmeister 15 menu profile layout")
    }
    applyPlans(listOf(plan))
}
