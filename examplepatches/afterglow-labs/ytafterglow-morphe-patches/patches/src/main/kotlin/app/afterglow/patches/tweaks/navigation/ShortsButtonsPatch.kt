package app.afterglow.patches.tweaks.navigation

import app.afterglow.patches.litho.afterglowLithoFilterPatch
import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.video.addPublicMethod
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.getFreeRegisterProvider
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val BUTTONS = "$EXTENSION_PACKAGE/navigation/ShortsButtons;"
private const val BINDINGS = "$EXTENSION_PACKAGE/navigation/ShortsHeaderBindings;"
private const val TAG_BUILDER = "$EXTENSION_PACKAGE/navigation/ShortsHeaderBindings\$TagBuilder;"

private val shortsHeaderTagResourcePatch = resourcePatch {
    execute {
        document("res/values/ids.xml").use { doc ->
            doc.documentElement.appendChild(doc.createElement("item").apply {
                setAttribute("type", "id")
                setAttribute("name", "afterglow_shorts_header_role")
            })
        }
    }
}

/** Bind only the native Shorts header options and paused Lens container. */
internal val shortsButtonsHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch, afterglowLithoFilterPatch, shortsHeaderTagResourcePatch,
        shortsPlayerLayerHookPatch)
    execute {
        val header = Fingerprint(returnType = "V", parameters = listOf("L"), filters = listOf(
            resourceLiteral(ResourceType.ID, "reel_header_options_container"),
            methodCall(smali = "Laurc;->a(Lbgdf;)I"),
            opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
            methodCall(smali = "Landroid/support/v7/widget/AppCompatImageView;->setImageResource(I)V", location = MatchAfterImmediately())
        ))
        val matches = header.instructionMatches
        val icon = matches[1].instruction.invokeRegisters
        val image = matches[3].instruction.invokeRegisters
        require(icon.size == 2 && image.size == 2)
        require((matches[2].instruction as OneRegisterInstruction).registerA == image[1])
        header.method.addInstructions(matches[3].index + 1,
            invokeStatic(image[0], icon[1], method = "$BUTTONS->header(Landroid/view/View;Ljava/lang/Enum;)V"))
        println("Afterglow Shorts header: ${header.method.definingClass}->${header.method.name}")

        val lens = Fingerprint(returnType = "V", parameters = listOf("Ljava/lang/String;"), filters = listOf(
            resourceLiteral(ResourceType.ID, "lens_paused_state_container"),
            methodCall(smali = "Latom;->h(Landroid/view/ViewGroup;Lbfcw;Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/Runnable;)V")
        ))
        val call = lens.instructionMatches.last()
        val arguments = call.instruction.invokeRegisters
        require(arguments.size == 9)
        lens.method.addInstructions(call.index,
            invokeStatic(arguments[1], method = "$BUTTONS->lens(Landroid/view/View;)V"))
        println("Afterglow Shorts Lens: ${lens.method.definingClass}->${lens.method.name}")

        // The modern toolbar keeps its mounted tree when settings closes. Tag
        // the exact buttons before native builder finalization instead of
        // discarding components only when conversion happens to run again.
        // 21.43.523: Lvmr holds the map; Lwvq delegates to that same builder.
        for (type in listOf("Lvmr;", "Lwvq;")) {
            val cls = mutableClassDefBy(type)
            require(cls.methods.single { it.name == "u" && it.parameterTypes ==
                listOf("I", "Ljava/lang/Object;") }.returnType == "V")
            cls.interfaces.add(TAG_BUILDER)
            cls.addPublicMethod("afterglow_putShortsTag", listOf("I", "Ljava/lang/Object;"), "V", 3, """
                invoke-virtual { p0, p1, p2 }, $type->u(ILjava/lang/Object;)V
                return-void
            """)
        }
        val filterCall = Fingerprint(filters = listOf(methodCall(
            definingClass = "$EXTENSION_PACKAGE/litho/LithoFilterPatch;", name = "isFiltered")))
        val conversion = filterCall.method
        val filterArgs = filterCall.instructionMatches.single().instruction.invokeRegisters
        require(filterArgs.size == 4)
        val code = conversion.implementation!!.instructions
        val buildIndex = code.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lwwa;" && ref.name == "b" && ref.returnType == conversion.returnType
        }
        require(buildIndex >= 0)
        val buildArgs = code[buildIndex].invokeRegisters
        require(buildArgs.size == 2)
        val idRegister = filterArgs[2]
        val free = conversion.getFreeRegisterProvider(buildIndex, 2, buildArgs + idRegister)
        val context = free.getFreeRegister4Bit()
        val element = free.getFreeRegister4Bit()
        conversion.addInstructionsAtControlFlowLabel(buildIndex, """
            move-object/from16 v$context, p2
            move-object/from16 v$element, p3
            ${invokeStatic(context, element, idRegister, buildArgs[0], method = "$BINDINGS->prepare($EXTENSION_PACKAGE/litho/LithoContext;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V")}
        """)

        // Mount applies either View tags or ComponentHost's native tag map.
        // Unmount restores before those properties are reset and the view pooled.
        val mount = Fingerprint(returnType = "V", parameters = listOf("Ljava/lang/Object;", "L"),
            filters = listOf(methodCall(smali = "Landroid/view/View;->setTag(ILjava/lang/Object;)V")),
            custom = { method, cls -> cls.type == "Lhiy;" && method.name == "q" }).method
        mount.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }.asReversed().forEach { index ->
                mount.addInstructionsAtControlFlowLabel(index,
                    "invoke-static/range { p0 .. p0 }, $BINDINGS->mounted(Ljava/lang/Object;)V")
            }
        val unmount = Fingerprint(returnType = "V", parameters = listOf("Ljava/lang/Object;", "L", "I"),
            filters = listOf(methodCall(smali = "Landroid/view/View;->setTag(ILjava/lang/Object;)V")),
            custom = { method, cls -> cls.type == "Lhiy;" && method.name == "u" }).method
        unmount.addInstructions(0,
            "invoke-static/range { p0 .. p0 }, $BINDINGS->unmounted(Ljava/lang/Object;)V")
        println("Afterglow Shorts modern header: ${conversion.definingClass}->${conversion.name}, mount ${mount.definingClass}->${mount.name}, unmount ${unmount.name}")
    }
}
