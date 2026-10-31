package com.google.android.libraries.places.internal;

import kotlin.jvm.JvmName;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@JvmName
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class zzbwz {
    public static final int zza(@NotNull zzbwp zzbwpVar, int i5) {
        int i11;
        Intrinsics.g(zzbwpVar, "<this>");
        int[] iArrZzq = zzbwpVar.zzq();
        int length = zzbwpVar.zzr().length;
        Intrinsics.g(iArrZzq, "<this>");
        int i12 = length - 1;
        int i13 = 0;
        while (true) {
            if (i13 <= i12) {
                int i14 = i5 + 1;
                i11 = (i13 + i12) >>> 1;
                int i15 = iArrZzq[i11];
                if (i15 >= i14) {
                    if (i15 <= i14) {
                        break;
                    }
                    i12 = i11 - 1;
                } else {
                    i13 = i11 + 1;
                }
            } else {
                i11 = (-i13) - 1;
                break;
            }
        }
        return i11 >= 0 ? i11 : ~i11;
    }
}
