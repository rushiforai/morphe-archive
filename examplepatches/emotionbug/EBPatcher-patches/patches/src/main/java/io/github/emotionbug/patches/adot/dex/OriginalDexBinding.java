package io.github.emotionbug.patches.adot.dex;

import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload;
import com.android.tools.smali.dexlib2.iface.debug.*;
import com.android.tools.smali.dexlib2.ValueType;
import com.android.tools.smali.dexlib2.iface.value.*;
import com.android.tools.smali.dexlib2.writer.util.TryListBuilder;
import java.util.*;

/** Compares original base classes to Morphe's immutable input, independent of DEX placement/indexes. */
public final class OriginalDexBinding {
    private OriginalDexBinding() {}
    public static boolean matches(ClassDef a, ClassDef b) {
        if (!a.getType().equals(b.getType()) || a.getAccessFlags()!=b.getAccessFlags()
            || !Objects.equals(a.getSuperclass(),b.getSuperclass()) || !a.getInterfaces().equals(b.getInterfaces())
            || !Objects.equals(a.getSourceFile(),b.getSourceFile()) || !a.getAnnotations().equals(b.getAnnotations())) return false;
        var af=new TreeSet<Field>();a.getFields().forEach(af::add);
        var bf=new TreeSet<Field>();b.getFields().forEach(bf::add);
        if(af.size()!=bf.size()) return false;
        var fi=bf.iterator();
        for(var f:af) {
            var g=fi.next();
            if(!f.equals(g) || f.getAccessFlags()!=g.getAccessFlags() || !Objects.equals(normalized(f.getInitialValue()),normalized(g.getInitialValue()))
                || !f.getAnnotations().equals(g.getAnnotations()) || !f.getHiddenApiRestrictions().equals(g.getHiddenApiRestrictions())) return false;
        }
        var am=new TreeSet<Method>();a.getMethods().forEach(am::add);
        var bm=new TreeSet<Method>();b.getMethods().forEach(bm::add);
        if(am.size()!=bm.size()) return false;
        var mi=bm.iterator();
        for(var m:am) {
            var n=mi.next();
            if(!m.equals(n) || m.getAccessFlags()!=n.getAccessFlags() || !m.getAnnotations().equals(n.getAnnotations())
                || !m.getHiddenApiRestrictions().equals(n.getHiddenApiRestrictions())) return false;
            for(int i=0;i<m.getParameters().size();i++) {
                var p=m.getParameters().get(i);var q=n.getParameters().get(i);
                if(!Objects.equals(p.getName(),q.getName()) || !p.getAnnotations().equals(q.getAnnotations())) return false;
            }
            if(!body(m.getImplementation(),n.getImplementation())) return false;
        }
        return true;
    }
    // DEX writers omit trailing language-default field values, but never negative zero.
    private static EncodedValue normalized(EncodedValue value) {
        if(value==null) return null;
        boolean zero=switch(value.getValueType()) {
            case ValueType.BOOLEAN -> !((BooleanEncodedValue)value).getValue();
            case ValueType.BYTE -> ((ByteEncodedValue)value).getValue()==0;
            case ValueType.CHAR -> ((CharEncodedValue)value).getValue()==0;
            case ValueType.SHORT -> ((ShortEncodedValue)value).getValue()==0;
            case ValueType.INT -> ((IntEncodedValue)value).getValue()==0;
            case ValueType.LONG -> ((LongEncodedValue)value).getValue()==0;
            case ValueType.FLOAT -> Float.floatToRawIntBits(((FloatEncodedValue)value).getValue())==0;
            case ValueType.DOUBLE -> Double.doubleToRawLongBits(((DoubleEncodedValue)value).getValue())==0;
            case ValueType.NULL -> true;
            default -> false;
        };
        return zero?null:value;
    }
    public static boolean body(MethodImplementation a,MethodImplementation b) {
        if(a==null || b==null) return a==b;
        if(a.getRegisterCount()!=b.getRegisterCount()) return false;
        var ai=a.getInstructions().iterator();var bi=b.getInstructions().iterator();
        while(ai.hasNext() && bi.hasNext()) if(!instruction(ai.next(),bi.next())) return false;
        if(ai.hasNext() || bi.hasNext()) return false;
        // Compare ordered catch coverage, not incidental adjacent try-item segmentation.
        var at=TryListBuilder.massageTryBlocks(a.getTryBlocks());
        var bt=TryListBuilder.massageTryBlocks(b.getTryBlocks());
        if(at.size()!=bt.size()) return false;
        for(int i=0;i<at.size();i++) {
            var x=at.get(i);var y=bt.get(i);
            if(x.getStartCodeAddress()!=y.getStartCodeAddress() || x.getCodeUnitCount()!=y.getCodeUnitCount()
                || !x.getExceptionHandlers().equals(y.getExceptionHandlers())) return false;
        }
        var ad=a.getDebugItems().iterator();var bd=b.getDebugItems().iterator();
        while(ad.hasNext() && bd.hasNext()) {
            var x=ad.next();var y=bd.next();
            if(x.getDebugItemType()!=y.getDebugItemType() || x.getCodeAddress()!=y.getCodeAddress()) return false;
            if(x instanceof LineNumber p && p.getLineNumber()!=((LineNumber)y).getLineNumber()) return false;
            if(x instanceof LocalInfo p) {
                var q=(LocalInfo)y;
                if(!Objects.equals(p.getName(),q.getName()) || !Objects.equals(p.getType(),q.getType()) || !Objects.equals(p.getSignature(),q.getSignature())) return false;
            }
            if(x instanceof StartLocal p && p.getRegister()!=((StartLocal)y).getRegister()) return false;
            if(x instanceof EndLocal p && p.getRegister()!=((EndLocal)y).getRegister()) return false;
            if(x instanceof RestartLocal p && p.getRegister()!=((RestartLocal)y).getRegister()) return false;
            if(x instanceof SetSourceFile p && !Objects.equals(p.getSourceFile(),((SetSourceFile)y).getSourceFile())) return false;
        }
        return !ad.hasNext() && !bd.hasNext();
    }
    private static boolean instruction(Instruction a,Instruction b) {
        if(a.getOpcode()!=b.getOpcode() || a.getCodeUnits()!=b.getCodeUnits()) return false;
        if(a instanceof OneRegisterInstruction x && x.getRegisterA()!=((OneRegisterInstruction)b).getRegisterA()) return false;
        if(a instanceof TwoRegisterInstruction x && x.getRegisterB()!=((TwoRegisterInstruction)b).getRegisterB()) return false;
        if(a instanceof ThreeRegisterInstruction x && x.getRegisterC()!=((ThreeRegisterInstruction)b).getRegisterC()) return false;
        if(a instanceof VariableRegisterInstruction x && x.getRegisterCount()!=((VariableRegisterInstruction)b).getRegisterCount()) return false;
        if(a instanceof FiveRegisterInstruction x) {
            var y=(FiveRegisterInstruction)b;
            if(x.getRegisterC()!=y.getRegisterC() || x.getRegisterD()!=y.getRegisterD() || x.getRegisterE()!=y.getRegisterE()
                || x.getRegisterF()!=y.getRegisterF() || x.getRegisterG()!=y.getRegisterG()) return false;
        }
        if(a instanceof RegisterRangeInstruction x && x.getStartRegister()!=((RegisterRangeInstruction)b).getStartRegister()) return false;
        if(a instanceof WideLiteralInstruction x && x.getWideLiteral()!=((WideLiteralInstruction)b).getWideLiteral()) return false;
        if(a instanceof OffsetInstruction x && x.getCodeOffset()!=((OffsetInstruction)b).getCodeOffset()) return false;
        if(a instanceof ReferenceInstruction x && !x.getReference().equals(((ReferenceInstruction)b).getReference())) return false;
        if(a instanceof DualReferenceInstruction x && !x.getReference2().equals(((DualReferenceInstruction)b).getReference2())) return false;
        if(a instanceof SwitchPayload x) {
            var y=((SwitchPayload)b).getSwitchElements();var xs=x.getSwitchElements();
            if(xs.size()!=y.size()) return false;
            for(int i=0;i<xs.size();i++) if(xs.get(i).getKey()!=y.get(i).getKey() || xs.get(i).getOffset()!=y.get(i).getOffset()) return false;
        }
        if(a instanceof ArrayPayload x) {
            var y=(ArrayPayload)b;
            if(x.getElementWidth()!=y.getElementWidth() || !x.getArrayElements().equals(y.getArrayElements())) return false;
        }
        if(a instanceof VerificationErrorInstruction || a instanceof InlineIndexInstruction || a instanceof VtableIndexInstruction || a instanceof FieldOffsetInstruction)
            throw new IllegalArgumentException("Optimized DEX cannot be bound to an original APK");
        return true;
    }
}
