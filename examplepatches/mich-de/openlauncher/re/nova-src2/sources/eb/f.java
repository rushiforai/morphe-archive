package eb;

import a5.a1;
import android.content.Context;
import android.text.Spanned;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.accessibility.AccessibilityManager;
import android.widget.TextView;
import com.android.launcher3.AppWidgetResizeFrame;
import com.android.launcher3.widget.picker.WidgetsFullSheet;
import com.android.launcher3.widget.picker.WidgetsRecyclerView;
import java.util.WeakHashMap;
import l10.z;
import q.b0;
import t70.g2;

/* loaded from: classes2.dex */
public final class f implements View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52471a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f52472b;

    public /* synthetic */ f(Object obj, int i5) {
        this.f52471a = i5;
        this.f52472b = obj;
    }

    private final void a(View view) {
    }

    private final void b(View view) {
    }

    private final void c(View view) {
    }

    private final void d(View view) {
    }

    private final void e(View view) {
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        int i5 = this.f52471a;
        Object obj = this.f52472b;
        switch (i5) {
            case 0:
                WidgetsFullSheet widgetsFullSheet = (WidgetsFullSheet) obj;
                WidgetsRecyclerView widgetsRecyclerView = ((h) widgetsFullSheet.A.get(2)).f52477d;
                if (widgetsFullSheet.L && widgetsRecyclerView != null) {
                    widgetsRecyclerView.f();
                    break;
                }
                break;
            case 1:
                fk.m mVar = (fk.m) obj;
                AccessibilityManager accessibilityManager = mVar.f55217q;
                if (mVar.f55218r != null && accessibilityManager != null) {
                    WeakHashMap weakHashMap = a1.f250a;
                    if (mVar.isAttachedToWindow()) {
                        accessibilityManager.addTouchExplorationStateChangeListener(new b5.b(mVar.f55218r));
                        break;
                    }
                }
                break;
            case 2:
                i2.e eVar = (i2.e) obj;
                Context context = view.getContext();
                if (!eVar.f61107d) {
                    context.getApplicationContext().registerComponentCallbacks(eVar.f61108e);
                    eVar.f61107d = true;
                    break;
                }
                break;
            case 5:
                ox.q.b((ox.q) obj, view);
                break;
        }
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        AccessibilityManager accessibilityManager;
        switch (this.f52471a) {
            case 0:
                break;
            case 1:
                fk.m mVar = (fk.m) this.f52472b;
                f10.o oVar = mVar.f55218r;
                if (oVar != null && (accessibilityManager = mVar.f55217q) != null) {
                    accessibilityManager.removeTouchExplorationStateChangeListener(new b5.b(oVar));
                    break;
                }
                break;
            case 2:
                i2.e eVar = (i2.e) this.f52472b;
                Context context = view.getContext();
                if (eVar.f61107d) {
                    context.getApplicationContext().unregisterComponentCallbacks(eVar.f61108e);
                    eVar.f61107d = false;
                    break;
                }
                break;
            case 3:
                TextView textView = (TextView) this.f52472b;
                CharSequence text = textView.getText();
                Object[] spans = (TextUtils.isEmpty(text) || !(text instanceof Spanned)) ? null : ((Spanned) text).getSpans(0, text.length(), l60.g.class);
                if (spans != null && spans.length > 0) {
                    for (Object obj : spans) {
                        ((l60.g) obj).f74767k = null;
                    }
                }
                textView.removeOnAttachStateChangeListener(this);
                textView.setTag(2131428310, null);
                break;
            case 4:
                ((AppWidgetResizeFrame) this.f52472b).K(false);
                break;
            case 5:
                ox.q qVar = (ox.q) this.f52472b;
                g2 g2Var = (g2) qVar.f81106f;
                if (g2Var != null) {
                    g2Var.c(null);
                }
                qVar.f81106f = null;
                cw.q qVar2 = (cw.q) qVar.f81103c;
                if (qVar2 != null) {
                    qVar2.f48267b = false;
                    if (qVar2.f48266a) {
                        qVar2.f48266a = false;
                        ((z) qVar2.f48268c).invoke(Boolean.FALSE);
                        break;
                    }
                }
                break;
            case 6:
                q.e eVar2 = (q.e) this.f52472b;
                ViewTreeObserver viewTreeObserver = eVar2.f83214x;
                if (viewTreeObserver != null) {
                    if (!viewTreeObserver.isAlive()) {
                        eVar2.f83214x = view.getViewTreeObserver();
                    }
                    eVar2.f83214x.removeGlobalOnLayoutListener(eVar2.f83201i);
                }
                view.removeOnAttachStateChangeListener(this);
                break;
            default:
                b0 b0Var = (b0) this.f52472b;
                ViewTreeObserver viewTreeObserver2 = b0Var.o;
                if (viewTreeObserver2 != null) {
                    if (!viewTreeObserver2.isAlive()) {
                        b0Var.o = view.getViewTreeObserver();
                    }
                    b0Var.o.removeGlobalOnLayoutListener(b0Var.f83178i);
                }
                view.removeOnAttachStateChangeListener(this);
                break;
        }
    }
}
