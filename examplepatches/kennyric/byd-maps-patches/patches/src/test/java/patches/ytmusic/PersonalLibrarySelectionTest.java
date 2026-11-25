package patches.ytmusic;

import static org.junit.Assert.*;
import app.morphe.patcher.patch.Patch;
import java.lang.reflect.Method;
import org.junit.Test;

public final class PersonalLibrarySelectionTest {
    private Patch<?> patch() throws Exception {
        return (Patch<?>) Class.forName("patches.ytmusic.GearslipSupportPatchKt")
            .getMethod("getGearslipMusicSupport").invoke(null);
    }
    private Patch<?> library() throws Exception {
        Method getter = Class.forName("patches.ytmusic.PersonalLibraryPatchKt").getDeclaredMethod("getGearslipPersonalLibrary");
        getter.setAccessible(true); return (Patch<?>) getter.invoke(null);
    }
    @Test public void appearsForTheOriginalPackageUsedByManagersNormalWorkflow() throws Exception {
        assertTrue("Manager filters patches before package renaming; original YT Music must be supported",
            patch().getCompatibility().stream().anyMatch(c -> c.getPackageName().equals("com.google.android.apps.youtube.music") &&
                c.getTargets().stream().anyMatch(t -> t.getVersion() == null)));
    }
    @Test public void hasOnePublicAppEntryAndIncludesTheInternalLibrary() throws Exception {
        assertEquals("Renamed output must not produce another YouTube Music catalogue entry", 1, patch().getCompatibility().size());
        assertNull("Library integration is part of the visible browser patch", library().getName());
        assertTrue("Selecting browser support must include its content integration", patch().getDependencies().contains(library()));
    }
    @Test public void linksToUpstreamHooksAfterAllSelectedPatchesExecute() throws Exception {
        Method finalizeBlock = java.util.Arrays.stream(Patch.class.getMethods())
            .filter(m -> m.getName().startsWith("getFinalizeBlock") && m.getParameterTypes().length == 0).findFirst().orElseThrow();
        assertNotNull("Other source bundles install the request bridges during execute; link them during finalize",
            finalizeBlock.invoke(library()));
    }
}
