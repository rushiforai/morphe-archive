package j00;

import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class q implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68538a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function2 f68539b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ u10.w f68540c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ List f68541d;

    public /* synthetic */ q(Function2 function2, u10.w wVar, List list, int i5) {
        this.f68538a = i5;
        this.f68539b = function2;
        this.f68540c = wVar;
        this.f68541d = list;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f68538a) {
            case 0:
                this.f68539b.invoke(u10.w.e(this.f68540c, (String) obj, null, null, 14), this.f68541d);
                break;
            default:
                this.f68539b.invoke(u10.w.e(this.f68540c, null, null, (List) obj, 7), this.f68541d);
                break;
        }
        return Unit.f71706a;
    }
}
