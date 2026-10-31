package e10;

import com.teslacoilsw.launcher.util.NamedIntent;
import java.net.HttpURLConnection;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import javax.net.ssl.HttpsURLConnection;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import kotlin.text.Charsets;

/* loaded from: classes.dex */
public final /* synthetic */ class h2 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51570a;

    public /* synthetic */ h2(int i5) {
        this.f51570a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = 3;
        int i11 = 2;
        boolean z11 = false;
        int i12 = 1;
        Continuation continuation = null;
        switch (this.f51570a) {
            case 0:
                ((Boolean) obj).getClass();
                y2.f51877a.getClass();
                Boolean bool = (Boolean) y2.Y().l();
                bool.getClass();
                return bool;
            case 1:
                ((Boolean) obj).getClass();
                y2.f51877a.getClass();
                return Boolean.valueOf(!((Boolean) y2.G0().l()).booleanValue());
            case 2:
                ((Boolean) obj).getClass();
                y2.f51877a.getClass();
                Boolean bool2 = (Boolean) y2.F1().l();
                bool2.getClass();
                return bool2;
            case 3:
                ((Boolean) obj).booleanValue();
                g2 g2Var = a3.f51435a;
                if (g2Var.f51555k) {
                    g2Var.f51557m.getClass();
                    z11 = true;
                }
                return Boolean.valueOf(z11);
            case 4:
                NamedIntent namedIntent = (NamedIntent) obj;
                y2 y2Var = y2.f51877a;
                Unit unit = Unit.f71706a;
                y2Var.getClass();
                return Boolean.valueOf(a3.f51435a.f51552h || mx.c0.c(namedIntent.f46369b) == mx.c0.APP_DRAWER);
            case 5:
                NamedIntent namedIntent2 = (NamedIntent) obj;
                y2 y2Var2 = y2.f51877a;
                Unit unit2 = Unit.f71706a;
                y2Var2.getClass();
                return Boolean.valueOf(a3.f51435a.f51552h || mx.c0.c(namedIntent2.f46369b) == mx.c0.EXPAND_STATUS_BAR);
            case 6:
                return EmptyList.f71733a;
            case 7:
                return EmptyList.f71733a;
            case 8:
                return Boolean.valueOf(!v2.g0.f(((v2.t) obj).j(), 2));
            case 9:
                a2.c.v(a3.f51435a.f51545a, "ssml_spotify_auth", (String) obj);
                return Unit.f71706a;
            case 10:
                a2.c.v(a3.f51435a.f51545a, "ssml_onedrive_auth", (String) obj);
                return Unit.f71706a;
            case 11:
                a2.c.v(a3.f51435a.f51545a, "ssml_github_auth", (String) obj);
                return Unit.f71706a;
            case 12:
                a3.f51435a.f51545a.edit().putLong("ssml_spotify_last_update", ((Long) obj).longValue()).apply();
                return Unit.f71706a;
            case 13:
                a2.c.v(a3.f51435a.f51545a, "deezer_auth", (String) obj);
                return Unit.f71706a;
            case 14:
                return r10.a.g("com.google.android.calendar").toString();
            case 15:
                a2.c.v(a3.f51435a.f51545a, "ssml_slack_auth", (String) obj);
                return Unit.f71706a;
            case 16:
                a2.c.v(a3.f51435a.f51545a, "ssml_twitch_auth", (String) obj);
                return Unit.f71706a;
            case 17:
                a2.c.v(a3.f51435a.f51545a, "ssml_discord_auth", (String) obj);
                return Unit.f71706a;
            case 18:
                a2.c.v(a3.f51435a.f51545a, "ssml_dropbox_auth", (String) obj);
                return Unit.f71706a;
            case 19:
                HttpsURLConnection it = (HttpsURLConnection) obj;
                Intrinsics.g(it, "it");
                return Unit.f71706a;
            case 20:
                Intrinsics.g((HttpURLConnection) obj, "<this>");
                return Unit.f71706a;
            case 21:
                i50.b createClientPlugin = (i50.b) obj;
                Intrinsics.g(createClientPlugin, "$this$createClientPlugin");
                createClientPlugin.a(h50.a.f59143c, new h50.c(3, null));
                createClientPlugin.a(h50.a.f59142b, new h50.d(i11, continuation, z11 ? 1 : 0));
                return Unit.f71706a;
            case 22:
                h50.t HttpResponseValidator = (h50.t) obj;
                Intrinsics.g(HttpResponseValidator, "$this$HttpResponseValidator");
                HttpResponseValidator.f59280c = false;
                HttpResponseValidator.f59278a.add(new h50.j(2, null));
                return Unit.f71706a;
            case 23:
                i50.b createClientPlugin2 = (i50.b) obj;
                Intrinsics.g(createClientPlugin2, "$this$createClientPlugin");
                createClientPlugin2.f61373a.f19690h.f(l50.a.f74721g, new c50.b(i5, continuation));
                return Unit.f71706a;
            case 24:
                i50.b createClientPlugin3 = (i50.b) obj;
                Intrinsics.g(createClientPlugin3, "$this$createClientPlugin");
                ((h50.n1) createClientPlugin3.f61374b).getClass();
                h50.s.a().c();
                return Unit.f71706a;
            case 25:
                i50.b createClientPlugin4 = (i50.b) obj;
                Intrinsics.g(createClientPlugin4, "$this$createClientPlugin");
                h50.t tVar = (h50.t) createClientPlugin4.f61374b;
                List listW1 = b70.g.w1(tVar.f59278a);
                List listW12 = b70.g.w1(tVar.f59279b);
                createClientPlugin4.a(i50.g.f61390d, new h50.w(tVar.f59280c, null));
                createClientPlugin4.a(i50.g.f61389c, new c50.b(listW1, continuation, 4));
                createClientPlugin4.a(h50.a.f59146f, new h50.x(listW12, continuation, z11 ? 1 : 0));
                createClientPlugin4.a(h50.a.f59144d, new h50.x(listW12, continuation, i12));
                return Unit.f71706a;
            case 26:
                i50.b createClientPlugin5 = (i50.b) obj;
                Intrinsics.g(createClientPlugin5, "$this$createClientPlugin");
                h50.e0 e0Var = (h50.e0) createClientPlugin5.f61374b;
                List<Pair> listD1 = b70.g.D1(new h50.i0(i12), MapsKt.q0(e0Var.f59177b));
                Charset charset = e0Var.f59178c;
                LinkedHashSet linkedHashSet = e0Var.f59176a;
                ArrayList arrayList = new ArrayList();
                for (Object obj2 : linkedHashSet) {
                    if (!e0Var.f59177b.containsKey((Charset) obj2)) {
                        arrayList.add(obj2);
                    }
                }
                List<Charset> listD12 = b70.g.D1(new h50.i0(z11 ? 1 : 0), arrayList);
                StringBuilder sb2 = new StringBuilder();
                for (Charset charset2 : listD12) {
                    if (sb2.length() > 0) {
                        sb2.append(",");
                    }
                    sb2.append(w.b.k(charset2));
                }
                for (Pair pair : listD1) {
                    Charset charset3 = (Charset) pair.f71683a;
                    float fFloatValue = ((Number) pair.f71684b).floatValue();
                    if (sb2.length() > 0) {
                        sb2.append(",");
                    }
                    double d5 = fFloatValue;
                    if (0.0d > d5 || d5 > 1.0d) {
                        throw new IllegalStateException("Check failed.");
                    }
                    sb2.append(w.b.k(charset3) + ";q=" + (MathKt.b(100 * fFloatValue) / 100.0d));
                }
                if (sb2.length() == 0) {
                    sb2.append(w.b.k(charset));
                }
                String string = sb2.toString();
                Charset charset4 = (Charset) b70.g.Y0(listD12);
                if (charset4 == null) {
                    Pair pair2 = (Pair) b70.g.Y0(listD1);
                    charset4 = pair2 != null ? (Charset) pair2.f71683a : null;
                    if (charset4 == null) {
                        charset4 = Charsets.f72000b;
                    }
                }
                createClientPlugin5.a(h50.a.f59145e, new h50.g0(string, charset4, null));
                createClientPlugin5.a(i50.g.f61391e, new h50.h0(charset, null));
                return Unit.f71706a;
            case 27:
                i50.b createClientPlugin6 = (i50.b) obj;
                Intrinsics.g(createClientPlugin6, "$this$createClientPlugin");
                ((h50.k0) createClientPlugin6.f61374b).getClass();
                createClientPlugin6.a(i50.g.f61389c, new c50.b(createClientPlugin6, continuation, 5));
                return Unit.f71706a;
            case 28:
                i50.b createClientPlugin7 = (i50.b) obj;
                Intrinsics.g(createClientPlugin7, "$this$createClientPlugin");
                createClientPlugin7.a(h50.a.f59147g, new h50.o0(createClientPlugin7, null));
                return Unit.f71706a;
            default:
                i50.b createClientPlugin8 = (i50.b) obj;
                Intrinsics.g(createClientPlugin8, "$this$createClientPlugin");
                h50.u0 u0Var = (h50.u0) createClientPlugin8.f61374b;
                h50.s0 s0Var = u0Var.f59286a;
                if (s0Var == null) {
                    Intrinsics.m("shouldRetry");
                    throw null;
                }
                h50.q0 q0Var = u0Var.f59287b;
                if (q0Var == null) {
                    Intrinsics.m("shouldRetryOnException");
                    throw null;
                }
                h50.r0 r0Var = u0Var.f59288c;
                if (r0Var != null) {
                    createClientPlugin8.a(i50.g.f61389c, new h50.w0(s0Var, q0Var, u0Var.f59291f, r0Var, u0Var.f59290e, createClientPlugin8, u0Var.f59289d, null));
                    return Unit.f71706a;
                }
                Intrinsics.m("delayMillis");
                throw null;
        }
    }

    public /* synthetic */ h2(c50.g gVar) {
        this.f51570a = 22;
    }
}
