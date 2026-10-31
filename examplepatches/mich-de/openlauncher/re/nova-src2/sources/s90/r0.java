package s90;

import android.content.Intent;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.view.ActionMode;
import android.view.View;
import android.view.ViewGroup;
import com.android.launcher3.dragndrop.DragLayer;
import com.android.launcher3.folder.FolderIcon;
import com.android.launcher3.views.FloatingIconView;
import java.net.URI;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import o9.d4;
import org.chromium.net.CronetException;
import org.chromium.net.UrlResponseInfo;
import org.json.JSONObject;

/* loaded from: classes5.dex */
public final /* synthetic */ class r0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f87006a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f87007b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f87008c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f87009d;

    public /* synthetic */ r0(int i5, Object obj, Object obj2, Object obj3) {
        this.f87006a = i5;
        this.f87007b = obj;
        this.f87008c = obj2;
        this.f87009d = obj3;
    }

    @Override // java.lang.Runnable
    public final void run() {
        JSONObject jSONObjectOptJSONObject;
        switch (this.f87006a) {
            case 0:
                a1 a1Var = (a1) this.f87007b;
                String str = (String) this.f87008c;
                g1 g1Var = (g1) this.f87009d;
                String string = URI.create(a1Var.f86865m).resolve(str).toString();
                a1Var.f86866p = string;
                a1Var.f86857e.add(string);
                a1Var.g(2, 3, new kz.c(29, a1Var, g1Var));
                return;
            case 1:
                x0 x0Var = (x0) this.f87007b;
                UrlResponseInfo urlResponseInfo = (UrlResponseInfo) this.f87008c;
                CronetException cronetException = (CronetException) this.f87009d;
                a1 a1Var2 = x0Var.f87058d;
                try {
                    x0Var.f87055a.onFailed(a1Var2, urlResponseInfo, cronetException);
                } catch (Exception e3) {
                    a1.a(a1Var2, "onFailed", e3);
                }
                x0Var.f87058d.d("maybeReportMetrics", new d4(x0Var, 7));
                a1Var2.f86869s.f86964e.decrementAndGet();
                return;
            case 2:
                tm.f fVar = (tm.f) this.f87007b;
                Intent intent = (Intent) this.f87008c;
                fi.j jVar = (fi.j) this.f87009d;
                try {
                    fVar.b(intent);
                    return;
                } finally {
                    jVar.a(null);
                }
            case 3:
                wm.e eVar = (wm.e) this.f87007b;
                String str2 = (String) this.f87008c;
                xm.e eVar2 = (xm.e) this.f87009d;
                x7.l lVar = eVar.f94610a;
                yl.d dVar = (yl.d) ((nm.c) lVar.f95145a).get();
                if (dVar == null) {
                    return;
                }
                JSONObject jSONObject = eVar2.f96113e;
                if (jSONObject.length() < 1) {
                    return;
                }
                JSONObject jSONObject2 = eVar2.f96110b;
                if (jSONObject2.length() >= 1 && (jSONObjectOptJSONObject = jSONObject.optJSONObject(str2)) != null) {
                    String strOptString = jSONObjectOptJSONObject.optString("choiceId");
                    if (strOptString.isEmpty()) {
                        return;
                    }
                    synchronized (((Map) lVar.f95146b)) {
                        try {
                            if (!strOptString.equals(((Map) lVar.f95146b).get(str2))) {
                                ((Map) lVar.f95146b).put(str2, strOptString);
                                Bundle bundle = new Bundle();
                                bundle.putString("arm_key", str2);
                                bundle.putString("arm_value", jSONObject2.optString(str2));
                                bundle.putString("personalization_id", jSONObjectOptJSONObject.optString("personalizationId"));
                                bundle.putInt("arm_index", jSONObjectOptJSONObject.optInt("armIndex", -1));
                                bundle.putString("group", jSONObjectOptJSONObject.optString("group"));
                                yl.e eVar3 = (yl.e) dVar;
                                eVar3.a("fp", "personalization_assignment", bundle);
                                Bundle bundle2 = new Bundle();
                                bundle2.putString("_fpid", strOptString);
                                eVar3.a("fp", "_fpc", bundle2);
                            }
                        } finally {
                        }
                    }
                    return;
                }
                return;
            case 4:
                y0.f fVar2 = (y0.f) this.f87007b;
                y0.o oVar = (y0.o) this.f87008c;
                y0.e eVar4 = (y0.e) this.f87009d;
                ActionMode actionModeStartActionMode = fVar2.f96512a.startActionMode(new y0.m(oVar), 1);
                Intrinsics.b(fVar2.f96519h, actionModeStartActionMode);
                if (actionModeStartActionMode == null) {
                    eVar4.close();
                    return;
                }
                return;
            case 5:
                FolderIcon folderIcon = (FolderIcon) this.f87007b;
                o9.l0 l0Var = (o9.l0) this.f87008c;
                c00.d dVar2 = (c00.d) this.f87009d;
                aa.n nVar = FolderIcon.f21127f0;
                l0Var.f79961m.a(folderIcon.getContext(), folderIcon.I.H, dVar2);
                folderIcon.postDelayed(new s0(folderIcon, dVar2, l0Var.n), 400L);
                return;
            case 6:
                FloatingIconView floatingIconView = (FloatingIconView) this.f87007b;
                View view = (View) this.f87008c;
                DragLayer dragLayer = (DragLayer) this.f87009d;
                floatingIconView.f21262a = null;
                za.q.g(view, true);
                floatingIconView.getClass();
                ((ViewGroup) dragLayer.getParent()).removeView(floatingIconView);
                dragLayer.removeView(floatingIconView.n);
                floatingIconView.d();
                floatingIconView.f21264c.B.u(2131624151, floatingIconView);
                return;
            default:
                FloatingIconView floatingIconView2 = (FloatingIconView) this.f87007b;
                CancellationSignal cancellationSignal = (CancellationSignal) this.f87008c;
                View view2 = (View) this.f87009d;
                za.p pVar = FloatingIconView.o;
                floatingIconView2.getClass();
                if (cancellationSignal.isCanceled()) {
                    return;
                }
                za.p pVar2 = floatingIconView2.f21268g;
                floatingIconView2.e(pVar2.f98478c, pVar2.f98479d, pVar2.f98477b, pVar2.f98480e);
                floatingIconView2.setVisibility(0);
                za.q.g(view2, false);
                return;
        }
    }

    public /* synthetic */ r0(FolderIcon folderIcon, o9.l0 l0Var, c00.d dVar, int i5, ga.j jVar) {
        this.f87006a = 5;
        this.f87007b = folderIcon;
        this.f87008c = l0Var;
        this.f87009d = dVar;
    }
}
