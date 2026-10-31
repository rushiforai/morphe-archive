package com.fyber.inneractive.sdk.flow.vast;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.model.vast.r;
import com.fyber.inneractive.sdk.model.vast.t;
import java.util.Comparator;

/* loaded from: classes3.dex */
public final class g implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final int f28416a;

    /* renamed from: b, reason: collision with root package name */
    public final int f28417b;

    /* renamed from: c, reason: collision with root package name */
    public final int f28418c;

    public g(int i5, int i11, int i12) {
        this.f28416a = i5;
        this.f28417b = i11;
        this.f28418c = i12;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        Integer num = 2;
        r rVar = (r) obj;
        r rVar2 = (r) obj2;
        if (!TextUtils.equals("VPAID", rVar2.f28636f)) {
            if (!TextUtils.equals("VPAID", rVar.f28636f)) {
                Integer num2 = rVar.f28635e;
                int iIntValue = num2 == null ? 0 : num2.intValue();
                Integer num3 = rVar2.f28635e;
                int iIntValue2 = num3 == null ? 0 : num3.intValue();
                int i5 = this.f28416a;
                if (iIntValue2 <= i5 || iIntValue > i5) {
                    if (iIntValue <= i5 || iIntValue2 > i5) {
                        t tVarA = t.a(rVar2.f28634d);
                        t tVar = t.MEDIA_TYPE_MP4;
                        Integer num4 = tVarA == tVar ? 3 : tVarA == t.MEDIA_TYPE_3GPP ? num : tVarA == t.MEDIA_TYPE_WEBM ? 1 : -1;
                        t tVarA2 = t.a(rVar.f28634d);
                        if (tVarA2 == tVar) {
                            num = 3;
                        } else if (tVarA2 != t.MEDIA_TYPE_3GPP) {
                            num = tVarA2 == t.MEDIA_TYPE_WEBM ? 1 : -1;
                        }
                        int iCompareTo = num4.compareTo(num);
                        if (iCompareTo != 0) {
                            return iCompareTo;
                        }
                        if (iIntValue >= iIntValue2) {
                            if (iIntValue <= iIntValue2) {
                                Integer num5 = rVar.f28632b;
                                int iIntValue3 = num5 == null ? 0 : num5.intValue();
                                Integer num6 = rVar.f28633c;
                                int iIntValue4 = num6 == null ? 0 : num6.intValue();
                                Integer num7 = rVar2.f28632b;
                                int iIntValue5 = num7 == null ? 0 : num7.intValue();
                                Integer num8 = rVar2.f28633c;
                                int i11 = iIntValue3 * iIntValue4;
                                int iIntValue6 = iIntValue5 * (num8 == null ? 0 : num8.intValue());
                                int i12 = this.f28417b * this.f28418c;
                                int iAbs = Math.abs(i11 - i12);
                                int iAbs2 = Math.abs(iIntValue6 - i12);
                                if (iAbs >= iAbs2) {
                                    if (iAbs <= iAbs2) {
                                        return 0;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return 1;
        }
        return -1;
    }
}
