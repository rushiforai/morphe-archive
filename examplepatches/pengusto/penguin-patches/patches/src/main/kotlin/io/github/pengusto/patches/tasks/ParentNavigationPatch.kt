package io.github.pengusto.patches.tasks

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.*
import io.github.pengusto.patches.codeDigest

private const val fragment = "Lcom/todoroo/astrid/activity/TaskEditFragment;"
private const val mainVm = "Lcom/todoroo/astrid/activity/MainActivityViewModel;"
private const val vm = "Lorg/tasks/ui/TaskEditViewModel;"
private const val task = "Lorg/tasks/data/entity/Task;"
private const val state = "Lorg/tasks/kmp/org/tasks/taskedit/TaskEditViewState;"
private const val ui = "Lorg/tasks/compose/edit/TaskEditScreenKt;"
private const val actions = "Lorg/tasks/compose/edit/TaskEditScreenKt\$\$ExternalSyntheticLambda15;"
private const val hooks = "Lio/github/pengusto/patches/extension/tasks/TasksHooks;"
private const val runtime = "Lio/github/pengusto/patches/extension/tasks/ParentNavigation;"
private const val obj = "Ljava/lang/Object;"
private const val continuation = "Lkotlin/coroutines/Continuation;"
private const val impl = "Lkotlin/coroutines/jvm/internal/ContinuationImpl;"
private const val composer = "Landroidx/compose/runtime/Composer;"
private const val gap = "Landroidx/compose/runtime/GapComposer;"
private const val fn0 = "Lkotlin/jvm/functions/Function0;"
private const val fn2 = "Lkotlin/jvm/functions/Function2;"

@Suppress("unused")
val parentNavigationPatch = bytecodePatch(
    name = "Navigate to the parent task",
    description = "Add a parent-task arrow to the existing editor. Keeps Back behavior and the current filter; asks whether to save, discard or cancel when the draft has changes. Official project F-Droid APK 15.13 only.",
    default = true,
) {
    compatibleWith(Compatibility(name = "Tasks.org", packageName = "org.tasks",
        targets = listOf(AppTarget(version = "15.13"))))
    extendWith("extensions/tasks.mpe")
    execute {
        mapOf(
            fragment to "0eee750dd81b567dfe2b1239939022c6ca654ec5b009fbd0de7422f1b64f39fd",
            mainVm to "01990b49914d8249ba61994d267120fa7bda2e26a18f11334b2a867f52365940",
            ui to "9187873ba668cae737ab9f3915b9dc79d4cb93db85999207b32f15fa5ab9cd8e",
            "Lorg/tasks/data/dao/TaskDao;" to "b4739fe188dfe3043b2502a10c50a2859cfdcaae1f4befaa09c1e22c018bc44a",
            task to "8a8b8264b48b5806f120183bc42da7220973f046cbff1c521de2b8d3ea54faef",
            vm to "7856f1c436c05750ed328f1fd637c6a535baa11e251e09b89ed7c32f03739b87",
            actions to "6227439b2ce61fe95b26608b506508f84adf870198b3c3f049b7ea3147a31fea",
            "Lorg/tasks/ui/TaskEditViewModel\$save\$2;" to "b23fcdf3b4459eccf3a1c1350a2dc3df454818c9b7da9994458220c97a7199e9",
        ).forEach { (type, expected) ->
            check(classDefBy(type).codeDigest() == expected) {
                "Unsupported or already patched Tasks.org bytecode: $type. Use the original official project F-Droid 15.13 APK."
            }
        }
        fun method(owner: String, name: String): MutableMethod =
            mutableClassDefBy(owner).methods.single { it.name == name }
        fun bind(name: String, registers: Int, code: String) {
            val old = method(hooks, name)
            val replacement = MutableMethod(ImmutableMethod(hooks, old.name, old.parameters,
                old.returnType, old.accessFlags, old.annotations, old.hiddenApiRestrictions,
                ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())))
            replacement.addInstructions(0, code.trimIndent())
            mutableClassDefBy(hooks).methods.apply { check(remove(old)); add(replacement) }
        }
        // The optimized APK has no stdlib facade intrinsics or Kotlin 2.4
        // spilling helper. Bind their exact semantics without shipping stdlib.
        classDefForEach { cls ->
            if (cls.type.startsWith("Lio/github/pengusto/patches/extension/tasks/")) {
                mutableClassDefBy(cls).methods.forEach { m ->
                    m.implementation?.instructions?.toList()?.forEachIndexed { index, insn ->
                        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                        val name = when {
                            ref?.definingClass == "Lkotlin/coroutines/intrinsics/IntrinsicsKt;" && ref.name == "getCOROUTINE_SUSPENDED" -> "suspended"
                            ref?.definingClass == "Lkotlin/coroutines/jvm/internal/SpillingKt;" && ref.name == "nullOutSpilledVariable" -> "clearSpill"
                            else -> null
                        }
                        if (name != null && ref != null) {
                            val target = ImmutableMethodReference(hooks, name, ref.parameterTypes, ref.returnType)
                            when (insn) {
                                is FiveRegisterInstruction -> m.replaceInstruction(index, BuilderInstruction35c(insn.opcode,
                                    insn.registerCount, insn.registerC, insn.registerD, insn.registerE, insn.registerF, insn.registerG, target))
                                is RegisterRangeInstruction -> m.replaceInstruction(index, BuilderInstruction3rc(insn.opcode,
                                    insn.startRegister, insn.registerCount, target))
                                else -> error("Unexpected Kotlin intrinsic instruction")
                            }
                        }
                    }
                }
            }
        }
        bind("suspended", 1, """
            sget-object v0, Lkotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lkotlin/coroutines/intrinsics/CoroutineSingletons;
            return-object v0
        """)
        bind("launch", 6, """
            sget-object v0, Lkotlinx/coroutines/internal/MainDispatcherLoader;->dispatcher:Lkotlinx/coroutines/android/HandlerContext;
            iget-object v0, v0, Lkotlinx/coroutines/android/HandlerContext;->immediate:Lkotlinx/coroutines/android/HandlerContext;
            invoke-static {v0}, Lkotlinx/coroutines/DelayKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/internal/ContextScope;
            move-result-object v0
            const/4 v1, 0x0
            const/4 v2, 0x0
            move-object v3, p0
            const/4 v4, 0x3
            invoke-static/range {v0 .. v4}, Lkotlinx/coroutines/DelayKt;->launch${'$'}default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;$fn2${"I"})Lkotlinx/coroutines/Job;
            return-void
        """)
        method(fragment, "onCreateView").addInstructions(0,
            "invoke-static/range {p0 .. p0}, $runtime->bind($obj)V")
        val destroy = MutableMethod(ImmutableMethod(fragment, "onDestroyView", emptyList(), "V",
            AccessFlags.PUBLIC.value, emptySet(), emptySet(),
            ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList())))
        destroy.addInstructions(0, """
            invoke-static {p0}, $runtime->unbind($obj)V
            invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V
            return-void
        """.trimIndent())
        check(mutableClassDefBy(fragment).methods.none { it.name == "onDestroyView" })
        mutableClassDefBy(fragment).methods.add(destroy)
        method(ui, "TaskEditScreen").addInstructions(0,
            "invoke-static/range {p0 .. p1}, $runtime->bindState($obj$obj)V")
        val action = method(actions, "invoke")
        val points = action.implementation!!.instructions.withIndex().filter { (_, i) ->
            val field = (i as? ReferenceInstruction)?.reference as? FieldReference
            field?.definingClass == state && field.name == "isReadOnly" && i.opcode == Opcode.IGET_BOOLEAN
        }
        check(points.size == 1 && (points.single().value as TwoRegisterInstruction).registerB == 0) {
            "Unexpected native Tasks.org action group"
        }
        // This branch has a live state in v0 and Composer in v4, before the
        // native read-only early return. The existing group/skip logic stays intact.
        action.addInstructions(points.single().index,
            "invoke-static {v0, v4}, $runtime->action($obj$obj)V")

        bind("vm", 1, """
            check-cast p0, $fragment
            invoke-virtual {p0}, $fragment->getEditViewModel()$vm
            move-result-object p0
            return-object p0
        """)
        bind("context", 1, """
            check-cast p0, $fragment
            invoke-virtual {p0}, $fragment->getContext()Landroid/content/Context;
            move-result-object p0
            return-object p0
        """)
        bind("active", 3, """
            check-cast p0, Landroidx/fragment/app/Fragment;
            invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;
            move-result-object v0
            if-eqz v0, :inactive
            invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
            move-result v1
            if-nez v1, :inactive
            invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z
            move-result v0
            if-nez v0, :inactive
            iget-object p0, p0, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;
            if-eqz p0, :inactive
            invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z
            move-result p0
            return p0
            :inactive
            const/4 p0, 0x0
            return p0
        """)
        bind("current", 1, """
            check-cast p0, $vm
            iget-object p0, p0, $vm->viewState:Lkotlinx/coroutines/flow/StateFlowImpl;
            invoke-virtual {p0}, Lkotlinx/coroutines/flow/StateFlowImpl;->getValue()$obj
            move-result-object p0
            check-cast p0, $state
            iget-object p0, p0, $state->task:$task
            return-object p0
        """)
        bind("task", 1, """
            check-cast p0, $state
            iget-object p0, p0, $state->task:$task
            return-object p0
        """)
        for (name in listOf("id", "parent")) bind(name, 3, """
            check-cast p0, $task
            iget-wide v0, p0, $task->$name:J
            return-wide v0
        """)
        bind("deleted", 5, """
            check-cast p0, $task
            iget-wide v0, p0, $task->deletionDate:J
            const-wide/16 v2, 0x0
            cmp-long p0, v0, v2
            if-lez p0, :present
            const/4 p0, 0x1
            return p0
            :present
            const/4 p0, 0x0
            return p0
        """)
        bind("hasChanges", 1, """
            check-cast p0, $vm
            invoke-virtual {p0}, $vm->hasChanges()Z
            move-result p0
            return p0
        """)
        bind("fetch", 4, """
            check-cast p0, $vm
            iget-object p0, p0, $vm->taskDao:Lorg/tasks/data/dao/TaskDao;
            check-cast p3, $impl
            invoke-virtual/range {p0 .. p3}, Lorg/tasks/data/dao/TaskDao;->fetch(J$impl)$obj
            move-result-object p0
            return-object p0
        """)
        // R8 inlined TaskEditViewModel.save(). Reuse exactly its shipped
        // NonCancellable transaction and Boolean result instead of reimplementing it.
        bind("save", 5, """
            check-cast p0, $vm
            sget-object v0, Lkotlinx/coroutines/NonCancellable;->INSTANCE:Lkotlinx/coroutines/NonCancellable;
            new-instance v1, Lorg/tasks/ui/TaskEditViewModel${'$'}save${'$'}2;
            const/4 v2, 0x0
            invoke-direct {v1, p0, v2}, Lorg/tasks/ui/TaskEditViewModel${'$'}save${'$'}2;-><init>($vm$continuation)V
            invoke-static {v0, v1, p1}, Lkotlinx/coroutines/DelayKt;->withContext(Lkotlin/coroutines/CoroutineContext;$fn2$continuation)$obj
            move-result-object p0
            return-object p0
        """)
        bind("discard", 2, """
            check-cast p0, $vm
            check-cast p1, $impl
            invoke-virtual {p0, p1}, $vm->discard($impl)$obj
            move-result-object p0
            return-object p0
        """)
        bind("open", 2, """
            check-cast p0, $fragment
            check-cast p1, $task
            iget-object p0, p0, $fragment->mainViewModel${'$'}delegate:Lcoil/ComponentRegistry${'$'}Builder;
            invoke-virtual {p0}, Lcoil/ComponentRegistry${'$'}Builder;->getValue()$obj
            move-result-object p0
            check-cast p0, $mainVm
            invoke-virtual {p0, p1}, $mainVm->setTask($task)V
            return-void
        """)
        bind("draw", 12, """
            check-cast p0, $gap
            const v0, 0x50e2838
            invoke-virtual {p0, v0}, $gap->startReplaceGroup(I)V
            if-eqz p1, :end_group
            move-object v0, p1
            const/4 v1, 0x0
            const/4 v2, 0x0
            const/4 v3, 0x0
            const/4 v4, 0x0
            move-object v5, p2
            move-object v6, p0
            const/4 v7, 0x0
            const/16 v8, 0x3e
            invoke-static/range {v0 .. v8}, Landroidx/compose/material3/ScrimKt;->IconButton($fn0${"Landroidx/compose/ui/Modifier;"}ZLandroidx/compose/material3/IconButtonColors;Landroidx/compose/ui/graphics/Shape;$fn2${composer}II)V
            :end_group
            const/4 v0, 0x0
            invoke-virtual {p0, v0}, $gap->end(Z)V
            return-void
        """)
        bind("icon", 11, """
            const-string v0, "arrow_upward"
            move-object v1, p2
            const/4 v2, 0x0
            const-wide/16 v3, 0x0
            move-object v5, p0
            check-cast v5, $composer
            const/4 v6, 0x0
            const/16 v7, 0xc
            invoke-static/range {v0 .. v7}, Lorg/tasks/compose/components/IconByLabelKt;->SymbolIcon-uDo3WH8(Ljava/lang/String;Ljava/lang/String;Landroidx/compose/ui/Modifier;J${composer}II)V
            return-void
        """)
    }
}
