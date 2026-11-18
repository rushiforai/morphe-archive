package org.ungoogled.waze;

import static org.junit.Assert.*;
import org.junit.Test;

public class NativeWarningBuildAdmissionTest {
    @Test public void onlyVerifiedVersionAndCodePairsAdvertiseTheNativeAdapter(){
        assertTrue(NativeWarnings.supportedNativeBuild("5.26.90.901",1030746));
        assertTrue(NativeWarnings.supportedNativeBuild("5.27.0.1",1030748));
        assertFalse(NativeWarnings.supportedNativeBuild("5.26.90.901",1030748));
        assertFalse(NativeWarnings.supportedNativeBuild("5.27.0.1",1030746));
        assertFalse(NativeWarnings.supportedNativeBuild("5.27.0.2",1030749));
        assertFalse(NativeWarnings.supportedNativeBuild(null,1030748));
        assertFalse("A source build never pretends that native hooks are installed",NativeWarnings.bound());
    }
}
