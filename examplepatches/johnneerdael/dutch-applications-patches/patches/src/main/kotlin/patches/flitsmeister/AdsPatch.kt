package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction

private const val ADS_READER = "Lgm8;->W(Landroid/content/Context;)Z"
private const val ADS_PREFERENCE = "Lb38;->f0:Llph;"
private const val ADS_OFF = "const/4 v0, 0x0\nreturn v0"
private const val SETTINGS_GENERAL = "Ljxg;->d(Landroidx/compose/ui/Modifier;Lz39;Lz39;Lz39;Lz39;Lz39;Lz39;ZLnl/flitsmeister/fmcore/data/model/vehicle/BaseVehicleProfile;Landroidx/compose/runtime/Composer;I)V"
private const val SETTINGS_ROW = "Lna6;->f(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Modifier;Ljava/lang/String;JJLp49;Lr49;Lr49;Lr49;Ljava/lang/Integer;ZZZZZZZZJLz39;Landroidx/compose/runtime/Composer;III)V"
private const val LBA = "Lnl/flitsmeister/lba/model/LBA;"
private const val LBA_IMAGES = "Lnl/flitsmeister/lba/repository/LBAImageRepository;"
private const val MONITORING = "Lnl/flitsmeister/lba/model/LBADisplayType;->MONITORING:Lnl/flitsmeister/lba/model/LBADisplayType;"
private const val LBA_DIALOG = "Lnha\$a;->a(Landroid/content/Context;Lnl/flitsmeister/lba/model/LBA;)Lnha;"

/** Apply the app's existing informative/monitoring exception before any
 * commercial image, notification or dialog work, including stale parcels. */
private fun trafficOnly(lba: String, temp: String, other: String, denied: String) = """
    invoke-virtual {$lba}, $LBA->getInformative()Z
    move-result $temp
    if-nez $temp, :morphe_join
    invoke-virtual {$lba}, $LBA->getDisplayType()Lnl/flitsmeister/lba/model/LBADisplayType;
    move-result-object $temp
    sget-object $other, $MONITORING
    if-eq $temp, $other, :morphe_join
    $denied
""".trimIndent()

private fun commercialLbaPlans() = listOf(
    MethodPlan("Lnl/flitsmeister/lba/api/LBADataApiService\$Companion;->getLBAFromJson(Lorg/json/JSONObject;)$LBA", 3, 18, listOf(
        Guard(0, Opcode.SGET_OBJECT, listOf(1), "Lnl/flitsmeister/lba/api/LBADataApiService\$Companion;->lbaGson:Lcom/google/gson/Gson;"),
        Guard(4, Opcode.INVOKE_VIRTUAL, listOf(1, 2, 0), "Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;"),
        Guard(5, Opcode.MOVE_RESULT_OBJECT, listOf(1)),
        Guard(6, Opcode.CHECK_CAST, listOf(1), LBA),
        Guard(7, Opcode.RETURN_OBJECT, listOf(1)),
    ), listOf(Edit(7, "labelled", "if-eqz p0, :morphe_join\n" +
        trafficOnly("p0", "v0", "p1", "const/4 p0, 0x0"), 7))),
    MethodPlan("$LBA_IMAGES->getImage(${LBA}Lnl/flitsmeister/lba/model/LBAImageType;)Landroid/graphics/Bitmap;", 5, 37, listOf(
        Guard(1, Opcode.INVOKE_VIRTUAL, listOf(3), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
        Guard(2, Opcode.INVOKE_VIRTUAL, listOf(4), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
        Guard(3, Opcode.INVOKE_DIRECT, listOf(2, 3, 4), "$LBA_IMAGES->typeImageExists(${LBA}Lnl/flitsmeister/lba/model/LBAImageType;)Z"),
    ), listOf(Edit(0, "labelled", trafficOnly("p1", "v0", "v1", "const/4 v0, 0x0\nreturn-object v0"), 0))),
    MethodPlan("$LBA_IMAGES->downloadAndSaveBitmapToStorage(${LBA}Lnl/flitsmeister/lba/model/LBAImageType;)V", 6, 10, listOf(
        Guard(0, Opcode.SGET_OBJECT, listOf(0), "Lp37;->a:Loe6;"),
        Guard(4, Opcode.NEW_INSTANCE, listOf(1), "Lnl/flitsmeister/lba/repository/LBAImageRepository\$downloadAndSaveBitmapToStorage\$1;"),
        Guard(8, Opcode.INVOKE_STATIC, listOf(0, 2, 2, 1, 3), "Lkx1;->c(Lz45;Lh45;Ld55;Lp49;I)Ladi;"),
    ), listOf(Edit(0, "labelled", trafficOnly("p1", "v0", "v1", "return-void"), 0))),
    MethodPlan("Lcl8;->getNotificationForLBA(Landroid/content/Context;$LBA)Landroid/app/Notification;", 13, 122, listOf(
        Guard(0, Opcode.INVOKE_VIRTUAL, listOf(11), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
        Guard(1, Opcode.INVOKE_VIRTUAL, listOf(12), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
        Guard(3, Opcode.IGET_OBJECT, listOf(10, 10), "Lcl8;->c:Lqmb;"),
        Guard(5, Opcode.INVOKE_VIRTUAL, listOf(12), "$LBA->getInformative()Z"),
    ), listOf(Edit(0, "labelled", trafficOnly("p2", "v0", "v1", "const/4 v0, 0x0\nreturn-object v0"), 0))),
    MethodPlan("Liha;->handle(Landroid/content/Intent;)V", 5, 32, listOf(
        Guard(20, Opcode.IF_NEZ, listOf(4), target = 22),
        Guard(25, Opcode.GOTO, target = 27),
        Guard(27, Opcode.SGET, listOf(3), "Lnha;->c:I"),
        Guard(28, Opcode.INVOKE_STATIC, listOf(0, 4), LBA_DIALOG),
        Guard(30, Opcode.INVOKE_VIRTUAL, listOf(3), "Landroid/app/Dialog;->show()V"),
    ), listOf(Edit(28, "labelled", trafficOnly("p1", "v1", "v2", "return-void"), 28))),
    MethodPlan("Lghb\$c;->l(Lnl/flitsmeister/fmcore/models/data/map/objects/FMMapPin;)V", 7, 98, listOf(
        Guard(27, Opcode.INVOKE_VIRTUAL, listOf(6), "Lnl/flitsmeister/lba/model/LBAPoint;->getLba()Lnl/flitsmeister/lba/model/LBA;"),
        Guard(28, Opcode.MOVE_RESULT_OBJECT, listOf(6)),
        Guard(29, Opcode.SGET, listOf(0), "Lnha;->c:I"),
        Guard(30, Opcode.INVOKE_STATIC, listOf(5, 6), LBA_DIALOG),
        Guard(32, Opcode.INVOKE_VIRTUAL, listOf(0), "Landroid/app/Dialog;->show()V"),
    ), listOf(Edit(30, "labelled", trafficOnly("p1", "v1", "v2", "return-void"), 30))),
)

/** Unlock Pro adds one eligibility scalar to W. Inspect either exact layout,
 * then defer replacement until every patch's execute block has completed. */
context(context: BytecodePatchContext)
private fun adsReaderPlan(replace: Boolean): MethodPlan {
    val method = exact("Lgm8;", "W", "Z", "Landroid/content/Context;").method
    val count = method.instructions.size
    check(count == 11 || count == 12) { "Changed general-ads reader layout" }
    val offset = count - 11
    check(method.getInstruction<NarrowLiteralInstruction>(9 + offset).narrowLiteral == 1) {
        "Changed general-ads fallback"
    }
    if (offset == 1) {
        check(method.getInstruction<NarrowLiteralInstruction>(4).narrowLiteral == 1) {
            "Unexpected general-ads eligibility override"
        }
    }
    return MethodPlan(ADS_READER, 2, count, listOf(
        Guard(0, Opcode.INVOKE_VIRTUAL, listOf(1), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
        Guard(1, Opcode.IGET_OBJECT, listOf(0, 0), "Lgm8;->b:Lsle;"),
        Guard(2, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
        Guard(3, Opcode.MOVE_RESULT, listOf(0)),
        Guard(4 + offset, Opcode.IF_EQZ, listOf(0), target = 9 + offset),
        Guard(5 + offset, Opcode.SGET_OBJECT, listOf(0), ADS_PREFERENCE),
        Guard(6 + offset, Opcode.INVOKE_VIRTUAL, listOf(0, 1), "Llph;->a(Landroid/content/Context;)Z"),
        Guard(7 + offset, Opcode.MOVE_RESULT, listOf(0)),
        Guard(8 + offset, Opcode.RETURN, listOf(0)),
        Guard(9 + offset, Opcode.CONST_4, listOf(0)),
        Guard(10 + offset, Opcode.RETURN, listOf(0)),
    ) + if (offset == 1) listOf(Guard(4, Opcode.CONST_16, listOf(0))) else emptyList(),
        if (replace) listOf(Edit(0, "body", ADS_OFF)) else emptyList(),
        mapOf(ADS_PREFERENCE to 1, "Lsle;->b(Landroid/content/Context;)Z" to 1))
}

@Suppress("unused")
val hideAds = bytecodePatch(
    name = "Hide ads",
    description = "Blocks commercial LBA records, image requests, cached images, notifications and dialogs; hides the Ads setting and preserves informative and monitoring traffic items.",
    default = true,
) {
    compatibleWith(flitsmeister)
    dependsOn(originalInput, startupCompatibility)
    execute {
        applyPlans(listOf(
            adsReaderPlan(replace = false),
            MethodPlan("Lim8;->a(Landroid/content/Context;)Z", 2, 15, listOf(
                Guard(0, Opcode.CONST_CLASS, listOf(0), "Ltle;"),
                Guard(6, Opcode.INVOKE_INTERFACE, listOf(0, 1), "Lsle;->b(Landroid/content/Context;)Z"),
                Guard(8, Opcode.IF_NEZ, listOf(0), target = 11),
                Guard(11, Opcode.SGET_OBJECT, listOf(0), ADS_PREFERENCE),
                Guard(12, Opcode.INVOKE_VIRTUAL, listOf(0, 1), "Llph;->a(Landroid/content/Context;)Z"),
            ), listOf(Edit(0, "body", ADS_OFF)), mapOf(ADS_PREFERENCE to 1)),
            MethodPlan(SETTINGS_GENERAL, 51, 477, listOf(
                Guard(426, Opcode.INVOKE_INTERFACE, listOf(11, 7), "Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V"),
                Guard(427, Opcode.CONST, listOf(7)),
                Guard(428, Opcode.INVOKE_STATIC, listOf(7, 11, 5), "Lria;->b(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;"),
                Guard(430, Opcode.SGET_OBJECT, listOf(20), "Lx14;->g:Landroidx/compose/runtime/internal/ComposableLambda;"),
                Guard(437, Opcode.MOVE_OBJECT_FROM16, listOf(33, 46)),
                Guard(438, Opcode.INVOKE_STATIC_RANGE, (11..37).toList(), SETTINGS_ROW),
                Guard(439, Opcode.MOVE_OBJECT_FROM16, listOf(11, 34)),
                Guard(440, Opcode.INVOKE_INTERFACE, listOf(11), "Landroidx/compose/runtime/Composer;->endReplaceGroup()V"),
            ), listOf(Edit(438, "replace", "nop"))),
        ) + commercialLbaPlans())
    }
    finalize {
        // Morphe 2.0.1 finalizers run after all execute blocks. Leave W intact
        // during execution so Unlock Pro can validate/apply its original plan.
        applyPlans(listOf(adsReaderPlan(replace = true)))
    }
}
