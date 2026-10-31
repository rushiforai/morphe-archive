package com.google.android.libraries.places.internal;

import com.google.common.flogger.backend.google.GooglePlatform;
import com.google.common.flogger.backend.system.DefaultPlatform;
import java.lang.reflect.InvocationTargetException;

/* loaded from: classes3.dex */
public final class zzqo {
    public static zzqn zza() {
        try {
            try {
                try {
                    return (zzqn) zzqs.class.getDeclaredConstructor(null).newInstance(null);
                } catch (IllegalAccessException | InstantiationException | NoClassDefFoundError | NoSuchMethodException | InvocationTargetException unused) {
                    return (zzqn) GooglePlatform.class.getDeclaredConstructor(null).newInstance(null);
                }
            } catch (IllegalAccessException | InstantiationException | NoClassDefFoundError | NoSuchMethodException | InvocationTargetException unused2) {
                return (zzqn) DefaultPlatform.class.getDeclaredConstructor(null).newInstance(null);
            }
        } catch (IllegalAccessException | InstantiationException | NoClassDefFoundError | NoSuchMethodException | InvocationTargetException unused3) {
            return null;
        }
    }
}
