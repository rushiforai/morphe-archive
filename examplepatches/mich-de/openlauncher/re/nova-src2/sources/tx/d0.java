package tx;

import android.content.Context;
import java.util.ArrayList;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public r f89684t;

    /* renamed from: u, reason: collision with root package name */
    public Context f89685u;

    /* renamed from: v, reason: collision with root package name */
    public ArrayList f89686v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f89687w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ r f89688x;

    /* renamed from: y, reason: collision with root package name */
    public int f89689y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d0(r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f89688x = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89687w = obj;
        this.f89689y |= Integer.MIN_VALUE;
        return this.f89688x.a(null, this);
    }
}
