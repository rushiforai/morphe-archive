package io.github.bryceaspringfield.morphe.patches.reddit

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.bryceaspringfield.morphe.patches.reddit.Constants.COMPATIBILITY_REDDIT
import java.util.logging.Logger

private const val PAGER_START_CLASS = "Lio/github/bryceaspringfield/morphe/extension/reddit/MediaPagerStart;"
private val mediaTapsLogger = Logger.getLogger("FixSearchMediaTapsPatch")

/** The constructor of the media viewer's start request: the cached posts, the tapped post, and its position. */
private val START_REQUEST_PARAMETERS = listOf("Ljava/util/ArrayList;", "Lcom/reddit/domain/model/Link;", "I")

@Suppress("unused")
val fixSearchMediaTapsPatch = bytecodePatch(
    name = "Fix search media taps",
    description = "Opens the tapped post from a search's Media tab. Reddit opens the post next to it after an account " +
            "is blocked, or when the viewer leaves out a hidden, removed, or promoted post listed before it. " +
            "",
    default = true,
) {
    compatibleWith(COMPATIBILITY_REDDIT)
    dependsOn(keywordFilterSettingsPatch)

    execute {
        var request: String? = null
        var pages: String? = null
        classDefForEach { classDef ->
            if (request == null && classDef.methods.any { m ->
                    m.name == "<init>" && m.parameterTypes.map { it.toString() } == START_REQUEST_PARAMETERS
                } && classDef.fields.count { !com.android.tools.smali.dexlib2.AccessFlags.STATIC.isSet(it.accessFlags) } == 3
            ) request = classDef.type
            if (pages == null && classDef.type.startsWith("Lcom/reddit/fullbleedplayer/data/")) {
                classDef.methods.firstOrNull { m ->
                    m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "Ljava/util/List;") &&
                            m.returnType.startsWith("L") && m.returnType != "Ljava/util/List;"
                }?.let { pages = it.returnType }
            }
        }
        val requestType = request
        val pagesType = pages
        if (requestType == null || pagesType == null) {
            mediaTapsLogger.warning("Could not find the media viewer's start request ($requestType) or pages ($pagesType)")
            return@execute
        }

        fun readsPosition(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction) =
            instruction.opcode == Opcode.IGET &&
                    instruction.getReference<FieldReference>()?.let { it.definingClass == requestType && it.type == "I" } == true

        val users = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.type == requestType || classDef.type.startsWith("Lio/github/bryceaspringfield/")) return@classDefForEach
            if (classDef.methods.any { m -> m.implementation?.instructions?.any { readsPosition(it) } == true }) users.add(classDef)
        }
        var hooked = 0
        users.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                val list = method.instructions.toList()
                list.indices.filter { readsPosition(list[it]) }.sortedDescending().forEach { index ->
                    // The viewer's pages: the nearest cast to the pages type before the read.
                    val cast = (index - 1 downTo 0).firstOrNull { i ->
                        list[i].opcode == Opcode.CHECK_CAST && list[i].getReference<TypeReference>()?.type == pagesType
                    } ?: return@forEach
                    val read = list[index] as TwoRegisterInstruction
                    val pagesRegister = (list[cast] as OneRegisterInstruction).registerA
                    method.addInstructions(
                        index + 1,
                        """
                            invoke-static/range { v${read.registerB} .. v${read.registerB} }, $PAGER_START_CLASS->start(Ljava/lang/Object;)I
                            move-result v${read.registerA}
                        """
                    )
                    method.addInstructions(
                        cast + 1,
                        "invoke-static/range { v$pagesRegister .. v$pagesRegister }, $PAGER_START_CLASS->pages(Ljava/lang/Object;)V"
                    )
                    hooked++
                }
            }
        }
        if (hooked == 0) mediaTapsLogger.warning("Could not find where the media viewer reads its start position")
        else mediaTapsLogger.info("Fix search media taps: hooked $hooked start reads of $requestType with pages $pagesType")
    }
}
