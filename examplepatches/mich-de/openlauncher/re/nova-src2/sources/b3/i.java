package b3;

import c3.n3;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class i extends Lambda implements Function2 {

    /* renamed from: k, reason: collision with root package name */
    public static final i f17233k;

    /* renamed from: l, reason: collision with root package name */
    public static final i f17234l;

    /* renamed from: m, reason: collision with root package name */
    public static final i f17235m;
    public static final i n;
    public static final i o;

    /* renamed from: p, reason: collision with root package name */
    public static final i f17236p;

    /* renamed from: q, reason: collision with root package name */
    public static final i f17237q;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f17238j;

    static {
        int i5 = 2;
        f17233k = new i(i5, 0);
        f17234l = new i(i5, 1);
        f17235m = new i(i5, 2);
        n = new i(i5, 3);
        o = new i(i5, 4);
        f17236p = new i(i5, 5);
        f17237q = new i(i5, 6);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i(int i5, int i11) {
        super(i5);
        this.f17238j = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f17238j) {
            case 0:
                ((l) obj).setCompositeKeyHash(((Number) obj2).intValue());
                break;
            case 1:
                ((l) obj).setDensity((y3.c) obj2);
                break;
            case 2:
                ((l) obj).setLayoutDirection((y3.n) obj2);
                break;
            case 3:
                ((l) obj).setMeasurePolicy((z2.r0) obj2);
                break;
            case 4:
                ((l) obj).setModifier((b2.t) obj2);
                break;
            case 5:
                ((l) obj).setCompositionLocalMap((p1.c0) obj2);
                break;
            default:
                ((l) obj).setViewConfiguration((n3) obj2);
                break;
        }
        return Unit.f71706a;
    }
}
