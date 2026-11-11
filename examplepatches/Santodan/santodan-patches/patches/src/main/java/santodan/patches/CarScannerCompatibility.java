package santodan.patches;

import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.Compatibility;
import java.util.List;

/** Exact inspected target; do not extend to older inputs. */
public final class CarScannerCompatibility {
    public static final String PACKAGE = "com.ovz.carscanner";
    public static final String VERSION = "2.1.50";
    private CarScannerCompatibility() {}

    public static Compatibility create() {
        return new Compatibility(PACKAGE, "Car Scanner ELM OBD2", null,
            ApkFileType.APK, null, null,
            List.of(new AppTarget(VERSION, null, false, 21, null), new AppTarget("2.2.21", null, false, 23, null), new AppTarget("2.2.42", null, false, 23, null)), app.morphe.patcher.patch.FormFactor.MOBILE, false);
    }
}
