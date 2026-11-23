package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction20t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction

/** Skip the promotional child and keep the page's original downloaded-content assembly. */
internal fun hideDownloadedMusicOffer(method: MutableMethod) {
    check(method.definingClass == "LlIIlIIllIIIllI;" && method.name == "invokeSuspend")
    val code = method.instructions.toList()
    check(code.size > 346 && (code[327] as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f140ab1 &&
        (code[340] as? ReferenceInstruction)?.reference.toString() ==
        "LIIIIlllIlIIIIIIl;-><init>(LIlIIIIIlllIlIll;LIIlIlIIIIlIllIIl;LIlIIIIIlllIlIll;LIIlIlIIIIlIllIIl;)V")
    val branch = code[317] as? BuilderInstruction21t
    check(branch?.opcode == Opcode.IF_EQZ && branch.target.location.index == 343 &&
        code[318].opcode == Opcode.NEW_INSTANCE) { "Deezer downloaded music offer gate changed" }
    method.replaceInstruction(317, BuilderInstruction20t(Opcode.GOTO_16, branch.target))
}
