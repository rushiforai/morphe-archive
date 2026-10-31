package b10;

import android.content.Context;
import android.net.Uri;
import com.teslacoilsw.launcher.onboarding.FirstRunActivityCompose;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class t implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16907a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t70.j0 f16908b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Context f16909c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ w20.l f16910d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f16911e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f16912f;

    public /* synthetic */ t(t70.j0 j0Var, Context context, w20.l lVar, p1.e1 e1Var, p1.e1 e1Var2, int i5) {
        this.f16907a = i5;
        this.f16908b = j0Var;
        this.f16909c = context;
        this.f16910d = lVar;
        this.f16911e = e1Var;
        this.f16912f = e1Var2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = this.f16907a;
        t70.j0 j0Var = this.f16908b;
        Uri uri = (Uri) obj;
        switch (i5) {
            case 0:
                int i11 = FirstRunActivityCompose.f45937s;
                if (uri != null) {
                    a80.e eVar = t70.y0.f88884a;
                    t70.m0.t(j0Var, a80.d.f488c, null, new o0(this.f16909c, uri, this.f16910d, this.f16911e, this.f16912f, null, 0), 2);
                    break;
                } else {
                    break;
                }
            default:
                if (uri != null) {
                    a80.e eVar2 = t70.y0.f88884a;
                    t70.m0.t(j0Var, a80.d.f488c, null, new o0(this.f16909c, uri, this.f16910d, this.f16911e, this.f16912f, null, 1), 2);
                    break;
                } else {
                    break;
                }
        }
        return Unit.f71706a;
    }
}
