package patches.aliexpress;

import app.morphe.patcher.patch.ApkFileType;
import org.junit.Test;
import static org.junit.Assert.*;
import patches.aliexpress.promotions.RemovePromotionsAndGamesPatchKt;

public class PromotionCompatibilityTest {
    @Test public void nativePromotionBindingsAreOnlyOfferedForTheVerifiedBuild() {
        var patch = RemovePromotionsAndGamesPatchKt.getRemovePromotionsAndGamesPatch();
        assertEquals("Remove promotions and games", patch.getName());
        assertEquals(1, patch.getCompatibility().size());
        var app = patch.getCompatibility().get(0);
        assertEquals("com.alibaba.aliexpresshd", app.getPackageName());
        assertEquals(ApkFileType.APK, app.getApkFileType());
        assertEquals(1, app.getTargets().size());
        var target = app.getTargets().get(0);
        assertEquals("8.180.1", target.getVersion());
        assertEquals(java.util.Set.of(80005998), new java.util.HashSet<>(target.getVersionCodes().values()));
        assertFalse(target.isExperimental());
    }
}
