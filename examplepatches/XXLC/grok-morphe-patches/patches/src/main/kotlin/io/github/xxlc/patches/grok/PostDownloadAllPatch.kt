package io.github.xxlc.patches.grok

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableField

@Suppress("unused")
val postDownloadAllPatch = bytecodePatch(
    name = "Download all (post)",
    description = "Thêm mục tải tất cả media của bài Imagine đang xem, giữ nguyên mục Download.",
    default = true,
) {
    compatibleWith(grokCompatibility)
    dependsOn(downloadResourcesPatch)

    execute {
        mutableClassDefBy("Le7/s0;").fields.add(
            ImmutableField(
                "Le7/s0;", "b", "Z", AccessFlags.PUBLIC.value, null, emptySet(), emptySet(),
            ).toMutable(),
        )

        DownloadActionEqualsFingerprint.method.apply {
            requireRegisterCount(5)
            // Chỉ trả về false nếu hai hành động Download khác cờ b.
            // Phần gốc tự khởi tạo lại v0, v1, v2; hashCode có thể giữ nguyên.
            addInstructionsWithLabels(
                0,
                """
                    instance-of v0, p1, Le7/s0;
                    if-eqz v0, :original_equals
                    move-object v0, p1
                    check-cast v0, Le7/s0;
                    iget-boolean v1, p0, Le7/s0;->b:Z
                    iget-boolean v0, v0, Le7/s0;->b:Z
                    if-eq v0, v1, :original_equals
                    const/4 v0, 0x0
                    return v0
                    :original_equals
                    nop
                """,
            )
        }

        PostMenuFingerprint.method.apply {
            requireRegisterCount(27) // .locals 26 và một tham số tĩnh.
            val returnIndex = implementation!!.instructions.lastIndex
            check(implementation!!.instructions[returnIndex].opcode == Opcode.RETURN_OBJECT) {
                "Điểm kết thúc danh sách menu không khớp smali gốc."
            }
            requireRegisters(returnIndex, 0)
            // Cuối method chỉ còn v0 (danh sách) và v10 (cờ của Le7/n2) cần giữ.
            // Tạo bản sao rồi chèn ngay sau Download; nếu thiếu thì thêm cuối.
            addInstructionsWithLabels(
                returnIndex,
                """
                    new-instance v1, Ljava/util/ArrayList;
                    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
                    new-instance v2, Le7/s0;
                    sget-object v3, Le7/o2;->a:Le7/o2;
                    invoke-direct {v2, v3}, Le7/s0;-><init>(Le7/o2;)V
                    const/4 v3, 0x1
                    iput-boolean v3, v2, Le7/s0;->b:Z
                    new-instance v4, Le7/n2;
                    invoke-direct {v4, v2, v10}, Le7/n2;-><init>(Le7/h1;Z)V
                    const/4 v6, 0x0
                    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
                    move-result-object v5
                    :find_download
                    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z
                    move-result v7
                    if-eqz v7, :insert_download_all
                    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                    move-result-object v7
                    check-cast v7, Le7/n2;
                    iget-object v7, v7, Le7/n2;->a:Le7/h1;
                    add-int/lit8 v6, v6, 0x1
                    instance-of v7, v7, Le7/s0;
                    if-eqz v7, :find_download
                    :insert_download_all
                    invoke-virtual {v1, v6, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
                    move-object v0, v1
                """,
            )
        }

        PostMenuLabelFingerprint.method.apply {
            requireRegisterCount(10)
            val labelIndex = PostMenuLabelFingerprint.instructionMatches.single().index
            requireRegisters(labelIndex, 4)
            // Hằng số gốc đã được fingerprint tra bằng tên tài nguyên.
            addInstructionsWithLabels(
                labelIndex + 1,
                """
                    move-object v0, p0
                    check-cast v0, Le7/s0;
                    iget-boolean v0, v0, Le7/s0;->b:Z
                    if-eqz v0, :original_label
                    const v4, $downloadAllStringId
                    :original_label
                    nop
                """,
            )
        }

        PostActionFingerprint.method.apply {
            requireRegisterCount(22)
            val sendIndex = indexOfReference(Opcode.SGET_OBJECT, "Le7/x;->a:Le7/x;")
            requireRegisters(sendIndex, 0)
            // Giữ nguyên thanh ghi và coroutine 0x1b của bản vá thủ công.
            // Media hiện tại vẫn đi qua nhánh gốc sau khi gửi các media còn lại.
            addInstructionsWithLabels(
                sendIndex,
                """
                    move-object v4, v0
                    check-cast v4, Le7/s0;
                    iget-boolean v4, v4, Le7/s0;->b:Z
                    if-eqz v4, :sd_done
                    invoke-virtual {v1}, Ly9/o2;->p0()Li7/i;
                    move-result-object v4
                    if-eqz v4, :sd_done
                    invoke-virtual {v4}, Li7/i;->d()Ljava/util/List;
                    move-result-object v4
                    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                    move-result-object v4
                    :sd_loop
                    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z
                    move-result v5
                    if-eqz v5, :sd_done
                    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                    move-result-object v5
                    check-cast v5, Li7/o;
                    if-eqz v3, :sd_send
                    if-eq v5, v3, :sd_loop
                    invoke-interface {v5}, Li7/j;->a()Lr7/u1;
                    move-result-object v6
                    invoke-interface {v3}, Li7/j;->a()Lr7/u1;
                    move-result-object v12
                    invoke-static {v6, v12}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v6
                    if-nez v6, :sd_loop
                    :sd_send
                    new-instance v12, Lwb/x0;
                    move-object v13, v1
                    sget-object v14, Le7/x;->a:Le7/x;
                    move-object v15, v5
                    move-object/from16 v16, v11
                    const/16 v17, 0x1b
                    invoke-direct/range {v12 .. v17}, Lwb/x0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lpn0/a;B)V
                    invoke-static {v7, v11, v11, v12, v8}, Luo0/e0;->B(Luo0/b0;Lkotlin/coroutines/CoroutineContext;Luo0/c0;Lkotlin/jvm/functions/Function2;I)Luo0/a2;
                    goto :sd_loop
                    :sd_done
                    nop
                """,
            )
        }
    }
}
