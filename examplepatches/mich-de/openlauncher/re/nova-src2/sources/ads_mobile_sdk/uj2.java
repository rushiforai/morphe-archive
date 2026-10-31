package ads_mobile_sdk;

import java.io.Closeable;
import java.util.ArrayList;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class uj2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fl2 f10368a;

    /* renamed from: b, reason: collision with root package name */
    public Object f10369b;

    /* renamed from: c, reason: collision with root package name */
    public Object f10370c;

    /* renamed from: d, reason: collision with root package name */
    public Closeable f10371d;

    /* renamed from: e, reason: collision with root package name */
    public cc2 f10372e;

    /* renamed from: f, reason: collision with root package name */
    public ArrayList f10373f;

    /* renamed from: g, reason: collision with root package name */
    public fl2 f10374g;

    /* renamed from: h, reason: collision with root package name */
    public /* synthetic */ Object f10375h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ fl2 f10376i;

    /* renamed from: j, reason: collision with root package name */
    public int f10377j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uj2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10376i = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10375h = obj;
        this.f10377j |= Integer.MIN_VALUE;
        return this.f10376i.a((wv0) null, this);
    }
}
