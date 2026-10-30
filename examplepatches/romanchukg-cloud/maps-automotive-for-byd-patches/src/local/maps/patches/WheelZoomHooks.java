// SPDX-License-Identifier: GPL-3.0-only
package local.maps.patches;

import java.util.List;
import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;

/** Exact static and navigation camera entries; no full-pose dispatcher interception.
 * Pinned to original 26.10: the camera owner is xay. Its cached state fields swapped
 * names against 26.09: static state is A (26.09 B), navigation state is z (26.09 A).
 */
final class WheelZoomHooks {
    static final String TYPE="Lxay;",DESCRIPTOR="d(Lagvg;)Lj$/util/Optional;";
    static final String PIN="afec9e90b54701db67d3f09b9d31937aa2b21c4e19015106e803ec4b9d494dda";
    static final String NAV="e(Lagwh;Lwvk;Z)Lj$/util/Optional;",NAV_PIN="01daf12af6cb99b509d5b55f65ca0fda23b2c7de0bc428593f78a9cad956c098";
    static final String OVERRIDE="p(Ljava/lang/Float;Ljava/lang/Float;I)Lj$/util/Optional;",OVERRIDE_PIN="a99da6d1c18c839d9bd021bf1803c93d27d5282f79a8f5c0ea69463800f54706";
    /** Cached camera state fields written by the two entries (role swap against 26.09). */
    static final String STATIC_STATE="A",NAVIGATION_STATE="z";
    private static final ImmutableMethodReference CHANGED=new ImmutableMethodReference("Llocal/maps/cluster/ClusterZoom;","cameraChanged",List.of("Ljava/lang/Object;"),"V");
    private static void pin(MutableMethod method,String descriptor,String hash,int registers){
        if(!TYPE.equals(method.getDefiningClass())||!descriptor.equals(Api29Hooks.descriptor(method))||!hash.equals(Api29Hooks.fingerprint(method))||method.getImplementation()==null||method.getImplementation().getRegisterCount()!=registers)throw new IllegalStateException("Wheel camera fingerprint changed "+descriptor);
    }
    private static void changedAfter(MutableMethod method,int address,int receiver,String field,String type){
        var body=method.getImplementation();int at=0,index=0,matches=0,found=-1;
        for(var instruction:body.getInstructions()){
            if(at==address&&instruction.getOpcode()==Opcode.IPUT_OBJECT&&instruction instanceof com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction&&instruction instanceof com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction){
                var registers=(com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction)instruction;
                var reference=((com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)instruction).getReference();
                if(registers.getRegisterB()==receiver&&reference instanceof com.android.tools.smali.dexlib2.iface.reference.FieldReference){var f=(com.android.tools.smali.dexlib2.iface.reference.FieldReference)reference;if(TYPE.equals(f.getDefiningClass())&&field.equals(f.getName())&&type.equals(f.getType())){found=index+1;matches++;}}
            }
            at+=instruction.getCodeUnits();index++;
        }
        if(matches!=1)throw new IllegalStateException("Camera cached state completion boundary changed");
        body.addInstruction(found,new BuilderInstruction35c(Opcode.INVOKE_STATIC,1,receiver,0,0,0,0,CHANGED));
    }
    /** Original p0=v12 (16 registers, params agwh/wvk/Z); writes navigation state z at 0x44. */
    static void patchNavigation(MutableMethod method){pin(method,NAV,NAV_PIN,16);changedAfter(method,0x44,12,NAVIGATION_STATE,"Lj$/util/Optional;");}
    static void patchOverride(MutableMethod method){
        // Original p0=v10/p1=v11 (14 registers), unchanged body against 26.09 n().
        pin(method,OVERRIDE,OVERRIDE_PIN,14);var body=method.getImplementation();
        body.addInstruction(0,new BuilderInstruction35c(Opcode.INVOKE_STATIC,2,10,11,0,0,0,new ImmutableMethodReference("Llocal/maps/cluster/ClusterZoom;","adjustNavigationZoom",List.of("Ljava/lang/Object;","Ljava/lang/Float;"),"Ljava/lang/Float;")));
        body.addInstruction(1,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,11));
    }
    private static MutableMethod method(BytecodePatchContext ctx,String descriptor){MutableMethod found=null;for(var method:ctx.mutableClassDefBy(TYPE).getMethods())if(descriptor.equals(Api29Hooks.descriptor(method))){if(found!=null)throw new IllegalStateException("Duplicate wheel camera method");found=method;}if(found==null)throw new IllegalStateException("Missing wheel camera method "+descriptor);return found;}
    private static void original(BytecodePatchContext ctx,String descriptor,String hash,int registers){pin(method(ctx,descriptor),descriptor,hash,registers);}
    static void patch(MutableMethod method){
        pin(method,DESCRIPTOR,PIN,15);changedAfter(method,0x53,13,STATIC_STATE,"Lj$/util/Optional;");
        var body=method.getImplementation();
        // Original p0=v13/p1=v14 (15 registers). No locals, result, callbacks or try handlers are clobbered.
        body.addInstruction(0,new BuilderInstruction35c(Opcode.INVOKE_STATIC,2,13,14,0,0,0,
            new ImmutableMethodReference("Llocal/maps/cluster/ClusterZoom;","adjustState",List.of("Ljava/lang/Object;","Ljava/lang/Object;"),"Ljava/lang/Object;")));
        body.addInstruction(1,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,14));
        body.addInstruction(2,new BuilderInstruction21c(Opcode.CHECK_CAST,14,new ImmutableTypeReference("Lagvg;")));
    }
    private static void field(BytecodePatchContext ctx,String type,String name,String expected){
        int matches=0;var owner=ctx.classDefByOrNull(type);
        if(owner!=null)for(var field:owner.getFields())if(name.equals(field.getName())&&expected.equals(field.getType()))matches++;
        if(matches!=1)throw new IllegalStateException("Wheel zoom native camera field changed "+type+name);
    }
    static void apply(BytecodePatchContext ctx){
        field(ctx,"Lgsv;","Z","Lfrr;");field(ctx,"Lfsb;","aC","Lieu;");field(ctx,"Lgcw;","m","Lieu;");field(ctx,"Lier;","at","Luip;");field(ctx,"Lier;","D","Lalme;");
        field(ctx,"Luip;","c","Lalme;");field(ctx,"Luip;","d","Lalme;");field(ctx,"Luip;","e","Lalme;");field(ctx,"Lusj;","c","Ljava/lang/Object;");field(ctx,"Lujf;","d","Lalme;");field(ctx,"Luiq;","a","[Lutf;");
        field(ctx,"Lxav;","b","Lxay;");field(ctx,"Lxav;","c","Lcom/google/android/libraries/geo/navcore/ui/camera/jni/CameraControllerJni;");
        field(ctx,TYPE,"k","Lcom/google/android/libraries/geo/navcore/ui/camera/jni/CameraControllerJni;");field(ctx,TYPE,"w","Lxav;");field(ctx,TYPE,"E","Luip;");field(ctx,TYPE,"B","Z");field(ctx,TYPE,NAVIGATION_STATE,"Lj$/util/Optional;");field(ctx,TYPE,STATIC_STATE,"Lj$/util/Optional;");field(ctx,TYPE,"c","Lagvh;");field(ctx,TYPE,"m","Lfmx;");
        field(ctx,"Lagvg;","b","I");field(ctx,"Lagvg;","c","Ljava/lang/Object;");field(ctx,"Lagwj;","b","I");field(ctx,"Lagwj;","e","D");field(ctx,"Lakbk;","b","Lakbq;");
        field(ctx,"Lagvh;","b","I");field(ctx,"Lagvh;","c","D");field(ctx,"Lagvh;","d","D");field(ctx,"Lagwh;","b","I");field(ctx,"Lagwh;","c","Ljava/lang/Object;");
        original(ctx,"i(Ljava/lang/Float;)Lj$/util/Optional;","fc3f9390de30b795bc6ad274b028560bfafae19ec13fe0560bbd3a96b3b0e612",4);
        original(ctx,"q()Lj$/util/Optional;","09093203699320c8f5af013f028977c06bec384e11e66b7539a64279072c18f3",13);
        patch(method(ctx,DESCRIPTOR));patchNavigation(method(ctx,NAV));patchOverride(method(ctx,OVERRIDE));
        System.out.println("Wheel zoom: pinned static8 and navigation3/6 camera families; owned zoom scalar only");
    }
}
