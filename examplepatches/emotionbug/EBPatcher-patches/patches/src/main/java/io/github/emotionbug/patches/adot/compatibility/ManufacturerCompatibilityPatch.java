package io.github.emotionbug.patches.adot.compatibility;
import java.util.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;


import io.github.emotionbug.patches.adot.dex.MethodPatch;
import io.github.emotionbug.patches.adot.summary.SummaryBytecodeGuard;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.*;
public final class ManufacturerCompatibilityPatch implements MethodPatch {
    public static final String ID="adot.compatibility.manufacturer";
    private static final Map<String,String> ORIGINALS=Map.of(
        "Lhya;->a()Z","6b10fd9537af04a163d018503279623699762d12708ab3a8e9be6f3e6c2eac63",
        "Lhya;-><clinit>()V","d3dc5dc3fd3551e6552ee3f5432ec1d1231ee8bfe1f01bef274084306f51a052",
        "Lhya;->f()[Lzci;","62fc6515a9c78a25eb10d1bdb045409f6cfac5d1065cbd147af47e18ebd64ed4");
    private final boolean embedded;
    public ManufacturerCompatibilityPatch() { this(false); }
    public ManufacturerCompatibilityPatch(boolean embedded) { this.embedded=embedded; }
    @Override public String dexEntry() { return "classes3.dex"; }
    @Override public Set<String> methods() { return ORIGINALS.keySet(); }
    @Override public MethodImplementation implementation(Method method) {
        String expected=ORIGINALS.get(id(method));
        if (expected==null || method.getImplementation()==null || !expected.equals(SummaryBytecodeGuard.fingerprint(method)))
            throw new IllegalStateException("Unsupported or already patched manufacturer method: "+id(method));
        switch(id(method)) {
            case "Lhya;->a()Z": return supportMethod();
            case "Lhya;-><clinit>()V": return supportInitializer();
            case "Lhya;->f()[Lzci;":
                MethodImplementation originalPermissions = permissionMethod(method);
                return embedded ? embeddedPermissions() : originalPermissions;
            default: throw new IllegalArgumentException(id(method));
        }
    }
    static MethodImplementation supportMethod() {
        var b = new MethodImplementationBuilder(1);
        b.addInstruction(new BuilderInstruction21c(Opcode.SGET_OBJECT, 0, field("Lo1i;", "c", "Ljava/util/List;")));
        b.addInstruction(invoke(Opcode.INVOKE_STATIC, 0, 0, method("Lg92;", "G", Arrays.asList(), "Lo1i;")));
        b.addInstruction(new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        b.addInstruction(invoke(Opcode.INVOKE_VIRTUAL, 1, 0, method("Lo1i;", "b", Arrays.asList(), "Z")));
        b.addInstruction(new BuilderInstruction11x(Opcode.MOVE_RESULT, 0));
        b.addInstruction(new BuilderInstruction11x(Opcode.RETURN, 0));
        return b.getMethodImplementation();
    }
    static MethodImplementation supportInitializer() {
        var b = new MethodImplementationBuilder(1);
        b.addInstruction(new BuilderInstruction21c(Opcode.NEW_INSTANCE, 0, new ImmutableTypeReference("Lhya;")));
        b.addInstruction(invoke(Opcode.INVOKE_DIRECT, 1, 0, method("Ljava/lang/Object;", "<init>", Arrays.asList(), "V")));
        b.addInstruction(new BuilderInstruction21c(Opcode.SPUT_OBJECT, 0, field("Lhya;","d","Lhya;")));
        b.addInstruction(new BuilderInstruction21c(Opcode.SGET_OBJECT, 0, field("Lo1i;", "c", "Ljava/util/List;")));
        b.addInstruction(invoke(Opcode.INVOKE_STATIC, 0, 0, method("Lg92;", "G", Arrays.asList(), "Lo1i;")));
        b.addInstruction(new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        b.addInstruction(invoke(Opcode.INVOKE_VIRTUAL, 1, 0, method("Lo1i;", "b", Arrays.asList(), "Z")));
        b.addInstruction(new BuilderInstruction11x(Opcode.MOVE_RESULT, 0));
        b.addInstruction(new BuilderInstruction21t(Opcode.IF_EQZ, 0, b.getLabel("unsupported")));
        b.addInstruction(new BuilderInstruction11n(Opcode.CONST_4, 0, 2));
        b.addInstruction(new BuilderInstruction10t(Opcode.GOTO, b.getLabel("encode")));
        b.addLabel("unsupported");
        b.addInstruction(new BuilderInstruction11n(Opcode.CONST_4, 0, 1));
        b.addLabel("encode");
        b.addInstruction(invoke(Opcode.INVOKE_STATIC, 1, 0, method("Lumc;", "c", Arrays.asList("I"), "B")));
        b.addInstruction(new BuilderInstruction11x(Opcode.MOVE_RESULT, 0));
        b.addInstruction(new BuilderInstruction21c(Opcode.SPUT_BYTE, 0, field("Lhya;","e","B")));
        b.addInstruction(new BuilderInstruction10x(Opcode.RETURN_VOID));
        return b.getMethodImplementation();
    }
    static MethodImplementation permissionMethod(Method m) {
        // Retain install gate, version-specific permission arrays and fallback verbatim.
        var b = new MutableMethodImplementation(m.getImplementation());
        int start=-1, end=-1;
        for (int i=0; i<b.getInstructions().size(); i++) {
            var ins=b.getInstructions().get(i);
            if (ins instanceof ReferenceInstruction ri) {
                var ref=ri.getReference();
                if (start<0 && ref instanceof MethodReference mr && mr.getDefiningClass().equals("Lj8j;") && mr.getName().equals("a")) start=i;
                if (start>=0 && ref instanceof FieldReference fr && fr.getDefiningClass().equals("Ldaj;") && fr.getName().equals("p")) {end=i; break;}
            }
        }
        if (start!=6 || end!=23) throw new IllegalStateException("Unexpected hya.f gate boundaries: "+start+","+end);
        for (int i=end-1; i>=start; i--) b.removeInstruction(i);
        return b;
    }
    static MethodImplementation embeddedPermissions() {
        // The app still needs its original media access; shell capture permission is
        // checked in the UserService, never represented as an app microphone grant.
        var b = new MethodImplementationBuilder(1);
        b.addInstruction(new BuilderInstruction21c(Opcode.SGET_OBJECT,0,field("Lo1i;","c","Ljava/util/List;")));
        b.addInstruction(invoke(Opcode.INVOKE_STATIC,0,0,method("Lg92;","G",Arrays.asList(),"Lo1i;")));
        b.addInstruction(new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,0));
        b.addInstruction(invoke(Opcode.INVOKE_VIRTUAL,1,0,method("Lo1i;","b",Arrays.asList(),"Z")));
        b.addInstruction(new BuilderInstruction11x(Opcode.MOVE_RESULT,0));
        b.addInstruction(new BuilderInstruction21t(Opcode.IF_EQZ,0,b.getLabel("fallback")));
        b.addInstruction(new BuilderInstruction21c(Opcode.SGET_OBJECT,0,field("Ldaj;","p","[Lzci;")));
        b.addInstruction(invoke(Opcode.INVOKE_STATIC,0,0,method("Lbel;","i",Arrays.asList(),"Z")));
        b.addInstruction(new BuilderInstruction11x(Opcode.MOVE_RESULT,0));
        b.addInstruction(new BuilderInstruction21t(Opcode.IF_EQZ,0,b.getLabel("legacy")));
        b.addInstruction(new BuilderInstruction21c(Opcode.SGET_OBJECT,0,field("Lzci;","X","Lzci;")));
        b.addInstruction(new BuilderInstruction10t(Opcode.GOTO,b.getLabel("array")));
        b.addLabel("legacy");
        b.addInstruction(new BuilderInstruction21c(Opcode.SGET_OBJECT,0,field("Lzci;","q","Lzci;")));
        b.addLabel("array");
        b.addInstruction(new BuilderInstruction35c(Opcode.FILLED_NEW_ARRAY,1,0,0,0,0,0,new ImmutableTypeReference("[Lzci;")));
        b.addInstruction(new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,0));
        b.addInstruction(new BuilderInstruction11x(Opcode.RETURN_OBJECT,0));
        b.addLabel("fallback");
        b.addInstruction(new BuilderInstruction21c(Opcode.SGET_OBJECT,0,field("Ldaj;","p","[Lzci;")));
        b.addInstruction(invoke(Opcode.INVOKE_STATIC,0,0,method("Ld90;","U",Arrays.asList(),"[Lzci;")));
        b.addInstruction(new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,0));
        b.addInstruction(new BuilderInstruction11x(Opcode.RETURN_OBJECT,0));
        return b.getMethodImplementation();
    }

}
