package e10;

import android.content.ComponentName;
import com.teslacoilsw.launcher.preferences.SettingsActivity;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class m3 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51659a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f51660b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f51661c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f51662d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f51663e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f51664f;

    public /* synthetic */ m3(b2.t tVar, hv.a1 a1Var, boolean z11, Function1 function1, i0.i iVar, int i5) {
        this.f51660b = tVar;
        this.f51662d = a1Var;
        this.f51661c = z11;
        this.f51663e = function1;
        this.f51664f = iVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f51659a;
        Object obj3 = this.f51664f;
        Object obj4 = this.f51663e;
        Object obj5 = this.f51662d;
        switch (i5) {
            case 0:
                p1.o oVar = (p1.o) obj;
                ((Integer) obj2).getClass();
                ComponentName componentName = SettingsActivity.f45966y;
                ((SettingsActivity) obj5).Z((o2.g) obj4, (String) obj3, this.f51660b, this.f51661c, oVar, p1.a0.l(7));
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(1);
                android.support.v4.media.session.b.l(this.f51660b, (hv.a1) obj5, this.f51661c, (Function1) obj4, (i0.i) obj3, (p1.o) obj, iL);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(196615);
                iy.p0.d((o2.g) obj4, (String) obj3, this.f51660b, this.f51661c, (i2.v0) obj5, (p1.o) obj, iL2);
                break;
            case 3:
                ((Integer) obj2).getClass();
                int iL3 = p1.a0.l(1);
                io.sentry.config.a.c(this.f51660b, (String) obj3, (Function0) obj5, (Function0) obj4, this.f51661c, (p1.o) obj, iL3);
                break;
            case 4:
                ((Integer) obj2).getClass();
                int iL4 = p1.a0.l(3073);
                ph.a.c(this.f51661c, (String) obj3, (String) obj5, this.f51660b, (Function0) obj4, (p1.o) obj, iL4);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL5 = p1.a0.l(433);
                p6.u.d(this.f51660b, (Function2) obj5, (Function2) obj4, this.f51661c, (Function0) obj3, (p1.o) obj, iL5);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ m3(b2.t tVar, String str, Function0 function0, Function0 function02, boolean z11, int i5) {
        this.f51660b = tVar;
        this.f51664f = str;
        this.f51662d = function0;
        this.f51663e = function02;
        this.f51661c = z11;
    }

    public /* synthetic */ m3(b2.t tVar, Function2 function2, Function2 function22, boolean z11, Function0 function0, int i5) {
        this.f51660b = tVar;
        this.f51662d = function2;
        this.f51663e = function22;
        this.f51661c = z11;
        this.f51664f = function0;
    }

    public /* synthetic */ m3(SettingsActivity settingsActivity, o2.g gVar, String str, b2.t tVar, boolean z11, int i5) {
        this.f51662d = settingsActivity;
        this.f51663e = gVar;
        this.f51664f = str;
        this.f51660b = tVar;
        this.f51661c = z11;
    }

    public /* synthetic */ m3(o2.g gVar, String str, b2.t tVar, boolean z11, i2.v0 v0Var, int i5) {
        this.f51663e = gVar;
        this.f51664f = str;
        this.f51660b = tVar;
        this.f51661c = z11;
        this.f51662d = v0Var;
    }

    public /* synthetic */ m3(boolean z11, String str, String str2, b2.t tVar, Function0 function0, int i5) {
        this.f51661c = z11;
        this.f51664f = str;
        this.f51662d = str2;
        this.f51660b = tVar;
        this.f51663e = function0;
    }
}
