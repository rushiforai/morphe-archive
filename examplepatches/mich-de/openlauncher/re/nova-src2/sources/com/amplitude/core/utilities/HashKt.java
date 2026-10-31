package com.amplitude.core.utilities;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.UnsignedKt;
import org.jetbrains.annotations.NotNull;
import r70.k;

@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a\u0016\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0000ø\u0001\u0000¢\u0006\u0004\b\u0003\u0010\u0004\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0005"}, d2 = {"toHexString", b.f42142b, "Lkotlin/ULong;", "toHexString-VKZWuLQ", "(J)Ljava/lang/String;", "core"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class HashKt {
    @NotNull
    /* renamed from: toHexString-VKZWuLQ, reason: not valid java name */
    public static final String m131toHexStringVKZWuLQ(long j11) {
        kotlin.text.a.a(16);
        return k.Y0(16, UnsignedKt.c(16, j11));
    }
}
