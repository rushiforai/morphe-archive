package g2;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class y extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f56909j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ z f56910k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y(Ref.ObjectRef objectRef, z zVar) {
        super(0);
        this.f56909j = objectRef;
        this.f56910k = zVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        this.f56909j.f71863a = this.f56910k.D();
        return Unit.f71706a;
    }
}
