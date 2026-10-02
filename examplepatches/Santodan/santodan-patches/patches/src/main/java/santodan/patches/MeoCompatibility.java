package santodan.patches;

import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.Compatibility;
import java.util.Collections;

/** Compatibility metadata shared by the MEO 5.7.0 patches. */
public final class MeoCompatibility {
    private MeoCompatibility() {}

    public static Compatibility create() {
        return new Compatibility(
            "com.alticelabs.meo.androidtv",
            "MEO (Android TV)",
            null,
            ApkFileType.APKM,
            null,
            null,
            Collections.singletonList(new AppTarget("5.7.0", false, 28)),
            false
        );
    }
}
