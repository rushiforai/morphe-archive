package io.github.xxlc.patches.grok

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction

private const val STATE_CLASS = "Lio/github/xxlc/extension/grok/DownloadAllState;"

@Suppress("unused")
val libraryDownloadAllPatch = bytecodePatch(
    name = "Download all (library)",
    description = "Thêm nút tải tất cả media của các bài Imagine đã chọn, giữ nguyên nút Download.",
    default = true,
) {
    compatibleWith(grokCompatibility)
    dependsOn(downloadResourcesPatch)
    extendWith("extensions/extension.mpe")

    execute {
        LibraryClickFingerprint.method.apply {
            requireRegisterCount(4) // .locals 3 và p0; tiền đề chỉ dùng v0, v1.
            val downloadIndex = indexOfReference(Opcode.SGET_OBJECT, "La7/o0;->a:La7/o0;")
            requireRegisters(downloadIndex, 0)
            // Nhánh switch gốc phải chạy qua thao tác tắt cờ khi bấm Download.
            addInstructionsAtControlFlowLabel(
                downloadIndex,
                """
                    const/4 v0, 0x0
                    sput-boolean v0, $STATE_CLASS->all:Z
                """,
            )
            // 0x1d đã có nơi sử dụng; bắt riêng 0x7f trước packed-switch gốc.
            // Đường đi thông thường khởi tạo lại v0, v1 trong phần mã gốc.
            addInstructionsWithLabels(
                0,
                """
                    iget-byte v0, p0, Ldb/q1;->a:B
                    const/16 v1, 0x7f
                    if-ne v0, v1, :original_click
                    iget-object v1, p0, Ldb/q1;->b:Lkotlin/jvm/functions/Function1;
                    const/4 v0, 0x1
                    sput-boolean v0, $STATE_CLASS->all:Z
                    sget-object v0, La7/o0;->a:La7/o0;
                    invoke-interface {v1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                    return-object v0
                    :original_click
                    nop
                """,
            )
        }

        LibraryButtonsFingerprint.method.apply {
            requireRegisterCount(32)
            val buttonIndex = LibraryButtonsFingerprint.instructionMatches.last().index
            requireRegisters(buttonIndex, 14, 15, 16, 17, 18, 19, 20)
            // Chèn sau lời gọi vẽ Download gốc, giữ cùng bố cục và trạng thái bật/tắt.
            addInstructionsWithLabels(
                buttonIndex + 1,
                """
                    sget-object v19, Lcg/q;->g0:Lzf0/b;
                    const v0, $downloadAllStringId
                    invoke-static {v0, v6}, Lm10/a;->k0(ILum/i0;)Ljava/lang/String;
                    move-result-object v15
                    invoke-static {v3, v1}, Lpl/p2;->c(Lkn/p;F)Lkn/p;
                    move-result-object v16
                    invoke-virtual {v6, v9}, Lum/i0;->g(Ljava/lang/Object;)Z
                    move-result v0
                    invoke-virtual {v6}, Lum/i0;->Q()Ljava/lang/Object;
                    move-result-object v4
                    if-nez v0, :sd_all_a
                    if-ne v4, v2, :sd_all_b
                    :sd_all_a
                    new-instance v4, Ldb/q1;
                    const/16 v0, 0x7f
                    invoke-direct {v4, v9, v0}, Ldb/q1;-><init>(Lkotlin/jvm/functions/Function1;B)V
                    invoke-virtual {v6, v4}, Lum/i0;->p0(Ljava/lang/Object;)V
                    :sd_all_b
                    move-object/from16 v17, v4
                    check-cast v17, Lkotlin/jvm/functions/Function0;
                    move-object/from16 v18, v6
                    invoke-static/range {v14 .. v20}, Leb/e;->c(ILjava/lang/String;Lkn/p;Lkotlin/jvm/functions/Function0;Lum/i0;Lzf0/b;Z)V
                """,
            )
        }

        LibrarySelectionFingerprint.method.apply {
            requireRegisterCount(44) // .locals 42, giữ nguyên số thanh ghi.
            val postIndex = indexOfReference(Opcode.IGET_OBJECT, "Le7/a;->a:Li7/i;")
            val singleIndex = indexOfReference(Opcode.NEW_INSTANCE, "La7/b1;")
            val resetIndex = indexOfReference(Opcode.IGET_OBJECT, "Lh8/i;->m:Lap0/d;")
            requireRegisters(postIndex, 8, 8)
            requireRegisters(singleIndex, 8)
            requireRegisters(resetIndex, 7, 1)

            // Lấy đích :cond_2f từ if-eqz v8 ngay sau constructor La7/b1.
            val nextPostBranch = implementation!!.instructions[singleIndex + 2] as BuilderOffsetInstruction
            check(nextPostBranch.opcode == Opcode.IF_EQZ) {
                "Nhánh chuyển sang bài tiếp theo không khớp smali gốc."
            }
            requireRegisters(singleIndex + 2, 8)
            val nextPostIndex = nextPostBranch.target.location.index

            // Chèn từ cuối về đầu để các chỉ số chưa dùng không bị dịch chuyển.
            // :goto_e là đích nhảy nên phải giữ nhãn trên phần xoá cờ.
            addInstructionsAtControlFlowLabel(
                resetIndex,
                """
                    const/4 v7, 0x0
                    sput-boolean v7, $STATE_CLASS->all:Z
                """,
            )
            // :cond_35 cũng là đích nhảy; vòng lặp phải chạy trước nhánh một media.
            addInstructionsAtControlFlowLabel(
                singleIndex,
                """
                    check-cast v0, La7/d1;
                    iget-object v13, v0, La7/d1;->a:La7/s0;
                    sget-object v14, La7/o0;->a:La7/o0;
                    if-ne v13, v14, :single_b1
                    sget-boolean v13, $STATE_CLASS->all:Z
                    if-eqz v13, :single_b1
                    invoke-virtual/range {v32 .. v32}, Li7/i;->d()Ljava/util/List;
                    move-result-object v13
                    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                    move-result-object v13
                    :all_loop
                    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z
                    move-result v14
                    if-eqz v14, :next_post
                    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                    move-result-object v14
                    check-cast v14, Li7/o;
                    new-instance v15, La7/b1;
                    invoke-direct {v15, v7, v14}, La7/b1;-><init>(Lr7/j1;Li7/o;)V
                    invoke-virtual {v5, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                    goto :all_loop
                    :single_b1
                    nop
                """,
                ExternalLabel("next_post", nextPostIndex),
            )
            addInstruction(postIndex + 1, "move-object/from16 v32, v8")
        }
    }
}
