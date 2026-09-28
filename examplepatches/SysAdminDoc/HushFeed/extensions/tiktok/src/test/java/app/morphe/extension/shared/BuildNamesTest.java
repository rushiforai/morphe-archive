package app.morphe.extension.shared;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import android.content.res.Resources;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * A view name written for one TikTok build resolves on that build alone. TikTok hands its short
 * names out again on every build, mostly to other views, so 47.0.3's g6r (the like button) looked
 * up on 47.1.3 would find whatever 47.1.3 calls g6r.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class BuildNamesTest {
    private static final String PACKAGE = "com.zhiliaoapp.musically";

    @After
    public void tearDown() {
        BuildNames.setRunningBuildForTests(null);
    }

    @Test
    public void aNameWithNoBuildIsTheSameOnEveryBuild() {
        assertEquals("desc", BuildNames.entryName("desc", "47.0.3"));
        assertEquals("desc", BuildNames.entryName("desc", "47.1.3"));
    }

    @Test
    public void aNameWrittenForOneBuildResolvesOnThatBuildAlone() {
        assertEquals("g6r", BuildNames.entryName("47.0.3:g6r", "47.0.3"));
        assertNull(BuildNames.entryName("47.0.3:g6r", "47.1.3"));
        // A build that only starts or ends the same way is another build.
        assertNull(BuildNames.entryName("47.0.3:g6r", "47.0"));
        assertNull(BuildNames.entryName("47.0.3:g6r", "47.0.31"));
        assertNull(BuildNames.entryName("47.0.3:g6r", "147.0.3"));
    }

    @Test
    public void theCacheLooksUpOnlyTheRunningBuildsName() {
        Resources base = RuntimeEnvironment.getApplication().getResources();
        int[] asked = new int[1];
        @SuppressWarnings("deprecation")
        Resources resources = new Resources(base.getAssets(), base.getDisplayMetrics(), base.getConfiguration()) {
            @Override
            public int getIdentifier(String name, String defType, String defPackage) {
                asked[0]++;
                if (!"id".equals(defType) || !PACKAGE.equals(defPackage)) return 0;
                if ("g85".equals(name)) return 0x7f0a2185;
                if ("g6r".equals(name)) return 0x7f0a2170;
                return 0;
            }
        };
        BuildNames.setRunningBuildForTests("47.1.3");
        ResourceIdCache cache = new ResourceIdCache();

        assertEquals(0, cache.resolve(resources, PACKAGE, "47.0.3:g6r", false));
        assertEquals("another build's name never reaches the lookup", 0, asked[0]);
        assertEquals(0x7f0a2185, cache.resolve(resources, PACKAGE, "47.1.3:g85", false));
        assertEquals(0x7f0a2170, cache.resolve(resources, PACKAGE, "g6r", false));
        assertEquals(2, asked[0]);

        // Remembered either way: a second round asks nothing.
        cache.resolve(resources, PACKAGE, "47.0.3:g6r", false);
        cache.resolve(resources, PACKAGE, "47.1.3:g85", false);
        assertEquals(2, asked[0]);
    }
}
