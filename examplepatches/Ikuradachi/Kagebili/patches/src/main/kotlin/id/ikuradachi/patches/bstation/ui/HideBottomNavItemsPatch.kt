package id.ikuradachi.patches.bstation.ui

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal fun BytecodePatchContext.applyBottomNav(
    hideDiscoverTab: Boolean,
    hideCreateButton: Boolean,
    hideChatsTab: Boolean,
    hideMeTab: Boolean,
    hideShortsTab: Boolean,
) {
    val patterns = buildList {
        if (hideCreateButton == true) add("popup-center-plus")
        if (hideDiscoverTab == true) add("discover-home")
        if (hideChatsTab == true) add("message-home")
        if (hideMeTab == true) add("user_center/mine")
        if (hideShortsTab == true) add("shorts")
    }

    if (patterns.isEmpty()) return

    val method = MainNavigationInfoFingerprint.method
    val classDef = MainNavigationInfoFingerprint.classDef

    val checkBranches = patterns.joinToString("\n") { pattern ->
        """
            const-string v2, "$pattern"
            invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
            move-result v2
            if-nez v2, :remove_item
        """.trimIndent()
    }

    val filterBody = """
        if-eqz p0, :cond_done

        invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v0

        :loop_start
        invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
        move-result v1
        if-eqz v1, :cond_done

        invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v1
        if-eqz v1, :loop_start

        instance-of v2, v1, Ltv/danmaku/bili/ui/main2/basic/BaseMainFrameFragment${'$'}c;
        if-eqz v2, :loop_start

        check-cast v1, Ltv/danmaku/bili/ui/main2/basic/BaseMainFrameFragment${'$'}c;
        iget-object v1, v1, Ltv/danmaku/bili/ui/main2/basic/BaseMainFrameFragment${'$'}c;->a:Lnf1/e;
        if-eqz v1, :loop_start

        iget-object v1, v1, Lnf1/e;->e:Ljava/lang/String;
        if-eqz v1, :loop_start

        const-string v2, "main/home"
        invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
        move-result v2
        if-nez v2, :loop_start

        $checkBranches

        goto :loop_start

        :remove_item
        invoke-interface {v0}, Ljava/util/Iterator;->remove()V
        goto :loop_start

        :cond_done
        return-object p0
    """.trimIndent()

    val filterMethod = MutableMethod(
        ImmutableMethod(
            classDef.type,
            "filterBottomNavTabs",
            listOf(ImmutableMethodParameter("Ljava/util/List;", emptySet(), null)),
            "Ljava/util/List;",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(6),
        ),
    )
    filterMethod.addInstructions(0, filterBody)
    classDef.methods.add(filterMethod)

    val returnIndex = method.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
    check(returnIndex >= 0) { "Could not find return-object instruction in ${method.name}" }

    val returnInstruction = method.getInstruction<OneRegisterInstruction>(returnIndex)
    val register = returnInstruction.registerA

    method.replaceInstruction(
        returnIndex,
        "invoke-static {v$register}, ${classDef.type}->filterBottomNavTabs(Ljava/util/List;)Ljava/util/List;",
    )
    method.addInstructions(
        returnIndex + 1,
        """
            move-result-object v$register
            return-object v$register
        """.trimIndent(),
    )
}
