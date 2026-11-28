/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.pm.PackageInfo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * The build's own package as the extension's checks see it. Install next to Instagram rewrites
 * OwnPackage.name() to the second copy's package (its patch test proves that on the real dex), so
 * these hold the checks to that one answer: a record named only by it counts as this app, and
 * Instagram's other packages don't.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class OwnPackageTest {

    @Test
    public void anUnmovedBuildIsInstagram() {
        assertEquals("com.instagram.android", OwnPackage.name());
    }

    @Test
    public void aNameOnlyRecordIsThisAppByTheOwnPackageAlone() {
        assertTrue("the own package", InstagramSignature.isThisApp(named(OwnPackage.name())));
        assertFalse("a second copy's package before the patch moves this build",
                InstagramSignature.isThisApp(named("com.instagram.android.hush")));
        assertFalse("Instagram's debug build", InstagramSignature.isThisApp(named("com.instagram.android.debug")));
    }

    private static PackageInfo named(String packageName) {
        PackageInfo info = new PackageInfo();
        info.packageName = packageName;
        return info;
    }
}
