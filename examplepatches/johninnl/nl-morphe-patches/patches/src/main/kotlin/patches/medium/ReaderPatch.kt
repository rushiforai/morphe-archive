package patches.medium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private fun helper(type: String, name: String, returns: String, parameters: List<String>, locals: Int, code: String) =
    MutableMethod(ImmutableMethod(type, name, parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, returns,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(locals + parameters.size, emptyList(), emptyList(), emptyList()))).apply { addInstructions(0, code.trimIndent()) }

@Suppress("unused")
val readFullArticles = bytecodePatch(
    name = "Read full articles natively",
    description = "Replaces locked article previews with editorial-only mirror content rendered by Medium's native paragraph components.",
) {
    compatibleWith(medium)
    dependsOn(readerExtension, readerImageResources)
    execute {
        val outer = exact("Lxub;", "invokeSuspend", "Ljava/lang/Object;", "Ljava/lang/Object;").method
        val outerInstructions = outer.implementation!!.instructions.toList()
        val queryConstructor = outerInstructions.indices.single { position ->
            val ref = (outerInstructions[position] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lcom/medium/android/graphql/FullPostQuery;" && ref.name == "<init>"
        }
        val queryRegister = (outerInstructions[queryConstructor] as FiveRegisterInstruction).registerC
        val viewModel = outerInstructions.single { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.IGET_OBJECT && ref?.definingClass == "Lxub;" && ref.name == "f" && ref.type == "Lgvb;"
        } as TwoRegisterInstruction
        check(queryRegister <= 15 && viewModel.registerA <= 15) { "Article owner registers require re-audit" }
        outer.addInstructions(queryConstructor + 1,
            "invoke-static {v$queryRegister, v${viewModel.registerA}}, LMediumReaderFlow;->bindOwner(Ljava/lang/Object;Ljava/lang/Object;)V")

        val matched = exact("Lwi6;", "invokeSuspend", "Ljava/lang/Object;", "Ljava/lang/Object;")
        val cls = matched.classDef
        check(cls.fields.count { it.name == "f" && it.type == "Ljava/lang/String;" } == 1 &&
            cls.fields.count { it.name == "g" && it.type == "Ljava/lang/Object;" } == 1 &&
            cls.fields.count { it.name == "h" && it.type == "Ljava/lang/Object;" } == 1) { "Missing requested-post/repository field" }
        val repository = exact("Lnib;", "r", "Ljava/lang/Object;", "Ljava/lang/String;", "Lam2;").classDef
        check(repository.fields.count { it.name == "d" && it.type == "Lqye;" } == 1) { "Missing native refresh event stream" }
        check(cls.methods.none { it.name == "mediumReaderWrap" }) { "Reader hook already present" }
        cls.methods.add(helper("Lwi6;", "mediumReaderWrap", "Ljd5;", listOf("Ljd5;", "Lwi6;"), 2, """
            iget-object v0, p1, Lwi6;->f:Ljava/lang/String;
            iget-object v1, p1, Lwi6;->g:Ljava/lang/Object;
            check-cast v1, Lnib;
            iget-object v1, v1, Lnib;->d:Lqye;
            invoke-static {v1, v0}, LMediumReaderRetry;->bind(Lqye;Ljava/lang/String;)V
            iget-object v1, p1, Lwi6;->h:Ljava/lang/Object;
            invoke-static {p0, v0, v1}, LMediumReaderFlow;->wrap(Ljd5;Ljava/lang/String;Ljava/lang/Object;)Ljd5;
            move-result-object v0
            return-object v0
        """))
        val method = matched.method
        val instructions = method.implementation!!.instructions.toList()
        fun call(index: Int): MethodReference? = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        val anchor = instructions.indices.filter { call(it)?.let { ref -> ref.definingClass == "Lahb;" && ref.name == "<init>" } == true }.single()
        val index = instructions.indices.first { it > anchor && call(it)?.let { ref -> ref.definingClass == "Laoj;" && ref.name == "x" && ref.parameterTypes == listOf("Lld5;", "Ljd5;", "Lyl2;") } == true }
        val invoke = instructions[index] as FiveRegisterInstruction
        val flow = invoke.registerD; val owner = invoke.registerE
        method.addInstructions(index, """
            invoke-static {v$flow, v$owner}, Lwi6;->mediumReaderWrap(Ljd5;Lwi6;)Ljd5;
            move-result-object v$flow
        """.trimIndent())

        exact("Lcom/medium/android/donkey/DonkeyApplication;", "onCreate", "V").method.apply {
            val superCall = implementation!!.instructions.toList().indexOfFirst { it.opcode == Opcode.INVOKE_SUPER }
            check(superCall == 0) { "Application startup changed" }
            addInstructions(superCall + 1,
                "invoke-static/range {p0 .. p0}, Lnl/johninnl/medium/reader/ReaderBootstrap;->initialize(Landroid/content/Context;)V")
        }
        exact("Lcom/medium/android/donkey/main/MainActivity;", "onCreate", "V", "Landroid/os/Bundle;").method.addInstructions(0,
            "invoke-static/range {p0 .. p0}, Lnl/johninnl/medium/reader/OfflineEntry;->attach(Landroid/app/Activity;)V")

        // Coil's existing mapper continues to own ordinary Medium image requests.
        exact("Lr67;", "getId", "Ljava/lang/String;")
        val image = exact("Lvw;", "a", "Ljava/lang/String;", "Lr67;", "Lika;")
        val originalImage = image.method
        originalImage.setName("mediumReaderOriginalImage")
        image.classDef.methods.add(MutableMethod(ImmutableMethod("Lvw;", "a", originalImage.parameters,
            originalImage.returnType, originalImage.accessFlags, originalImage.annotations,
            originalImage.hiddenApiRestrictions, ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList()))).apply {
            addInstructions(0, """
                invoke-virtual {p1}, Lr67;->getId()Ljava/lang/String;
                move-result-object v0
                invoke-static {v0}, Lnl/johninnl/medium/reader/ReaderImages;->resolve(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :native_image
                return-object v0
                :native_image
                invoke-virtual {p0, p1, p2}, Lvw;->mediumReaderOriginalImage(Lr67;Lika;)Ljava/lang/String;
                move-result-object v0
                return-object v0
            """.trimIndent())
        })

        for ((type, bundle, getter) in listOf(
            Triple("Lcom/medium/android/donkey/post/PostFragment;", "Lcom/medium/android/donkey/post/PostFragment${'$'}BundleInfo;", "l1"),
            Triple("Lcom/medium/android/donkey/post/PostPageFragment2;", "Lcom/medium/android/donkey/post/PostPageFragment2${'$'}BundleInfo;", "d0"),
        )) {
            val view = exact(type, "H", "Landroid/view/View;", "Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;")
            val getterReturn = if (getter == "d0") "Lcom/medium/android/core/fragments/AbstractMediumFragment${'$'}BundleInfo;" else bundle
            exact(type, getter, getterReturn)
            check(view.classDef.methods.none { it.name == "mediumReaderUi" }) { "Reader UI hook already present" }
            view.classDef.methods.add(helper(type, "mediumReaderUi", "Landroid/view/View;", listOf("Landroid/view/View;", type), 1, """
                invoke-virtual {p1}, $type->$getter()$getterReturn
                move-result-object v0
                check-cast v0, $bundle
                invoke-virtual {v0}, $bundle->getPost()Lcom/medium/android/data/post/TargetPost;
                move-result-object v0
                invoke-virtual {v0}, Lcom/medium/android/data/post/TargetPost;->getId()Ljava/lang/String;
                move-result-object v0
                invoke-static {p0, v0}, Lnl/johninnl/medium/reader/ReaderUi;->wrap(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
                move-result-object v0
                return-object v0
            """))
            // Delegate through a fresh method so reused parameter registers in Medium's
            // original implementation cannot overwrite the fragment receiver.
            val original = view.method
            original.setName("mediumReaderCreateView")
            view.classDef.methods.add(MutableMethod(ImmutableMethod(type, "H", original.parameters,
                original.returnType, original.accessFlags, original.annotations,
                original.hiddenApiRestrictions, ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList()))).apply {
                addInstructions(0, """
                    invoke-virtual {p0, p1, p2, p3}, $type->mediumReaderCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
                    move-result-object v0
                    invoke-static {v0, p0}, $type->mediumReaderUi(Landroid/view/View;$type)Landroid/view/View;
                    move-result-object v0
                    return-object v0
                """.trimIndent())
            })
        }
    }
}
