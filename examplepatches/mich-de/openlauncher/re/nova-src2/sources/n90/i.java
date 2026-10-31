package n90;

import java.io.IOException;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;
import m90.d0;

/* loaded from: classes5.dex */
public final class i extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f78056j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ long f78057k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Ref.LongRef f78058l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ d0 f78059m;
    public final /* synthetic */ Ref.LongRef n;
    public final /* synthetic */ Ref.LongRef o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(Ref.BooleanRef booleanRef, long j11, Ref.LongRef longRef, d0 d0Var, Ref.LongRef longRef2, Ref.LongRef longRef3) {
        super(2);
        this.f78056j = booleanRef;
        this.f78057k = j11;
        this.f78058l = longRef;
        this.f78059m = d0Var;
        this.n = longRef2;
        this.o = longRef3;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) throws IOException {
        int iIntValue = ((Number) obj).intValue();
        long jLongValue = ((Number) obj2).longValue();
        if (iIntValue == 1) {
            Ref.BooleanRef booleanRef = this.f78056j;
            if (booleanRef.f71859a) {
                throw new IOException("bad zip: zip64 extra repeated");
            }
            booleanRef.f71859a = true;
            if (jLongValue < this.f78057k) {
                throw new IOException("bad zip: zip64 extra too short");
            }
            Ref.LongRef longRef = this.f78058l;
            long jD = longRef.f71862a;
            d0 d0Var = this.f78059m;
            if (jD == 4294967295L) {
                jD = d0Var.d();
            }
            longRef.f71862a = jD;
            Ref.LongRef longRef2 = this.n;
            longRef2.f71862a = longRef2.f71862a == 4294967295L ? d0Var.d() : 0L;
            Ref.LongRef longRef3 = this.o;
            longRef3.f71862a = longRef3.f71862a == 4294967295L ? d0Var.d() : 0L;
        }
        return Unit.f71706a;
    }
}
