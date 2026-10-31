package com.google.android.libraries.places.internal;

import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Arrays;
import java.util.Objects;

/* loaded from: classes3.dex */
final class zzor extends zzoa {
    static final zzoa zza = new zzor(null, new Object[0], 0);
    final transient Object[] zzb;
    private final transient Object zzc;
    private final transient int zzd;

    private zzor(Object obj, Object[] objArr, int i5) {
        this.zzc = obj;
        this.zzb = objArr;
        this.zzd = i5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r16v10 */
    /* JADX WARN: Type inference failed for: r16v11 */
    /* JADX WARN: Type inference failed for: r16v5 */
    /* JADX WARN: Type inference failed for: r16v6 */
    /* JADX WARN: Type inference failed for: r16v8 */
    /* JADX WARN: Type inference failed for: r16v9 */
    /* JADX WARN: Type inference failed for: r3v6 */
    /* JADX WARN: Type inference failed for: r3v8, types: [java.lang.Object[]] */
    /* JADX WARN: Type inference failed for: r5v8, types: [java.lang.Object[]] */
    public static zzor zzh(int i5, Object[] objArr, zznz zznzVar) {
        boolean z11;
        int i11;
        int i12;
        short[] sArr;
        boolean z12;
        byte[] bArr;
        boolean z13;
        ?? r16;
        int i13 = i5;
        Object[] objArrCopyOf = objArr;
        if (i13 == 0) {
            return (zzor) zza;
        }
        Object obj = null;
        boolean z14 = false;
        int i14 = 1;
        if (i13 == 1) {
            Object obj2 = objArrCopyOf[0];
            Objects.requireNonNull(obj2);
            Object obj3 = objArrCopyOf[1];
            Objects.requireNonNull(obj3);
            zznj.zza(obj2, obj3);
            return new zzor(null, objArrCopyOf, 1);
        }
        zzmt.zzb(i13, objArrCopyOf.length >> 1, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX);
        int iZzh = zzob.zzh(i13);
        if (i13 == 1) {
            Object obj4 = objArrCopyOf[0];
            Objects.requireNonNull(obj4);
            Object obj5 = objArrCopyOf[1];
            Objects.requireNonNull(obj5);
            zznj.zza(obj4, obj5);
            r16 = 0;
            i13 = 1;
            i11 = 1;
        } else {
            int i15 = iZzh - 1;
            if (iZzh <= 128) {
                byte[] bArr2 = new byte[iZzh];
                Arrays.fill(bArr2, (byte) -1);
                int i16 = 0;
                int i17 = 0;
                while (i16 < i13) {
                    int i18 = i17 + i17;
                    int i19 = i16 + i16;
                    Object obj6 = objArrCopyOf[i19];
                    Objects.requireNonNull(obj6);
                    Object obj7 = objArrCopyOf[i19 ^ 1];
                    Objects.requireNonNull(obj7);
                    zznj.zza(obj6, obj7);
                    int iZza = zznq.zza(obj6.hashCode());
                    while (true) {
                        int i21 = iZza & i15;
                        z13 = z14;
                        int i22 = bArr2[i21] & 255;
                        if (i22 == 255) {
                            bArr2[i21] = (byte) i18;
                            if (i17 < i16) {
                                objArrCopyOf[i18] = obj6;
                                objArrCopyOf[i18 ^ 1] = obj7;
                            }
                            i17++;
                        } else {
                            if (obj6.equals(objArrCopyOf[i22])) {
                                int i23 = i22 ^ 1;
                                Object obj8 = objArrCopyOf[i23];
                                Objects.requireNonNull(obj8);
                                zzny zznyVar = new zzny(obj6, obj7, obj8);
                                objArrCopyOf[i23] = obj7;
                                obj = zznyVar;
                                break;
                            }
                            iZza = i21 + 1;
                            z14 = z13;
                        }
                    }
                    i16++;
                    z14 = z13;
                }
                z11 = z14;
                bArr = bArr2;
                z12 = z11;
                if (i17 != i13) {
                    sArr = new Object[3];
                    sArr[z11 ? 1 : 0] = bArr2;
                    sArr[1] = Integer.valueOf(i17);
                    sArr[2] = obj;
                    obj = sArr;
                    i11 = 1;
                    r16 = z11;
                }
                i11 = 1;
                obj = bArr;
                r16 = z12;
            } else {
                z11 = false;
                if (iZzh <= 32768) {
                    sArr = new short[iZzh];
                    Arrays.fill(sArr, (short) -1);
                    int i24 = 0;
                    for (int i25 = 0; i25 < i13; i25++) {
                        int i26 = i24 + i24;
                        int i27 = i25 + i25;
                        Object obj9 = objArrCopyOf[i27];
                        Objects.requireNonNull(obj9);
                        Object obj10 = objArrCopyOf[i27 ^ 1];
                        Objects.requireNonNull(obj10);
                        zznj.zza(obj9, obj10);
                        int iZza2 = zznq.zza(obj9.hashCode());
                        while (true) {
                            int i28 = iZza2 & i15;
                            char c11 = (char) sArr[i28];
                            if (c11 == 65535) {
                                sArr[i28] = (short) i26;
                                if (i24 < i25) {
                                    objArrCopyOf[i26] = obj9;
                                    objArrCopyOf[i26 ^ 1] = obj10;
                                }
                                i24++;
                            } else {
                                if (obj9.equals(objArrCopyOf[c11])) {
                                    int i29 = c11 ^ 1;
                                    Object obj11 = objArrCopyOf[i29];
                                    Objects.requireNonNull(obj11);
                                    zzny zznyVar2 = new zzny(obj9, obj10, obj11);
                                    objArrCopyOf[i29] = obj10;
                                    obj = zznyVar2;
                                    break;
                                }
                                iZza2 = i28 + 1;
                            }
                        }
                    }
                    if (i24 != i13) {
                        bArr = new Object[]{sArr, Integer.valueOf(i24), obj};
                        z12 = z11;
                        i11 = 1;
                        obj = bArr;
                        r16 = z12;
                    }
                    obj = sArr;
                    i11 = 1;
                    r16 = z11;
                } else {
                    int[] iArr = new int[iZzh];
                    Arrays.fill(iArr, -1);
                    int i31 = 0;
                    int i32 = 0;
                    while (i31 < i13) {
                        int i33 = i32 + i32;
                        int i34 = i31 + i31;
                        Object obj12 = objArrCopyOf[i34];
                        Objects.requireNonNull(obj12);
                        Object obj13 = objArrCopyOf[i34 ^ i14];
                        Objects.requireNonNull(obj13);
                        zznj.zza(obj12, obj13);
                        int iZza3 = zznq.zza(obj12.hashCode());
                        while (true) {
                            int i35 = iZza3 & i15;
                            int i36 = iArr[i35];
                            if (i36 == -1) {
                                iArr[i35] = i33;
                                if (i32 < i31) {
                                    objArrCopyOf[i33] = obj12;
                                    objArrCopyOf[i33 ^ 1] = obj13;
                                }
                                i32++;
                                i12 = i14;
                            } else {
                                i12 = i14;
                                if (obj12.equals(objArrCopyOf[i36])) {
                                    int i37 = i36 ^ 1;
                                    Object obj14 = objArrCopyOf[i37];
                                    Objects.requireNonNull(obj14);
                                    zzny zznyVar3 = new zzny(obj12, obj13, obj14);
                                    objArrCopyOf[i37] = obj13;
                                    obj = zznyVar3;
                                    break;
                                }
                                iZza3 = i35 + 1;
                                i14 = i12;
                            }
                        }
                        i31++;
                        i14 = i12;
                    }
                    i11 = i14;
                    if (i32 == i13) {
                        obj = iArr;
                        r16 = z11;
                    } else {
                        Object[] objArr2 = new Object[3];
                        objArr2[0] = iArr;
                        objArr2[i11] = Integer.valueOf(i32);
                        objArr2[2] = obj;
                        obj = objArr2;
                        r16 = z11;
                    }
                }
            }
        }
        boolean z15 = obj instanceof Object[];
        Object obj15 = obj;
        if (z15) {
            Object[] objArr3 = (Object[]) obj;
            zznzVar.zzc = (zzny) objArr3[2];
            Object obj16 = objArr3[r16];
            int iIntValue = ((Integer) objArr3[i11]).intValue();
            objArrCopyOf = Arrays.copyOf(objArrCopyOf, iIntValue + iIntValue);
            obj15 = obj16;
            i13 = iIntValue;
        }
        return new zzor(obj15, objArrCopyOf, i13);
    }

    /* JADX WARN: Removed duplicated region for block: B:4:0x0003  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0003 A[EDGE_INSN: B:44:0x0003->B:4:0x0003 BREAK  A[LOOP:0: B:16:0x0038->B:22:0x004e], EDGE_INSN: B:46:0x0003->B:4:0x0003 BREAK  A[LOOP:1: B:26:0x0063->B:32:0x007a], EDGE_INSN: B:48:0x0003->B:4:0x0003 BREAK  A[LOOP:2: B:34:0x0089->B:43:0x00a0]] */
    @Override // com.google.android.libraries.places.internal.zzoa, java.util.Map
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object get(Object obj) {
        Object obj2;
        if (obj == null) {
            obj2 = null;
        } else {
            int i5 = this.zzd;
            Object[] objArr = this.zzb;
            if (i5 == 1) {
                Object obj3 = objArr[0];
                Objects.requireNonNull(obj3);
                if (obj3.equals(obj)) {
                    obj2 = objArr[1];
                    Objects.requireNonNull(obj2);
                }
            } else {
                Object obj4 = this.zzc;
                if (obj4 != null) {
                    if (obj4 instanceof byte[]) {
                        byte[] bArr = (byte[]) obj4;
                        int length = bArr.length - 1;
                        int iZza = zznq.zza(obj.hashCode());
                        while (true) {
                            int i11 = iZza & length;
                            int i12 = bArr[i11] & 255;
                            if (i12 == 255) {
                                break;
                            }
                            if (obj.equals(objArr[i12])) {
                                obj2 = objArr[i12 ^ 1];
                                break;
                            }
                            iZza = i11 + 1;
                        }
                    } else if (obj4 instanceof short[]) {
                        short[] sArr = (short[]) obj4;
                        int length2 = sArr.length - 1;
                        int iZza2 = zznq.zza(obj.hashCode());
                        while (true) {
                            int i13 = iZza2 & length2;
                            char c11 = (char) sArr[i13];
                            if (c11 == 65535) {
                                break;
                            }
                            if (obj.equals(objArr[c11])) {
                                obj2 = objArr[c11 ^ 1];
                                break;
                            }
                            iZza2 = i13 + 1;
                        }
                    } else {
                        int[] iArr = (int[]) obj4;
                        int length3 = iArr.length - 1;
                        int iZza3 = zznq.zza(obj.hashCode());
                        while (true) {
                            int i14 = iZza3 & length3;
                            int i15 = iArr[i14];
                            if (i15 == -1) {
                                break;
                            }
                            if (obj.equals(objArr[i15])) {
                                obj2 = objArr[i15 ^ 1];
                                break;
                            }
                            iZza3 = i14 + 1;
                        }
                    }
                }
            }
        }
        if (obj2 == null) {
            return null;
        }
        return obj2;
    }

    @Override // java.util.Map
    public final int size() {
        return this.zzd;
    }

    @Override // com.google.android.libraries.places.internal.zzoa
    public final zznt zza() {
        return new zzoq(this.zzb, 1, this.zzd);
    }

    @Override // com.google.android.libraries.places.internal.zzoa
    public final zzob zze() {
        return new zzoo(this, this.zzb, 0, this.zzd);
    }

    @Override // com.google.android.libraries.places.internal.zzoa
    public final zzob zzf() {
        return new zzop(this, new zzoq(this.zzb, 0, this.zzd));
    }
}
