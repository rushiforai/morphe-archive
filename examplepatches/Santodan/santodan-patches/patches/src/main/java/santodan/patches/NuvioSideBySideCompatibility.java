package santodan.patches;

import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.Compatibility;
import java.util.Collections;

/** Java bridge for Morphe compatibility metadata whose constructor is Kotlin-internal. */
public final class NuvioSideBySideCompatibility {
    private NuvioSideBySideCompatibility() {}

    public static Compatibility create() {
        return new Compatibility(
            "com.nuvio.tv",
            "NuvioTV",
            null,
            ApkFileType.APK,
            null,
            null,
            Collections.singletonList(new AppTarget("1.1.0-beta.1", false, null)),
            false
        );
    }
}
