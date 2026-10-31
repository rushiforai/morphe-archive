package com.facebook.ads.redexgen.X;

import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.if, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class Cif {
    public static String[] A01 = {"1CU3iw4Trc3qggngkxP7P26jEGLrLZaR", "qcH7HKgKdAybLTWn0rmK7JyCE0S9C8rn", "oNJ0dA1Zpt4CixMfeWT18n5RxX88Y0E3", "FZ8N3xW3PfzdZjJWrErZ2QIuE13XuJtD", "DvPOKoiXqOiYMgjx6IqCziqOSBLzEcJY", "MpMZeZ7xc490HXAXJonG5r1KTyiIoUHH", "NGMd8PbmdSzgSLgNcWdVjgLa", "jY1Ixh6DMe9BpV8yAbg842YJP45AQ2Eb"};
    public final InterfaceC1943ie A00;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 6 out of bounds for length 6
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    private int A00(List<C1921iH> list) {
        boolean z11 = false;
        for (int size = list.size() - 1; size >= 0; size--) {
            if (list.get(size).A00 != 8) {
                z11 = true;
            } else if (z11) {
                return size;
            }
        }
        return -1;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 4 out of bounds for length 4
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final void A05(List<C1921iH> list) {
        while (true) {
            int iA00 = A00(list);
            if (iA00 == -1) {
                return;
            } else {
                A01(list, iA00, iA00 + 1);
            }
        }
    }

    public Cif(InterfaceC1943ie interfaceC1943ie) {
        this.A00 = interfaceC1943ie;
    }

    private void A01(List<C1921iH> list, int i5, int i11) {
        C1921iH c1921iH = list.get(i5);
        C1921iH c1921iH2 = list.get(i11);
        switch (c1921iH2.A00) {
            case 1:
                A02(list, i5, c1921iH, i11, c1921iH2);
                break;
            case 2:
                A03(list, i5, c1921iH, i11, c1921iH2);
                break;
            case 4:
                A04(list, i5, c1921iH, i11, c1921iH2);
                break;
        }
    }

    private void A02(List<C1921iH> list, int i5, C1921iH c1921iH, int i11, C1921iH c1921iH2) {
        int i12 = 0;
        int i13 = c1921iH.A01;
        int offset = c1921iH2.A02;
        if (i13 < offset) {
            i12 = 0 - 1;
        }
        int i14 = c1921iH.A02;
        int offset2 = c1921iH2.A02;
        if (i14 < offset2) {
            i12++;
        }
        int i15 = c1921iH2.A02;
        int offset3 = c1921iH.A02;
        if (i15 <= offset3) {
            int i16 = c1921iH.A02;
            int offset4 = c1921iH2.A01;
            c1921iH.A02 = i16 + offset4;
        }
        int i17 = c1921iH2.A02;
        int offset5 = c1921iH.A01;
        if (i17 <= offset5) {
            int i18 = c1921iH.A01;
            int offset6 = c1921iH2.A01;
            c1921iH.A01 = i18 + offset6;
        }
        int offset7 = c1921iH2.A02;
        c1921iH2.A02 = offset7 + i12;
        list.set(i5, c1921iH2);
        list.set(i11, c1921iH);
    }

    private final void A03(List<C1921iH> list, int i5, C1921iH c1921iH, int i11, C1921iH c1921iH2) {
        boolean z11;
        C1921iH c1921iHADb = null;
        boolean z12 = false;
        if (c1921iH.A02 < c1921iH.A01) {
            z11 = false;
            if (c1921iH2.A02 == c1921iH.A02 && c1921iH2.A01 == c1921iH.A01 - c1921iH.A02) {
                z12 = true;
            }
        } else {
            z11 = true;
            if (c1921iH2.A02 == c1921iH.A01 + 1 && c1921iH2.A01 == c1921iH.A02 - c1921iH.A01) {
                z12 = true;
            }
        }
        if (c1921iH.A01 < c1921iH2.A02) {
            c1921iH2.A02--;
        } else if (c1921iH.A01 < c1921iH2.A02 + c1921iH2.A01) {
            c1921iH2.A01--;
            c1921iH.A00 = 2;
            c1921iH.A01 = 1;
            int remaining = c1921iH2.A01;
            if (A01[6].length() == 11) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[2] = "8AUTweiK2qHuqKAjuAP9RAHRjtqC9cI5";
            strArr[3] = "fxjAamJyQJjVOLb9u9QxKoC9co41mLuZ";
            if (remaining == 0) {
                list.remove(i11);
                this.A00.AIj(c1921iH2);
                return;
            }
            return;
        }
        if (c1921iH.A02 <= c1921iH2.A02) {
            c1921iH2.A02++;
        } else if (c1921iH.A02 < c1921iH2.A02 + c1921iH2.A01) {
            int remaining2 = (c1921iH2.A02 + c1921iH2.A01) - c1921iH.A02;
            c1921iHADb = this.A00.ADb(2, c1921iH.A02 + 1, remaining2, null);
            c1921iH2.A01 = c1921iH.A02 - c1921iH2.A02;
        }
        if (z12) {
            list.set(i5, c1921iH2);
            list.remove(i11);
            this.A00.AIj(c1921iH);
            return;
        }
        if (z11) {
            if (c1921iHADb != null) {
                if (c1921iH.A02 > c1921iHADb.A02) {
                    c1921iH.A02 -= c1921iHADb.A01;
                }
                if (c1921iH.A01 > c1921iHADb.A02) {
                    c1921iH.A01 -= c1921iHADb.A01;
                }
            }
            if (c1921iH.A02 > c1921iH2.A02) {
                c1921iH.A02 -= c1921iH2.A01;
            }
            if (c1921iH.A01 > c1921iH2.A02) {
                c1921iH.A01 -= c1921iH2.A01;
            }
        } else {
            if (c1921iHADb != null) {
                if (c1921iH.A02 >= c1921iHADb.A02) {
                    c1921iH.A02 -= c1921iHADb.A01;
                }
                if (c1921iH.A01 >= c1921iHADb.A02) {
                    c1921iH.A01 -= c1921iHADb.A01;
                }
            }
            if (c1921iH.A02 >= c1921iH2.A02) {
                c1921iH.A02 -= c1921iH2.A01;
            }
            if (c1921iH.A01 >= c1921iH2.A02) {
                c1921iH.A01 -= c1921iH2.A01;
            }
        }
        list.set(i5, c1921iH2);
        String[] strArr2 = A01;
        if (strArr2[1].charAt(7) == strArr2[5].charAt(7)) {
            throw new RuntimeException();
        }
        String[] strArr3 = A01;
        strArr3[1] = "R1vl9Esi4EQuoIO0IEs3BYKA9Bp2yfIo";
        strArr3[5] = "ll7MLLjNdpT1F8Cd0W3dCYnGe1w6KT9M";
        if (c1921iH.A02 != c1921iH.A01) {
            list.set(i11, c1921iH);
        } else {
            list.remove(i11);
        }
        if (c1921iHADb != null) {
            list.add(i5, c1921iHADb);
        }
    }

    private final void A04(List<C1921iH> list, int i5, C1921iH c1921iH, int i11, C1921iH c1921iH2) {
        C1921iH c1921iHADb = null;
        C1921iH c1921iHADb2 = null;
        if (c1921iH.A01 < c1921iH2.A02) {
            c1921iH2.A02--;
        } else {
            int remaining = c1921iH.A01;
            if (remaining < c1921iH2.A02 + c1921iH2.A01) {
                c1921iH2.A01--;
                c1921iHADb = this.A00.ADb(4, c1921iH.A02, 1, c1921iH2.A03);
            }
        }
        if (c1921iH.A02 <= c1921iH2.A02) {
            c1921iH2.A02++;
        } else if (c1921iH.A02 < c1921iH2.A02 + c1921iH2.A01) {
            int i12 = (c1921iH2.A02 + c1921iH2.A01) - c1921iH.A02;
            c1921iHADb2 = this.A00.ADb(4, c1921iH.A02 + 1, i12, c1921iH2.A03);
            c1921iH2.A01 -= i12;
        }
        list.set(i11, c1921iH);
        if (c1921iH2.A01 > 0) {
            list.set(i5, c1921iH2);
        } else {
            list.remove(i5);
            this.A00.AIj(c1921iH2);
        }
        if (c1921iHADb != null) {
            list.add(i5, c1921iHADb);
        }
        if (c1921iHADb2 != null) {
            list.add(i5, c1921iHADb2);
        }
    }
}
