package patches.homeassistant;

import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.Compatibility;
import java.util.HashSet;
import java.util.Set;
import org.junit.Test;
import static org.junit.Assert.*;

/** Inspect compiled patch metadata, as consumed by Manager and the bundle generator. */
public class CompatibilityTest {
    @Test public void carHostSupportIsRestrictedToTheStockHomeAssistantArchive() {
        var patch = CarHostPatchKt.getCarHostPatch();
        assertEquals("Allow any Android Auto host", patch.getName());
        assertTrue("Any-host admission is on by default", patch.getDefault());
        var apps = patch.getCompatibility();
        assertNotNull(apps);
        assertEquals(1, apps.size());
        Compatibility app = apps.get(0);
        assertEquals("io.homeassistant.companion.android", app.getPackageName());
        assertEquals(ApkFileType.APKS, app.getApkFileType());
        assertEquals("The stock publisher key is pinned",
            Set.of("11194ba809b42ddf0e1a7dec6842a59c7ff1119c5482e95febffd5c6014daa5a"),
            Set.copyOf(app.getSignatures()));
        assertEquals(1, app.getTargets().size());
        AppTarget target = app.getTargets().get(0);
        assertEquals("2026.10.1-full", target.getVersion());
        assertEquals(Set.of(24906), new HashSet<>(target.getVersionCodes().values()));
        assertEquals(29, target.getMinSdk().intValue());
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
