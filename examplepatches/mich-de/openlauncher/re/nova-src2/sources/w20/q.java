package w20;

import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: classes4.dex */
public abstract class q {

    /* renamed from: a, reason: collision with root package name */
    public static final Method f93717a;

    static {
        Class cls = Integer.TYPE;
        f93717a = v30.e.g(AssetManager.class, "openNonAsset", cls, String.class, cls);
    }

    public static InputStream a(AssetManager assetManager, int i5, String str) {
        Method method = f93717a;
        if (method != null) {
            try {
                return (InputStream) method.invoke(assetManager, Integer.valueOf(i5), str, 2);
            } catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException unused) {
            }
        }
        AssetFileDescriptor assetFileDescriptorOpenNonAssetFd = assetManager.openNonAssetFd(i5, str);
        if (assetFileDescriptorOpenNonAssetFd == null) {
            return null;
        }
        return assetFileDescriptorOpenNonAssetFd.createInputStream();
    }
}
