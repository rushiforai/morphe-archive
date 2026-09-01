package defpackage;

import android.view.View;
import java.lang.ref.WeakReference;
import java.util.HashSet;
import java.util.Set;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zue implements View.OnClickListener {
    public static final HashSet e = new HashSet();
    public final View.OnClickListener a;
    public final WeakReference b;
    public final WeakReference c;
    public final String d;

    public zue(View view, View view2, String str) {
        this.a = gue.f(view);
        this.b = new WeakReference(view2);
        this.c = new WeakReference(view);
        String lowerCase = str.toLowerCase();
        lowerCase.getClass();
        this.d = tuc.L(lowerCase, "activity", "");
    }

    public final void a() {
        zue zueVar;
        Set set = ec2.a;
        if (set.contains(this)) {
            return;
        }
        try {
            View view = (View) this.b.get();
            View view2 = (View) this.c.get();
            if (view == null || view2 == null) {
                return;
            }
            try {
                String strD = x0d.d(view2);
                String strB = hy9.b(view2, strD);
                if (strB != null && !wo7.u(strB, strD)) {
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("view", x0d.b(view, view2));
                    jSONObject.put("screenname", this.d);
                    if (!set.contains(this)) {
                        try {
                            zueVar = this;
                            try {
                                f94.c().execute(new q13(jSONObject, strD, zueVar, strB, 5));
                            } catch (Throwable th) {
                                th = th;
                                try {
                                    ec2.a(zueVar, th);
                                } catch (Throwable th2) {
                                    th = th2;
                                }
                            }
                        } catch (Throwable th3) {
                            th = th3;
                            zueVar = this;
                        }
                    }
                }
                return;
            } catch (Exception unused) {
                return;
            }
        } catch (Throwable th4) {
            th = th4;
            zueVar = this;
        }
        ec2.a(zueVar, th);
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            view.getClass();
            View.OnClickListener onClickListener = this.a;
            if (onClickListener != null) {
                onClickListener.onClick(view);
            }
            a();
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
