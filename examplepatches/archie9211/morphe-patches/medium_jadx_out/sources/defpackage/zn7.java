package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class zn7 implements d55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ xn7 b;

    public /* synthetic */ zn7(xn7 xn7Var, int i) {
        this.a = i;
        this.b = xn7Var;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i;
        int i2;
        int i3 = this.a;
        c1e c1eVar = c1e.a;
        uob uobVar = w12.a;
        switch (i3) {
            case 0:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                String str = (String) obj2;
                x12 x12Var = (x12) obj3;
                int iIntValue = ((Integer) obj4).intValue();
                str.getClass();
                if ((iIntValue & 6) == 0) {
                    i = 57344;
                    i2 = iIntValue | (((p65) x12Var).g(zBooleanValue) ? 4 : 2);
                } else {
                    i = 57344;
                    i2 = iIntValue;
                }
                if ((iIntValue & 48) == 0) {
                    i2 |= ((p65) x12Var).f(str) ? 32 : 16;
                }
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(i2 & 1, (i2 & 147) != 146)) {
                    p65Var.S();
                } else {
                    Object objM = p65Var.M();
                    if (objM == uobVar) {
                        objM = new ov6(15);
                        p65Var.j0(objM);
                    }
                    fo7.i((m45) objM, str, this.b, null, zBooleanValue, p65Var, (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 6 | ((i2 << 12) & i), 8);
                }
                break;
            case 1:
                boolean zBooleanValue2 = ((Boolean) obj).booleanValue();
                String str2 = (String) obj2;
                x12 x12Var2 = (x12) obj3;
                int iIntValue2 = ((Integer) obj4).intValue();
                str2.getClass();
                int i4 = (iIntValue2 & 6) == 0 ? (((p65) x12Var2).g(zBooleanValue2) ? 4 : 2) | iIntValue2 : iIntValue2;
                if ((iIntValue2 & 48) == 0) {
                    i4 |= ((p65) x12Var2).f(str2) ? 32 : 16;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(i4 & 1, (i4 & 147) != 146)) {
                    p65Var2.S();
                } else {
                    Object objM2 = p65Var2.M();
                    if (objM2 == uobVar) {
                        objM2 = new ov6(17);
                        p65Var2.j0(objM2);
                    }
                    fo7.j((m45) objM2, str2, this.b, null, zBooleanValue2, null, p65Var2, (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 6 | (57344 & (i4 << 12)), 40);
                }
                break;
            case 2:
                boolean zBooleanValue3 = ((Boolean) obj).booleanValue();
                String str3 = (String) obj2;
                x12 x12Var3 = (x12) obj3;
                int iIntValue3 = ((Integer) obj4).intValue();
                str3.getClass();
                int i5 = (iIntValue3 & 6) == 0 ? (((p65) x12Var3).g(zBooleanValue3) ? 4 : 2) | iIntValue3 : iIntValue3;
                if ((iIntValue3 & 48) == 0) {
                    i5 |= ((p65) x12Var3).f(str3) ? 32 : 16;
                }
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(i5 & 1, (i5 & 147) != 146)) {
                    p65Var3.S();
                } else {
                    Object objM3 = p65Var3.M();
                    if (objM3 == uobVar) {
                        objM3 = new ov6(18);
                        p65Var3.j0(objM3);
                    }
                    fo7.k(((i5 << 15) & 458752) | (i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 6, 88, null, p65Var3, (m45) objM3, this.b, null, str3, zBooleanValue3, false);
                }
                break;
            case 3:
                boolean zBooleanValue4 = ((Boolean) obj).booleanValue();
                String str4 = (String) obj2;
                x12 x12Var4 = (x12) obj3;
                int iIntValue4 = ((Integer) obj4).intValue();
                str4.getClass();
                int i6 = (iIntValue4 & 6) == 0 ? (((p65) x12Var4).g(zBooleanValue4) ? 4 : 2) | iIntValue4 : iIntValue4;
                if ((iIntValue4 & 48) == 0) {
                    i6 |= ((p65) x12Var4).f(str4) ? 32 : 16;
                }
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(i6 & 1, (i6 & 147) != 146)) {
                    p65Var4.S();
                } else {
                    Object objM4 = p65Var4.M();
                    if (objM4 == uobVar) {
                        objM4 = new ov6(19);
                        p65Var4.j0(objM4);
                    }
                    fo7.r((m45) objM4, str4, this.b, null, zBooleanValue4, p65Var4, (i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 6 | (57344 & (i6 << 12)), 8);
                }
                break;
            case 4:
                boolean zBooleanValue5 = ((Boolean) obj).booleanValue();
                String str5 = (String) obj2;
                x12 x12Var5 = (x12) obj3;
                int iIntValue5 = ((Integer) obj4).intValue();
                str5.getClass();
                int i7 = (iIntValue5 & 6) == 0 ? (((p65) x12Var5).g(zBooleanValue5) ? 4 : 2) | iIntValue5 : iIntValue5;
                if ((iIntValue5 & 48) == 0) {
                    i7 |= ((p65) x12Var5).f(str5) ? 32 : 16;
                }
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(i7 & 1, (i7 & 147) != 146)) {
                    p65Var5.S();
                } else {
                    Object objM5 = p65Var5.M();
                    if (objM5 == uobVar) {
                        objM5 = new ov6(20);
                        p65Var5.j0(objM5);
                    }
                    fo7.l((m45) objM5, str5, this.b, null, zBooleanValue5, p65Var5, (i7 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 6 | (57344 & (i7 << 12)), 8);
                }
                break;
            case 5:
                boolean zBooleanValue6 = ((Boolean) obj).booleanValue();
                String str6 = (String) obj2;
                x12 x12Var6 = (x12) obj3;
                int iIntValue6 = ((Integer) obj4).intValue();
                str6.getClass();
                int i8 = (iIntValue6 & 6) == 0 ? (((p65) x12Var6).g(zBooleanValue6) ? 4 : 2) | iIntValue6 : iIntValue6;
                if ((iIntValue6 & 48) == 0) {
                    i8 |= ((p65) x12Var6).f(str6) ? 32 : 16;
                }
                p65 p65Var6 = (p65) x12Var6;
                if (!p65Var6.P(i8 & 1, (i8 & 147) != 146)) {
                    p65Var6.S();
                } else {
                    Object objM6 = p65Var6.M();
                    if (objM6 == uobVar) {
                        objM6 = new ov6(21);
                        p65Var6.j0(objM6);
                    }
                    fo7.m((m45) objM6, str6, this.b, null, zBooleanValue6, p65Var6, (i8 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 6 | (57344 & (i8 << 12)));
                }
                break;
            default:
                boolean zBooleanValue7 = ((Boolean) obj).booleanValue();
                String str7 = (String) obj2;
                x12 x12Var7 = (x12) obj3;
                int iIntValue7 = ((Integer) obj4).intValue();
                str7.getClass();
                int i9 = (iIntValue7 & 6) == 0 ? (((p65) x12Var7).g(zBooleanValue7) ? 4 : 2) | iIntValue7 : iIntValue7;
                if ((iIntValue7 & 48) == 0) {
                    i9 |= ((p65) x12Var7).f(str7) ? 32 : 16;
                }
                p65 p65Var7 = (p65) x12Var7;
                if (!p65Var7.P(i9 & 1, (i9 & 147) != 146)) {
                    p65Var7.S();
                } else {
                    Object objM7 = p65Var7.M();
                    if (objM7 == uobVar) {
                        objM7 = new ov6(16);
                        p65Var7.j0(objM7);
                    }
                    fo7.n((m45) objM7, str7, this.b, null, zBooleanValue7, p65Var7, (i9 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 6 | (57344 & (i9 << 12)), 8);
                }
                break;
        }
        return c1eVar;
    }
}
