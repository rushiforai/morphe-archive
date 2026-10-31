package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import ni.a0;

/* loaded from: classes.dex */
public final class bk2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fl2 f1445a;

    /* renamed from: b, reason: collision with root package name */
    public String f1446b;

    /* renamed from: c, reason: collision with root package name */
    public a0 f1447c;

    /* renamed from: d, reason: collision with root package name */
    public mi.g f1448d;

    /* renamed from: e, reason: collision with root package name */
    public ni.z f1449e;

    /* renamed from: f, reason: collision with root package name */
    public d f1450f;

    /* renamed from: g, reason: collision with root package name */
    public fl2 f1451g;

    /* renamed from: h, reason: collision with root package name */
    public String f1452h;

    /* renamed from: i, reason: collision with root package name */
    public /* synthetic */ Object f1453i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ fl2 f1454j;

    /* renamed from: k, reason: collision with root package name */
    public int f1455k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bk2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1454j = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1453i = obj;
        this.f1455k |= Integer.MIN_VALUE;
        return fl2.a((mi.g) null, (ni.z) null, (a0) null, this.f1454j, (String) null, this);
    }
}
