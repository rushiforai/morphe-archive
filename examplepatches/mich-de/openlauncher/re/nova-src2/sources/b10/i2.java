package b10;

import java.util.ArrayList;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class i2 extends ContinuationImpl {
    public int A;
    public /* synthetic */ Object B;
    public final /* synthetic */ k2 C;
    public int D;

    /* renamed from: t, reason: collision with root package name */
    public k2 f16722t;

    /* renamed from: u, reason: collision with root package name */
    public m1 f16723u;

    /* renamed from: v, reason: collision with root package name */
    public ArrayList f16724v;

    /* renamed from: w, reason: collision with root package name */
    public cy.m0 f16725w;

    /* renamed from: x, reason: collision with root package name */
    public cy.g f16726x;

    /* renamed from: y, reason: collision with root package name */
    public cy.g f16727y;

    /* renamed from: z, reason: collision with root package name */
    public cy.g f16728z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i2(k2 k2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.C = k2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.B = obj;
        this.D |= Integer.MIN_VALUE;
        return this.C.a(this);
    }
}
