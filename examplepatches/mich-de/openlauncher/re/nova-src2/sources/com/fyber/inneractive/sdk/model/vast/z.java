package com.fyber.inneractive.sdk.model.vast;

import android.text.TextUtils;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class z implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final Integer[] f28652a;

    /* renamed from: b, reason: collision with root package name */
    public final String f28653b;

    public z(String str) throws y {
        this.f28652a = new Integer[0];
        if (TextUtils.isEmpty(str) || !str.matches("^[0-9.]+$")) {
            throw new y();
        }
        ArrayList arrayList = new ArrayList();
        for (String str2 : str.split("\\.")) {
            arrayList.add(Integer.valueOf(com.fyber.inneractive.sdk.util.v.a(str2, 0)));
        }
        this.f28652a = (Integer[]) arrayList.toArray(new Integer[arrayList.size()]);
        this.f28653b = str;
    }

    @Override // java.lang.Comparable
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final int compareTo(z zVar) {
        if (zVar == null) {
            return 1;
        }
        int iMax = Math.max(this.f28652a.length, zVar.f28652a.length);
        int i5 = 0;
        while (i5 < iMax) {
            Integer[] numArr = this.f28652a;
            int iIntValue = numArr.length > i5 ? numArr[i5].intValue() : 0;
            Integer[] numArr2 = zVar.f28652a;
            int iIntValue2 = numArr2.length > i5 ? numArr2[i5].intValue() : 0;
            if (iIntValue > iIntValue2) {
                return 1;
            }
            if (iIntValue2 > iIntValue) {
                return -1;
            }
            i5++;
        }
        return 0;
    }

    public final String toString() {
        return this.f28653b;
    }
}
