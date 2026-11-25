package patches.wuplaymobile;

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import java.util.*;

/** Retain validated input build metadata after re-signing; leave PackageManager/auth native. */
final class MobileIdentity {
    static void retain(MutableMethod method) {
        var implementation=method.getImplementation();
        List<Instruction> code=new ArrayList<>();implementation.getInstructions().forEach(code::add);
        int anchor=-1;
        for(int i=0;i<code.size();i++) if(code.get(i) instanceof ReferenceInstruction) {
            var ref=((ReferenceInstruction)code.get(i)).getReference();
            if(ref.toString().equals("Landroidx/core/os/HandlerCompat$Api28Impl;->signingCertSha256(Landroid/content/Context;)Ljava/lang/String;")) {
                if(anchor!=-1)throw new IllegalStateException("Ambiguous WuPlay registration identity");anchor=i;
            }
        }
        if(anchor<0||anchor+2>=code.size()||code.get(anchor).getOpcode()!=Opcode.INVOKE_STATIC||
            code.get(anchor+1).getOpcode()!=Opcode.MOVE_RESULT_OBJECT||!(code.get(anchor+2) instanceof FiveRegisterInstruction)||
            !(code.get(anchor+2) instanceof ReferenceInstruction))throw new IllegalStateException("WuPlay registration identity changed");
        int result=((OneRegisterInstruction)code.get(anchor+1)).getRegisterA();
        var call=(FiveRegisterInstruction)code.get(anchor+2);
        var ref=((ReferenceInstruction)code.get(anchor+2)).getReference();
        if(code.get(anchor+2).getOpcode()!=Opcode.INVOKE_DIRECT||call.getRegisterCount()!=2||call.getRegisterD()!=result||
           !ref.toString().equals("Lapp/wuplay/androidtv/network/BuildIdentity;-><init>(Ljava/lang/String;)V"))
            throw new IllegalStateException("WuPlay registration certificate data flow changed");
        implementation.addInstruction(anchor+2,new BuilderInstruction21c(Opcode.CONST_STRING,result,
            new ImmutableStringReference("ae406f7d398ae1ae418238f83d07554e6aa6cf5855b66edb9c4c85995d435e7f")));
    }
}
