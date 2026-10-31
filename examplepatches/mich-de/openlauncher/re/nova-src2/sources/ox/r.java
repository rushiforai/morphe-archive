package ox;

import android.app.Activity;
import b.c0;
import e00.t5;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class r {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81107a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Activity f81108b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f81109c;

    public /* synthetic */ r(Activity activity, Function0 function0, int i5) {
        this.f81107a = i5;
        this.f81108b = activity;
        this.f81109c = function0;
    }

    public final void a(ex.a aVar) {
        switch (this.f81107a) {
            case 0:
                t5 t5Var = (t5) this.f81109c;
                u.a(this.f81108b);
                u.e();
                t5Var.invoke();
                break;
            default:
                if (aVar != null) {
                    mc0.d.f76206a.n(c0.k("Consent form error: ", aVar.f53057b), new Object[0]);
                }
                u.a(this.f81108b);
                u.e();
                this.f81109c.invoke();
                break;
        }
    }
}
