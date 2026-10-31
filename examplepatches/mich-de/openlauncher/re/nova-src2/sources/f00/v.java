package f00;

import kotlin.jvm.functions.Function2;
import kotlin.ranges.IntRange;

/* loaded from: classes4.dex */
public final /* synthetic */ class v implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53346a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ IntRange f53347b;

    public /* synthetic */ v(IntRange intRange, int i5) {
        this.f53346a = i5;
        this.f53347b = intRange;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int iF0;
        switch (this.f53346a) {
            case 0:
                iF0 = kotlin.ranges.a.f0(((Integer) obj2).intValue() + ((Integer) obj).intValue(), this.f53347b);
                break;
            case 1:
                iF0 = kotlin.ranges.a.f0(((Integer) obj2).intValue() + ((Integer) obj).intValue(), this.f53347b);
                break;
            case 2:
                int iIntValue = ((Integer) obj2).intValue();
                Integer numU0 = r70.i.u0((String) obj);
                Integer numValueOf = numU0 != null ? Integer.valueOf(numU0.intValue() + iIntValue) : null;
                if (numValueOf == null) {
                    return null;
                }
                if (this.f53347b.g(numValueOf.intValue())) {
                    return String.valueOf(numValueOf);
                }
                return null;
            case 3:
                iF0 = kotlin.ranges.a.f0(((Integer) obj2).intValue() + ((Integer) obj).intValue(), this.f53347b);
                break;
            case 4:
                int iIntValue2 = ((Integer) obj2).intValue();
                Integer numU02 = r70.i.u0((String) obj);
                if (numU02 != null) {
                    int iIntValue3 = numU02.intValue() + iIntValue2;
                    IntRange intRange = this.f53347b;
                    int i5 = intRange.f71906a;
                    if (iIntValue3 <= intRange.f71907b && i5 <= iIntValue3) {
                        return String.valueOf(iIntValue3);
                    }
                }
                return null;
            default:
                int iIntValue4 = ((Integer) obj2).intValue();
                Integer numU03 = r70.i.u0((String) obj);
                if (numU03 != null) {
                    int iIntValue5 = numU03.intValue() + iIntValue4;
                    IntRange intRange2 = this.f53347b;
                    int i11 = intRange2.f71906a;
                    if (iIntValue5 <= intRange2.f71907b && i11 <= iIntValue5) {
                        return String.valueOf(iIntValue5);
                    }
                }
                return null;
        }
        return Integer.valueOf(iF0);
    }
}
