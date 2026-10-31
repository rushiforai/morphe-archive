package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public static final v f40824a = new v("CreativeView", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final v f40825b = new v("Start", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final v f40826c = new v("FirstQuartile", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final v f40827d = new v("Midpoint", 3);

    /* renamed from: e, reason: collision with root package name */
    public static final v f40828e = new v("ThirdQuartile", 4);

    /* renamed from: f, reason: collision with root package name */
    public static final v f40829f = new v("Complete", 5);

    /* renamed from: g, reason: collision with root package name */
    public static final v f40830g = new v("Mute", 6);

    /* renamed from: h, reason: collision with root package name */
    public static final v f40831h = new v("UnMute", 7);

    /* renamed from: i, reason: collision with root package name */
    public static final v f40832i = new v("Pause", 8);

    /* renamed from: j, reason: collision with root package name */
    public static final v f40833j = new v("Rewind", 9);

    /* renamed from: k, reason: collision with root package name */
    public static final v f40834k = new v("Resume", 10);

    /* renamed from: l, reason: collision with root package name */
    public static final v f40835l = new v("CloseLinear", 11);

    /* renamed from: m, reason: collision with root package name */
    public static final v f40836m = new v("Skip", 12);
    public static final v n = new v("Progress", 13);
    public static final /* synthetic */ v[] o;

    /* renamed from: p, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f40837p;

    static {
        v[] vVarArrA = a();
        o = vVarArrA;
        f40837p = EnumEntriesKt.a(vVarArrA);
    }

    public v(String str, int i5) {
    }

    public static final /* synthetic */ v[] a() {
        return new v[]{f40824a, f40825b, f40826c, f40827d, f40828e, f40829f, f40830g, f40831h, f40832i, f40833j, f40834k, f40835l, f40836m, n};
    }

    @NotNull
    public static EnumEntries<v> b() {
        return f40837p;
    }

    public static v valueOf(String str) {
        return (v) Enum.valueOf(v.class, str);
    }

    public static v[] values() {
        return (v[]) o.clone();
    }
}
