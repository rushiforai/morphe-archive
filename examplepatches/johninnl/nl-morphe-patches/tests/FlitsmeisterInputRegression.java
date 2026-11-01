import java.io.File;
import java.lang.reflect.*;
import java.net.*;
import java.nio.file.*;
import java.security.cert.X509Certificate;
import java.util.*;
import app.morphe.patcher.*;
import app.morphe.patcher.patch.*;
import com.reandroid.apk.ApkModule;

/** Exercise the shipped guard with real publisher metadata and both Flitsmeister manifest variants. */
class FlitsmeisterInputRegression extends OriginalInputRegression {
    public static void main(String[] args) throws Exception {
        File originalFile=new File(args[1]), scratch=new File(args[2]);
        try (ApkModule apk=ApkModule.loadApkFile(originalFile);
             URLClassLoader loader=new URLClassLoader(new URL[]{new File(args[0]).toURI().toURL()},FlitsmeisterInputRegression.class.getClassLoader())) {
            var manifest=apk.getAndroidManifest();
            check(manifest.getMinSdkVersion()==29,"fixture is the publisher Android 10+ base");
            PackageMetadata original=new PackageMetadata(manifest.getPackageName(),manifest.getVersionName(),String.valueOf(manifest.getVersionCode()),apk.getApkSignatureBlock());
            Class<?> app=loader.loadClass("patches.flitsmeister.CompatibilityKt");
            ResourcePatch guard=(ResourcePatch)app.getDeclaredMethod("getOriginalInput").invoke(null);
            Compatibility target=(Compatibility)app.getDeclaredMethod("getFlitsmeister").invoke(null);
            check(target.getTargets().getFirst().getMinSdk()==29,"catalogue advertises Android 10+");
            validate=loader.loadClass("patches.shared.OriginalInputKt").getDeclaredMethod("validateOriginalInput",Compatibility.class,PackageMetadata.class,Integer.class);
            validate(target,original,29);
            check(true,"default validator accepts the catalogue SDK");
            reject("additional SDK acceptance is scoped to the Flitsmeister resource guard",()->validate(target,original,32));
            List<X509Certificate> trusted=original.getSigningCertificates().values().stream().flatMap(Collection::stream).distinct().toList();
            check(!trusted.isEmpty(),"fixture has a real publisher signer");
            try(ResourcePatchContext context=new ResourcePatchContext(config(originalFile,scratch,"flitsmeister-guard"))) {
                Path xml=context.get("AndroidManifest.xml",false).toPath();Files.createDirectories(xml.getParent());
                for(int sdk:List.of(29,32)) {
                    String content=xml(sdk);
                    Files.writeString(xml,content);guard.execute(context);
                    check(Files.readString(xml).equals(content),"Flitsmeister minSdk "+sdk+" accepted without manifest rewriting");
                }
                for(int sdk:List.of(23,24,28,30,31,33,999)) {
                    String content=xml(sdk);Files.writeString(xml,content);
                    boolean refused=false;
                    try{guard.execute(context);}catch(IllegalStateException expected){refused=true;}
                    check(refused,"uninspected minSdk "+sdk+" rejected");
                    check(Files.readString(xml).equals(content),"rejected manifest remains intact");
                }
                for(String usesSdk:List.of("", "<uses-sdk android:minSdkVersion=\"29\"/><uses-sdk android:minSdkVersion=\"32\"/>")) {
                    Files.writeString(xml,"<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\">"+usesSdk+"</manifest>");
                    boolean refused=false;
                    try{guard.execute(context);}catch(IllegalStateException expected){refused=true;}
                    check(refused,"missing or ambiguous SDK rejected");
                }
                Files.writeString(xml,xml(29));
                Field field=ResourcePatchContext.class.getDeclaredField("packageMetadata");field.setAccessible(true);
                String pkg=original.getPackageName(),version=original.getVersionName(),code=original.getVersionCode();
                PackageMetadata[] invalid={metadata(original,"wrong.package",version,code,trusted),
                    metadata(original,pkg,"0.0.0",code,trusted),metadata(original,pkg,version,"1",trusted),
                    new PackageMetadata(pkg,version,code,null)};
                for(PackageMetadata bad:invalid) {
                    field.set(context,bad);boolean refused=false;
                    try{guard.execute(context);}catch(IllegalStateException expected){refused=true;}
                    check(refused,"wrong package/version/code or missing signer rejected");
                }
                try(ApkModule foreign=ApkModule.loadApkFile(new File(args[3]))) {
                    var m=foreign.getAndroidManifest();
                    check(m.getMinSdkVersion()==29&&m.getTargetSdkVersion()==37,"patched APK preserves input minimum and target SDKs");
                    PackageMetadata other=new PackageMetadata(m.getPackageName(),m.getVersionName(),String.valueOf(m.getVersionCode()),foreign.getApkSignatureBlock());
                    List<X509Certificate> untrusted=other.getSigningCertificates().values().stream().flatMap(Collection::stream).distinct().toList();
                    check(!untrusted.isEmpty()&&Collections.disjoint(trusted,untrusted),"negative control has real disjoint signing certificates");
                    List<X509Certificate> mixed=new ArrayList<>(trusted);mixed.addAll(untrusted);
                    for(List<X509Certificate> signers:List.of(untrusted,mixed)) {
                        field.set(context,metadata(original,pkg,version,code,signers));boolean refused=false;
                        try{guard.execute(context);}catch(IllegalStateException expected){refused=true;}
                        check(refused,"untrusted or mixed signer set rejected");
                    }
                }
            }
            System.out.println("SUCCESS Flitsmeister original-input assertions="+checks);
        }
    }
    static String xml(int sdk) {
        return "<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><uses-sdk android:minSdkVersion=\""+sdk+"\"/></manifest>";
    }
}
