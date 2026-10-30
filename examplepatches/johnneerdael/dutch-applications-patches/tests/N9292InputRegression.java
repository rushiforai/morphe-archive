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
class N9292InputRegression extends OriginalInputRegression {
    static PackageMetadata read(File file) throws Exception {
        try (ApkModule apk=ApkModule.loadApkFile(file)) {
            var m=apk.getAndroidManifest();
            return new PackageMetadata(m.getPackageName(),m.getVersionName(),String.valueOf(m.getVersionCode()),apk.getApkSignatureBlock());
        }
    }
    public static void main(String[] args) throws Exception {
        File bundle=new File(args[0]), originalFile=new File(args[1]), scratch=new File(args[3]);
        PackageMetadata original=read(originalFile), other=read(new File(args[2]));
        List<X509Certificate> trusted=original.getSigningCertificates().values().stream().flatMap(Collection::stream).distinct().toList();
        List<X509Certificate> untrusted=other.getSigningCertificates().values().stream().flatMap(Collection::stream).distinct().toList();
        check(!trusted.isEmpty()&&!untrusted.isEmpty()&&Collections.disjoint(trusted,untrusted),"real disjoint publisher certificates");
        Set<Patch<?>> patches=new PatchLoader.Jar(Set.of(bundle));
        List<Patch<?>> named=patches.stream().filter(p->p.getName()!=null&&p.getCompatibility()!=null&&p.getCompatibility().stream().anyMatch(c->c.getPackageName().equals("nl.negentwee"))).toList();
        check(named.size()==4,"four 9292 controls loaded");
        Field execution=Patch.class.getDeclaredField("executeBlock");execution.setAccessible(true);
        ClassLoader loader=execution.get(named.getFirst()).getClass().getClassLoader();
        Class<?> app=loader.loadClass("patches.negentwee.CompatibilityKt");
        ResourcePatch guard=(ResourcePatch)app.getDeclaredMethod("getOriginalInput").invoke(null);
        for(Patch<?> patch:named) for(Patch<?> node:closure(patch))
            if(node!=guard)check(node.getDependencies().contains(guard),"preflight precedes "+patch.getName());
        List<X509Certificate> mixed=new ArrayList<>(trusted);mixed.addAll(untrusted);
        String pkg="nl.negentwee", version="2.48.1", code="32189";
        PackageMetadata[] invalid={metadata(original,"wrong.package",version,code,trusted),metadata(original,pkg,"0.0.0",code,trusted),
            metadata(original,pkg,version,"1",trusted),new PackageMetadata(pkg,version,code,null),
            metadata(original,pkg,version,code,untrusted),metadata(original,pkg,version,code,mixed)};
        String[] names={"package","version","code","missing signer","untrusted signer","mixed signer"};
        try(ResourcePatchContext context=new ResourcePatchContext(config(originalFile,scratch,"guard"))) {
            var manifest=context.get("AndroidManifest.xml",false).toPath();Files.createDirectories(manifest.getParent());
            String xml="<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><uses-sdk android:minSdkVersion=\"32\"/></manifest>";
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
            for(String usesSdk:List.of("<uses-sdk android:minSdkVersion=\"999\"/>","")) {
                String bad="<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\">"+usesSdk+"</manifest>";
                Files.writeString(manifest,bad);boolean refused=false;
                try{guard.execute(context);}catch(IllegalStateException expected){refused=true;}
                check(refused,"actual guard rejects wrong/missing minSdk");
                check(Files.readString(manifest).equals(bad),"invalid minSdk leaves manifest intact");
            }
        }
        try(BytecodePatchContext context=new BytecodePatchContext(config(originalFile,scratch,"methods"),original)) {
            String type="Lregression/Required;";
            var body=new ImmutableMethodImplementation(2,List.of(new ImmutableInstruction10x(Opcode.RETURN_VOID)),List.of(),List.of());
            var zero=new ImmutableMethod(type,"required",List.of(),"V",1,Set.of(),Set.of(),body);
            var one=new ImmutableMethod(type,"required",List.of(new ImmutableMethodParameter("I",Set.of(),null)),"V",1,Set.of(),Set.of(),body);
            context.setPatchClasses$morphe_patcher(new PatchClasses(Set.of(new ImmutableClassDef(type,1,"Ljava/lang/Object;",List.of(),null,Set.of(),List.of(),List.of(zero,one)))));
            Method helper=Arrays.stream(app.getDeclaredMethods()).filter(m->m.getName().equals("exact")).findFirst().orElseThrow();
            check(helper.invoke(null,context,type,"required()V",1,2,1)!=null,"app helper resolves lawful overload");
            reject("app helper missing method",()->helper.invoke(null,context,type,"absent()V",1,2,1));
            reject("app helper wrong flags",()->helper.invoke(null,context,type,"required()V",2,2,1));
            reject("app helper wrong register count",()->helper.invoke(null,context,type,"required()V",1,3,1));
            reject("app helper wrong instruction count",()->helper.invoke(null,context,type,"required()V",1,2,2));
            Method strict=loader.loadClass("patches.shared.OriginalInputKt").getDeclaredMethod("uniqueMatch",BytecodePatchContext.class,Fingerprint.class);
            Fingerprint broad=new Fingerprint(null,type,null,null,"required",null,null,"V",null,null,(List<String>)null,null);
            reject("production resolver rejects ambiguity",()->strict.invoke(null,context,broad));
        }
        System.out.println("SUCCESS 9292 original-input assertions="+checks);
    }
}
