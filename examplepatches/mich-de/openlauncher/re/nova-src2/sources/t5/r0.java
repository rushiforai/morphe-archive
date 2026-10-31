package t5;

import java.io.FileOutputStream;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class r0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public FileOutputStream f88681t;

    /* renamed from: u, reason: collision with root package name */
    public long f88682u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f88683v;

    /* renamed from: w, reason: collision with root package name */
    public int f88684w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88683v = obj;
        this.f88684w |= Integer.MIN_VALUE;
        return br.c.g(null, this);
    }
}
