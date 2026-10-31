package com.bytedance.sdk.openadsdk.tn;

import a2.c;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public final class wie {
    private final jw ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final List<jc> f27078zb;

    public wie(jw jwVar) {
        this.ycx = jwVar;
        ArrayList arrayList = new ArrayList();
        this.f27078zb = arrayList;
        arrayList.add(new jc(jwVar, new int[]{1}));
    }

    private jc ycx(int i5) {
        if (i5 >= this.f27078zb.size()) {
            jc jcVarZb = (jc) c.e(1, this.f27078zb);
            for (int size = this.f27078zb.size(); size <= i5; size++) {
                jw jwVar = this.ycx;
                jcVarZb = jcVarZb.zb(new jc(jwVar, new int[]{1, jwVar.ycx(jwVar.zb() + (size - 1))}));
                this.f27078zb.add(jcVarZb);
            }
        }
        return this.f27078zb.get(i5);
    }

    public void ycx(int[] iArr, int i5) {
        if (i5 != 0) {
            int length = iArr.length - i5;
            if (length > 0) {
                jc jcVarYcx = ycx(i5);
                int[] iArr2 = new int[length];
                System.arraycopy(iArr, 0, iArr2, 0, length);
                int[] iArrYcx = new jc(this.ycx, iArr2).ycx(i5, 1).sya(jcVarYcx)[1].ycx();
                int length2 = i5 - iArrYcx.length;
                for (int i11 = 0; i11 < length2; i11++) {
                    iArr[length + i11] = 0;
                }
                System.arraycopy(iArrYcx, 0, iArr, length + length2, iArrYcx.length);
                return;
            }
            throw new IllegalArgumentException("No data bytes provided");
        }
        throw new IllegalArgumentException("No error correction bytes");
    }
}
