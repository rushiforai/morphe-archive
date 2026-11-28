package app.sharklatan.patches.airplay;
import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.zip.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;

import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
final class AirPlayHooks {
    static final String ENTRY="Lapp/sharklatan/youtube/airplay/AirPlayEntry;";
    static final String ACTIVITY="app.sharklatan.youtube.airplay.AirPlayActivity";
    static final String VIDEO="Lapp/morphe/extension/youtube/patches/VideoInformation;";
    /** Verified seek entry points in the preserved Morphe YouTube 21.30.216 base. */
    static final Set<String> SEEK_CLASSES=new HashSet<>(Arrays.asList("Larzg;","Lanfu;"));

 static Method add(BytecodePatchContext context,Method method){MutableClass c=context.mutableClassDefBy(method.getDefiningClass());MutableMethod m=new MutableMethod(method);c.getMethods().add(m);return m;}
 static MutableMethod mutable(BytecodePatchContext context,Method method){
  MutableClass c=context.mutableClassDefBy(method.getDefiningClass());
  for(MutableMethod m:c.getMethods())if(m.getName().equals(method.getName())&&m.getParameterTypes().equals(method.getParameterTypes())&&m.getReturnType().equals(method.getReturnType()))return m;
  throw new IllegalStateException("Missing hook "+method);
 }
 static Method replace(BytecodePatchContext context,Method method,MutableMethodImplementation body){
  MutableMethod current=mutable(context,method);
  if(current.getImplementation()!=body)throw new IllegalStateException("Hook must preserve the shared mutable method body");
  return current;
 }
 static void rewrite(BytecodePatchContext context){
  List<ClassDef> input=new ArrayList<>();context.classDefForEach(c->{input.add(c);return kotlin.Unit.INSTANCE;});
  Set<String> targets=new HashSet<>(Arrays.asList("Lcom/google/android/apps/youtube/app/watchwhile/MainActivity;","Lcom/google/android/youtube/app/honeycomb/Shell$HomeActivity;"));
  boolean videoInfo=false,streamRequest=false,seekHook=false,found=false;int stateHooks=0;List<ClassDef> classes=new ArrayList<>();
                for(ClassDef cls:input) {
                    if(cls.getType().startsWith("Lapp/sharklatan/"))continue;
                    if(cls.getType().equals(VIDEO))videoInfo=true;
                    if(cls.getType().equals("Lapp/morphe/extension/shared/spoof/requests/StreamingDataRequest;"))streamRequest=true;
                    List<Method> audioMethods=new ArrayList<>();boolean audioChanged=false;
                    for(Method method:cls.getMethods()) {
                        if(method.getImplementation()==null){audioMethods.add(method);continue;}
                        MutableMethodImplementation audioImpl=null;int offset=0;
                        for(Instruction instruction:method.getImplementation().getInstructions()) {
                            if(instruction instanceof ReferenceInstruction && ((ReferenceInstruction)instruction).getReference() instanceof MethodReference) {
                                MethodReference ref=(MethodReference)((ReferenceInstruction)instruction).getReference();
                                if(ref.getDefiningClass().equals(ENTRY)||ref.getDefiningClass().equals("Lapp/sharklatan/youtube/airplay/NativeRemote;"))throw new IllegalStateException("AirPlay is already present. Use the APK saved before applying this patch.");
                                boolean mono=ref.getName().equals("setVolume")&&ref.getParameterTypes().toString().equals("[F]");
                                boolean stereo=ref.getName().equals("setStereoVolume")&&ref.getParameterTypes().toString().equals("[F, F]");
                                boolean lifecycle=Arrays.asList("play","pause","stop").contains(ref.getName())&&ref.getParameterTypes().isEmpty();
                                boolean session=ref.getDefiningClass().equals("Landroid/media/session/MediaSession;")&&ref.getName().equals("setPlaybackState")&&ref.getParameterTypes().toString().equals("[Landroid/media/session/PlaybackState;]");
                                if(session || ref.getDefiningClass().equals("Landroid/media/AudioTrack;")&&(mono||stereo||lifecycle)) {
                                    if(audioImpl==null)audioImpl=mutable(context,method).getImplementation();
                                    ImmutableMethodReference hook=new ImmutableMethodReference("Lapp/sharklatan/youtube/airplay/LocalAudio;",session?"state":lifecycle?ref.getName():mono?"volume":"stereo",session?Arrays.asList("Landroid/media/session/MediaSession;","Landroid/media/session/PlaybackState;"):lifecycle?Collections.singletonList("Landroid/media/AudioTrack;"):mono?Arrays.asList("Landroid/media/AudioTrack;","F"):Arrays.asList("Landroid/media/AudioTrack;","F","F"),session||lifecycle?"V":"I");
                                    if(instruction instanceof FiveRegisterInstruction){FiveRegisterInstruction regs=(FiveRegisterInstruction)instruction;
                                        audioImpl.replaceInstruction(offset,new BuilderInstruction35c(Opcode.INVOKE_STATIC,regs.getRegisterCount(),regs.getRegisterC(),regs.getRegisterD(),regs.getRegisterE(),regs.getRegisterF(),regs.getRegisterG(),hook));}
                                    else if(instruction instanceof RegisterRangeInstruction){RegisterRangeInstruction regs=(RegisterRangeInstruction)instruction;audioImpl.replaceInstruction(offset,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,regs.getStartRegister(),regs.getRegisterCount(),hook));}
                                    else throw new IllegalStateException("Unsupported AudioTrack instruction.");
                                    if(session)stateHooks++;
                                }
                            }offset++;
                        }
                        boolean seek=SEEK_CLASSES.contains(cls.getType())&&method.getName().equals("ao")&&method.getParameterTypes().toString().equals("[J, Lbkgc;]");
                        boolean videoId=cls.getType().equals(VIDEO)&&method.getName().equals("setVideoId")&&method.getParameterTypes().toString().equals("[Ljava/lang/String;]");
                        if(seek)seekHook=true;
                        if(seek||videoId){
                            if(audioImpl==null)audioImpl=mutable(context,method).getImplementation();
                            int register=audioImpl.getRegisterCount()-(seek?3:1);
                            ImmutableMethodReference hook=new ImmutableMethodReference("Lapp/sharklatan/youtube/airplay/NativeRemote;",seek?"seek":"video",Collections.singletonList(seek?"J":"Ljava/lang/String;"),"V");
                            audioImpl.addInstruction(0,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,register,seek?2:1,hook));
                        }
                        if(audioImpl==null)audioMethods.add(method);
                        else {audioChanged=true;audioMethods.add(replace(context,method,audioImpl));}
                    }
                    if(audioChanged){cls=new ImmutableClassDef(cls.getType(),cls.getAccessFlags(),cls.getSuperclass(),cls.getInterfaces(),cls.getSourceFile(),cls.getAnnotations(),cls.getFields(),audioMethods);found=true;}
                    if(!targets.contains(cls.getType())){classes.add(cls);continue;}
                    String target=cls.getType();
                    found=true;List<Method> methods=new ArrayList<>();boolean hooked=false;
                    ImmutableMethodReference hook=new ImmutableMethodReference(ENTRY,"attach",Collections.singletonList("Landroid/app/Activity;"),"V");
                    for(Method method:cls.getMethods()) {
                        if(!method.getName().equals("onResume")||!method.getParameterTypes().isEmpty()){methods.add(method);continue;}
                        if(method.getImplementation()==null)throw new IllegalStateException("onResume has no body.");
                        MutableMethodImplementation impl=mutable(context,method).getImplementation();
                        // p0 is the final register for a non-static no-argument method.
                        int self=impl.getRegisterCount()-1;
                        List<Integer> returns=new ArrayList<>();int i=0;for(com.android.tools.smali.dexlib2.iface.instruction.Instruction instruction:impl.getInstructions()){if(instruction.getOpcode()==Opcode.RETURN_VOID)returns.add(i);i++;}
                        if(returns.isEmpty())throw new IllegalStateException("No normal return from onResume.");
                        impl.addInstruction(0,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,self,1,hook));
                        methods.add(replace(context,method,impl));hooked=true;
                    }
                    if(!hooked) {
                        MutableMethodImplementation impl=new MutableMethodImplementation(1);
                        impl.addInstruction(new BuilderInstruction3rc(Opcode.INVOKE_SUPER_RANGE,0,1,new ImmutableMethodReference(cls.getSuperclass(),"onResume",Collections.emptyList(),"V")));
                        impl.addInstruction(new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,0,1,hook));impl.addInstruction(new BuilderInstruction10x(Opcode.RETURN_VOID));
                        methods.add(add(context,new ImmutableMethod(target,"onResume",Collections.emptyList(),"V",AccessFlags.PROTECTED.getValue(),Collections.emptySet(),Collections.emptySet(),impl)));
                    }
                    classes.add(new ImmutableClassDef(cls.getType(),cls.getAccessFlags(),cls.getSuperclass(),cls.getInterfaces(),cls.getSourceFile(),cls.getAnnotations(),cls.getFields(),methods));
                }

 if(!videoInfo||!streamRequest||!seekHook||stateHooks==0)throw new IllegalStateException("Select the Morphe YouTube patches (including Spoof video streams) together with AirPlay for original YouTube 21.30.216");
 }
}
