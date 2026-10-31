package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class C {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f38389a;

    /* renamed from: b, reason: collision with root package name */
    public static final C f38390b = new C("IGNORE", 0);

    /* renamed from: c, reason: collision with root package name */
    public static final C f38391c = new C("MEASURE", 1);

    /* renamed from: d, reason: collision with root package name */
    public static final C f38392d = new C("ENFORCE", 2);

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ C[] f38393e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f38394f;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final C a(boolean z11) {
            return z11 ? C.f38392d : C.f38391c;
        }

        public a() {
        }
    }

    static {
        C[] cArrA = a();
        f38393e = cArrA;
        f38394f = EnumEntriesKt.a(cArrA);
        f38389a = new a(null);
    }

    public C(String str, int i5) {
    }

    public static final /* synthetic */ C[] a() {
        return new C[]{f38390b, f38391c, f38392d};
    }

    @NotNull
    public static EnumEntries<C> b() {
        return f38394f;
    }

    public static C valueOf(String str) {
        return (C) Enum.valueOf(C.class, str);
    }

    public static C[] values() {
        return (C[]) f38393e.clone();
    }
}
