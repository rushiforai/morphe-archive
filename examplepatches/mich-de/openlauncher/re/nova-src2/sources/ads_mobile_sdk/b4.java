package ads_mobile_sdk;

import java.util.Iterator;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class b4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public f5 f1242a;

    /* renamed from: b, reason: collision with root package name */
    public c80.a f1243b;

    /* renamed from: c, reason: collision with root package name */
    public Iterator f1244c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f1245d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ f5 f1246e;

    /* renamed from: f, reason: collision with root package name */
    public int f1247f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b4(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1246e = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1245d = obj;
        this.f1247f |= Integer.MIN_VALUE;
        return f5.a(this.f1246e, this);
    }
}
