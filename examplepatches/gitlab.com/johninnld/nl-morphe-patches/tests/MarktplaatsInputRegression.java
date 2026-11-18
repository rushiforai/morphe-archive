import java.io.File;
import java.lang.reflect.*;
import java.nio.file.Files;
import java.security.cert.X509Certificate;
import java.util.*;
import app.morphe.patcher.*;
import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.PatchClasses;
import com.reandroid.apk.ApkModule;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x;

/** Executes the shipped guard with real publisher certificates, without mutating APKs. */
class MarktplaatsInputRegression extends OriginalInputRegression {
    static PackageMetadata read(File file) throws Exception {
        try (ApkModule apk=ApkModule.loadApkFile(file)) {
            var m=apk.getAndroidManifest();
            return new PackageMetadata(m.getPackageName(),m.getVersionName(),String.valueOf(m.getVersionCode()),apk.getApkSignatureBlock());
        }
    }
    public static void main(String[] args) throws Exception {
        File bundle=new File(args[0]), originalFile=new File(args[1]), scratch=new File(args[3]);
        PackageMetadata original=read(originalFile), other=read(new File(args[2]));
        int minSdk;
        try(ApkModule apk=ApkModule.loadApkFile(originalFile)) {
            minSdk=apk.getAndroidManifest().getMinSdkVersion();
        }
        List<X509Certificate> trusted=original.getSigningCertificates().values().stream().flatMap(Collection::stream).distinct().toList();
        List<X509Certificate> untrusted=other.getSigningCertificates().values().stream().flatMap(Collection::stream).distinct().toList();
        check(!trusted.isEmpty()&&!untrusted.isEmpty()&&Collections.disjoint(trusted,untrusted),"real disjoint publisher certificates");
        Set<Patch<?>> patches=new PatchLoader.Jar(Set.of(bundle));
        List<Patch<?>> named=patches.stream().filter(p->p.getName()!=null&&p.getCompatibility()!=null&&p.getCompatibility().stream().anyMatch(c->c.getPackageName().equals("nl.marktplaats.android"))).toList();
        check(named.size()==5,"five Marktplaats controls loaded");
        for(Patch<?> patch:named) for(Compatibility compatible:patch.getCompatibility())
            check(compatible.getTargets().size()==1&&compatible.getTargets().stream().allMatch(target->target.getVersion().equals("16.19.0")),"public control exposes only current Marktplaats version");
        Field execution=Patch.class.getDeclaredField("executeBlock");execution.setAccessible(true);
        ClassLoader loader=execution.get(named.getFirst()).getClass().getClassLoader();
        Class<?> app=loader.loadClass("patches.marktplaats.CompatibilityKt");
        ResourcePatch guard=(ResourcePatch)app.getDeclaredMethod("getOriginalInput").invoke(null);
        for(Patch<?> patch:named) for(Patch<?> node:closure(patch))
            if(node!=guard)check(node.getDependencies().contains(guard),"preflight precedes "+patch.getName());
        List<X509Certificate> mixed=new ArrayList<>(trusted);mixed.addAll(untrusted);
        String pkg="nl.marktplaats.android", version=original.getVersionName(), code=original.getVersionCode();
        List<Integer> supported=version.equals("16.19.0")&&code.equals("633464") ? List.of(26,28,29,32) : List.of();
        check(supported.contains(minSdk),"original is an exact supported publisher build");
        PackageMetadata[] invalid={metadata(original,"wrong.package",version,code,trusted),metadata(original,pkg,"0.0.0",code,trusted),
            metadata(original,pkg,version,"1",trusted),new PackageMetadata(pkg,version,code,null),
            metadata(original,pkg,version,code,untrusted),metadata(original,pkg,version,code,mixed),
            metadata(original,pkg,"16.17.0","633462",trusted),metadata(original,pkg,"16.17.0",code,trusted),
            metadata(original,pkg,version,"633462",trusted)};
        String[] names={"package","version","code","missing signer","untrusted signer","mixed signer",
            "retired 16.17.0/633462","retired version with current build","current version with retired build"};
        try(ResourcePatchContext context=new ResourcePatchContext(config(originalFile,scratch,"guard"))) {
            var manifest=context.get("AndroidManifest.xml",false).toPath();Files.createDirectories(manifest.getParent());
            String module="<application><meta-data android:name=\"com.android.dynamic.apk.fused.modules\" android:value=\"alertscentercompose\"/></application>";
            String xml="<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><uses-sdk android:minSdkVersion=\""+minSdk+"\"/>"+module+"</manifest>";
            Files.writeString(manifest,xml);guard.execute(context);
            check(Files.readString(manifest).equals(xml),"actual original accepted without mutation");
            Field field=ResourcePatchContext.class.getDeclaredField("packageMetadata");field.setAccessible(true);
            for(int i=0;i<invalid.length;i++) {
                field.set(context,invalid[i]);boolean refused=false;
                try{guard.execute(context);}catch(IllegalStateException expected){refused=true;}
                check(refused,"actual guard rejects "+names[i]);
                check(Files.readString(manifest).equals(xml),"invalid "+names[i]+" leaves manifest intact");
            }
            field.set(context,original);
            if(minSdk==32) {
                for(String incomplete:List.of(xml.replace(module,""),xml.replace("alertscentercompose","otherfeature"))) {
                    Files.writeString(manifest,incomplete);boolean refused=false;
                    try{guard.execute(context);}catch(IllegalStateException expected){refused=true;}
                    check(refused,"API32 input without the Notifications module is rejected");
                    check(Files.readString(manifest).equals(incomplete),"incomplete module input remains unchanged");
                }
                Files.writeString(manifest,xml);
            }
            // Use the retired build's genuine minimum as well: rejecting its
            // metadata under API 26 alone could merely prove an SDK mismatch.
            field.set(context,metadata(original,pkg,"16.17.0","633462",trusted));
            String retired=xml.replace("minSdkVersion=\""+minSdk+"\"","minSdkVersion=\"32\"");
            Files.writeString(manifest,retired);boolean retiredRefused=false;
            try{guard.execute(context);}catch(IllegalStateException expected){retiredRefused=true;}
            check(retiredRefused,"actual guard rejects retired 16.17.0/633462 at its original API 32");
            check(Files.readString(manifest).equals(retired),"retired exact tuple leaves manifest intact");
            field.set(context,original);
            for(int minimum:supported) {
                String accepted=xml.replace("minSdkVersion=\""+minSdk+"\"","minSdkVersion=\""+minimum+"\"");
                Files.writeString(manifest,accepted);guard.execute(context);
                check(Files.readString(manifest).equals(accepted),"declared minimum SDK accepted without mutation");
            }
            List<String> rejected=new ArrayList<>(List.of(""));
            for(int minimum:List.of(25,26,27,28,29,30,31,32,33,999))
                if(!supported.contains(minimum))rejected.add("<uses-sdk android:minSdkVersion=\""+minimum+"\"/>");
            for(String usesSdk:rejected) {
                String bad="<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\">"+usesSdk+"</manifest>";
                Files.writeString(manifest,bad);boolean refused=false;
                try{guard.execute(context);}catch(IllegalStateException expected){refused=true;}
                check(refused,"actual guard rejects wrong/missing minSdk");
                check(Files.readString(manifest).equals(bad),"invalid minSdk leaves manifest intact");
            }
        }
        // Unmapped methods must fail even when their synthetic shape is lawful.
        try(BytecodePatchContext context=new BytecodePatchContext(config(originalFile,scratch,"methods"),original)) {
            String type="Lregression/Required;";
            var body=new ImmutableMethodImplementation(2,List.of(new ImmutableInstruction10x(Opcode.RETURN_VOID)),List.of(),List.of());
            var zero=new ImmutableMethod(type,"required",List.of(),"V",1,Set.of(),Set.of(),body);
            var one=new ImmutableMethod(type,"required",List.of(new ImmutableMethodParameter("I",Set.of(),null)),"V",1,Set.of(),Set.of(),body);
            context.setPatchClasses$morphe_patcher(new PatchClasses(Set.of(new ImmutableClassDef(type,1,"Ljava/lang/Object;",List.of(),null,Set.of(),List.of(),List.of(zero,one)))));
            Method helper=Arrays.stream(app.getDeclaredMethods()).filter(m->m.getName().equals("exact")).findFirst().orElseThrow();
            reject("app helper rejects unaudited lawful overload",()->helper.invoke(null,context,type,"required()V",1,2,1));
            reject("app helper missing method",()->helper.invoke(null,context,type,"absent()V",1,2,1));
            reject("app helper wrong flags",()->helper.invoke(null,context,type,"required()V",2,2,1));
            reject("app helper wrong register count",()->helper.invoke(null,context,type,"required()V",1,3,1));
            reject("app helper wrong instruction count",()->helper.invoke(null,context,type,"required()V",1,2,2));
            Method strict=loader.loadClass("patches.shared.OriginalInputKt").getDeclaredMethod("uniqueMatch",BytecodePatchContext.class,Fingerprint.class);
            Fingerprint broad=new Fingerprint(null,type,null,null,"required",null,null,"V",null,null,(List<String>)null,null);
            reject("production resolver rejects ambiguity",()->strict.invoke(null,context,broad));
        }
        // La0.a is an audited, unchanged production binding. Mutate the method
        // declaration rather than the historical call-site shape arguments.
        Method helper=Arrays.stream(app.getDeclaredMethods()).filter(m->m.getName().equals("exact")).findFirst().orElseThrow();
        for(int fixture=0;fixture<4;fixture++) {
            int flags=fixture==1?17:25, registers=fixture==2?8:7, count=fixture==3?86:87;
            List<com.android.tools.smali.dexlib2.iface.instruction.Instruction> instructions=new ArrayList<>();
            for(int i=1;i<count;i++)instructions.add(new ImmutableInstruction10x(Opcode.NOP));
            instructions.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
            var method=new ImmutableMethod("La0;","a",List.of(),"V",flags,Set.of(),Set.of(),
                new ImmutableMethodImplementation(registers,instructions,List.of(),List.of()));
            try(BytecodePatchContext context=new BytecodePatchContext(config(originalFile,scratch,"bound-"+fixture),original)) {
                context.setPatchClasses$morphe_patcher(new PatchClasses(Set.of(new ImmutableClassDef("La0;",1,"Ljava/lang/Object;",List.of(),null,Set.of(),List.of(),List.of(method)))));
                if(fixture==0)check(helper.invoke(null,context,"La0;","a()V",25,7,87)!=null,"audited current binding resolves exact shape");
                else reject("audited current binding rejects altered shape "+fixture,()->helper.invoke(null,context,"La0;","a()V",25,7,87));
            }
        }
        System.out.println("SUCCESS Marktplaats original-input assertions="+checks);
    }
}
