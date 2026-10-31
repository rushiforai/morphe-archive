package iy;

import java.util.List;
import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class y implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68396a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f68397b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f68398c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f68399d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f68400e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f68401f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Function f68402g;

    public /* synthetic */ y(int i5, Object obj, b2.t tVar, Function function, int i11, int i12, int i13) {
        this.f68396a = i13;
        this.f68397b = i5;
        this.f68401f = obj;
        this.f68398c = tVar;
        this.f68402g = function;
        this.f68399d = i11;
        this.f68400e = i12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f68396a) {
            case 0:
                ((Integer) obj2).getClass();
                p0.h(this.f68397b, (List) this.f68401f, (b2.t) this.f68398c, (x1.e) this.f68402g, (p1.o) obj, p1.a0.l(this.f68399d | 1), this.f68400e);
                break;
            case 1:
                ((Integer) obj2).getClass();
                ps.k.a(this.f68397b, (String) this.f68401f, (b2.t) this.f68398c, (Function0) this.f68402g, (p1.o) obj, p1.a0.l(this.f68399d | 1), this.f68400e);
                break;
            default:
                ((Integer) obj2).getClass();
                p6.f.o((Function0) this.f68401f, this.f68397b, (q00.l) this.f68398c, (Function2) this.f68402g, (p1.o) obj, p1.a0.l(this.f68399d | 1), this.f68400e);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ y(Function0 function0, int i5, q00.l lVar, Function2 function2, int i11, int i12) {
        this.f68396a = 2;
        this.f68401f = function0;
        this.f68397b = i5;
        this.f68398c = lVar;
        this.f68402g = function2;
        this.f68399d = i11;
        this.f68400e = i12;
    }
}
