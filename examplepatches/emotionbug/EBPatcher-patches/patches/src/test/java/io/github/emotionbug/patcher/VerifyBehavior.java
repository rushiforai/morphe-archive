package io.github.emotionbug.patcher;

import java.nio.file.*;
import java.util.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

/** Bounded host interpretation of rebuilt DEX instructions. No Android/target execution. */
public final class VerifyBehavior {
    static final String SUPPORT = "Lhya;", IDENTITY = "Lkho;";
    static final Object AMH = new Object(), LIST = new Object(), PERMISSION_ARRAY = new Object();
    record Instance(String type) {}
    static final Map<String, Method> methods = new HashMap<>();
    static final Map<String, Set<Integer>> visited = new HashMap<>();
    static String methodId(MethodReference m) {
        return m.getDefiningClass()+"->"+m.getName()+"("+String.join("", m.getParameterTypes())+")"+m.getReturnType();
    }
    static String fieldId(FieldReference f) {
        return f.getDefiningClass()+"->"+f.getName()+":"+f.getType();
    }
    static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
    static int number(Object value) {
        require(value instanceof Integer, "Expected integer, got "+value);
        return (Integer)value;
    }
    static Object ref(Instruction ins) { return ((ReferenceInstruction)ins).getReference(); }
    static int reg(Instruction ins) { return ((OneRegisterInstruction)ins).getRegisterA(); }
    static List<Object> arguments(Instruction ins, Object[] regs) {
        require(ins instanceof FiveRegisterInstruction, "Only explicit five-register invoke is supported");
        var i=(FiveRegisterInstruction)ins;
        int[] indexes={i.getRegisterC(),i.getRegisterD(),i.getRegisterE(),i.getRegisterF(),i.getRegisterG()};
        require(i.getRegisterCount()<=5, "Invalid invoke register count");
        List<Object> values=new ArrayList<>();
        for(int n=0;n<i.getRegisterCount();n++) values.add(regs[indexes[n]]);
        return values;
    }
    static final class VM {
        final boolean eligible, modern, externalMedia;
        final String certificate;
        final Object applicationContext = new Object();
        final Map<String,Object> fields=new HashMap<>();
        int amhTouches, objectConstructors;
        VM(boolean eligible, boolean modern, boolean externalMedia, String certificate) {
            this.certificate=certificate;
            this.eligible=eligible; this.modern=modern; this.externalMedia=externalMedia;
        }
        Object read(FieldReference field) {
            String id=fieldId(field);
            if(id.equals("Lo1i;->c:Ljava/util/List;")) { amhTouches++; return LIST; }
            if(id.equals("Ldaj;->p:[Lzci;")) return PERMISSION_ARRAY;
            if(Set.of("Lzci;->X:Lzci;","Lzci;->a0:Lzci;","Lzci;->Z:Lzci;","Lzci;->q:Lzci;","Lzci;->Y:Lzci;").contains(id)) return id;
            throw new AssertionError("Unexpected read: "+id);
        }
        void write(Opcode opcode, FieldReference field, Object value) {
            String id=fieldId(field);
            switch(id) {
                case "Lhya;->d:Lhya;" -> require(opcode==Opcode.SPUT_OBJECT && value instanceof Instance && ((Instance)value).type().equals(SUPPORT), "Invalid singleton write");
                case "Lhya;->e:B" -> require(opcode==Opcode.SPUT_BYTE && value instanceof Integer, "Invalid cached support write");
                case "Lkho;->a:Ljava/lang/String;", "Lkho;->b:Ljava/lang/String;", "Lkho;->c:Ljava/lang/String;" -> require(opcode==Opcode.SPUT_OBJECT && value instanceof String, "Invalid recorder identity write");
                default -> throw new AssertionError("Unexpected write: "+id);
            }
            require(!fields.containsKey(id), "Duplicate static write: "+id);
            fields.put(id,value);
        }
        Object call(Opcode opcode, MethodReference method, List<Object> args) {
            String id=methodId(method);
            switch(id) {
                case "Lts1;->j()Lq2j;":
                    require(opcode==Opcode.INVOKE_STATIC && args.isEmpty(), "Invalid original application-context call");
                    return applicationContext;
                case "Lio/github/emotionbug/patches/runtime/RecorderIdentity;->certificate(Landroid/content/Context;)Ljava/lang/String;":
                    require(opcode==Opcode.INVOKE_STATIC && args.size()==1 && args.get(0)==applicationContext, "Signer helper must receive ts1.j context");
                    return certificate;
                case "Ljava/lang/Object;-><init>()V":
                    require(opcode==Opcode.INVOKE_DIRECT && args.size()==1 && args.get(0) instanceof Instance && ((Instance)args.get(0)).type().equals(SUPPORT), "Invalid object constructor call");
                    objectConstructors++;
                    return null;
                case "Lg92;->G()Lo1i;":
                    require(opcode==Opcode.INVOKE_STATIC && args.isEmpty(), "Invalid installation manager call");
                    return AMH;
                case "Lo1i;->b()Z":
                    require(opcode==Opcode.INVOKE_VIRTUAL && args.size()==1 && args.get(0)==AMH, "Invalid install-kind receiver");
                    return eligible?1:0;
                case "Lumc;->c(I)B":
                    require(opcode==Opcode.INVOKE_STATIC && args.size()==1, "Invalid encoding call");
                    // Independently observed original umc.c: 1 -> byte 1, 2 -> byte 7.
                    int input=number(args.get(0));
                    require(input==1 || input==2, "Unexpected support enum: "+input);
                    return input==1?1:7;
                case "Lbel;->i()Z":
                    require(opcode==Opcode.INVOKE_STATIC && args.isEmpty(), "Invalid API gate");
                    return modern?1:0;
                case "Ld90;->c0()Z":
                    require(opcode==Opcode.INVOKE_STATIC && args.isEmpty(), "Invalid external-media gate");
                    return externalMedia?1:0;
                case "Ld90;->U()[Lzci;":
                    require(opcode==Opcode.INVOKE_STATIC && args.isEmpty(), "Invalid permission fallback");
                    // Independently observed original d90.U, preserving its API-dependent result.
                    return List.of("Lzci;->"+(modern?"X":"q")+":Lzci;", "Lzci;->r:Lzci;");
                default: throw new AssertionError("Unexpected invoke: "+id);
            }
        }
        Object run(String id) {
            Method method=methods.get(id);
            require(method!=null && method.getImplementation()!=null, "Missing method "+id);
            var body=method.getImplementation();
            require(!body.getTryBlocks().iterator().hasNext(), "Unexpected exception handler in "+id);
            Object[] regs=new Object[body.getRegisterCount()];
            Arrays.fill(regs,0);
            if(!AccessFlags.STATIC.isSet(method.getAccessFlags())) regs[regs.length-1]=new Instance(SUPPORT);
            List<Instruction> insns=new ArrayList<>();
            List<Integer> addresses=new ArrayList<>();
            Map<Integer,Integer> indexByAddress=new HashMap<>();
            int address=0;
            for(var ins:body.getInstructions()) { indexByAddress.put(address,insns.size()); addresses.add(address); insns.add(ins); address+=ins.getCodeUnits(); }
            int pc=0,steps=0;
            Object result=null;
            boolean pending=false;
            while(pc>=0 && pc<insns.size()) {
                require(++steps<=128,"Instruction bound exceeded in "+id);
                visited.computeIfAbsent(id,k->new HashSet<>()).add(pc);
                var ins=insns.get(pc);
                Opcode op=ins.getOpcode();
                boolean isMove=op==Opcode.MOVE_RESULT || op==Opcode.MOVE_RESULT_OBJECT;
                if(!isMove) pending=false;
                Integer branch=null;
                switch(op) {
                    case SGET_OBJECT -> regs[reg(ins)]=read((FieldReference)ref(ins));
                    case SPUT_OBJECT, SPUT_BYTE -> write(op,(FieldReference)ref(ins),regs[reg(ins)]);
                    case NEW_INSTANCE -> {
                        String type=((TypeReference)ref(ins)).getType();
                        require(type.equals(SUPPORT),"Unexpected allocation "+type);
                        regs[reg(ins)]=new Instance(type);
                    }
                    case INVOKE_STATIC, INVOKE_VIRTUAL, INVOKE_DIRECT -> {
                        MethodReference target=(MethodReference)ref(ins);
                        result=call(op,target,arguments(ins,regs));
                        pending=!target.getReturnType().equals("V");
                    }
                    case MOVE_RESULT, MOVE_RESULT_OBJECT -> {
                        require(pending,"Move-result without adjacent producer in "+id);
                        if(op==Opcode.MOVE_RESULT) require(result instanceof Integer,"Scalar/object result mismatch");
                        else require(!(result instanceof Integer),"Object/scalar result mismatch");
                        regs[reg(ins)]=result; pending=false;
                    }
                    case CONST_4, CONST_16, CONST -> regs[reg(ins)]=((NarrowLiteralInstruction)ins).getNarrowLiteral();
                    case CONST_STRING, CONST_STRING_JUMBO -> regs[reg(ins)]=((StringReference)ref(ins)).getString();
                    case IF_EQZ, IF_NEZ -> {
                        boolean zero=regs[reg(ins)]==null || (regs[reg(ins)] instanceof Integer && number(regs[reg(ins)])==0);
                        if((op==Opcode.IF_EQZ && zero)||(op==Opcode.IF_NEZ && !zero)) branch=((OffsetInstruction)ins).getCodeOffset();
                    }
                    case GOTO, GOTO_16, GOTO_32 -> branch=((OffsetInstruction)ins).getCodeOffset();
                    case FILLED_NEW_ARRAY -> {
                        require(((TypeReference)ref(ins)).getType().equals("[Lzci;"),"Unexpected array type");
                        result=List.copyOf(arguments(ins,regs)); pending=true;
                    }
                    case RETURN -> { return number(regs[reg(ins)]); }
                    case RETURN_OBJECT -> {
                        require(regs[reg(ins)] instanceof List<?>,"Unexpected returned object");
                        return regs[reg(ins)];
                    }
                    case RETURN_VOID -> { return null; }
                    default -> throw new AssertionError("Unexpected opcode "+op+" in "+id);
                }
                if(branch!=null) {
                    Integer destination=indexByAddress.get(addresses.get(pc)+branch);
                    require(destination!=null,"Branch target is not an instruction boundary in "+id);
                    pc=destination;
                } else pc++;
            }
            throw new AssertionError("Method fell through without return: "+id);
        }
    }
    public static void main(String[] args) throws Exception {
        methods.clear(); visited.clear();
        require(args.length==3,"Usage: VerifyBehavior REBUILT_DEX_DIRECTORY RECORDER_PACKAGE CERT_SHA256_BASE64");
        require(Base64.getDecoder().decode(args[2]).length==32,"Invalid expected certificate");
        Set<String> expected=Set.of("Lhya;->a()Z","Lhya;-><clinit>()V","Lhya;->f()[Lzci;","Lkho;-><clinit>()V");
        try(var paths=Files.list(Path.of(args[0]))) {
            for(Path path:paths.filter(p->p.getFileName().toString().matches("classes[0-9]*\\.dex")).sorted().toList()) {
                var dex=DexFileFactory.loadDexFile(path.toFile(),Opcodes.getDefault());
                for(var c:dex.getClasses()) if(c.getType().equals(SUPPORT)||c.getType().equals(IDENTITY)) {
                    for(var m:c.getMethods()) if(expected.contains(methodId(m))) require(methods.put(methodId(m),m)==null,"Duplicate method "+methodId(m));
                }
            }
        }
        require(methods.keySet().equals(expected),"Missing rebuilt methods: "+methods.keySet());
        int scenarios=0;
        for(boolean eligible:new boolean[]{false,true}) for(boolean modern:new boolean[]{false,true}) for(boolean external:new boolean[]{false,true}) {
            VM vm=new VM(eligible,modern,external,args[2]);
            vm.run("Lkho;-><clinit>()V");
            require(Objects.equals(vm.fields.get("Lkho;->a:Ljava/lang/String;"),args[1]),"Recorder package mismatch");
            require(Objects.equals(vm.fields.get("Lkho;->b:Ljava/lang/String;"),args[2]),"Recorder certificate mismatch");
            require(Objects.equals(vm.fields.get("Lkho;->c:Ljava/lang/String;"),args[1]+".action.CONNECT"),"Recorder action mismatch");
            vm.run("Lhya;-><clinit>()V");
            require(vm.fields.get("Lhya;->d:Lhya;") instanceof Instance && vm.objectConstructors==1,"Singleton initialization mismatch");
            require(Objects.equals(vm.fields.get("Lhya;->e:B"),eligible?7:1),"Cached support mismatch");
            require(Objects.equals(vm.run("Lhya;->a()Z"),eligible?1:0),"Dynamic support mismatch");
            List<String> permissions;
            if(!eligible) permissions=List.of(modern?"X":"q","r");
            else permissions=List.of(modern?"X":"q");
            List<String> expectedPermissions=permissions.stream().map(x->"Lzci;->"+x+":Lzci;").toList();
            require(Objects.equals(vm.run("Lhya;->f()[Lzci;"),expectedPermissions),"Permission array mismatch eligible="+eligible+" modern="+modern+" external="+external);
            require(vm.amhTouches==3,"Install-manager static initialization reads not preserved");
            require(vm.fields.size()==5,"Unexpected static field count");
            scenarios++;
        }
        for(var entry:methods.entrySet()) {
            int count=0;
            for(var ins:entry.getValue().getImplementation().getInstructions()) count++;
            require(visited.getOrDefault(entry.getKey(),Set.of()).size()==count,"Uncovered instructions in "+entry.getKey());
        }
        System.out.println("PASS: interpreted actual rebuilt DEX in "+scenarios+" install/API/media scenarios; support, cached 7/1, singleton, permission arrays, and runtime signer identity verified.");
        System.out.println("Scope: external Android calls are allowlisted stubs. This is not ART verification, device execution, recording, Binder, or server validation.");
    }
}
