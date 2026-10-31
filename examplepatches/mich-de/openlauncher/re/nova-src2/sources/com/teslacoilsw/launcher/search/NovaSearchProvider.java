package com.teslacoilsw.launcher.search;

import a80.d;
import a80.e;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Process;
import android.view.View;
import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.teslacoilsw.launcher.NovaLauncher;
import e10.s2;
import e10.y2;
import e10.z2;
import j00.k0;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.reflect.KProperty;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.json.Json;
import mx.g0;
import org.jetbrains.annotations.NotNull;
import p1.v1;
import p8.f;
import pp.b0;
import pp.r;
import pp.w;
import pp.x;
import q20.c;
import r10.a;
import r10.b1;
import r10.n1;
import t70.m0;
import t70.y0;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u0000 \u00032\u00020\u00012\u00020\u0002:\u0001\u0004\u0082\u0001\u0002\u0005\u0006¨\u0006\u0007"}, d2 = {"Lcom/teslacoilsw/launcher/search/NovaSearchProvider;", "Lr10/n1;", "Landroid/os/Parcelable;", k.O, "r10/b1", "Lcom/teslacoilsw/launcher/search/BuiltinNovaSearchProvider;", "Lcom/teslacoilsw/launcher/search/NovaCustomSearchProvider;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable(with = b1.class)
@SourceDebugExtension
/* loaded from: classes.dex */
public abstract class NovaSearchProvider extends n1 implements Parcelable {

    @NotNull
    public static final b1 Companion = new b1();

    /* renamed from: h, reason: collision with root package name */
    public static final BuiltinNovaSearchProvider f46217h;

    /* renamed from: i, reason: collision with root package name */
    public static final BuiltinNovaSearchProvider f46218i;

    /* renamed from: j, reason: collision with root package name */
    public static final BuiltinNovaSearchProvider f46219j;

    /* renamed from: k, reason: collision with root package name */
    public static final BuiltinNovaSearchProvider f46220k;

    /* renamed from: l, reason: collision with root package name */
    public static final BuiltinNovaSearchProvider f46221l;

    /* renamed from: m, reason: collision with root package name */
    public static final BuiltinNovaSearchProvider f46222m;
    public static final BuiltinNovaSearchProvider n;
    public static final NovaSearchProvider$Companion$WIKI$1 o;

    /* renamed from: p, reason: collision with root package name */
    public static final BuiltinNovaSearchProvider f46223p;

    /* renamed from: q, reason: collision with root package name */
    public static final BuiltinNovaSearchProvider f46224q;

    /* renamed from: r, reason: collision with root package name */
    public static final BuiltinNovaSearchProvider f46225r;

    /* renamed from: s, reason: collision with root package name */
    public static final BuiltinNovaSearchProvider f46226s;

    /* renamed from: t, reason: collision with root package name */
    public static final BuiltinNovaSearchProvider f46227t;

    /* renamed from: u, reason: collision with root package name */
    public static final List f46228u;

    /* renamed from: v, reason: collision with root package name */
    public static final SerialDescriptor f46229v;

    /* renamed from: d, reason: collision with root package name */
    public final String f46230d;

    /* renamed from: e, reason: collision with root package name */
    public final Uri f46231e;

    /* renamed from: f, reason: collision with root package name */
    public final v1 f46232f;

    /* renamed from: g, reason: collision with root package name */
    public final v1 f46233g;

    static {
        BuiltinNovaSearchProvider builtinNovaSearchProvider = new BuiltinNovaSearchProvider("Google", z2.v(2131231778, "com.teslacoilsw.launcher"), "https://google.com/search?q=%s", null, null, new c(17), 24);
        f46217h = builtinNovaSearchProvider;
        BuiltinNovaSearchProvider builtinNovaSearchProvider2 = new BuiltinNovaSearchProvider("Google (web)", z2.v(2131231778, "com.teslacoilsw.launcher"), "https://google.com/search?q=%s", null, null, null, 56);
        f46218i = builtinNovaSearchProvider2;
        BuiltinNovaSearchProvider builtinNovaSearchProvider3 = new BuiltinNovaSearchProvider("DuckDuckGo", z2.v(2131231757, "com.teslacoilsw.launcher"), "https://duckduckgo.com/?q=%s&t=novalauncher", z2.v(2131231758, "com.teslacoilsw.launcher"), null, null, 48);
        f46219j = builtinNovaSearchProvider3;
        f46220k = new BuiltinNovaSearchProvider("Bing", z2.v(2131231168, "com.teslacoilsw.launcher"), "https://bing.com/search?q=%s", null, null, null, 56);
        BuiltinNovaSearchProvider builtinNovaSearchProvider4 = new BuiltinNovaSearchProvider("Play Store", z2.v(2131231795, "com.teslacoilsw.launcher"), "market://search?c=apps&q=%s", null, "com.android.vending", null, 40);
        f46221l = builtinNovaSearchProvider4;
        ComponentName componentNameUnflattenFromString = ComponentName.unflattenFromString("com.google.android.apps.searchlite/.ui.SearchActivity");
        Intrinsics.d(componentNameUnflattenFromString);
        BuiltinNovaSearchProvider builtinNovaSearchProvider5 = new BuiltinNovaSearchProvider("Google Go", a.f(componentNameUnflattenFromString, Process.myUserHandle()), "https://google.com/search?q=%s", null, "com.google.android.apps.searchlite", new c(18), 8);
        f46222m = builtinNovaSearchProvider5;
        BuiltinNovaSearchProvider builtinNovaSearchProvider6 = new BuiltinNovaSearchProvider("Google Maps", z2.v(2131231779, "com.teslacoilsw.launcher"), "https://maps.google.com/maps?q=%s", null, null, null, 56);
        n = builtinNovaSearchProvider6;
        NovaSearchProvider$Companion$WIKI$1 novaSearchProvider$Companion$WIKI$1 = new NovaSearchProvider$Companion$WIKI$1("Wikipedia", z2.v(2131231781, "com.teslacoilsw.launcher"), "https://wikipedia.org/w/index.php?search=%s", null, null, null, 56);
        o = novaSearchProvider$Companion$WIKI$1;
        BuiltinNovaSearchProvider builtinNovaSearchProvider7 = new BuiltinNovaSearchProvider("Spotify", z2.v(2131231780, "com.teslacoilsw.launcher"), "https://open.spotify.com/search/%s", null, "com.spotify.music", null, 40);
        f46223p = builtinNovaSearchProvider7;
        BuiltinNovaSearchProvider builtinNovaSearchProvider8 = new BuiltinNovaSearchProvider("YouTube", z2.v(2131231782, "com.teslacoilsw.launcher"), "https://www.youtube.com/results?search_query=%s", null, null, null, 56);
        f46224q = builtinNovaSearchProvider8;
        BuiltinNovaSearchProvider builtinNovaSearchProvider9 = new BuiltinNovaSearchProvider("YouTube Music", z2.v(2131231783, "com.teslacoilsw.launcher"), "https://music.youtube.com/search?q=%s", null, null, null, 56);
        f46225r = builtinNovaSearchProvider9;
        BuiltinNovaSearchProvider builtinNovaSearchProvider10 = new BuiltinNovaSearchProvider("Google Translate", z2.v(2131231773, "com.teslacoilsw.launcher"), "https://translate.google.com/?text=%s", null, "com.google.android.apps.translate", new c(19), 8);
        f46226s = builtinNovaSearchProvider10;
        BuiltinNovaSearchProvider builtinNovaSearchProvider11 = new BuiltinNovaSearchProvider("Firefox Focus", a.f(new ComponentName("org.mozilla.focus", "org.mozilla.focus.activity.MainActivity"), Process.myUserHandle()), b.f42142b, null, "org.mozilla.focus", new c(20), 8);
        f46227t = builtinNovaSearchProvider11;
        f46228u = ul.b.Q(builtinNovaSearchProvider, builtinNovaSearchProvider2, builtinNovaSearchProvider3, builtinNovaSearchProvider4, builtinNovaSearchProvider6, novaSearchProvider$Companion$WIKI$1, builtinNovaSearchProvider7, builtinNovaSearchProvider8, builtinNovaSearchProvider9, builtinNovaSearchProvider10, builtinNovaSearchProvider11, builtinNovaSearchProvider5);
        f46229v = BuiltinSerializersKt.ListSerializer(BuiltinSerializersKt.serializer(StringCompanionObject.f71868a)).getDescriptor();
    }

    public NovaSearchProvider(String str, Uri uri, String str2, Uri uri2) {
        super(str, uri, b0.f82697j);
        this.f46230d = str2;
        this.f46231e = uri2;
        v1 v1Var = new v1(this, 5);
        this.f46232f = v1Var;
        this.f46233g = v1Var;
    }

    @Override // r10.n1
    public void d(NovaLauncher novaLauncher, View view, String str, Function1 function1) {
        NovaSearchProvider novaSearchProvider;
        NovaLauncher novaLauncher2;
        String str2;
        r rVar = r.f82771h;
        Intent intent = (Intent) e().invoke(str);
        byte b11 = 0;
        try {
            f fVar = new f(novaLauncher);
            try {
                fVar.c(str, new k0(28, b11));
                Unit unit = Unit.f71706a;
                fVar.close();
            } finally {
            }
        } catch (Exception unused) {
        }
        try {
            novaLauncher.startActivity(intent);
            Context context = g0.f77088a;
            g0.i().c(new x(rVar, w.f82778b));
            y2.f51877a.getClass();
            s2 s2Var = y2.f51971y2;
            KProperty kProperty = y2.f51881b[176];
            s2Var.getClass();
            if (((Boolean) s2Var.l()).booleanValue()) {
                e eVar = y0.f88884a;
                novaSearchProvider = this;
                novaLauncher2 = novaLauncher;
                str2 = str;
                try {
                    m0.t(novaLauncher2, d.f488c, null, new j00.m0(novaSearchProvider, intent, str2, novaLauncher2, null), 2);
                } catch (ActivityNotFoundException unused2) {
                    Function1 function1E = e();
                    v1 v1Var = novaSearchProvider.f46232f;
                    if (!Intrinsics.b(function1E, v1Var)) {
                        try {
                            novaLauncher2.startActivity((Intent) v1Var.invoke(str2));
                            Context context2 = g0.f77088a;
                            g0.i().c(new x(rVar, w.f82778b));
                            return;
                        } catch (ActivityNotFoundException unused3) {
                            com.google.android.gms.internal.consent_sdk.k0.w(novaLauncher2, 2132017222, 0).show();
                        }
                    }
                    com.google.android.gms.internal.consent_sdk.k0.w(novaLauncher2, 2132017222, 0).show();
                }
            }
        } catch (ActivityNotFoundException unused4) {
            novaSearchProvider = this;
            novaLauncher2 = novaLauncher;
            str2 = str;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public Function1 e() {
        return this.f46233g;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!getClass().equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        Intrinsics.e(obj, "null cannot be cast to non-null type com.teslacoilsw.launcher.search.NovaSearchProvider");
        NovaSearchProvider novaSearchProvider = (NovaSearchProvider) obj;
        return Intrinsics.b(this.f46230d, novaSearchProvider.f46230d) && Intrinsics.b(this.f85199b, novaSearchProvider.f85199b) && Intrinsics.b(this.f85198a, novaSearchProvider.f85198a);
    }

    public boolean f(Context context) {
        return true;
    }

    public final int hashCode() {
        return this.f85198a.hashCode() + ((this.f85199b.hashCode() + (this.f46230d.hashCode() * 31)) * 31);
    }

    @Override // r10.o1
    public final String toString() {
        return c0.n("NovaSearchProvider(", this.f85198a, ", ", this.f46230d, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        Json.Companion companion = Json.INSTANCE;
        companion.getSerializersModule();
        parcel.writeString(companion.encodeToString(Companion.serializer(), this));
    }
}
