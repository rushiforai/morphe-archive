package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.ad.orientation;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final C0222a f39380a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f39381b = new a("Portrait", 0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f39382c = new a("Landscape", 1);

    /* renamed from: d, reason: collision with root package name */
    public static final a f39383d = new a("None", 2);

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ a[] f39384e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f39385f;

    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.ad.orientation.a$a, reason: collision with other inner class name */
    public static final class C0222a {
        public /* synthetic */ C0222a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @Nullable
        public final a a(@Nullable String str) {
            if (str == null) {
                return null;
            }
            int iHashCode = str.hashCode();
            if (iHashCode == 3387192) {
                if (str.equals("none")) {
                    return a.f39383d;
                }
                return null;
            }
            if (iHashCode == 729267099) {
                if (str.equals("portrait")) {
                    return a.f39381b;
                }
                return null;
            }
            if (iHashCode == 1430647483 && str.equals("landscape")) {
                return a.f39382c;
            }
            return null;
        }

        public C0222a() {
        }
    }

    static {
        a[] aVarArrA = a();
        f39384e = aVarArrA;
        f39385f = EnumEntriesKt.a(aVarArrA);
        f39380a = new C0222a(null);
    }

    public a(String str, int i5) {
    }

    public static final /* synthetic */ a[] a() {
        return new a[]{f39381b, f39382c, f39383d};
    }

    @NotNull
    public static EnumEntries<a> b() {
        return f39385f;
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f39384e.clone();
    }
}
