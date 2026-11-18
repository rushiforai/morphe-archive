/* Playlist controller anchor adapted from Morphe patches v2.2.0 (GPLv3),
 * https://github.com/MorpheApp/morphe-patches. See NOTICE.
 * Afterglow independently maps the retained playlist bar and its native flag reads.
 * Portions provided "AS IS" by the Morphe software project without express or implied
 * warranties, including merchantability and fitness for a particular purpose.
 */
package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.afterglow.patches.shared.writtenRegisters
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FLOATING_PLAYLIST_MINIBAR = 45798642L

/** Select the retained native bar, with matching events, gestures and animation. */
internal val playlistMinibarHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        val controller = Fingerprint(name = "<init>", strings = listOf("engagement-panel-playlist"))
        val creation = Fingerprint(classFingerprint = controller, returnType = "V", parameters = emptyList(),
            filters = listOf(literal(FLOATING_PLAYLIST_MINIBAR),
                methodCall(parameters = listOf("I", "J", "Z"), returnType = "Z",
                    location = MatchAfterWithin(3))))
        val getter = (creation.instructionMatches.last().instruction as ReferenceInstruction)
            .reference as MethodReference

        // Confirm this is the playlist's floating/old layout choice, not the
        // separate floating video mini-player or a flag that only hides content.
        val floating = Fingerprint(name = "<init>", filters = listOf(
            resourceLiteral(ResourceType.LAYOUT, "next_gen_playlist_entry_point"),
            resourceLiteral(ResourceType.LAYOUT, "next_gen_playlist_fab_entry_point"),
            resourceLiteral(ResourceType.LAYOUT, "playlist_fab_entry_point")))
        val constructors = creation.method.implementation!!.instructions.mapNotNull { instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (instruction.opcode == Opcode.INVOKE_DIRECT_RANGE && call?.name == "<init>"
                && call.parameterTypes == floating.method.parameterTypes) call else null
        }
        require(constructors.size == 2 && constructors.count { it.definingClass == floating.method.definingClass } == 1) {
            "Playlist minibar must retain both native layout constructors"
        }
        val legacyCall = constructors.single { it.definingClass != floating.method.definingClass }
        val legacy = Fingerprint(definingClass = legacyCall.definingClass, name = "<init>", filters = listOf(
            resourceLiteral(ResourceType.ID, "playlist_entry_point_stub"),
            methodCall(smali = "Landroid/view/ViewStub;->inflate()Landroid/view/View;"),
            resourceLiteral(ResourceType.ID, "playlist_entry_point_bar")))
        require(legacy.method.parameterTypes == floating.method.parameterTypes
                && legacy.classDef.interfaces == floating.classDef.interfaces
                && legacy.method.implementation!!.instructions.none {
                    val call = (it as? ReferenceInstruction)?.reference as? MethodReference
                    call?.definingClass == "Landroid/view/ViewStub;" && call.name == "setLayoutResource"
                }) { "Original playlist controls must inflate the existing bar without substituting the floating layout" }

        // AB Lab describes this native flag using the same numeric id. Its extension
        // metadata is not a native config read and must not enter the owner audit.
        val matches = Fingerprint(filters = listOf(literal(FLOATING_PLAYLIST_MINIBAR)),
            custom = { _, cls -> !cls.type.startsWith(EXTENSION_PACKAGE) }).matchAll()
        require(matches.size == 13 && matches.map { it.method.definingClass }.distinct().size == 7) {
            "Expected all 13 playlist minibar methods across seven native owners; found " +
                    matches.joinToString { it.method.smali }
        }
        var loadCount = 0
        val sites = matches.map { match ->
            val method = match.method
            val instructions = method.implementation!!.instructions
            val loads = instructions.mapIndexedNotNull { index, instruction ->
                if ((instruction as? WideLiteralInstruction)?.wideLiteral == FLOATING_PLAYLIST_MINIBAR
                    && instruction.opcode.setsWideRegister()) index else null
            }
            loadCount += loads.size
            val usedLoads = mutableSetOf<Int>()
            val reads = instructions.mapIndexedNotNull { index, instruction ->
                if (instruction.opcode != Opcode.INVOKE_VIRTUAL
                    || (instruction as ReferenceInstruction).reference != getter) return@mapIndexedNotNull null
                val args = instruction.invokeRegisters
                require(args.size == 5 && args[3] == args[2] + 1) { "Playlist flag getter signature changed" }
                fun lastWrite(register: Int) = (index - 1 downTo 0).firstOrNull {
                    register in instructions[it].writtenRegisters
                }
                val flagLoad = lastWrite(args[2]) ?: return@mapIndexedNotNull null
                if (flagLoad !in loads) return@mapIndexedNotNull null
                require(lastWrite(args[3]) == flagLoad) { "Playlist flag's wide register pair was overwritten" }
                val namespace = lastWrite(args[1])?.let { instructions[it] as? WideLiteralInstruction }
                require(namespace?.wideLiteral == 23L) {
                    "Playlist floating flag must retain namespace 23"
                }
                require(instructions[index + 1].opcode == Opcode.MOVE_RESULT) {
                    "Playlist flag read must return its boolean directly"
                }
                usedLoads.add(flagLoad)
                index + 1
            }
            require(usedLoads == loads.toSet()) { "Unmapped playlist minibar flag load in ${method.smali}" }
            method to reads
        }
        // Two floating-controller methods reuse one id for three reads each.
        // Hooking only the next invoke after each literal would miss these and
        // would accidentally alter an Integer.intValue() call in the color path.
        require(loadCount == 14 && sites.sumOf { it.second.size } == 18) {
            "Expected 18 playlist minibar flag reads from 14 original id loads"
        }
        sites.forEach { (method, reads) ->
            reads.asReversed().forEach { index ->
                val register = (method.implementation!!.instructions[index] as OneRegisterInstruction).registerA
                method.addInstructions(index + 1, """
                    invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/playback/PlaylistMinibar;->floatingPlaylistMinibar(Z)Z
                    move-result v$register
                """)
            }
        }
        println("Afterglow playlist minibar: ${creation.method.smali}, old=${legacy.method.definingClass}, " +
                "floating=${floating.method.definingClass}, 18 reads/14 loads/13 methods/7 owners")
    }
}
