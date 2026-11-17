/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.graphics.RenderEffect;
import android.os.Build;

import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowNativeRenderEffect;

/**
 * Robolectric's native RenderEffect has every effect but the runtime shader one, so a holder could
 * never be given the keyer here. This one answers with a real native effect, one that moves nothing,
 * so the view takes it as it would on the phone. The keyer's own pixels are ListBackgroundTest's.
 */
@Implements(value = RenderEffect.class, minSdk = Build.VERSION_CODES.TIRAMISU, isInAndroidSdk = false,
        callNativeMethodsByDefault = true)
public class RuntimeShaderEffectShadow extends ShadowNativeRenderEffect {
    @Implementation(minSdk = Build.VERSION_CODES.TIRAMISU)
    protected static long nativeCreateRuntimeShaderEffect(long shader, String contentName) {
        return nativeCreateOffsetEffect(0f, 0f, 0L);
    }
}
