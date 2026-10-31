package com.amplitude.android.utilities;

import com.amplitude.common.Logger;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bÆ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0018\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\b\u0010\u0007\u001a\u0004\u0018\u00010\bJ \u0010\t\u001a\b\u0012\u0002\b\u0003\u0018\u00010\n2\u0006\u0010\u0005\u001a\u00020\u00062\b\u0010\u0007\u001a\u0004\u0018\u00010\bH\u0002¨\u0006\u000b"}, d2 = {"Lcom/amplitude/android/utilities/LoadClass;", b.f42142b, "()V", "isClassAvailable", b.f42142b, "clazz", b.f42142b, "logger", "Lcom/amplitude/common/Logger;", "loadClass", "Ljava/lang/Class;", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class LoadClass {

    @NotNull
    public static final LoadClass INSTANCE = new LoadClass();

    private LoadClass() {
    }

    private final Class<?> loadClass(String clazz, Logger logger) {
        try {
            return Class.forName(clazz);
        } catch (ClassNotFoundException e3) {
            if (logger == null) {
                return null;
            }
            logger.debug("Class not available:" + clazz + ": " + e3);
            return null;
        } catch (UnsatisfiedLinkError e11) {
            if (logger == null) {
                return null;
            }
            logger.error("Failed to load (UnsatisfiedLinkError) " + clazz + ": " + e11);
            return null;
        } catch (Throwable th2) {
            if (logger == null) {
                return null;
            }
            logger.error("Failed to initialize " + clazz + ": " + th2);
            return null;
        }
    }

    public final boolean isClassAvailable(@NotNull String clazz, @Nullable Logger logger) {
        Intrinsics.g(clazz, "clazz");
        return loadClass(clazz, logger) != null;
    }
}
