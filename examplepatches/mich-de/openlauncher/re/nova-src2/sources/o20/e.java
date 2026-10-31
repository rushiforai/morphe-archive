package o20;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {
    public /* synthetic */ Object A;
    public final /* synthetic */ f B;
    public int C;

    /* renamed from: t, reason: collision with root package name */
    public String f79407t;

    /* renamed from: u, reason: collision with root package name */
    public String f79408u;

    /* renamed from: v, reason: collision with root package name */
    public Function3 f79409v;

    /* renamed from: w, reason: collision with root package name */
    public Function2 f79410w;

    /* renamed from: x, reason: collision with root package name */
    public String f79411x;

    /* renamed from: y, reason: collision with root package name */
    public List f79412y;

    /* renamed from: z, reason: collision with root package name */
    public int f79413z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.B = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.A = obj;
        this.C |= Integer.MIN_VALUE;
        return f.g(this.B, null, null, null, null, this);
    }
}
