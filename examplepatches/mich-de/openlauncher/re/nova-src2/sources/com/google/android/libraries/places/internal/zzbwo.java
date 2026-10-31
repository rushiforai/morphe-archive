package com.google.android.libraries.places.internal;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes3.dex */
public final class zzbwo {

    @NotNull
    public static final zzbwo zza = new zzbwo();

    @NotNull
    private static final zzbwn zzb = new zzbwn(new byte[0], 0, 0, false, false);
    private static final int zzc;

    @NotNull
    private static final AtomicReference[] zzd;

    static {
        int iAvailableProcessors = Runtime.getRuntime().availableProcessors();
        int iHighestOneBit = Integer.highestOneBit((iAvailableProcessors + iAvailableProcessors) - 1);
        zzc = iHighestOneBit;
        AtomicReference[] atomicReferenceArr = new AtomicReference[iHighestOneBit];
        for (int i5 = 0; i5 < iHighestOneBit; i5++) {
            atomicReferenceArr[i5] = new AtomicReference();
        }
        zzd = atomicReferenceArr;
    }

    private zzbwo() {
    }

    @JvmStatic
    @NotNull
    public static final zzbwn zza() {
        AtomicReference atomicReferenceZzc = zzc();
        zzbwn zzbwnVar = zzb;
        zzbwn zzbwnVar2 = (zzbwn) atomicReferenceZzc.getAndSet(zzbwnVar);
        if (zzbwnVar2 == zzbwnVar) {
            return new zzbwn();
        }
        if (zzbwnVar2 == null) {
            atomicReferenceZzc.set(null);
            return new zzbwn();
        }
        atomicReferenceZzc.set(zzbwnVar2.zzg);
        zzbwnVar2.zzg = null;
        zzbwnVar2.zzd = 0;
        return zzbwnVar2;
    }

    @JvmStatic
    public static final void zzb(@NotNull zzbwn segment) {
        Intrinsics.g(segment, "segment");
        if (segment.zzg != null || segment.zzh != null) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        if (segment.zze) {
            return;
        }
        AtomicReference atomicReferenceZzc = zzc();
        zzbwn zzbwnVar = zzb;
        zzbwn zzbwnVar2 = (zzbwn) atomicReferenceZzc.getAndSet(zzbwnVar);
        if (zzbwnVar2 != zzbwnVar) {
            int i5 = zzbwnVar2 != null ? zzbwnVar2.zzd : 0;
            if (i5 >= 65536) {
                atomicReferenceZzc.set(zzbwnVar2);
                return;
            }
            segment.zzg = zzbwnVar2;
            segment.zzc = 0;
            segment.zzd = i5 + UserMetadata.MAX_INTERNAL_KEY_SIZE;
            atomicReferenceZzc.set(segment);
        }
    }

    private static final AtomicReference zzc() {
        return zzd[(int) (Thread.currentThread().getId() & (zzc - 1))];
    }
}
