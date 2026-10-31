package g2;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class k extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f56872j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ int f56873k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(Ref.ObjectRef objectRef, int i5) {
        super(1);
        this.f56872j = objectRef;
        this.f56873k = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Boolean boolValueOf = Boolean.valueOf(((z) obj).H(this.f56873k));
        this.f56872j.f71863a = boolValueOf;
        return boolValueOf;
    }
}
