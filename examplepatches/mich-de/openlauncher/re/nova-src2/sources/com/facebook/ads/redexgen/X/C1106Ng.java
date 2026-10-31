package com.facebook.ads.redexgen.X;

import android.util.SparseArray;
import android.util.SparseIntArray;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Ng, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1106Ng implements InterfaceC1593cu {
    public static String[] A05 = {"WrPJ0pg2mPJfrspahLmz5pjFVZ3GhqoW", "XFEX4XZYlFg40morts9AHvey8KOZtdLm", "6cuKepiJY3YuoKcwF9RqxVJry7zuXWia", "FhTxBa1JVVSZU0W7vi0M8MQjQwVICFNT", "5t1v8XDPU0UxAmsbKSZNGz4o0pupsy3y", "sc1mKX", "4t0AqRJOupFITXPu5dRmgnMWkOT1YaYH", "0ivFdIyTIrvJN3IRKWLvTn9YwUe91U3g"};
    public final int A00;
    public final /* synthetic */ C1105Nf A04;
    public final C1083Mj A03 = new C1083Mj(new byte[5]);
    public final SparseArray<InterfaceC1602d3> A01 = new SparseArray<>();
    public final SparseIntArray A02 = new SparseIntArray();

    public C1106Ng(C1105Nf c1105Nf, int i5) {
        this.A04 = c1105Nf;
        this.A00 = i5;
    }

    private C1598cz A00(C1084Mk c1084Mk, int i5) {
        int iA09 = c1084Mk.A09();
        int descriptorTag = iA09 + i5;
        int i11 = -1;
        String strTrim = null;
        ArrayList arrayList = null;
        while (true) {
            int iA092 = c1084Mk.A09();
            String[] strArr = A05;
            if (strArr[1].charAt(14) == strArr[6].charAt(14)) {
                throw new RuntimeException();
            }
            A05[3] = "FRrIYo9gZZwdZZnKdS5xpGv7sNAFUJd3";
            if (iA092 >= descriptorTag) {
                break;
            }
            int descriptorsStartPosition = c1084Mk.A0I();
            int descriptorLength = c1084Mk.A09() + c1084Mk.A0I();
            if (descriptorLength > descriptorTag) {
                break;
            }
            if (descriptorsStartPosition == 5) {
                long jA0Q = c1084Mk.A0Q();
                if (jA0Q == 1094921523) {
                    i11 = Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE;
                } else if (jA0Q == 1161904947) {
                    i11 = Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE;
                } else if (jA0Q == 1094921524) {
                    i11 = 172;
                } else if (jA0Q == 1212503619) {
                    i11 = 36;
                }
            } else if (descriptorsStartPosition == 106) {
                i11 = Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE;
            } else if (descriptorsStartPosition == 122) {
                i11 = Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE;
            } else if (descriptorsStartPosition == 127) {
                if (c1084Mk.A0I() == 21) {
                    i11 = 172;
                }
            } else if (descriptorsStartPosition == 123) {
                i11 = Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE;
            } else if (descriptorsStartPosition == 10) {
                String strA0W = c1084Mk.A0W(3);
                if (A05[7].charAt(23) != 85) {
                    String[] strArr2 = A05;
                    strArr2[1] = "86rcz2fFTzPsI86Gjcev7r1TLV4z3OrO";
                    strArr2[6] = "Q16PsPIOBdkA1kpc6X8ekK9PiWV3jtDj";
                    strTrim = strA0W.trim();
                } else {
                    A05[3] = "FoFLSaMdUolFLraf7Ybm8uTRjuWnz4Vo";
                    strTrim = strA0W.trim();
                }
            } else if (descriptorsStartPosition == 89) {
                i11 = 89;
                arrayList = new ArrayList();
                while (c1084Mk.A09() < descriptorLength) {
                    String dvbLanguage = c1084Mk.A0W(3).trim();
                    int iA0I = c1084Mk.A0I();
                    byte[] bArr = new byte[4];
                    c1084Mk.A0k(bArr, 0, 4);
                    arrayList.add(new C1597cy(dvbLanguage, iA0I, bArr));
                }
            } else if (descriptorsStartPosition == 111) {
                i11 = 257;
            }
            c1084Mk.A0g(descriptorLength - c1084Mk.A09());
        }
        c1084Mk.A0f(descriptorTag);
        return new C1598cz(i11, strTrim, arrayList, Arrays.copyOfRange(c1084Mk.A0l(), iA09, descriptorTag));
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x003e  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0149 A[PHI: r1 r2 r8 r9
      0x0149: PHI (r1v30 com.facebook.ads.redexgen.X.cz) = (r1v25 com.facebook.ads.redexgen.X.cz), (r1v34 com.facebook.ads.redexgen.X.cz) binds: [B:53:0x01d1, B:32:0x0147] A[DONT_GENERATE, DONT_INLINE]
      0x0149: PHI (r2v15 'tableId' int) = (r2v7 'tableId' int), (r2v16 'tableId' int) binds: [B:53:0x01d1, B:32:0x0147] A[DONT_GENERATE, DONT_INLINE]
      0x0149: PHI (r8v9 'programNumber' int) = (r8v6 'programNumber' int), (r8v11 'programNumber' int) binds: [B:53:0x01d1, B:32:0x0147] A[DONT_GENERATE, DONT_INLINE]
      0x0149: PHI (r9v7 'esInfoLength' int) = (r9v3 'esInfoLength' int), (r9v8 'esInfoLength' int) binds: [B:53:0x01d1, B:32:0x0147] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x014b A[PHI: r1 r2 r9
      0x014b: PHI (r1v26 com.facebook.ads.redexgen.X.cz) = (r1v25 com.facebook.ads.redexgen.X.cz), (r1v30 com.facebook.ads.redexgen.X.cz), (r1v34 com.facebook.ads.redexgen.X.cz) binds: [B:53:0x01d1, B:33:0x0149, B:32:0x0147] A[DONT_GENERATE, DONT_INLINE]
      0x014b: PHI (r2v8 'tableId' int) = (r2v7 'tableId' int), (r2v15 'tableId' int), (r2v16 'tableId' int) binds: [B:53:0x01d1, B:33:0x0149, B:32:0x0147] A[DONT_GENERATE, DONT_INLINE]
      0x014b: PHI (r9v4 'esInfoLength' int) = (r9v3 'esInfoLength' int), (r9v7 'esInfoLength' int), (r9v8 'esInfoLength' int) binds: [B:53:0x01d1, B:33:0x0149, B:32:0x0147] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1593cu
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A5j(C1084Mk c1084Mk) {
        C1092Ms c1092Ms;
        int programNumber;
        int esInfoLength;
        int tableId;
        C1598cz c1598czA00;
        InterfaceC1602d3 interfaceC1602d3A64;
        if (c1084Mk.A0I() == 2) {
            int i5 = this.A04.A09;
            if (A05[3].charAt(0) == 'F') {
                A05[4] = "5ZtlFdMXD0W0AKqJcYLBU1vIsgZ10Iwd";
                if (i5 != 1) {
                    int tableId2 = this.A04.A09;
                    if (tableId2 != 2) {
                        int tableId3 = this.A04.A02;
                        if (tableId3 == 1) {
                            c1092Ms = (C1092Ms) this.A04.A0I.get(0);
                        } else {
                            c1092Ms = new C1092Ms(((C1092Ms) this.A04.A0I.get(0)).A02());
                            this.A04.A0I.add(c1092Ms);
                        }
                        if ((c1084Mk.A0I() & 128) == 0) {
                            return;
                        }
                        c1084Mk.A0g(1);
                        int i11 = c1084Mk.A0M();
                        int programInfoLength = 3;
                        c1084Mk.A0g(3);
                        c1084Mk.A0h(this.A03, 2);
                        this.A03.A09(3);
                        int esInfoLength2 = 13;
                        this.A04.A01 = this.A03.A04(13);
                        c1084Mk.A0h(this.A03, 2);
                        int tableId4 = 4;
                        this.A03.A09(4);
                        c1084Mk.A0g(this.A03.A04(12));
                        int i12 = 21;
                        if (this.A04.A09 == 2 && this.A04.A05 == null) {
                            this.A04.A05 = this.A04.A0H.A64(21, new C1598cz(21, null, null, N1.A07));
                            if (this.A04.A05 != null) {
                                this.A04.A05.AAo(c1092Ms, this.A04.A03, new C1601d2(i11, 21, UserMetadata.MAX_INTERNAL_KEY_SIZE));
                            }
                        }
                        this.A01.clear();
                        this.A02.clear();
                        int iA07 = c1084Mk.A07();
                        while (iA07 > 0) {
                            C1083Mj c1083Mj = this.A03;
                            String[] strArr = A05;
                            if (strArr[1].charAt(14) != strArr[6].charAt(14)) {
                                A05[5] = "dmuM78";
                                c1084Mk.A0h(c1083Mj, 5);
                                programNumber = this.A03.A04(8);
                                this.A03.A09(programInfoLength);
                                esInfoLength = this.A03.A04(esInfoLength2);
                                this.A03.A09(tableId4);
                                tableId = this.A03.A04(12);
                                c1598czA00 = A00(c1084Mk, tableId);
                                if (programNumber != 6) {
                                    if (programNumber == 5) {
                                        programNumber = c1598czA00.A00;
                                    }
                                }
                            } else {
                                c1084Mk.A0h(c1083Mj, 5);
                                programNumber = this.A03.A04(8);
                                this.A03.A09(programInfoLength);
                                esInfoLength = this.A03.A04(esInfoLength2);
                                this.A03.A09(tableId4);
                                tableId = this.A03.A04(12);
                                c1598czA00 = A00(c1084Mk, tableId);
                                if (programNumber != 6) {
                                }
                            }
                            iA07 -= tableId + 5;
                            int tableId5 = this.A04.A09;
                            int tableId6 = tableId5 == 2 ? programNumber : esInfoLength;
                            if (!this.A04.A0C.get(tableId6)) {
                                if (this.A04.A09 != 2 || programNumber != i12) {
                                    interfaceC1602d3A64 = this.A04.A0H.A64(programNumber, c1598czA00);
                                } else {
                                    interfaceC1602d3A64 = this.A04.A05;
                                }
                                if (this.A04.A09 != 2 || esInfoLength < this.A02.get(tableId6, UserMetadata.MAX_INTERNAL_KEY_SIZE)) {
                                    this.A02.put(tableId6, esInfoLength);
                                    this.A01.put(tableId6, interfaceC1602d3A64);
                                }
                            }
                            i12 = 21;
                            programInfoLength = 3;
                            tableId4 = 4;
                            esInfoLength2 = 13;
                        }
                        int esInfoLength3 = this.A02.size();
                        for (int programNumber2 = 0; programNumber2 < esInfoLength3; programNumber2++) {
                            int programInfoLength2 = this.A02.keyAt(programNumber2);
                            int trackIdCount = this.A02.valueAt(programNumber2);
                            this.A04.A0C.put(programInfoLength2, true);
                            this.A04.A0D.put(trackIdCount, true);
                            InterfaceC1602d3 interfaceC1602d3ValueAt = this.A01.valueAt(programNumber2);
                            if (interfaceC1602d3ValueAt != null) {
                                if (interfaceC1602d3ValueAt != this.A04.A05) {
                                    interfaceC1602d3ValueAt.AAo(c1092Ms, this.A04.A03, new C1601d2(i11, programInfoLength2, UserMetadata.MAX_INTERNAL_KEY_SIZE));
                                }
                                this.A04.A0B.put(trackIdCount, interfaceC1602d3ValueAt);
                            }
                        }
                        if (this.A04.A09 == 2) {
                            if (!this.A04.A08) {
                                this.A04.A03.A6x();
                                this.A04.A02 = 0;
                                this.A04.A08 = true;
                                return;
                            }
                            return;
                        }
                        int i13 = 0;
                        this.A04.A0B.remove(this.A00);
                        C1105Nf c1105Nf = this.A04;
                        if (this.A04.A09 != 1) {
                            int i14 = this.A04.A02;
                            if (A05[7].charAt(23) != 'U') {
                                String[] strArr2 = A05;
                                strArr2[2] = "cOQDQpzMhrcl1CtsXtFiSTP6gwzqV3qW";
                                strArr2[0] = "yb3hnpA3u1t26YJLwEutzpd0DtxVnfej";
                                i13 = i14 - 1;
                            }
                        }
                        c1105Nf.A02 = i13;
                        if (this.A04.A02 == 0) {
                            this.A04.A03.A6x();
                            this.A04.A08 = true;
                            return;
                        }
                        return;
                    }
                }
            }
            throw new RuntimeException();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1593cu
    public final void AAo(C1092Ms c1092Ms, InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
    }
}
