// SPDX-License-Identifier: GPL-3.0-only
package local.maps.patches;

import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.extensions.InstructionExtensions;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.instruction.*;

/** Exact26.10 native DisplayScaler insertion; no context wrappers or resources are replaced.
 * 26.10 names: DisplayScaler gvy->gsw, display target fxy->fut (a=MAIN, e=HUD). The newer R8 turns
 * the HUD early return into a goto to the shared final return; the insertion point is unchanged.
 */
final class UiScaleHooks {
    static final String TYPE="Lgsw;",TARGET="Lfut;";
    static void apply(BytecodePatchContext context){
        MutableMethod found=null;
        for(var m:context.mutableClassDefBy(TYPE).getMethods())
            if(m.getName().equals("b")&&m.getParameterTypes().toString().equals("["+TARGET+"]")&&m.getReturnType().equals("F")){
                if(found!=null)throw new IllegalStateException("Ambiguous native DisplayScaler");found=m;
            }
        if(found==null)throw new IllegalStateException("Native DisplayScaler register schema changed");
        patch(found);
        System.out.println("Main UI size: native DisplayScaler main target only; cluster/HUD/limited unchanged");
    }
    static void patch(MutableMethod found){
        if(found.getImplementation()==null||found.getImplementation().getRegisterCount()!=3)
            throw new IllegalStateException("Native DisplayScaler register schema changed");
        var list=found.getImplementation().getInstructions();int insertion=-1;
        if(list.size()!=9||list.get(0).getOpcode()!=Opcode.SGET_OBJECT
            ||!((ReferenceInstruction)list.get(0)).getReference().toString().equals(TARGET+"->e:"+TARGET)
            ||((OneRegisterInstruction)list.get(0)).getRegisterA()!=0||list.get(1).getOpcode()!=Opcode.IF_NE
            ||((TwoRegisterInstruction)list.get(1)).getRegisterA()!=2||((TwoRegisterInstruction)list.get(1)).getRegisterB()!=0
            ||((OffsetInstruction)list.get(1)).getCodeOffset()!=5
            ||list.get(2).getOpcode()!=Opcode.CONST_HIGH16||((OneRegisterInstruction)list.get(2)).getRegisterA()!=1
            ||((NarrowLiteralInstruction)list.get(2)).getNarrowLiteral()!=Float.floatToIntBits(1f)
            // 26.10: HUD keeps 1.0 through a goto to the final return v1 (26.09: its own return v1).
            ||list.get(3).getOpcode()!=Opcode.GOTO||((OffsetInstruction)list.get(3)).getCodeOffset()!=0x0e-0x06
            ||list.get(8).getOpcode()!=Opcode.RETURN||((OneRegisterInstruction)list.get(8)).getRegisterA()!=1
            ||list.get(4).getOpcode()!=Opcode.INVOKE_DIRECT
            ||!((ReferenceInstruction)list.get(4)).getReference().toString().equals(TYPE+"->d("+TARGET+")F")
            ||((FiveRegisterInstruction)list.get(4)).getRegisterCount()!=2
            ||((FiveRegisterInstruction)list.get(4)).getRegisterC()!=1||((FiveRegisterInstruction)list.get(4)).getRegisterD()!=2)
            throw new IllegalStateException("Native DisplayScaler target branch changed");
        for(int i=1;i+2<list.size();i++){
            var value=list.get(i);
            if(value.getOpcode()!=Opcode.CONST_HIGH16||!(value instanceof NarrowLiteralInstruction)
                ||((NarrowLiteralInstruction)value).getNarrowLiteral()!=Float.floatToIntBits(1.125f)
                ||((OneRegisterInstruction)value).getRegisterA()!=2)continue;
            var before=list.get(i-1);var multiply=list.get(i+1);var ret=list.get(i+2);
            if(before.getOpcode()!=Opcode.MOVE_RESULT||((OneRegisterInstruction)before).getRegisterA()!=1
                ||multiply.getOpcode()!=Opcode.MUL_FLOAT_2ADDR||((TwoRegisterInstruction)multiply).getRegisterA()!=1
                ||((TwoRegisterInstruction)multiply).getRegisterB()!=2||ret.getOpcode()!=Opcode.RETURN
                ||((OneRegisterInstruction)ret).getRegisterA()!=1)
                throw new IllegalStateException("Native DisplayScaler factor schema changed");
            if(insertion>=0)throw new IllegalStateException("Ambiguous native DisplayScaler factor");insertion=i;
        }
        if(insertion<0)throw new IllegalStateException("Native DisplayScaler factor not found");
        // p1 is v2, still the display-target enum here. The existing next instruction overwrites it.
        // Reusing v0 is safe: its prior HUD enum constant has already served the early return test.
        // The HUD goto jumps past this insertion straight to the final return.
        InstructionExtensions.INSTANCE.addInstructionsWithLabels(found,insertion,
            "sget-object v0, "+TARGET+"->a:"+TARGET+"\n"
            +"if-ne p1, v0, :stock_density\n"
            +"invoke-static {v1}, Llocal/maps/cluster/MainUiScale;->adjust(F)F\n"
            +"move-result v1\n"
            +":stock_density\n"
            +"nop");
    }
}
