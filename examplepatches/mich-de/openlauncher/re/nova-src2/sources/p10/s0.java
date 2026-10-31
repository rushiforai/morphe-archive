package p10;

import android.content.Context;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class s0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public og.i f81898t;

    /* renamed from: u, reason: collision with root package name */
    public Context f81899u;

    /* renamed from: v, reason: collision with root package name */
    public t0 f81900v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f81901w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ og.i f81902x;

    /* renamed from: y, reason: collision with root package name */
    public int f81903y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s0(og.i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f81902x = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81901w = obj;
        this.f81903y |= Integer.MIN_VALUE;
        return this.f81902x.n(null, null, this);
    }
}
