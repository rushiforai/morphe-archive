package com.moloco.sdk.internal.publisher;

import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* renamed from: com.moloco.sdk.internal.publisher.c, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2941c {

    /* renamed from: c, reason: collision with root package name */
    public static final int f37034c = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Map<t, Duration> f37035a;

    /* renamed from: b, reason: collision with root package name */
    public final long f37036b;

    /* renamed from: com.moloco.sdk.internal.publisher.c$a */
    public /* synthetic */ class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int[] f37037a;

        static {
            int[] iArr = new int[t.values().length];
            try {
                iArr[t.f37458a.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[t.f37459b.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[t.f37460c.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                iArr[t.f37461d.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                iArr[t.f37462e.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                iArr[t.f37465h.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                iArr[t.f37466i.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                iArr[t.f37464g.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                iArr[t.f37463f.ordinal()] = 9;
            } catch (NoSuchFieldError unused9) {
            }
            f37037a = iArr;
        }
    }

    public /* synthetic */ C2941c(Map map, long j11, DefaultConstructorMarker defaultConstructorMarker) {
        this(map, j11);
    }

    @NotNull
    public final Map<t, Duration> a() {
        return this.f37035a;
    }

    public final long b() {
        return this.f37036b;
    }

    @NotNull
    public final Map<t, Duration> c() {
        return this.f37035a;
    }

    public final long d() {
        return this.f37036b;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C2941c)) {
            return false;
        }
        C2941c c2941c = (C2941c) obj;
        return Intrinsics.b(this.f37035a, c2941c.f37035a) && Duration.d(this.f37036b, c2941c.f37036b);
    }

    public int hashCode() {
        int iHashCode = this.f37035a.hashCode() * 31;
        long j11 = this.f37036b;
        Duration.Companion companion = Duration.f72038b;
        return Long.hashCode(j11) + iHashCode;
    }

    @NotNull
    public String toString() {
        return "AdCreatorConfiguration(adTimeouts=" + this.f37035a + ", defaultTimeoutDuration=" + ((Object) Duration.r(this.f37036b)) + ')';
    }

    public C2941c(Map<t, Duration> adTimeouts, long j11) {
        Intrinsics.g(adTimeouts, "adTimeouts");
        this.f37035a = adTimeouts;
        this.f37036b = j11;
    }

    @NotNull
    public final C2941c a(@NotNull Map<t, Duration> adTimeouts, long j11) {
        Intrinsics.g(adTimeouts, "adTimeouts");
        return new C2941c(adTimeouts, j11, null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ C2941c a(C2941c c2941c, Map map, long j11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            map = c2941c.f37035a;
        }
        if ((i5 & 2) != 0) {
            j11 = c2941c.f37036b;
        }
        return c2941c.a(map, j11);
    }

    public C2941c(Map map, long j11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        long jG;
        if ((i5 & 1) != 0) {
            t[] tVarArrValues = t.values();
            int iD0 = b70.k.d0(tVarArrValues.length);
            LinkedHashMap linkedHashMap = new LinkedHashMap(iD0 < 16 ? 16 : iD0);
            for (t tVar : tVarArrValues) {
                switch (a.f37037a[tVar.ordinal()]) {
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                        jG = DurationKt.g(5, DurationUnit.f72046e);
                        break;
                    case 6:
                    case 7:
                    case 8:
                    case 9:
                        jG = DurationKt.g(15, DurationUnit.f72046e);
                        break;
                    default:
                        throw new NoWhenBranchMatchedException();
                }
                linkedHashMap.put(tVar, new Duration(jG));
            }
            map = linkedHashMap;
        }
        this(map, (i5 & 2) != 0 ? DurationKt.g(5, DurationUnit.f72046e) : j11, null);
    }
}
