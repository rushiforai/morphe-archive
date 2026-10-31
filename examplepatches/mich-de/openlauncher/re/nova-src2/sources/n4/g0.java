package n4;

import android.os.Bundle;
import l1.a2;

/* loaded from: classes2.dex */
public abstract class g0 {

    /* renamed from: a, reason: collision with root package name */
    public r f77807a;

    /* renamed from: b, reason: collision with root package name */
    public CharSequence f77808b;

    /* renamed from: c, reason: collision with root package name */
    public CharSequence f77809c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f77810d = false;

    public void a(Bundle bundle) {
        if (this.f77810d) {
            bundle.putCharSequence("android.summaryText", this.f77809c);
        }
        CharSequence charSequence = this.f77808b;
        if (charSequence != null) {
            bundle.putCharSequence("android.title.big", charSequence);
        }
        bundle.putString("androidx.core.app.extra.COMPAT_TEMPLATE", c());
    }

    public abstract void b(a2 a2Var);

    public abstract String c();

    public void d(Bundle bundle) {
        if (bundle.containsKey("android.summaryText")) {
            this.f77809c = bundle.getCharSequence("android.summaryText");
            this.f77810d = true;
        }
        this.f77808b = bundle.getCharSequence("android.title.big");
    }
}
