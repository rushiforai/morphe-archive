package un;

import android.view.View;
import com.google.android.gms.internal.consent_sdk.v;

/* loaded from: classes3.dex */
public abstract class b {
    public static k b(c cVar, v vVar) {
        if (!tn.a.f89541a.f19873a) {
            throw new IllegalStateException("Method called before OM SDK activation");
        }
        x7.f.j(cVar, "AdSessionConfiguration is null");
        x7.f.j(vVar, "AdSessionContext is null");
        return new k(cVar, vVar);
    }

    public abstract void a(View view, f fVar, String str);

    public abstract void c();

    public abstract void d(View view);

    public abstract void e();
}
