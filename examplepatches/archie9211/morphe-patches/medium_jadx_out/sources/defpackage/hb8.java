package defpackage;

import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.TextView;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.common.post.paragraph.ParagraphView;
import com.medium.reader.R;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class hb8 implements x45 {
    public final /* synthetic */ int a;

    public /* synthetic */ hb8(q73 q73Var) {
        this.a = 26;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        gnb gnbVarB0;
        rk6 rk6Var;
        ComposeView composeView;
        int i = this.a;
        String strD0 = null;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return sz3.d(f76.Q(700, 0, null, 6), 2);
            case 1:
                return ((ba8) obj).f;
            case 2:
                View view = (View) obj;
                view.getClass();
                Object parent = view.getParent();
                if (parent instanceof View) {
                    return (View) parent;
                }
                return null;
            case 3:
                View view2 = (View) obj;
                view2.getClass();
                Object tag = view2.getTag(R.id.nav_controller_view_tag);
                if (tag instanceof WeakReference) {
                    return (db8) ((WeakReference) tag).get();
                }
                if (tag instanceof db8) {
                    return (db8) tag;
                }
                return null;
            case 4:
                return c1eVar;
            case 5:
                ir irVar = ((ig8) obj).a;
                if (irVar != null) {
                    irVar.invoke();
                }
                return c1eVar;
            case 6:
                jyb jybVar = (jyb) obj;
                jybVar.getClass();
                hyb.a(jybVar);
                return c1eVar;
            case 7:
                ((Long) obj).getClass();
                return c1eVar;
            case 8:
                jyb jybVar2 = (jyb) obj;
                jybVar2.getClass();
                hyb.a(jybVar2);
                return c1eVar;
            case 9:
                return Boolean.valueOf(muc.Q((String) ((dv6) obj).k, "notification", false));
            case 10:
                xne xneVar = (xne) obj;
                return xne.a(xneVar, bt4.FOLLOWING, new ag8(xneVar.g.a()), 159);
            case 11:
                jyb jybVar3 = (jyb) obj;
                jybVar3.getClass();
                hyb.a(jybVar3);
                return c1eVar;
            case 12:
                anb anbVar = (anb) obj;
                anbVar.getClass();
                gnbVarB0 = anbVar.B0("SELECT id FROM offline_catalog WHERE is_reading_list = 1");
                try {
                    if (gnbVarB0.w0() && !gnbVarB0.isNull(0)) {
                        strD0 = gnbVarB0.d0(0);
                        break;
                    }
                    return strD0;
                } finally {
                }
            case 13:
                anb anbVar2 = (anb) obj;
                anbVar2.getClass();
                try {
                    anbVar2.B0("DELETE FROM offline_catalog").w0();
                    return c1eVar;
                } finally {
                }
            case 14:
                anb anbVar3 = (anb) obj;
                anbVar3.getClass();
                try {
                    anbVar3.B0("DELETE FROM offline_post").w0();
                    return c1eVar;
                } finally {
                }
            case 15:
                anb anbVar4 = (anb) obj;
                anbVar4.getClass();
                gnbVarB0 = anbVar4.B0("SELECT id FROM offline_post");
                try {
                    ArrayList arrayList = new ArrayList();
                    while (gnbVarB0.w0()) {
                        arrayList.add(gnbVarB0.d0(0));
                        break;
                    }
                    return arrayList;
                } finally {
                }
            case 16:
                anb anbVar5 = (anb) obj;
                anbVar5.getClass();
                gnbVarB0 = anbVar5.B0("SELECT id FROM offline_post");
                try {
                    ArrayList arrayList2 = new ArrayList();
                    while (gnbVarB0.w0()) {
                        arrayList2.add(gnbVarB0.d0(0));
                        break;
                    }
                    return arrayList2;
                } finally {
                }
            case 17:
                t22 t22Var = (t22) obj;
                int i2 = tq.a;
                sn3 sn3Var = eo.b;
                i89 i89Var = (i89) t22Var;
                i89Var.getClass();
                Context context = (Context) m40.U(i89Var, sn3Var);
                i89 i89Var2 = (i89) t22Var;
                m73 m73Var = (m73) m40.U(i89Var2, z22.h);
                dx8 dx8Var = (dx8) m40.U(i89Var2, ex8.a);
                if (dx8Var == null) {
                    return null;
                }
                return new fp(context, m73Var, dx8Var.a, dx8Var.b);
            case 18:
                return c1eVar;
            case 19:
                return Boolean.TRUE;
            case 20:
                wld.a.e((Throwable) obj, "Error building paragraph", new Object[0]);
                return c1eVar;
            case 21:
                FrameLayout frameLayout = (FrameLayout) obj;
                frameLayout.getClass();
                Object tag2 = frameLayout.getTag(-1712675874);
                sh3 sh3Var = tag2 instanceof sh3 ? (sh3) tag2 : null;
                if (sh3Var != null) {
                    sh3Var.dispose();
                }
                frameLayout.setTag(-1712675874, null);
                View childAt = frameLayout.getChildAt(0);
                ParagraphView paragraphView = childAt instanceof ParagraphView ? (ParagraphView) childAt : null;
                if (paragraphView != null && (composeView = paragraphView.getComposeView()) != null) {
                    composeView.e();
                }
                View media = paragraphView != null ? paragraphView.getMedia() : null;
                ComposeView composeView2 = media instanceof ComposeView ? (ComposeView) media : null;
                if (composeView2 != null) {
                    composeView2.e();
                }
                if (paragraphView != null) {
                    TextView textView = paragraphView.c;
                    ViewTreeObserver viewTreeObserver = textView != null ? textView.getViewTreeObserver() : null;
                    if (viewTreeObserver != null && viewTreeObserver.isAlive() && (rk6Var = paragraphView.l) != null) {
                        viewTreeObserver.removeOnPreDrawListener(rk6Var);
                    }
                    paragraphView.l = null;
                }
                return c1eVar;
            case 22:
                wld.a.e((Throwable) obj, "Error building paragraph", new Object[0]);
                return c1eVar;
            case 23:
                obj.getClass();
                return Boolean.valueOf(obj instanceof e39);
            case 24:
                obj.getClass();
                return Boolean.valueOf(obj instanceof f39);
            case 25:
                jyb jybVar4 = (jyb) obj;
                jybVar4.getClass();
                hyb.a(jybVar4);
                return c1eVar;
            case 26:
                throw y30.k(obj);
            case 27:
                wld.a.b((Throwable) obj, "Failed to observe scroll.", new Object[0]);
                return c1eVar;
            case 28:
                ((MotionEvent) obj).getClass();
                return Boolean.FALSE;
            default:
                jyb jybVar5 = (jyb) obj;
                jybVar5.getClass();
                hyb.a(jybVar5);
                return c1eVar;
        }
    }

    public /* synthetic */ hb8(int i) {
        this.a = i;
    }
}
