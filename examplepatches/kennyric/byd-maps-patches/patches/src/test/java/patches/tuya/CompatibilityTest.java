package patches.tuya;

import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.Compatibility;
import java.util.HashSet;
import java.util.Set;
import org.junit.Test;
import static org.junit.Assert.*;

/** Inspect compiled patch metadata, as consumed by Manager and the bundle generator. */
public class CompatibilityTest {
    @Test public void carHostSupportIsRestrictedToTheStockTuyaArchive() {
        var patch = CarHostPatchKt.getCarHostPatch();
        assertEquals("Allow any Android Auto host", patch.getName());
        assertTrue("Any-host admission is on by default", patch.getDefault());
        var apps = patch.getCompatibility();
        assertNotNull(apps);
        assertEquals(1, apps.size());
        Compatibility app = apps.get(0);
        assertEquals("com.tuya.smart", app.getPackageName());
        assertEquals(ApkFileType.APKS, app.getApkFileType());
        assertEquals("The stock publisher key is pinned",
            Set.of("93219fc273e2200f4adee5f7191dc656ba2a2d7b2ff5d24cd55c4b6155001e40"),
            Set.copyOf(app.getSignatures()));
        assertEquals(1, app.getTargets().size());
        AppTarget target = app.getTargets().get(0);
        assertEquals("7.12.6", target.getVersion());
        assertEquals(Set.of(872), new HashSet<>(target.getVersionCodes().values()));
        assertEquals(24, target.getMinSdk().intValue());
        assertFalse(target.isExperimental());
    }

    @Test public void allowAnyHostAdmitsEveryHostWithoutAWhitelistOption() {
        var patch = CarHostPatchKt.getCarHostPatch();
        assertTrue("Admission must not be configurable through a host list",
            patch.getOptions().isEmpty());
        assertTrue("The host examples keep naming arbitrary hosts",
            patch.getDescription().contains("whatever its package name or signing key"));
        assertTrue("Google's own host keeps working",
            patch.getDescription().contains("Google's Android Auto keeps working"));
    }
}
