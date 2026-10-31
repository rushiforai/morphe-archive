package ads_mobile_sdk;

import android.app.Activity;
import b.e6;
import java.io.Closeable;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class pf0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f8254a;

    /* renamed from: b, reason: collision with root package name */
    public Closeable f8255b;

    /* renamed from: c, reason: collision with root package name */
    public Closeable f8256c;

    /* renamed from: d, reason: collision with root package name */
    public Activity f8257d;

    /* renamed from: e, reason: collision with root package name */
    public e6 f8258e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f8259f;

    /* renamed from: g, reason: collision with root package name */
    public /* synthetic */ Object f8260g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ rf0 f8261h;

    /* renamed from: i, reason: collision with root package name */
    public int f8262i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pf0(rf0 rf0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8261h = rf0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8260g = obj;
        this.f8262i |= Integer.MIN_VALUE;
        return rf0.a(this.f8261h, this);
    }
}
