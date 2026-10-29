package app.originisland.patches.youtube.widecomments

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.originisland.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION_CLASS = "Lapp/originisland/extension/WideCommentsPatch;"

/**
 * The layout of the watch page, which lays out and draws the player, the title and buttons
 * under it, the suggested videos and the panels of the video. Its name is not obfuscated.
 */
private const val WATCH_LAYOUT_CLASS =
    "Lcom/google/android/apps/youtube/app/watch/nextgenwatch/ui/NextGenWatchLayout;"

@Suppress("unused")
val wideCommentsPatch = bytecodePatch(
    name = "Comments under the video",
    description = "Shows the comments under the video in the wide layout, as on an opened foldable " +
            "phone held sideways, instead of over the suggested videos.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    extendWith("extensions/extension.mpe")

    execute {
        val layout = mutableClassDefBy(WATCH_LAYOUT_CLASS)
        val superclass = layout.superclass
            ?: throw PatchException("The watch page layout has no superclass")

        fun method(name: String, parameters: String) = layout.methods.firstOrNull {
            it.name == name && it.parameterTypes.joinToString("") == parameters
        } ?: throw PatchException("Could not find $name of the watch page layout")

        method("onFinishInflate", "").addInstructions(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS->onWatchLayoutInflated(Landroid/view/ViewGroup;)V"
        )

        // The layout measures and lays out the panels for the space of the suggested videos.
        var replaced = 0
        listOf(method("onMeasure", "II"), method("onLayout", "ZIIII")).forEach { method ->
            method.instructions.toList().forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@forEachIndexed
                val reference = (instruction as ReferenceInstruction).reference as MethodReference
                val parameters = reference.parameterTypes.joinToString("")
                val hook = when {
                    reference.name == "measure" && parameters == "II" -> "measureChild"
                    reference.name == "layout" && parameters == "IIII" -> "layoutChild"
                    else -> return@forEachIndexed
                }

                val call = method.getInstruction<FiveRegisterInstruction>(index)
                val registers = listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG)
                    .take(call.registerCount).joinToString { "v$it" }
                method.replaceInstruction(
                    index,
                    "invoke-static { $registers }, $EXTENSION_CLASS->$hook(Landroid/view/View;$parameters)V"
                )
                replaced++
            }
        }
        if (replaced == 0) throw PatchException("Could not find how the watch page lays out its parts")

        // The layout also measures and lays out some views, the panels among them, through a
        // class that holds a view.
        val holderType = layout.fields.map { it.type }.distinct().firstOrNull { type ->
            val classDef = classDefByOrNull(type) ?: return@firstOrNull false
            fun calls(name: String, parameters: String) = classDef.methods.any { method ->
                method.returnType == "V" && method.parameterTypes.joinToString("") == parameters &&
                        method.implementation?.instructions?.any {
                            it.opcode == Opcode.INVOKE_VIRTUAL &&
                                    ((it as ReferenceInstruction).reference as MethodReference).let { reference ->
                                        reference.name == name && reference.parameterTypes.joinToString("") == parameters
                                    }
                        } == true
            }
            calls("measure", "II") && calls("layout", "IIII")
        } ?: throw PatchException("Could not find how the watch page measures its views")

        mutableClassDefBy(holderType).methods.filter { method ->
            method.returnType == "V" && method.parameterTypes.joinToString("") in listOf("II", "IIII") &&
                    method.implementation?.instructions?.any {
                        it.opcode == Opcode.INVOKE_VIRTUAL &&
                                ((it as ReferenceInstruction).reference as MethodReference).name in listOf("measure", "layout")
                    } == true
        }.forEach { method ->
            val call = method.implementation!!.instructions.first {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((it as ReferenceInstruction).reference as MethodReference).name in listOf("measure", "layout")
            }
            val view = ((call as ReferenceInstruction).reference as MethodReference).name
            val parameters = method.parameterTypes.joinToString("")
            val hook = if (view == "measure") "measureChild" else "layoutChild"
            val arguments = if (parameters == "II") "p0, p1, p2" else "p0, p1, p2, p3, p4"
            val field = classDefBy(holderType).fields.first { it.type == "Ljava/lang/Object;" }
            method.addInstructions(
                0,
                """
                    iget-object p0, p0, $holderType->${field.name}:Ljava/lang/Object;
                    check-cast p0, Landroid/view/View;
                    invoke-static { $arguments }, $EXTENSION_CLASS->$hook(Landroid/view/View;$parameters)V
                    return-void
                """
            )
        }

        // The layout puts each part where it goes with a helper per part, on every frame.
        val placer = layout.methods.flatMap { method ->
            method.implementation?.instructions?.mapNotNull { instruction ->
                if (instruction.opcode != Opcode.CHECK_CAST) return@mapNotNull null
                ((instruction as ReferenceInstruction).reference as TypeReference).type
            } ?: emptyList()
        }.distinct().firstNotNullOfOrNull { type ->
            val classDef = classDefByOrNull(type) ?: return@firstNotNullOfOrNull null
            classDef.methods.firstOrNull { method ->
                method.returnType == "V" && method.parameterTypes.isEmpty() &&
                        method.implementation?.instructions?.any {
                            it.opcode == Opcode.INVOKE_VIRTUAL &&
                                    ((it as ReferenceInstruction).reference as MethodReference).name == "setTranslationX"
                        } == true
            }?.let { classDef to it }
        } ?: throw PatchException("Could not find how the watch page puts its parts where they go")

        val (placerClass, placeMethod) = placer
        // The abstract getter, as the other one fails while a helper has no part.
        val viewGetter = placerClass.methods.firstOrNull {
            it.returnType == "Landroid/view/View;" && it.parameterTypes.isEmpty() && it.implementation == null
        } ?: throw PatchException("Could not find the part a helper of the watch page puts")

        mutableClassDefBy(placerClass.type).methods.single {
            it.name == placeMethod.name && it.parameterTypes.isEmpty() && it.returnType == "V"
        }.addInstructionsWithLabels(
            0,
            """
                invoke-virtual { p0 }, ${placerClass.type}->${viewGetter.name}()Landroid/view/View;
                move-result-object v0
                invoke-static { v0 }, $EXTENSION_CLASS->placesChild(Landroid/view/View;)Z
                move-result v0
                if-eqz v0, :app
                return-void
                :app
                nop
            """
        )

        // The layout clips each part it draws to where it put it, so the moved panels are drawn
        // the way any view group draws a child.
        method("drawChild", "Landroid/graphics/Canvas;Landroid/view/View;J").addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p2 }, $EXTENSION_CLASS->drawsUnclipped(Landroid/view/ViewGroup;Landroid/view/View;)Z
                move-result v0
                if-eqz v0, :clipped
                invoke-super { p0, p1, p2, p3, p4 }, $superclass->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
                move-result v0
                return v0
                :clipped
                nop
            """
        )

        listOf("onInterceptTouchEvent", "onTouchEvent").forEach { name ->
            method(name, "Landroid/view/MotionEvent;").addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, $EXTENSION_CLASS->$name(Landroid/view/ViewGroup;Landroid/view/MotionEvent;)Z
                    move-result v0
                    if-eqz v0, :app
                    return v0
                    :app
                    nop
                """
            )
        }
    }
}
