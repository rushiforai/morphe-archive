package b00;

import java.util.ArrayList;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public f f16290t;

    /* renamed from: u, reason: collision with root package name */
    public ArrayList f16291u;

    /* renamed from: v, reason: collision with root package name */
    public ArrayList f16292v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f16293w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ f f16294x;

    /* renamed from: y, reason: collision with root package name */
    public int f16295y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f16294x = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f16293w = obj;
        this.f16295y |= Integer.MIN_VALUE;
        return f.a(this.f16294x, this);
    }
}
