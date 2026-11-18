package santodan.patches;

import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.Compatibility;
import java.util.Collections;

/** Exact original target for installed-app visibility and optional diagnostics. */
public final class FirstDescendantCompatibility {
    public static final String PACKAGE = "com.nexon.tfdc";
    public static final String VERSION = "1.1.5";

    private FirstDescendantCompatibility() {}

    public static Compatibility create() {
        return new Compatibility(PACKAGE, "TFD Companion", null,
            ApkFileType.APKS, null, null,
            Collections.singletonList(new AppTarget(VERSION, null, false, 24, null)), app.morphe.patcher.patch.FormFactor.MOBILE, false);
    }

    public static Compatibility createExperimentalVisibility() {
        return new Compatibility(PACKAGE, "TFD Companion", null,
            ApkFileType.APKS, null, null,
            Collections.singletonList(new AppTarget(null, null, true, 30, null)),
            app.morphe.patcher.patch.FormFactor.MOBILE, false);
    }

    /** Package-visibility filtering requires Android 11 or newer. */
    public static Compatibility createVisibility() {
        return new Compatibility(PACKAGE, "TFD Companion", null,
            ApkFileType.APKS, null, null,
            java.util.List.of(new AppTarget(VERSION, null, false, 30, null),
                new AppTarget("1.1.6", null, false, 30, null)), app.morphe.patcher.patch.FormFactor.MOBILE, false);
    }
}
