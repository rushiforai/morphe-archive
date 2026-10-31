package cs;

import androidx.fragment.app.m0;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import w70.i2;

/* loaded from: classes4.dex */
public final class n implements w70.m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ w70.m f47834a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p f47835b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ m0 f47836c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f47837d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ String f47838e;

    public n(i2 i2Var, p pVar, m0 m0Var, String str, String str2) {
        this.f47834a = i2Var;
        this.f47835b = pVar;
        this.f47836c = m0Var;
        this.f47837d = str;
        this.f47838e = str2;
    }

    @Override // w70.m
    public final Object collect(w70.n nVar, Continuation continuation) {
        Object objCollect = this.f47834a.collect(new m(nVar, this.f47835b, this.f47836c, this.f47837d, this.f47838e), continuation);
        return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
    }
}
