import java.io.File;
import java.lang.reflect.*;
import java.nio.file.*;
import java.security.cert.X509Certificate;
import java.util.*;
import app.morphe.patcher.*;
import app.morphe.patcher.patch.*;
import com.reandroid.apk.ApkModule;

/** Execute each weather app's production preflight with actual publisher certificates. */
class WeatherInputRegression extends OriginalInputRegression {
    static PackageMetadata read(File file) throws Exception {
        try(ApkModule apk=ApkModule.loadApkFile(file)) {
            var manifest=apk.getAndroidManifest();
            return new PackageMetadata(manifest.getPackageName(),manifest.getVersionName(),String.valueOf(manifest.getVersionCode()),apk.getApkSignatureBlock());
        }
    }
    public static void main(String[] args) throws Exception {
        File bundle=new File(args[0]),originalFile=new File(args[2]),scratch=new File(args[4]);
        String appName=args[1];
        String[] target=switch(appName) {
            case "buienalarm" -> new String[]{"org.yoki.android.buienalarm","4.32.0","3723","5"};
            case "buienradar" -> new String[]{"com.supportware.Buienradar","7.4.8","7897","5"};
            case "weerplaza" -> new String[]{"nl.weerplaza.app","3.13.1","734","5"};
            case "rainviewer" -> new String[]{"com.lucky_apps.RainViewer","8.4.1","44084","9"};
            default -> throw new IllegalArgumentException(appName);
        };
        PackageMetadata original=read(originalFile),other=read(new File(args[3]));
        List<X509Certificate> trusted=original.getSigningCertificates().values().stream().flatMap(Collection::stream).distinct().toList();
        List<X509Certificate> untrusted=other.getSigningCertificates().values().stream().flatMap(Collection::stream).distinct().toList();
        check(!trusted.isEmpty()&&!untrusted.isEmpty()&&Collections.disjoint(trusted,untrusted),appName+" genuine disjoint publisher signers");
        check(original.getPackageName().equals(target[0])&&original.getVersionName().equals(target[1])&&original.getVersionCode().equals(target[2]),appName+" exact observed publisher build");
        Set<Patch<?>> patches=new PatchLoader.Jar(Set.of(bundle));
        List<Patch<?>> named=patches.stream().filter(p->p.getName()!=null&&p.getCompatibility()!=null&&p.getCompatibility().stream().anyMatch(c->c.getPackageName().equals(target[0]))).toList();
        check(named.size()==Integer.parseInt(target[3]),appName+" all controls loaded");
        Field execution=Patch.class.getDeclaredField("executeBlock");execution.setAccessible(true);
        ClassLoader loader=execution.get(named.getFirst()).getClass().getClassLoader();
        Class<?> owner=loader.loadClass(appName.equals("buienradar")?"patches.buienradar.shared.Constants":"patches."+appName+".CompatibilityKt");
        ResourcePatch guard=(ResourcePatch)owner.getDeclaredMethod("getOriginalInput").invoke(appName.equals("buienradar")?owner.getField("INSTANCE").get(null):null);
        for(Patch<?> patch:named)for(Patch<?> node:closure(patch))
            if(node!=guard)check(node.getDependencies().contains(guard),appName+" preflight precedes every mutation: "+patch.getName());
        Set<Integer> supported=switch(appName) {
            case "buienradar" -> Set.of(28,29,32);
            case "rainviewer" -> Set.of(29,32);
            default -> Set.of(26);
        };
        int minimum;
        try(ApkModule apk=ApkModule.loadApkFile(originalFile)){minimum=apk.getAndroidManifest().getMinSdkVersion();}
        check(supported.contains(minimum),appName+" original minimum SDK observed");
        List<X509Certificate> mixed=new ArrayList<>(trusted);mixed.addAll(untrusted);
        PackageMetadata[] invalid={metadata(original,"wrong.package",target[1],target[2],trusted),
            metadata(original,target[0],"0.0.0",target[2],trusted),metadata(original,target[0],target[1],"1",trusted),
            new PackageMetadata(target[0],target[1],target[2],null),metadata(original,target[0],target[1],target[2],untrusted),
            metadata(original,target[0],target[1],target[2],mixed)};
        String[] names={"package","version","build","missing signer","untrusted signer","mixed signer"};
        try(ResourcePatchContext context=new ResourcePatchContext(config(originalFile,scratch,"guard"))) {
            Path manifest=context.get("AndroidManifest.xml",false).toPath();Files.createDirectories(manifest.getParent());
            String xml="<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><uses-sdk android:minSdkVersion=\""+minimum+"\"/></manifest>";
            Files.writeString(manifest,xml);guard.execute(context);
            check(Files.readString(manifest).equals(xml),appName+" actual original guard accepts without mutation");
            Field field=ResourcePatchContext.class.getDeclaredField("packageMetadata");field.setAccessible(true);
            for(int i=0;i<invalid.length;i++) {
                field.set(context,invalid[i]);boolean refused=false;
                try{guard.execute(context);}catch(IllegalStateException expected){refused=true;}
                check(refused,appName+" rejects "+names[i]);
                check(Files.readString(manifest).equals(xml),appName+" rejected metadata leaves manifest unchanged");
            }
            field.set(context,original);
            for(int sdk:List.of(25,26,27,28,29,30,31,32,33,999)) {
                String fixture=xml.replace("minSdkVersion=\""+minimum+"\"","minSdkVersion=\""+sdk+"\"");
                Files.writeString(manifest,fixture);boolean accepted=true;
                try{guard.execute(context);}catch(IllegalStateException expected){accepted=false;}
                check(accepted==supported.contains(sdk),appName+" exact minimum SDK "+sdk);
                check(Files.readString(manifest).equals(fixture),appName+" SDK preflight remains read-only");
            }
            for(String sdk:List.of("","<uses-sdk android:minSdkVersion=\""+minimum+"\"/><uses-sdk android:minSdkVersion=\""+minimum+"\"/>")) {
                String bad="<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\">"+sdk+"</manifest>";
                Files.writeString(manifest,bad);boolean refused=false;
                try{guard.execute(context);}catch(IllegalStateException expected){refused=true;}
                check(refused,appName+" rejects missing/ambiguous SDK");
                check(Files.readString(manifest).equals(bad),appName+" rejected SDK declaration remains unchanged");
            }
        }
        System.out.println("SUCCESS "+appName+" original-input assertions="+checks);
    }
}
