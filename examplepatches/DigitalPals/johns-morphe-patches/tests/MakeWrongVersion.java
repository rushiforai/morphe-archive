import java.io.File;
import com.reandroid.apk.ApkModule;
import com.reandroid.archive.writer.ApkFileWriter;

/** Test-only fixture: alter metadata, never install this invalid-signature APK. */
public class MakeWrongVersion {
    public static void main(String[] args) throws Exception {
        try (ApkModule module = ApkModule.loadApkFile(new File(args[0]))) {
            module.getAndroidManifest().getManifestElement().searchAttributeByName("versionName").setValueAsString("5.15.4");
            try (ApkFileWriter writer = module.createApkFileWriter(new File(args[1]))) { writer.write(); }
        }
    }
}
