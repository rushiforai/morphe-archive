import app.morphe.patcher.*;
import app.morphe.patcher.dex.*;
import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patches.chmate.PosterIdChainNgPatchKt;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction;
import java.io.File;
import java.nio.file.*;
import java.util.*;

/** Applies the production hook to each native APK and serializes its changed NG engine to DEX. */
public class VerifyPosterIdChainHooks {
    static final String EXT = "Lapp/morphe/extension/chmate/PosterIdChainNg;";
    static void check(boolean ok, String label) { if (!ok) throw new AssertionError(label); }
    static List<Instruction> code(Method method) {
        List<Instruction> out = new ArrayList<>();
        method.getImplementation().getInstructions().forEach(out::add);
        return out;
    }
    static boolean call(Instruction instruction, String name) {
        return instruction instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference m
                && m.getDefiningClass().equals(EXT) && m.getName().equals(name);
    }
    static boolean sameRead(Instruction a, Instruction b) {
        return a.getOpcode()==Opcode.IGET_OBJECT && b.getOpcode()==Opcode.IGET_OBJECT
            && a instanceof TwoRegisterInstruction x && b instanceof TwoRegisterInstruction y
            && x.getRegisterA()==y.getRegisterA() && x.getRegisterB()==y.getRegisterB()
            && ((ReferenceInstruction)a).getReference().equals(((ReferenceInstruction)b).getReference());
    }
    static boolean nativeMap(BytecodePatchContext context, String type) {
        if(type.equals("Ljava/util/Map;"))return true;
        if(type.startsWith("Ljava/")||type.startsWith("Lj$/"))return false;
        ClassDef cls=context.classDefBy(type);
        for(String parent:cls.getInterfaces())if(nativeMap(context,parent))return true;
        return cls.getSuperclass()!=null && nativeMap(context,cls.getSuperclass());
    }
    public static void main(String[] args) throws Exception {
        String[][] profiles = {
            {"191 dev","Lo/m9ExternalSyntheticLambda1;","SE_","K","C","Lo/processAdDisplayErrorPostbackForUserError;","h","c","c"},
            {"226 dev","Lo/listener;","d","J","A","Lo/BouncyCastleSocketAdapterCompanion;","j","d","b"},
            {"241","Lo/SignInButton;","a","e","b","Lo/setDislikeWidth;","i","g",""},
            {"242 dev","Lo/zzaW;","c","a","c","Lo/KeJ11;","g","h",""},
            {"243 dev","Lo/zzdpd;","e","b","a","Lo/zzabv;","h","j",""}
        };
        if (args.length == 3) profiles = new String[][] {profiles[0], profiles[1], profiles[3]};
        check(args.length == profiles.length, "Provide APKs in 191/226/242 or 191/226/241/242/243 order");
        for (int p=0; p<profiles.length; p++) {
            String[] profile = profiles[p];
            File temp = Path.of("build/verification/poster-id-chain/hooks-"+p).toAbsolutePath().toFile();
            PatcherConfig config = new PatcherConfig(new File(args[p]),temp,null,null,true,Set.of(),
                    BytecodeMode.FULL,NoOpDexVerifier.INSTANCE);
            config.setBytecodeMode$morphe_patcher(BytecodeMode.FULL);
            try (BytecodePatchContext context = new BytecodePatchContext(config,
                    new PackageMetadata("jp.co.airfront.android.a2chMate","0.8.10."+profile[0],"1",null))) {
                context.decodeDexFiles$morphe_patcher();
                String hiddenOwner = profile[0].startsWith("242")
                    ? "Ljp/syoboi/a2chMate/ui/reslist/ResListFragmentViewModel$onBackPressedInput_delegatelambda0$3;" : profile[1];
                String hiddenMethod = profile[0].startsWith("242") ? "invokeSuspend" : profile[8];
                Method before = null;
                if(!hiddenMethod.isEmpty()) for(Method m:context.mutableClassDefBy(hiddenOwner).getMethods())
                    if(m.getName().equals(hiddenMethod) && m.getParameterTypes().equals(List.of(profile[0].startsWith("242")?"Ljava/lang/Object;":"Z"))) before=m;
                List<Instruction> hiddenBefore = before == null ? List.of() : code(before);
                Map<Instruction, Instruction> branchTargets = new IdentityHashMap<>();
                for(Instruction i:hiddenBefore)if(i instanceof BuilderOffsetInstruction b)
                    branchTargets.put(i,b.getTarget().getLocation().getInstruction());
                int hiddenRegisters = before == null ? 0 : before.getImplementation().getRegisterCount();
                PosterIdChainNgPatchKt.patchPosterIdChainNg(context);
                if(before != null) {
                    List<Instruction> after=code(before);
                    int hiddenCalls=0;
                    for(int i=0;i<after.size();i++)if(call(after.get(i),"applyHidden")) {
                        hiddenCalls++;
                        FiveRegisterInstruction hook=(FiveRegisterInstruction)after.get(i);
                        check(hook.getRegisterCount()==1,"hidden filter takes only owner");
                        check(after.get(i+1).getOpcode()==Opcode.IGET_OBJECT && after.get(i+1) instanceof TwoRegisterInstruction r
                            && r.getRegisterB()==hook.getRegisterC(),"hidden filter precedes native map read with exact owner");
                        Instruction anchor=after.get(i+1);
                        for(var branch:branchTargets.entrySet()) if(sameRead(branch.getValue(),anchor))
                            check(((BuilderOffsetInstruction)branch.getKey()).getTarget().getLocation().getInstruction()==after.get(i),
                                "native jumps into filtering phase execute hidden hook");
                    }
                    check(hiddenCalls==1,"one transparent filter hook");
                    check(before.getImplementation().getRegisterCount()==hiddenRegisters,"hidden filter register count unchanged");
                    after.removeIf(i->call(i,"applyHidden")||call(i,"reset"));
                    check(after.size()==hiddenBefore.size(),"original hidden-filter instruction count retained");
                    for(int i=0;i<after.size();i++)check(after.get(i)==hiddenBefore.get(i)||sameRead(after.get(i),hiddenBefore.get(i)),
                        "original hidden-filter instruction/branch retained at "+i);
                    Path hiddenDex=temp.toPath().resolve("hidden-filter.dex");Files.createDirectories(hiddenDex.getParent());
                    DexPool.writeTo(hiddenDex.toString(),new ImmutableDexFile(Opcodes.getDefault(),List.of(context.mutableClassDefBy(hiddenOwner))));
                }
                ClassDef owner = context.mutableClassDefBy(profile[1]);
                Method target = null;
                for (Method method : owner.getMethods()) {
                    if (method.getName().equals(profile[2]) && method.getReturnType().equals("I")) target=method;
                }
                check(target != null,"native response method");
                List<Instruction> instructions=code(target);
                int found=0;
                for (int i=0;i<instructions.size();i++) if (call(instructions.get(i),"merge")) {
                    found++;
                    int p0=target.getImplementation().getRegisterCount()-target.getParameterTypes().size()-1;
                    OneRegisterInstruction result=(OneRegisterInstruction)instructions.get(i+1);
                    boolean modern=profile[8].isEmpty();
                    Instruction store=instructions.get(i+(modern?3:2));
                    int value=store instanceof FiveRegisterInstruction f ? f.getRegisterE()
                            : ((RegisterRangeInstruction)store).getStartRegister()+2;
                    if(modern) {
                        FiveRegisterInstruction call=(FiveRegisterInstruction)instructions.get(i);
                        check(call.getRegisterCount()==3 && call.getRegisterC()==p0
                                && call.getRegisterD()==p0+1 && call.getRegisterE()==value,
                                "owner/response/state passed without clobbering cache");
                        Instruction load=instructions.get(i+2);
                        check(load.getOpcode()==Opcode.IGET && load instanceof TwoRegisterInstruction r
                                && r.getRegisterA()==p0+1 && r.getRegisterB()==p0+1,
                                "merge precedes destructive response-number load");
                    } else {
                        RegisterRangeInstruction call=(RegisterRangeInstruction)instructions.get(i);
                        check(call.getStartRegister()==p0 && call.getRegisterCount()==3,"owner/row/state argument range");
                        TwoRegisterInstruction move=(TwoRegisterInstruction)instructions.get(i-1);
                        check(move.getRegisterA()==p0+2 && move.getRegisterB()==value,"legacy scratch argument");
                    }
                    check(result.getRegisterA()==value,"native chain-state register preserved");
                }
                check(found==1,"one merge hook");
                if (!profile[8].isEmpty()) {
                    int resets=0;
                    for (Method m:owner.getMethods()) if(m.getName().equals(profile[8]) && m.getReturnType().equals("V")
                            && m.getParameterTypes().equals(List.of("Z")))
                        for(Instruction i:code(m))if(call(i,"reset"))resets++;
                    check(resets==1,"legacy rebuild resets snapshots");
                }
                String matcher=null;
                boolean rows=false;
                for(Field field:owner.getInstanceFields()) {
                    if(field.getName().equals(profile[3]))rows=true;
                    if(field.getName().equals(profile[4]))matcher=field.getType();
                }
                check(rows && matcher!=null,"native source list and WORD matcher");
                if(before!=null) {
                    String mapName=profile[0].startsWith("191")?"N":profile[0].startsWith("226")?"K":"j";
                    String mapType=null;
                    for(Field f:owner.getInstanceFields())if(f.getName().equals(mapName))mapType=f.getType();
                    check(mapType!=null && (mapType.equals("Landroid/util/SparseIntArray;")||nativeMap(context,mapType)),
                        "transparent NG map implements SparseIntArray or java.util.Map");
                    String number=profile[0].startsWith("226")?"l":"o";
                    String anchors=profile[0].startsWith("191")?"d":profile[0].startsWith("226")?"a":"b";
                    Set<String> fields=new HashSet<>();
                    for(Field f:context.classDefBy(profile[5]).getInstanceFields())fields.add(f.getName()+":"+f.getType());
                    check(fields.contains(number+":I")&&fields.contains(anchors+":[I"),"native response number and parsed anchor fields");
                }
                boolean items=false;
                for(String type=matcher; type!=null && !type.equals("Ljava/lang/Object;" );) {
                    ClassDef cls=context.classDefBy(type);
                    for(Field field:cls.getInstanceFields()) if(field.getType().equals("Ljava/util/List;"))items=true;
                    type=cls.getSuperclass();
                }
                check(items,"board-filtered native rule list available");
                for(String name:List.of(profile[6],profile[7])) {
                    boolean fieldFound=false;
                    for(Field field:context.classDefBy(profile[5]).getInstanceFields())
                        if(field.getName().equals(name)&&field.getType().equals("Ljava/lang/String;"))fieldFound=true;
                    check(fieldFound,"native ID/body field "+name);
                }
                Path dex=temp.toPath().resolve("ng-engine.dex"); Files.createDirectories(dex.getParent());
                DexPool.writeTo(dex.toString(),new ImmutableDexFile(Opcodes.getDefault(),List.of(owner)));
                check(Files.size(dex)>0,"patched engine serialized");
                System.out.println("PASS "+profile[0]+" production hooks, original instructions/registers, transparent-filter branch targets, native maps/anchors/rules and DEX serialization");
            }
            System.gc();
        }
    }
}
