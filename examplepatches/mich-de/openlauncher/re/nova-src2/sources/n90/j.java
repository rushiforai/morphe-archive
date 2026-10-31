package n90;

import java.io.IOException;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;
import m90.d0;

/* loaded from: classes5.dex */
public final class j extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ d0 f78060j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f78061k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f78062l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f78063m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(d0 d0Var, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, Ref.ObjectRef objectRef3) {
        super(2);
        this.f78060j = d0Var;
        this.f78061k = objectRef;
        this.f78062l = objectRef2;
        this.f78063m = objectRef3;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) throws IOException {
        int iIntValue = ((Number) obj).intValue();
        long jLongValue = ((Number) obj2).longValue();
        if (iIntValue == 21589) {
            if (jLongValue < 1) {
                throw new IOException("bad zip: extended timestamp extra too short");
            }
            byte b11 = this.f78060j.readByte();
            boolean z11 = (b11 & 1) == 1;
            boolean z12 = (b11 & 2) == 2;
            boolean z13 = (b11 & 4) == 4;
            long j11 = z11 ? 5L : 1L;
            if (z12) {
                j11 += 4;
            }
            if (z13) {
                j11 += 4;
            }
            if (jLongValue < j11) {
                throw new IOException("bad zip: extended timestamp extra too short");
            }
            if (z11) {
                this.f78061k.f71863a = Long.valueOf(r2.c() * 1000);
            }
            if (z12) {
                this.f78062l.f71863a = Long.valueOf(r2.c() * 1000);
            }
            if (z13) {
                this.f78063m.f71863a = Long.valueOf(r2.c() * 1000);
            }
        }
        return Unit.f71706a;
    }
}
