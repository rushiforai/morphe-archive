import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.nio.file.*;
import java.security.*;
import java.security.cert.X509Certificate;
import java.util.*;
import app.morphe.patcher.*;
import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.PatchClasses;
import com.reandroid.apk.ApkModule;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x;

/** Real SDK guard/dependency execution; no publisher application code is executed. */
class TvgidsInputRegression extends OriginalInputRegression {
    static PackageMetadata read(File file) throws Exception {
        try (ApkModule apk=ApkModule.loadApkFile(file)) {
            var m=apk.getAndroidManifest();
            return new PackageMetadata(m.getPackageName(),m.getVersionName(),String.valueOf(m.getVersionCode()),apk.getApkSignatureBlock());
        }
    }
    static void guard(ResourcePatch node, ResourcePatchContext context) throws Exception {
        for(Patch<?> dependency:node.getDependencies()) {
            check(dependency instanceof ResourcePatch,"read-only preflight dependency is resource guard");
            guard((ResourcePatch)dependency,context);
        }
        node.execute(context);
    }
    static String digest(Path file) throws Exception {
        return HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(Files.readAllBytes(file)));
    }
    public static void main(String[] args) throws Exception {
        File originalFile=new File(args[1]), scratch=new File(args[3]);
        PackageMetadata original=read(originalFile), other=read(new File(args[2]));
        List<X509Certificate> trusted=original.getSigningCertificates().values().stream().flatMap(Collection::stream).distinct().toList();
        List<X509Certificate> untrusted=other.getSigningCertificates().values().stream().flatMap(Collection::stream).distinct().toList();
        check(!trusted.isEmpty()&&!untrusted.isEmpty()&&Collections.disjoint(trusted,untrusted),"real disjoint publisher certificates");
        try(URLClassLoader loader=new URLClassLoader(new URL[]{new File(args[0]).toURI().toURL()},TvgidsInputRegression.class.getClassLoader())) {
            Class<?> app=loader.loadClass("patches.tvgids.CompatibilityKt");
            ResourcePatch preflight=(ResourcePatch)app.getDeclaredMethod("getOriginalInput").invoke(null);
            List<X509Certificate> mixed=new ArrayList<>(trusted);mixed.addAll(untrusted);
            String pkg="nl.tvgids",version="7.0.16",code="106691";
            PackageMetadata[] invalid={metadata(original,"wrong.package",version,code,trusted),metadata(original,pkg,"0.0.0",code,trusted),
                metadata(original,pkg,version,"1",trusted),new PackageMetadata(pkg,version,code,null),
                metadata(original,pkg,version,code,untrusted),metadata(original,pkg,version,code,mixed)};
            String[] names={"package","version","code","missing signer","untrusted signer","mixed signer"};
            try(ResourcePatchContext context=new ResourcePatchContext(config(originalFile,scratch,"guard"))) {
                Path manifest=context.get("AndroidManifest.xml",false).toPath();Files.createDirectories(manifest.getParent());
                String xml="<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><uses-sdk android:minSdkVersion=\"26\"/></manifest>";
                Files.writeString(manifest,xml);guard(preflight,context);
                check(Files.readString(manifest).equals(xml),"actual original accepted without manifest mutation");
                Map<Path,String> pristine=new LinkedHashMap<>();
                for(String abi:List.of("arm64-v8a","armeabi-v7a","x86_64")) {
                    Path file=context.get("lib/"+abi+"/libapp.so",true).toPath();pristine.put(file,digest(file));
                }
                Field field=ResourcePatchContext.class.getDeclaredField("packageMetadata");field.setAccessible(true);
                for(int i=0;i<invalid.length;i++) {
                    field.set(context,invalid[i]);boolean refused=false;
                    try{guard(preflight,context);}catch(IllegalStateException expected){refused=true;}
                    check(refused,"guard rejects "+names[i]);
                    check(Files.readString(manifest).equals(xml),"invalid "+names[i]+" leaves manifest intact");
                    for(var entry:pristine.entrySet())check(digest(entry.getKey()).equals(entry.getValue()),"invalid metadata leaves native image intact");
                }
                field.set(context,original);
                for(String usesSdk:List.of("<uses-sdk android:minSdkVersion=\"999\"/>","","<uses-sdk android:minSdkVersion=\"26\"/><uses-sdk android:minSdkVersion=\"26\"/>")) {
                    String bad="<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\">"+usesSdk+"</manifest>";
                    Files.writeString(manifest,bad);boolean refused=false;
                    try{guard(preflight,context);}catch(IllegalStateException expected){refused=true;}
                    check(refused,"guard rejects wrong/missing/ambiguous minSdk");
                    check(Files.readString(manifest).equals(bad),"invalid minSdk leaves manifest intact");
                }
                Files.writeString(manifest,xml);
                Path arm32=context.get("lib/armeabi-v7a/libapp.so",true).toPath();byte[] changed=Files.readAllBytes(arm32);changed[changed.length-1]^=1;
                Files.write(arm32,changed);String altered=digest(arm32);boolean refused=false;
                try{guard(preflight,context);}catch(IllegalStateException expected){refused=true;}
                check(refused,"guard rejects altered ARM32 before mutation");
                for(var entry:pristine.entrySet())check(digest(entry.getKey()).equals(entry.getKey().equals(arm32)?altered:entry.getValue()),"rejected native set is read-only");
                Class<?> policies;
                try{policies=loader.loadClass("patches.tvgids.NativePoliciesKt");}
                catch(ClassNotFoundException missing){throw new AssertionError("Native all-image policy adapter is missing",missing);}
                Class<?> policy=loader.loadClass("patches.tvgids.NativePolicy");
                Object ads=Arrays.stream(policy.getEnumConstants()).filter(v->v.toString().equals("ADS")).findFirst().orElseThrow();
                Method apply=policies.getDeclaredMethod("applyNativePolicy",ResourcePatchContext.class,policy);
                Map<Path,java.nio.file.attribute.FileTime> timestamps=new LinkedHashMap<>();
                for(Path file:pristine.keySet())timestamps.put(file,Files.getLastModifiedTime(file));
                reject("policy rejects all-image set before any file write",()->apply.invoke(null,context,ads));
                for(var entry:pristine.entrySet()) {
                    check(digest(entry.getKey()).equals(entry.getKey().equals(arm32)?altered:entry.getValue()),"rejected policy preserves every native image");
                    check(Files.getLastModifiedTime(entry.getKey()).equals(timestamps.get(entry.getKey())),"rejected policy performs no file writes");
                }
                // Exercise the new third stage with real resources and a corrupt
                // later ABI. Every output must be validated before the first write.
                changed[changed.length-1]^=1;Files.write(arm32,changed);
                Object tracking=Arrays.stream(policy.getEnumConstants()).filter(v->v.toString().equals("TRACKING")).findFirst().orElseThrow();
                Object consent=Arrays.stream(policy.getEnumConstants()).filter(v->v.toString().equals("CONSENT")).findFirst().orElseThrow();
                apply.invoke(null,context,ads);apply.invoke(null,context,tracking);
                byte[] priorArm32=Files.readAllBytes(arm32), corruptPrior=priorArm32.clone();corruptPrior[corruptPrior.length-1]^=1;
                Files.write(arm32,corruptPrior);
                Map<Path,String> beforeConsent=new LinkedHashMap<>();timestamps.clear();
                for(Path file:pristine.keySet()) {
                    beforeConsent.put(file,digest(file));timestamps.put(file,Files.getLastModifiedTime(file));
                }
                reject("consent validates all prior images before any file write",()->apply.invoke(null,context,consent));
                for(Path file:pristine.keySet()) {
                    check(digest(file).equals(beforeConsent.get(file)),"rejected consent preserves every prior policy output");
                    check(Files.getLastModifiedTime(file).equals(timestamps.get(file)),"rejected consent performs no file writes");
                }
                Files.write(arm32,priorArm32);apply.invoke(null,context,consent);
                check(true,"ADS then TRACKING then CONSENT applies through real resource adapter");
            }
            try(BytecodePatchContext context=new BytecodePatchContext(config(originalFile,scratch,"methods"),original)) {
                String type="Lregression/Required;";
                var body=new ImmutableMethodImplementation(2,List.of(new ImmutableInstruction10x(Opcode.RETURN_VOID)),List.of(),List.of());
                var zero=new ImmutableMethod(type,"required",List.of(),"V",1,Set.of(),Set.of(),body);
                var one=new ImmutableMethod(type,"required",List.of(new ImmutableMethodParameter("I",Set.of(),null)),"V",1,Set.of(),Set.of(),body);
                context.setPatchClasses$morphe_patcher(new PatchClasses(Set.of(new ImmutableClassDef(type,1,"Ljava/lang/Object;",List.of(),null,Set.of(),List.of(),List.of(zero,one)))));
                Method helper=Arrays.stream(app.getDeclaredMethods()).filter(m->m.getName().equals("exact")).findFirst().orElseThrow();
                check(helper.invoke(null,context,type,"required()V",1,2,1)!=null,"helper resolves lawful overload");
                reject("missing method",()->helper.invoke(null,context,type,"absent()V",1,2,1));
                reject("wrong flags",()->helper.invoke(null,context,type,"required()V",2,2,1));
                reject("wrong total registers",()->helper.invoke(null,context,type,"required()V",1,3,1));
                reject("wrong instruction count",()->helper.invoke(null,context,type,"required()V",1,2,2));
                Method strict=loader.loadClass("patches.shared.OriginalInputKt").getDeclaredMethod("uniqueMatch",BytecodePatchContext.class,Fingerprint.class);
                Fingerprint broad=new Fingerprint(null,type,null,null,"required",null,null,"V",null,null,(List<String>)null,null);
                reject("ambiguity",()->strict.invoke(null,context,broad));
            }
            System.out.println("SUCCESS TVgids original-input assertions="+checks);
        }
    }
}
