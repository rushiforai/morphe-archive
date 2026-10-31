package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;
import java.util.zip.ZipFile;

public final class VerifyNuvioUpdateFlow {
    static void check(boolean value) { if (!value) throw new AssertionError(); }
    static void rejected(Runnable action) {
        try {action.run();} catch(IllegalStateException expected) {return;}
        throw new AssertionError("Invalid update flow accepted");
    }
    static Map<String,MutableClass> copy(Map<String,MutableClass> input) {
        var result=new HashMap<String,MutableClass>(); input.forEach((t,c)->result.put(t,new MutableClass(c))); return result;
    }
    static void apply(Map<String,MutableClass> c) {
        NuvioUpdateFlowPatch.install(c.get("Llb/q;"),c.get("Llb/b;"),c.get(NuvioUpdateInstaller.INSTALLER),
            c.get(NuvioUpdateFlowPatch.INSTALL_UI),c.get("Landroidx/core/content/FileProvider;"),c.get("Lb4/a;"),c.get("Lmb/a;"));
    }
    public static void main(String[] args)throws Exception {
        var originals=new HashMap<String,MutableClass>();
        var types=Set.of("Llb/q;","Llb/b;",NuvioUpdateInstaller.INSTALLER,NuvioUpdateInstaller.RECEIVER,
            "Landroidx/core/content/FileProvider;","Lb4/a;","Lmb/a;");
        try(var zip=new ZipFile(args[0])) {
            for(var e:Collections.list(zip.entries()))if(e.getName().matches("classes\\d*\\.dex"))
                try(var in=new BufferedInputStream(zip.getInputStream(e))) {
                    for(var c:DexBackedDexFile.fromInputStream(null,in).getClasses())if(types.contains(c.getType()))check(originals.put(c.getType(),new MutableClass(c))==null);
                }
        }
        try(var zip=new ZipFile(args[2]); var in=new BufferedInputStream(zip.getInputStream(zip.getEntry("extensions/nuvio-apk-updates.mpe")))) {
            for(var c:DexBackedDexFile.fromInputStream(null,in).getClasses())if(c.getType().equals(NuvioUpdateFlowPatch.INSTALL_UI)) originals.put(c.getType(),new MutableClass(c));
        }
        check(originals.size()==8);
        var classes=copy(originals);
        NuvioUpdateInstaller.disableMetadata(classes.get(NuvioUpdateInstaller.INSTALLER),classes.get(NuvioUpdateInstaller.RECEIVER));
        var bad=copy(classes); NuvioUpdateInstaller.unique(bad.get("Llb/b;"),"a").getImplementation().replaceInstruction(0,new BuilderInstruction10x(Opcode.NOP));
        rejected(()->apply(bad));
        check(NuvioPlaybackButtonsPatch.fingerprint(NuvioUpdateInstaller.unique(bad.get("Llb/q;"),"b")).equals(NuvioPlaybackButtonsPatch.fingerprint(NuvioUpdateInstaller.unique(classes.get("Llb/q;"),"b"))));
        var missing=copy(classes); missing.get(NuvioUpdateFlowPatch.INSTALL_UI).getMethods().removeIf(m->m.getName().equals("contentUri")); rejected(()->apply(missing));
        var incompatible=copy(classes); NuvioUpdateInstaller.unique(incompatible.get("Llb/q;"),"b").setAccessFlags(9); rejected(()->apply(incompatible));
        apply(classes); rejected(()->apply(classes));
        File out=new File(args[1]); out.getParentFile().mkdirs(); DexPool.writeTo(out.toString(),new ImmutableDexFile(Opcodes.getDefault(),classes.values()));
        try(var in=new BufferedInputStream(new FileInputStream(out))) {
            for(var c:DexBackedDexFile.fromInputStream(null,in).getClasses())for(var after:new MutableClass(c).getMethods()) {
                if(c.getType().equals("Llb/q;")&&after.getName().equals("b"))NuvioUpdateFlowPatch.removeDownloadHook(after);
                if(c.getType().equals(NuvioUpdateInstaller.INSTALLER)&&after.getName().equals("b")) {NuvioUpdateFlowPatch.removeInstallHook(after); check(NuvioUpdateInstaller.isZero(after.getImplementation().getInstructions().get(0),15)); after.getImplementation().removeInstruction(0);}
                if(c.getType().equals(NuvioUpdateInstaller.RECEIVER)&&after.getName().equals("onReceive"))after.getImplementation().removeInstruction(NuvioUpdateInstaller.dmResult(after)+1);
                if(c.getType().equals(NuvioUpdateFlowPatch.INSTALL_UI)&&after.getName().equals("contentUri")) {
                    var body=after.getImplementation(); check(body.getInstructions().size()==5);
                    check(NuvioPlaybackButtonsPatch.reference(body.getInstructions().get(0)).equals("Landroidx/core/content/FileProvider;->c(Landroid/content/Context;Ljava/lang/String;)Lb4/a;"));
                    check(NuvioPlaybackButtonsPatch.reference(body.getInstructions().get(2)).equals("Lb4/a;->c(Ljava/io/File;)Landroid/net/Uri;"));
                    while(!body.getInstructions().isEmpty())body.removeInstruction(0);
                    body.addInstruction(new BuilderInstruction11n(Opcode.CONST_4,0,0)); body.addInstruction(new BuilderInstruction11x(Opcode.RETURN_OBJECT,0));
                }
                var before=originals.get(c.getType()).getMethods().stream().filter(m->m.toString().equals(after.toString())).findFirst().orElseThrow();
                check(NuvioPlaybackButtonsPatch.fingerprint(before).equals(NuvioPlaybackButtonsPatch.fingerprint(after)));
                check(ImmutableMethodImplementation.of(before.getImplementation()).getTryBlocks().equals(ImmutableMethodImplementation.of(after.getImplementation()).getTryBlocks()));
            }
        }
        System.out.println("PASS: original beta.8, exact native/provider/asset contracts, missing/changed/incompatible/duplicate rejection, narrow hooks and DEX/try-region roundtrip");
    }
}
