import java.io.File;
import java.lang.reflect.*;
import java.net.*;
import java.nio.file.*;
import java.security.cert.X509Certificate;
import java.util.*;
import app.morphe.patcher.*;
import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.PatchClasses;
import com.reandroid.apk.ApkModule;
import com.android.tools.smali.dexlib2.immutable.*;

/** Execute the NRC production preflight and strict resolver with the real SDK. */
class NrcInputRegression extends OriginalInputRegression {
    static PackageMetadata read(File file) throws Exception {
        try (ApkModule apk=ApkModule.loadApkFile(file)) {
            var manifest=apk.getAndroidManifest();
            return new PackageMetadata(manifest.getPackageName(),manifest.getVersionName(),String.valueOf(manifest.getVersionCode()),apk.getApkSignatureBlock());
        }
    }
    public static void main(String[] args) throws Exception {
        File originalFile=new File(args[1]),scratch=new File(args[3]);
        PackageMetadata original=read(originalFile),other=read(new File(args[2]));
        List<X509Certificate> trusted=original.getSigningCertificates().values().stream().flatMap(Collection::stream).distinct().toList();
        List<X509Certificate> untrusted=other.getSigningCertificates().values().stream().flatMap(Collection::stream).distinct().toList();
        check(!trusted.isEmpty()&&!untrusted.isEmpty()&&Collections.disjoint(trusted,untrusted),"NRC real disjoint publisher certificates");
        try(URLClassLoader loader=new URLClassLoader(new URL[]{new File(args[0]).toURI().toURL()},NrcInputRegression.class.getClassLoader())) {
            Class<?> app=loader.loadClass("patches.nrc.CompatibilityKt");
            ResourcePatch preflight=(ResourcePatch)app.getDeclaredMethod("getOriginalInput").invoke(null);
            List<X509Certificate> mixed=new ArrayList<>(trusted);mixed.addAll(untrusted);
            String pkg="com.twipemobile.nrc",version="5.12.25",code="627";
            PackageMetadata[] invalid={
                metadata(original,"wrong.package",version,code,trusted),metadata(original,pkg,"5.12.24","626",trusted),
                metadata(original,pkg,"5.12.24",code,trusted),metadata(original,pkg,version,"626",trusted),
                new PackageMetadata(pkg,version,code,null),metadata(original,pkg,version,code,untrusted),
                metadata(original,pkg,version,code,mixed)};
            String[] names={"wrong package","retired 5.12.24/626","retired version with new build","new version with retired build","missing signer","untrusted signer","mixed signer"};
            try(ResourcePatchContext context=new ResourcePatchContext(config(originalFile,scratch,"guard"))) {
                Path manifest=context.get("AndroidManifest.xml",false).toPath();Files.createDirectories(manifest.getParent());
                String xml="<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><uses-sdk android:minSdkVersion=\"23\"/></manifest>";
                Files.writeString(manifest,xml);preflight.execute(context);
                check(Files.readString(manifest).equals(xml),"NRC actual 627 original accepted without writes");
                Field field=ResourcePatchContext.class.getDeclaredField("packageMetadata");field.setAccessible(true);
                for(int i=0;i<invalid.length;i++) {
                    field.set(context,invalid[i]);boolean refused=false;
                    try{preflight.execute(context);}catch(IllegalStateException expected){refused=true;}
                    check(refused,"NRC guard rejects "+names[i]);
                    check(Files.readString(manifest).equals(xml),"NRC rejected metadata leaves manifest unchanged");
                }
                field.set(context,original);
                for(String sdk:List.of("<uses-sdk android:minSdkVersion=\"22\"/>","<uses-sdk android:minSdkVersion=\"24\"/>","","<uses-sdk android:minSdkVersion=\"23\"/><uses-sdk android:minSdkVersion=\"23\"/>")) {
                    String bad="<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\">"+sdk+"</manifest>";
                    Files.writeString(manifest,bad);boolean refused=false;
                    try{preflight.execute(context);}catch(IllegalStateException expected){refused=true;}
                    check(refused,"NRC guard rejects wrong/missing/ambiguous minSdk");
                    check(Files.readString(manifest).equals(bad),"NRC rejected SDK leaves manifest unchanged");
                }
            }
            try(BytecodePatchContext context=new BytecodePatchContext(config(originalFile,scratch,"methods"),original)) {
                String type="Lregression/Required;";
                var body=new ImmutableMethodImplementation(2,List.of(),List.of(),List.of());
                var zero=new ImmutableMethod(type,"required",List.of(),"V",1,Set.of(),Set.of(),body);
                var one=new ImmutableMethod(type,"required",List.of(new ImmutableMethodParameter("I",Set.of(),null)),"V",1,Set.of(),Set.of(),body);
                context.setPatchClasses$morphe_patcher(new PatchClasses(Set.of(new ImmutableClassDef(type,1,"Ljava/lang/Object;",List.of(),null,Set.of(),List.of(),List.of(zero,one)))));
                Method exact=Arrays.stream(app.getDeclaredMethods()).filter(m->m.getName().equals("exact")).findFirst().orElseThrow();
                check(exact.invoke(null,context,type,"required","V",new String[0])!=null,"NRC exact reference resolves lawful overload");
                reject("NRC missing method reference",()->exact.invoke(null,context,type,"absent","V",new String[0]));
                reject("NRC wrong return reference",()->exact.invoke(null,context,type,"required","I",new String[0]));
                reject("NRC wrong parameter reference",()->exact.invoke(null,context,type,"required","V",new String[]{"Z"}));
                Method strict=loader.loadClass("patches.shared.OriginalInputKt").getDeclaredMethod("uniqueMatch",BytecodePatchContext.class,Fingerprint.class);
                Fingerprint broad=new Fingerprint(null,type,null,null,"required",null,null,"V",null,null,(List<String>)null,null);
                reject("NRC ambiguous reference",()->strict.invoke(null,context,broad));
            }
        }
        System.out.println("SUCCESS NRC input assertions="+checks);
    }
}
