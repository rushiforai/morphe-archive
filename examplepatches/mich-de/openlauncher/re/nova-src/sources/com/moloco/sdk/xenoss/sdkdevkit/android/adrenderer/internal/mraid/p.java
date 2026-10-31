package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f39173a;

    /* renamed from: b, reason: collision with root package name */
    public static final p f39174b = new p("Portrait", 0);

    /* renamed from: c, reason: collision with root package name */
    public static final p f39175c = new p("Landscape", 1);

    /* renamed from: d, reason: collision with root package name */
    public static final p f39176d = new p("None", 2);

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ p[] f39177e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f39178f;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @Nullable
        public final p a(@Nullable String str) {
            if (str == null) {
                return null;
            }
            int iHashCode = str.hashCode();
            if (iHashCode == 3387192) {
                if (str.equals("none")) {
                    return p.f39176d;
                }
                return null;
            }
            if (iHashCode == 729267099) {
                if (str.equals("portrait")) {
                    return p.f39174b;
                }
                return null;
            }
            if (iHashCode == 1430647483 && str.equals("landscape")) {
                return p.f39175c;
            }
            return null;
        }

        public a() {
        }
    }

    static {
        p[] pVarArrA = a();
        f39177e = pVarArrA;
        f39178f = EnumEntriesKt.a(pVarArrA);
        f39173a = new a(null);
    }

    public p(String str, int i5) {
    }

    public static final /* synthetic */ p[] a() {
        return new p[]{f39174b, f39175c, f39176d};
    }

    @NotNull
    public static EnumEntries<p> b() {
        return f39178f;
    }

    public static p valueOf(String str) {
        return (p) Enum.valueOf(p.class, str);
    }

    public static p[] values() {
        return (p[]) f39177e.clone();
    }
}
