package io.github.emotionbug.patches.adot.dex;

import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import java.util.*;
import org.junit.Test;
import static org.junit.Assert.*;

public class OriginalDexBindingTest {
    private ClassDef fixture(String text,int register,int handler) {
        var body=new ImmutableMethodImplementation(2,List.of(
            new ImmutableInstruction21c(Opcode.CONST_STRING,register,new ImmutableStringReference(text)),
            new ImmutableInstruction11x(Opcode.RETURN_OBJECT,register)),
            List.of(new ImmutableTryBlock(0,2,List.of(new ImmutableExceptionHandler("Ljava/lang/Exception;",handler)))),null);
        var method=new ImmutableMethod("Lfixture;","value",List.of(),"Ljava/lang/String;",AccessFlags.PUBLIC.getValue()|AccessFlags.STATIC.getValue(),Set.of(),Set.of(),body);
        return new ImmutableClassDef("Lfixture;",AccessFlags.PUBLIC.getValue(),"Ljava/lang/Object;",List.of(),null,Set.of(),List.of(),List.of(method));
    }
    @Test public void equivalentDecodedClassesBindButDifferentValuesOperandsAndHandlersDoNot() {
        ClassDef original=fixture("original",0,2);
        assertTrue(OriginalDexBinding.matches(original,fixture("original",0,2)));
        assertFalse(OriginalDexBinding.matches(original,fixture("changed",0,2)));
        assertFalse(OriginalDexBinding.matches(original,fixture("original",1,2)));
        assertFalse(OriginalDexBinding.matches(original,fixture("original",0,0)));
    }
    @Test public void unchangedDescriptorCannotHideMissingMethodOrChangedAccess() {
        ClassDef original=fixture("original",0,2);
        assertFalse(OriginalDexBinding.matches(original,new ImmutableClassDef(original.getType(),original.getAccessFlags(),original.getSuperclass(),original.getInterfaces(),null,Set.of(),List.of(),List.of())));
        assertFalse(OriginalDexBinding.matches(original,new ImmutableClassDef(original.getType(),AccessFlags.FINAL.getValue(),original.getSuperclass(),original.getInterfaces(),null,Set.of(),List.of(),original.getMethods())));
    }
    @Test public void equivalentCatchSegmentationBindsButChangedHandlersDoNot() {
        var instructions=List.of(new ImmutableInstruction10x(Opcode.NOP),new ImmutableInstruction10x(Opcode.NOP),new ImmutableInstruction10x(Opcode.RETURN_VOID));
        var handlers=List.of(new ImmutableExceptionHandler("Ljava/lang/Exception;",2));
        var split=new ImmutableMethodImplementation(1,instructions,List.of(new ImmutableTryBlock(0,1,handlers),new ImmutableTryBlock(1,1,handlers)),null);
        var combined=new ImmutableMethodImplementation(1,instructions,List.of(new ImmutableTryBlock(0,2,handlers)),null);
        var changed=new ImmutableMethodImplementation(1,instructions,List.of(new ImmutableTryBlock(0,2,List.of(new ImmutableExceptionHandler("Ljava/lang/RuntimeException;",2)))),null);
        assertTrue(OriginalDexBinding.body(split,combined));
        assertFalse(OriginalDexBinding.body(split,changed));
    }
}
