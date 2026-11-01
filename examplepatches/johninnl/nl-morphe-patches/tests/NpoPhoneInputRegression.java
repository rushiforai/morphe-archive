import java.io.File;
import java.lang.reflect.*;
import java.net.*;
import java.nio.file.*;
import app.morphe.patcher.*;
import app.morphe.patcher.patch.*;
import com.reandroid.apk.ApkModule;

/** Phone and TV share a package/version, but their build codes and SDK guards differ. */
class NpoPhoneInputRegression extends OriginalInputRegression {
    public static void main(String[] args) throws Exception {
        File originalFile=new File(args[1]), scratch=new File(args[2]);
        try(ApkModule apk=ApkModule.loadApkFile(originalFile);
            URLClassLoader loader=new URLClassLoader(new URL[]{new File(args[0]).toURI().toURL()},NpoPhoneInputRegression.class.getClassLoader())) {
            var m=apk.getAndroidManifest();
            check(m.getMinSdkVersion()==32 && m.getVersionCode()==240497937,"actual API32 phone fixture");
            ResourcePatch guard=(ResourcePatch)loader.loadClass("patches.npostarttv.CompatibilityKt").getDeclaredMethod("getOriginalInput").invoke(null);
            // Keep this suite focused on the existing metadata/manifest leaf.
            // NpoNativeInputRegression executes the full chain with complete split resources.
            if(!guard.getDependencies().isEmpty()) {
                check(guard.getDependencies().size()==1,"native guard retains one metadata preflight dependency");
                guard=(ResourcePatch)guard.getDependencies().iterator().next();
            }
            try(ResourcePatchContext context=new ResourcePatchContext(config(originalFile,scratch,"phone-guard"))) {
                Path xml=context.get("AndroidManifest.xml",false).toPath();Files.createDirectories(xml.getParent());
                for(int sdk:new int[]{24,29,32}) {
                    String content=xml(sdk);Files.writeString(xml,content);guard.execute(context);
                    check(Files.readString(xml).equals(content),"phone minSdk "+sdk+" accepted unchanged");
                }
                for(int sdk:new int[]{23,25,28,30,31,33}) {
                    String content=xml(sdk);Files.writeString(xml,content);boolean refused=false;
                    try{guard.execute(context);}catch(IllegalStateException expected){refused=true;}
                    check(refused,"phone rejects minSdk "+sdk+" outside inspected API24/29/32 variants");
                    check(Files.readString(xml).equals(content),"rejected phone fixture remains intact");
                }
                Files.writeString(xml,xml(32));
                Field field=ResourcePatchContext.class.getDeclaredField("packageMetadata");field.setAccessible(true);
                field.set(context,new PackageMetadata(m.getPackageName(),m.getVersionName(),String.valueOf(m.getVersionCode()),null));
                boolean refused=false;
                try{guard.execute(context);}catch(IllegalStateException expected){refused=true;}
                check(refused,"phone rejects missing publisher signer");
            }
            System.out.println("SUCCESS NPO phone original-input assertions="+checks);
        }
    }
    static String xml(int sdk) {
        return "<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><uses-sdk android:minSdkVersion=\""+sdk+"\"/></manifest>";
    }
}
