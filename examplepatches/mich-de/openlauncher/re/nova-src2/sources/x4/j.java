package x4;

import aa.t;
import ai.s1;
import android.content.Context;
import android.graphics.drawable.AnimatedVectorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.text.Html;
import android.text.method.LinkMovementMethod;
import android.view.KeyEvent;
import android.webkit.WebView;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.launcher3.CellLayout;
import com.android.launcher3.folder.Folder;
import com.android.launcher3.views.DoubleShadowBubbleTextView;
import com.google.android.gms.internal.measurement.ag;
import com.teslacoilsw.launcher.novawidget.WeatherWidget;
import com.teslacoilsw.tesladirect.ChangeLogDialog;
import e10.y2;
import java.util.Date;
import java.util.Optional;
import java.util.UUID;
import k30.l0;
import k30.s;
import k30.u;
import k30.x;
import kotlin.jvm.internal.Intrinsics;
import o9.m0;
import o9.n1;
import org.json.JSONException;
import org.json.JSONObject;
import y7.r;

/* loaded from: classes2.dex */
public final class j implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f95091a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f95092b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f95093c;

    public /* synthetic */ j(int i5, Object obj, Object obj2) {
        this.f95091a = i5;
        this.f95092b = obj;
        this.f95093c = obj2;
    }

    /* JADX WARN: Removed duplicated region for block: B:69:0x023a  */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() {
        Uri uri;
        Drawable drawableMutate;
        ga.j jVar;
        int i5 = 24;
        DoubleShadowBubbleTextView doubleShadowBubbleTextViewD0 = null;
        switch (this.f95091a) {
            case 0:
                ((e) this.f95092b).accept(this.f95093c);
                return;
            case 1:
                xn.i.b((WebView) this.f95092b, (String) this.f95093c);
                return;
            case 2:
                WeatherWidget weatherWidget = (WeatherWidget) this.f95092b;
                String str = weatherWidget.f45927q;
                weatherWidget.removeCallbacks(this);
                x xVar = weatherWidget.f45928r;
                boolean zA = xVar.a();
                k30.d dVar = xVar.f71087e;
                s sVar = xVar.f71086d;
                u uVar = xVar.f71085c;
                if (!zA) {
                    weatherWidget.f45929s = null;
                    return;
                }
                String str2 = xVar.f71091i;
                if (str2 == null || str2.length() == 0) {
                    uri = null;
                } else {
                    try {
                        uri = Uri.parse(str2);
                    } catch (Throwable unused) {
                    }
                }
                weatherWidget.f45929s = uri;
                if (weatherWidget.f45932v == uVar) {
                    x xVar2 = weatherWidget.f45933w;
                    if (xVar2.f71086d == sVar && xVar2.f71087e == dVar) {
                        mc0.d.f76206a.m("Reusing drawable", new Object[0]);
                        drawableMutate = weatherWidget.f45931u;
                    } else {
                        drawableMutate = null;
                    }
                }
                if (drawableMutate == null) {
                    mc0.d.f76206a.m("Loading new drawable", new Object[0]);
                    Drawable drawable = weatherWidget.f45930t.getDrawable(uVar.b(sVar, dVar));
                    Intrinsics.d(drawable);
                    drawableMutate = drawable.mutate();
                    weatherWidget.f45931u = drawableMutate;
                    AnimatedVectorDrawable animatedVectorDrawable = drawableMutate instanceof AnimatedVectorDrawable ? (AnimatedVectorDrawable) drawableMutate : null;
                    if (animatedVectorDrawable != null) {
                        animatedVectorDrawable.start();
                    }
                    weatherWidget.f45933w = xVar;
                    weatherWidget.f45932v = uVar;
                }
                int iN = bh.g.N(((Context) this.f95093c).getResources().getDisplayMetrics(), 24);
                drawableMutate.setBounds(0, 0, iN, iN);
                v9.d dVar2 = weatherWidget.f45926p;
                if (dVar2 == null) {
                    Intrinsics.m("binding");
                    throw null;
                }
                TextView textView = (TextView) dVar2.f92302g;
                y2.f51877a.getClass();
                textView.setText(((l0) y2.D1().l()).d(str, xVar.f71083a) + " — " + lx.d.h(uVar.name()));
                v9.d dVar3 = weatherWidget.f45926p;
                if (dVar3 == null) {
                    Intrinsics.m("binding");
                    throw null;
                }
                ((TextView) dVar3.f92303h).setText("Feels Like ".concat(((l0) y2.D1().l()).d(str, xVar.f71084b)));
                v9.d dVar4 = weatherWidget.f45926p;
                if (dVar4 == null) {
                    Intrinsics.m("binding");
                    throw null;
                }
                ((TextView) dVar4.f92301f).setText(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                v9.d dVar5 = weatherWidget.f45926p;
                if (dVar5 == null) {
                    Intrinsics.m("binding");
                    throw null;
                }
                ((ImageView) dVar5.f92298c).setImageDrawable(drawableMutate);
                v9.d dVar6 = weatherWidget.f45926p;
                if (dVar6 == null) {
                    Intrinsics.m("binding");
                    throw null;
                }
                ((TextView) dVar6.f92299d).setText(xVar.f71088f);
                v9.d dVar7 = weatherWidget.f45926p;
                if (dVar7 == null) {
                    Intrinsics.m("binding");
                    throw null;
                }
                ((TextView) dVar7.f92300e).setText("Refreshed " + ((wa0.b) weatherWidget.f45936z.getValue()).c(new Date(xVar.f71090h)));
                weatherWidget.postDelayed(this, 60000L);
                return;
            case 3:
                if (((r) this.f95093c).f96764a.f98296a instanceof z7.a) {
                    return;
                }
                try {
                    o7.i iVar = (o7.i) ((z7.j) this.f95092b).get();
                    if (iVar == null) {
                        throw new IllegalStateException("Worker was marked important (" + ((r) this.f95093c).f96766c.f95173c + ") but did not provide ForegroundInfo");
                    }
                    o7.r rVarC = o7.r.c();
                    int i11 = r.f96763g;
                    String str3 = ((r) this.f95093c).f96766c.f95173c;
                    rVarC.getClass();
                    r rVar = (r) this.f95093c;
                    z7.j jVar2 = rVar.f96764a;
                    y7.s sVar2 = rVar.f96768e;
                    Context context = rVar.f96765b;
                    UUID id2 = rVar.f96767d.getId();
                    sVar2.getClass();
                    z7.j jVar3 = new z7.j();
                    sVar2.f96770a.a(new s1(sVar2, jVar3, id2, iVar, context));
                    jVar2.l(jVar3);
                    return;
                } catch (Throwable th2) {
                    ((r) this.f95093c).f96764a.k(th2);
                    return;
                }
            case 4:
                n1 n1Var = (n1) ((vm.c) this.f95093c).f92857b;
                Folder folder = (Folder) this.f95092b;
                int iE0 = folder.e0();
                ga.c cVar = folder.f21115m;
                if (iE0 <= 1) {
                    if (iE0 == 1) {
                        CellLayout cellLayoutI0 = n1Var.I0(cVar.f57291c, cVar.f57292d);
                        jVar = (ga.j) cVar.H.remove(0);
                        jVar.f57303q.h(cVar.f57303q.e());
                        doubleShadowBubbleTextViewD0 = n1Var.D0(cellLayoutI0, jVar);
                        n1Var.f80002c0.b(jVar, cVar.f57291c, cVar.f57292d, cVar.f57293e, cVar.f57294f);
                    } else {
                        jVar = null;
                    }
                    n1Var.T0(folder.f21116p, cVar, true);
                    KeyEvent.Callback callback = folder.f21116p;
                    if (callback instanceof m0) {
                        folder.f21114l.s((m0) callback);
                    }
                    if (doubleShadowBubbleTextViewD0 != null) {
                        n1Var.O.g(doubleShadowBubbleTextViewD0, cVar);
                        doubleShadowBubbleTextViewD0.requestFocus();
                    }
                    if (jVar != null) {
                        ea.e eVarA = n1Var.O().a().a(jVar);
                        ((ea.e) Optional.ofNullable(folder.f21114l.f95713i).map(new t(i5)).map(new com.google.firebase.crashlytics.internal.persistence.d(eVarA, 11)).orElse(eVarA)).b(ea.d.LAUNCHER_FOLDER_CONVERTED_TO_ICON);
                        return;
                    }
                    return;
                }
                return;
            default:
                og.i iVar2 = (og.i) this.f95093c;
                ChangeLogDialog changeLogDialog = (ChangeLogDialog) iVar2.f80413c;
                changeLogDialog.f46518u = false;
                changeLogDialog.f46517t.f92370l.setVisibility(8);
                try {
                    JSONObject jSONObject = new JSONObject((String) this.f95092b);
                    try {
                        changeLogDialog.f46515r = jSONObject.getInt("versionCode");
                        changeLogDialog.f46517t.f92365g.setText(changeLogDialog.getString(2132018093, jSONObject.getString("versionName")));
                        if (changeLogDialog.f46515r == ps.f.h(changeLogDialog)) {
                            changeLogDialog.f46517t.f92371m.setVisibility(0);
                            changeLogDialog.f46517t.f92369k.setVisibility(8);
                        } else {
                            try {
                                if (jSONObject.getBoolean("showUpdateButton")) {
                                    if (!changeLogDialog.a0() || ((ag) iVar2.f80412b).f32385a == 1) {
                                        changeLogDialog.f46517t.f92369k.setVisibility(8);
                                    } else {
                                        changeLogDialog.f46517t.f92369k.setVisibility(0);
                                    }
                                    changeLogDialog.f46517t.f92368j.setVisibility(8);
                                    changeLogDialog.f46517t.f92361c.setVisibility(0);
                                }
                            } catch (Exception unused2) {
                            }
                        }
                        changeLogDialog.f46517t.f92363e.setVisibility(0);
                        changeLogDialog.f46517t.f92362d.setText(Html.fromHtml(jSONObject.getString("log").replace("\n", "<br />\n")));
                        changeLogDialog.f46517t.f92362d.setLinksClickable(true);
                        changeLogDialog.f46517t.f92362d.setMovementMethod(LinkMovementMethod.getInstance());
                        changeLogDialog.f46517t.f92362d.setVisibility(0);
                        return;
                    } catch (JSONException unused3) {
                        changeLogDialog.f46517t.f92365g.setText(changeLogDialog.getString(2132018093, "unknown"));
                        return;
                    }
                } catch (JSONException e3) {
                    e3.printStackTrace();
                    return;
                }
        }
    }

    public /* synthetic */ j(Object obj, Object obj2, boolean z11, int i5) {
        this.f95091a = i5;
        this.f95093c = obj;
        this.f95092b = obj2;
    }

    public j(xn.i iVar, WebView webView, String str) {
        this.f95091a = 1;
        this.f95092b = webView;
        this.f95093c = str;
    }
}
