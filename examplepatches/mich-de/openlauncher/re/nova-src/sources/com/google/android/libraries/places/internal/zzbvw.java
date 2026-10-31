package com.google.android.libraries.places.internal;

import java.util.concurrent.locks.ReentrantLock;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.SourceDebugExtension;

@SourceDebugExtension
/* loaded from: classes3.dex */
public final class zzbvw {
    private zzbvw() {
        throw null;
    }

    public static final /* synthetic */ boolean zza(zzbvw zzbvwVar, zzbvz zzbvzVar) {
        ReentrantLock reentrantLock = zzbvz.zzd;
        reentrantLock.lock();
        reentrantLock.unlock();
        return false;
    }

    public /* synthetic */ zzbvw(DefaultConstructorMarker defaultConstructorMarker) {
    }
}
