package com.amplitude.core.utilities;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\bÀ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u001b\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\b\u0007\u0010\bJ\"\u0010\t\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u000b\u001a\u00020\nø\u0001\u0001¢\u0006\u0004\b\f\u0010\r\u0082\u0002\u000b\n\u0002\b!\n\u0005\b¡\u001e0\u0001¨\u0006\u000e"}, d2 = {"Lcom/amplitude/core/utilities/Hash;", b.f42142b, "()V", "fnv1a64", "Lkotlin/ULong;", "value", b.f42142b, "fnv1a64-I7RO_PI", "(Ljava/lang/String;)J", "xxHash32", "Lkotlin/UInt;", "seed", "xxHash32-8fN1j4Y", "(Ljava/lang/String;I)I", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class Hash {

    @NotNull
    public static final Hash INSTANCE = new Hash();

    private Hash() {
    }

    /* renamed from: xxHash32-8fN1j4Y$default, reason: not valid java name */
    public static /* synthetic */ int m128xxHash328fN1j4Y$default(Hash hash, String str, int i5, int i11, Object obj) {
        if ((i11 & 2) != 0) {
            i5 = 0;
        }
        return hash.m130xxHash328fN1j4Y(str, i5);
    }

    /* renamed from: fnv1a64-I7RO_PI, reason: not valid java name */
    public final long m129fnv1a64I7RO_PI(@NotNull String value) {
        Intrinsics.g(value, "value");
        byte[] bytes = value.getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "getBytes(...)");
        long j11 = -3750763034362895579L;
        for (long j12 : bytes) {
            ULong.Companion companion = ULong.f71699b;
            j11 = (j11 ^ (j12 & 255)) * 1099511628211L;
        }
        return j11;
    }

    /* renamed from: xxHash32-8fN1j4Y, reason: not valid java name */
    public final int m130xxHash328fN1j4Y(@NotNull String value, int seed) {
        Intrinsics.g(value, "value");
        return XxHash32.INSTANCE.m134hash8fN1j4Y(value, seed);
    }
}
