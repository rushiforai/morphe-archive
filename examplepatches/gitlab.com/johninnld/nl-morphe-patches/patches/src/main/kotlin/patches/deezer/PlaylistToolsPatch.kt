package patches.deezer

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Locate the same playlist UI decision changed by the 26 control. */
internal fun validateNativePlaylistTool(method: Method, sort: Boolean): Int {
    val code = checkNotNull(method.implementation).instructions.toList()
    val source = code.indices.singleOrNull { index ->
        code[index].opcode == Opcode.SGET_OBJECT &&
            (code[index] as? ReferenceInstruction)?.reference?.toString() ==
                "LIllIllIllIll;->IlIllIIIlIIIllIl:LIllIllIllIll;" &&
            code.getOrNull(index + 1)?.opcode == Opcode.INVOKE_INTERFACE &&
            (code[index + 1] as? ReferenceInstruction)?.reference?.toString() ==
                "LIllIlllIIlllI;->IllIlIlIIlIllIll(LIllIllIllIll;Ljava/lang/String;)Z"
    } ?: error("Deezer native playlist eligibility query changed")
    val scope = code[source] as OneRegisterInstruction
    val call = code[source + 1] as FiveRegisterInstruction
    val result = code.getOrNull(source + 2) as? OneRegisterInstruction
    val branch = code.getOrNull(source + 3) as? OneRegisterInstruction
    check(call.registerCount == 3 && call.registerD == scope.registerA &&
        result?.opcode == Opcode.MOVE_RESULT && branch?.opcode == Opcode.IF_EQZ &&
        branch.registerA == result.registerA) { "Deezer native playlist eligibility branch changed" }
    if (sort) {
        check((code.getOrNull(source + 4) as? ReferenceInstruction)?.reference?.toString() ==
            "LlIlIllIIllIlIl;->IllIlIIIlllIIIll:Ljava/lang/Boolean;") {
            "Deezer native playlist chart exclusion changed"
        }
        val labels = code.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
        }
        check(labels.containsAll(listOf("SORT_PLAYLIST", "SEARCH", "sortPlaylistCallback", "searchPlaylistCallback"))) {
            "Deezer native playlist actions changed"
        }
    } else {
        check(code.any {
            it.opcode == Opcode.NEW_INSTANCE &&
                (it as? ReferenceInstruction)?.reference?.toString() == "LlIIIlIIIlllllll;"
        }) { "Deezer native playlist header search renderer changed" }
    }
    return source + 2
}

/** Keep the query/callbacks and surrounding guards; change only its UI verdict. */
internal fun exposePlaylistTool2703(method: MutableMethod, sort: Boolean) {
    val decision = validateNativePlaylistTool(method, sort)
    val register = (method.implementation!!.instructions[decision] as OneRegisterInstruction).registerA
    check(register <= 15) { "Deezer playlist UI result register changed" }
    method.replaceInstruction(decision, "const/4 v$register, 0x1")
}

@Suppress("unused")
val deezerPlaylistTools = bytecodePatch(
    name = "Search and sort playlists",
    description = "Shows native playlist header search and the Sort menu action for playlist management. " +
        "Keeps Deezer's search, display-order preferences, ownership checks and chart exclusion. " +
        "Account, content access and playback permissions are unchanged.",
    default = true,
) {
    compatibleWith(deezer)
    dependsOn(deezerBase)
    execute {
        exposePlaylistTool2703(exact(
            "LIIlIllIlIlllIll;", "invokeSuspend", "Ljava/lang/Object;", "Ljava/lang/Object;",
        ).method, sort = false)
        exposePlaylistTool2703(exact(
            "LIIIIIllllIllllI;", "IIlIlIlIlIllllll", "Ljava/lang/Object;",
            "Ljava/lang/Object;", "Ljava/lang/Object;",
        ).method, sort = true)
    }
}
