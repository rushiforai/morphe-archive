package t5;

import java.io.FileInputStream;
import java.nio.channels.FileLock;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class v0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c80.d f88717t;

    /* renamed from: u, reason: collision with root package name */
    public FileInputStream f88718u;

    /* renamed from: v, reason: collision with root package name */
    public FileLock f88719v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f88720w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f88721x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ w0 f88722y;

    /* renamed from: z, reason: collision with root package name */
    public int f88723z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v0(w0 w0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88722y = w0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88721x = obj;
        this.f88723z |= Integer.MIN_VALUE;
        return this.f88722y.a(null, this);
    }
}
