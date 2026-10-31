package ah;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import ft.u;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Map;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import mk.v;
import p1.e1;
import p1.n;
import p1.o;
import p1.s2;
import p1.t;
import p1.t1;
import s10.s;
import sg.m;
import t70.j0;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public Object f12803a;

    /* renamed from: b, reason: collision with root package name */
    public Object f12804b;

    /* renamed from: c, reason: collision with root package name */
    public Object f12805c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f12806d;

    public a() {
        this.f12806d = new a5.d(this, 4);
    }

    public void a(j0 j0Var, o oVar, int i5) {
        t tVar = (t) oVar;
        tVar.d0(-404945498);
        if ((((tVar.h(j0Var) ? 4 : 2) | i5 | (tVar.h(this) ? 32 : 16)) & 19) == 18 && tVar.E()) {
            tVar.V();
        } else {
            boolean z11 = ((Boolean) ((s2) ((e1) this.f12805c)).getValue()).booleanValue() && f() != null;
            tVar.b0(-1531180671);
            boolean zH = tVar.h(this) | tVar.h(j0Var);
            Object objP = tVar.P();
            if (zH || objP == n.f81514a) {
                objP = new s(4, this, j0Var);
                tVar.m0(objP);
            }
            tVar.p(false);
            v.b(z11, (Function0) objP, 0, tVar, 0);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new r00.n(this, j0Var, i5, 5);
        }
    }

    public abstract void b(a5.d dVar);

    public String c() {
        return (String) this.f12804b;
    }

    public u d() {
        return (u) this.f12803a;
    }

    public String e() {
        return (String) this.f12805c;
    }

    public String f() {
        return (String) ((s2) ((e1) this.f12803a)).getValue();
    }

    public FrameLayout g(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        FrameLayout frameLayout = new FrameLayout(layoutInflater.getContext());
        m(bundle, new g(this, frameLayout, layoutInflater, viewGroup, bundle));
        if (((c) this.f12803a) == null) {
            pg.b bVar = pg.b.f82559e;
            Context context = frameLayout.getContext();
            int iB = bVar.b(context, pg.c.f82561a);
            String strC = m.c(context, iB);
            String strE = m.e(context, iB);
            LinearLayout linearLayout = new LinearLayout(frameLayout.getContext());
            linearLayout.setOrientation(1);
            linearLayout.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
            frameLayout.addView(linearLayout);
            TextView textView = new TextView(frameLayout.getContext());
            textView.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
            textView.setText(strC);
            linearLayout.addView(textView);
            Intent intentA = bVar.a(context, iB, null);
            if (intentA != null) {
                Button button = new Button(context);
                button.setId(16908313);
                button.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
                button.setText(strE);
                linearLayout.addView(button);
                button.setOnClickListener(new h(context, intentA));
            }
        }
        return frameLayout;
    }

    public void h(Bundle bundle) {
        c cVar = (c) this.f12803a;
        if (cVar != null) {
            cVar.onSaveInstanceState(bundle);
            return;
        }
        Bundle bundle2 = (Bundle) this.f12804b;
        if (bundle2 != null) {
            bundle.putAll(bundle2);
        }
    }

    public abstract Object i(ContinuationImpl continuationImpl);

    public abstract Object j(String str, Continuation continuation);

    public void k(float f11) {
        ((s2) ((e1) this.f12804b)).setValue(new y3.f(f11));
    }

    public void l(int i5) {
        while (!((LinkedList) this.f12805c).isEmpty() && ((j) ((LinkedList) this.f12805c).getLast()).a() >= i5) {
            ((LinkedList) this.f12805c).removeLast();
        }
    }

    public void m(Bundle bundle, j jVar) {
        if (((c) this.f12803a) != null) {
            jVar.b();
            return;
        }
        if (((LinkedList) this.f12805c) == null) {
            this.f12805c = new LinkedList();
        }
        ((LinkedList) this.f12805c).add(jVar);
        if (bundle != null) {
            Bundle bundle2 = (Bundle) this.f12804b;
            if (bundle2 == null) {
                this.f12804b = (Bundle) bundle.clone();
            } else {
                bundle2.putAll(bundle);
            }
        }
        b((a5.d) this.f12806d);
    }

    public a(u uVar, String str, String str2, Map map) {
        this.f12803a = uVar;
        this.f12804b = str;
        this.f12805c = str2;
        this.f12806d = map;
    }

    public a(String str, boolean z11) {
        this.f12803a = androidx.compose.runtime.d.k(str);
        this.f12804b = androidx.compose.runtime.d.k(new y3.f(0));
        this.f12805c = androidx.compose.runtime.d.k(Boolean.valueOf(z11));
        this.f12806d = new LinkedHashMap();
    }
}
