package j3;

import java.util.Comparator;
import kotlin.Pair;

/* loaded from: classes2.dex */
public final class f implements Comparator {

    /* renamed from: b, reason: collision with root package name */
    public static final f f68777b = new f(0);

    /* renamed from: c, reason: collision with root package name */
    public static final f f68778c = new f(1);

    /* renamed from: d, reason: collision with root package name */
    public static final f f68779d = new f(2);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68780a;

    public /* synthetic */ f(int i5) {
        this.f68780a = i5;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.f68780a) {
            case 0:
                h2.c cVarH = ((q) obj).h();
                h2.c cVarH2 = ((q) obj2).h();
                int iCompare = Float.compare(cVarH.f59018a, cVarH2.f59018a);
                if (iCompare != 0) {
                    return iCompare;
                }
                int iCompare2 = Float.compare(cVarH.f59019b, cVarH2.f59019b);
                if (iCompare2 != 0) {
                    return iCompare2;
                }
                int iCompare3 = Float.compare(cVarH.f59021d, cVarH2.f59021d);
                return iCompare3 != 0 ? iCompare3 : Float.compare(cVarH.f59020c, cVarH2.f59020c);
            case 1:
                h2.c cVarH3 = ((q) obj).h();
                h2.c cVarH4 = ((q) obj2).h();
                int iCompare4 = Float.compare(cVarH4.f59020c, cVarH3.f59020c);
                if (iCompare4 != 0) {
                    return iCompare4;
                }
                int iCompare5 = Float.compare(cVarH3.f59019b, cVarH4.f59019b);
                if (iCompare5 != 0) {
                    return iCompare5;
                }
                int iCompare6 = Float.compare(cVarH3.f59021d, cVarH4.f59021d);
                return iCompare6 != 0 ? iCompare6 : Float.compare(cVarH4.f59018a, cVarH3.f59018a);
            default:
                Pair pair = (Pair) obj;
                Pair pair2 = (Pair) obj2;
                int iCompare7 = Float.compare(((h2.c) pair.f71683a).f59019b, ((h2.c) pair2.f71683a).f59019b);
                return iCompare7 != 0 ? iCompare7 : Float.compare(((h2.c) pair.f71683a).f59021d, ((h2.c) pair2.f71683a).f59021d);
        }
    }
}
