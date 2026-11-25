package patches.myspoti;

import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.Compatibility;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.junit.Test;
import static org.junit.Assert.*;

/** Inspect compiled patch metadata, as consumed by Manager and the bundle generator. */
public class CompatibilityTest {
    @Test public void anyVersionRemainsRestrictedToTheMyspotiAndOrpheonApkPackages() {
        var patch = CarHostPatchKt.getCarHostPatch();
        assertEquals("Allow any Android Auto host", patch.getName());
        List<Compatibility> apps = patch.getCompatibility();
        assertNotNull(apps);
        assertEquals(2, apps.size());
        Set<String> packages = new HashSet<>();
        for (Compatibility app : apps) {
            packages.add(app.getPackageName());
            assertEquals(ApkFileType.APK, app.getApkFileType());
            assertEquals("Declare one unrestricted version target", 1, app.getTargets().size());
            AppTarget target = app.getTargets().get(0);
            assertNull("Any must not filter by version name", target.getVersion());
            assertNull("Any must not filter by build code or ABI", target.getVersionCodes());
            assertFalse(target.isExperimental());
        }
        assertEquals(Set.of("app.myspoti.stable", "app.orpheon.beta"), packages);
    }

    @Test public void allowAnyHostAdmitsEveryHostWithoutAWhitelistOption() {
        var patch = CarHostPatchKt.getCarHostPatch();
        assertTrue("Admission must not be configurable through a host list",
            patch.getOptions().isEmpty());
        assertTrue("The host examples keep naming arbitrary hosts",
            patch.getDescription().contains("whatever its package name or signing key"));
        assertFalse("The patch is not a configured trusted-host list",
            patch.getDescription().contains("configured Gearslip host"));
    }

    @Test public void upNextAcceptsThePortedOriginals() {
        var patch = UpNextPatchKt.getUpNext();
        Map<String, Set<String>> versions = new HashMap<>();
        for (Compatibility app : patch.getCompatibility()) {
            Set<String> names = new HashSet<>();
            for (AppTarget target : app.getTargets()) names.add(target.getVersion());
            assertNull(versions.put(app.getPackageName(), names));
        }
        assertEquals(Set.of("2.3.0", "2.4.0", "2.4.1"), versions.get("app.myspoti.stable"));
        assertEquals(Set.of("1.0.0-beta.1"), versions.get("app.orpheon.beta"));
    }
}
