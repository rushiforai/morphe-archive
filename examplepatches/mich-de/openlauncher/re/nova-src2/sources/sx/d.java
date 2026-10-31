package sx;

import android.content.Context;
import android.content.Intent;
import android.os.Process;
import cl.l0;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.ai.NovaAiSettingsActivity;
import com.teslacoilsw.launcher.games.GamesActivity;
import java.util.Objects;
import java.util.concurrent.TimeUnit;
import k30.h0;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import l1.d1;
import mx.g0;
import p1.z2;
import tx.d4;
import tx.e4;
import vx.t;
import x80.d0;
import x80.e0;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f87756a;

    public /* synthetic */ d(int i5) {
        this.f87756a = i5;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        String string;
        switch (this.f87756a) {
            case 0:
                zy.c cVar = zy.c.f98823a;
                break;
            case 1:
                z2 z2Var = t0.q.f88173a;
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                zy.c cVar2 = zy.c.f98823a;
                zy.c.i("ai_insight_feed_impression", b70.k.e0(new Pair("surface", "left_swipe")));
                p6.f.O("nova_ai_insight_viewed", b70.k.e0(new Pair("surface", "left_swipe")));
                break;
            case 6:
                if (ps.k.f82917e) {
                    string = ps.k.f82916d;
                } else {
                    Context context = g0.f77088a;
                    string = g0.e().getApplicationContext().getSharedPreferences("nova_ai_google_session", 0).getString("google_display_name", null);
                    ps.k.f82916d = string;
                    ps.k.f82917e = true;
                }
                Context context2 = g0.f77088a;
                String string2 = g0.e().getApplicationContext().getSharedPreferences("nova_ai_google_session", 0).getString("google_email", null);
                if (string != null || string2 != null) {
                    break;
                }
            case 7:
                t tVar = t.f93370a;
                t.f93385r = false;
                break;
            case 8:
                break;
            case 9:
                d1 d1Var = NovaAiSettingsActivity.f45697u;
                break;
            case 10:
                d1 d1Var2 = NovaAiSettingsActivity.f45697u;
                break;
            case 11:
                d1 d1Var3 = NovaAiSettingsActivity.f45697u;
                break;
            case 12:
                tx.d1 d1Var4 = tx.d1.f89690a;
                tx.d1.i();
                break;
            case 13:
                break;
            case 14:
                d0 d0Var = new d0();
                TimeUnit timeUnit = TimeUnit.SECONDS;
                d0Var.c(30L, timeUnit);
                d0Var.d(30L, timeUnit);
                d0Var.e(30L);
                d0Var.a(new d4());
                break;
            case 15:
                x7.h hVar = new x7.h(5);
                hVar.b("https://esim.instabridge.com/");
                hVar.a(w20.f.f93676b);
                e0 e0Var = (e0) e4.f89714a.getValue();
                Objects.requireNonNull(e0Var, "client == null");
                hVar.f95137b = e0Var;
                break;
            case 16:
                NovaLauncher novaLauncher = NovaLauncher.f45649u1;
                Intrinsics.d(novaLauncher);
                Intent intent = new Intent("android.intent.action.MAIN");
                intent.addCategory("android.intent.category.APP_CONTACTS");
                intent.setFlags(268435456);
                l0.Q(novaLauncher, intent);
                break;
            case 17:
                NovaLauncher novaLauncher2 = NovaLauncher.f45649u1;
                Intrinsics.d(novaLauncher2);
                l0.Q(novaLauncher2, new Intent(novaLauncher2, (Class<?>) GamesActivity.class));
                break;
            case 18:
                NovaLauncher novaLauncher3 = NovaLauncher.f45649u1;
                Intrinsics.d(novaLauncher3);
                Intent intent2 = new Intent("android.intent.action.MAIN");
                intent2.addCategory("android.intent.category.APP_GALLERY");
                intent2.setFlags(268435456);
                l0.Q(novaLauncher3, intent2);
                break;
            case 19:
                NovaLauncher novaLauncher4 = NovaLauncher.f45649u1;
                Intrinsics.d(novaLauncher4);
                Intent intent3 = new Intent("android.intent.action.MAIN");
                intent3.addCategory("android.intent.category.APP_MAPS");
                intent3.setFlags(268435456);
                l0.Q(novaLauncher4, intent3);
                break;
            case 20:
                NovaLauncher novaLauncher5 = NovaLauncher.f45649u1;
                Intrinsics.d(novaLauncher5);
                h0 h0Var = h0.f70974r;
                l0.Q(novaLauncher5, ic.b.J(lm.e.p(novaLauncher5).f70981g));
                break;
            case 21:
                break;
            case 22:
                break;
            case 23:
                break;
            case 24:
                break;
            case 25:
                break;
            case 26:
                break;
            case 27:
                break;
            case 28:
                break;
            default:
                Process.killProcess(Process.myPid());
                break;
        }
        return Unit.f71706a;
    }
}
