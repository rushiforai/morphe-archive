package j3;

import java.util.ArrayList;
import java.util.List;
import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class u extends Lambda implements Function2 {

    /* renamed from: k, reason: collision with root package name */
    public static final u f68834k;

    /* renamed from: l, reason: collision with root package name */
    public static final u f68835l;

    /* renamed from: m, reason: collision with root package name */
    public static final u f68836m;
    public static final u n;
    public static final u o;

    /* renamed from: p, reason: collision with root package name */
    public static final u f68837p;

    /* renamed from: q, reason: collision with root package name */
    public static final u f68838q;

    /* renamed from: r, reason: collision with root package name */
    public static final u f68839r;

    /* renamed from: s, reason: collision with root package name */
    public static final u f68840s;

    /* renamed from: t, reason: collision with root package name */
    public static final u f68841t;

    /* renamed from: u, reason: collision with root package name */
    public static final u f68842u;

    /* renamed from: v, reason: collision with root package name */
    public static final u f68843v;

    /* renamed from: w, reason: collision with root package name */
    public static final u f68844w;

    /* renamed from: x, reason: collision with root package name */
    public static final u f68845x;

    /* renamed from: y, reason: collision with root package name */
    public static final u f68846y;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f68847j;

    static {
        int i5 = 2;
        f68834k = new u(i5, 0);
        f68835l = new u(i5, 1);
        f68836m = new u(i5, 2);
        n = new u(i5, 3);
        o = new u(i5, 4);
        f68837p = new u(i5, 5);
        f68838q = new u(i5, 6);
        f68839r = new u(i5, 7);
        f68840s = new u(i5, 8);
        f68841t = new u(i5, 9);
        f68842u = new u(i5, 10);
        f68843v = new u(i5, 11);
        f68844w = new u(i5, 12);
        f68845x = new u(i5, 13);
        f68846y = new u(i5, 14);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ u(int i5, int i11) {
        super(i5);
        this.f68847j = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        String str;
        Function function;
        switch (this.f68847j) {
            case 0:
                return (c2.e) obj;
            case 1:
                List list = (List) obj;
                List list2 = (List) obj2;
                if (list == null) {
                    return list2;
                }
                ArrayList arrayListK1 = b70.g.K1(list);
                arrayListK1.addAll(list2);
                return arrayListK1;
            case 2:
                return (c2.m) obj;
            case 3:
                return (Unit) obj;
            case 4:
                return (Unit) obj;
            case 5:
                throw new IllegalStateException("merge function called on unmergeable property IsDialog. A dialog should not be a child of a clickable/focusable node.");
            case 6:
                throw new IllegalStateException("merge function called on unmergeable property IsPopup. A popup should not be a child of a clickable/focusable node.");
            case 7:
                return (Unit) obj;
            case 8:
                throw new IllegalStateException("merge function called on unmergeable property PaneTitle.");
            case 9:
                h hVar = (h) obj;
                int i5 = ((h) obj2).f68785a;
                return hVar;
            case 10:
                return (String) obj;
            case 11:
                List list3 = (List) obj;
                List list4 = (List) obj2;
                if (list3 == null) {
                    return list4;
                }
                ArrayList arrayListK12 = b70.g.K1(list3);
                arrayListK12.addAll(list4);
                return arrayListK12;
            case 12:
                Float f11 = (Float) obj;
                ((Number) obj2).floatValue();
                return f11;
            case 13:
                a aVar = (a) obj;
                a aVar2 = (a) obj2;
                if (aVar == null || (str = aVar.f68764a) == null) {
                    str = aVar2.f68764a;
                }
                if (aVar == null || (function = aVar.f68765b) == null) {
                    function = aVar2.f68765b;
                }
                return new a(str, function);
            default:
                return obj == null ? obj2 : obj;
        }
    }
}
