package com.bytedance.adsdk.ycx.zb.lud;

import com.bytedance.adsdk.ycx.zb.dj.dj;
import com.bytedance.adsdk.ycx.zb.dj.sya;
import com.bytedance.adsdk.ycx.zb.zb.ycx.ea;
import com.bytedance.adsdk.ycx.zb.zb.ycx.fby;
import com.bytedance.adsdk.ycx.zb.zb.ycx.jw;
import com.bytedance.adsdk.ycx.zb.zb.ycx.lt;
import com.bytedance.adsdk.ycx.zb.zb.ycx.lud;
import com.bytedance.adsdk.ycx.zb.zb.ycx.ok;
import com.bytedance.adsdk.ycx.zb.zb.ycx.pmi;
import com.bytedance.adsdk.ycx.zb.zb.ycx.ry;
import com.bytedance.adsdk.ycx.zb.zb.ycx.uh;
import com.bytedance.adsdk.ycx.zb.zb.ycx.wie;
import com.bytedance.adsdk.ycx.zb.zb.ycx.xkz;
import java.util.Deque;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/* loaded from: classes2.dex */
public class zb {

    /* renamed from: com.bytedance.adsdk.ycx.zb.lud.zb$1, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] ycx;

        static {
            int[] iArr = new int[sya.values().length];
            ycx = iArr;
            try {
                iArr[sya.MINUS.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                ycx[sya.PLUS.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                ycx[sya.DIVISION.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                ycx[sya.MULTI.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                ycx[sya.MOD.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                ycx[sya.EQ.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                ycx[sya.NOT_EQ.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                ycx[sya.GT.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                ycx[sya.LT.ordinal()] = 9;
            } catch (NoSuchFieldError unused9) {
            }
            try {
                ycx[sya.GT_EQ.ordinal()] = 10;
            } catch (NoSuchFieldError unused10) {
            }
            try {
                ycx[sya.LT_EQ.ordinal()] = 11;
            } catch (NoSuchFieldError unused11) {
            }
            try {
                ycx[sya.DOUBLE_AMP.ordinal()] = 12;
            } catch (NoSuchFieldError unused12) {
            }
            try {
                ycx[sya.DOUBLE_BAR.ordinal()] = 13;
            } catch (NoSuchFieldError unused13) {
            }
        }
    }

    private static void sya(List<com.bytedance.adsdk.ycx.zb.zb.ycx> list, String str, int i5) {
        Iterator<com.bytedance.adsdk.ycx.zb.zb.ycx> it = list.iterator();
        while (it.hasNext()) {
            if (dj.ycx(it.next().ycx())) {
                throw new IllegalArgumentException(str.substring(0, i5));
            }
        }
    }

    public static com.bytedance.adsdk.ycx.zb.zb.ycx ycx(List<com.bytedance.adsdk.ycx.zb.zb.ycx> list, String str, int i5) {
        sya(list, str, i5);
        Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> dequeYcx = ycx(zb(list, str, i5));
        if (dequeYcx.size() == 1) {
            return dequeYcx.getFirst();
        }
        throw new IllegalStateException();
    }

    private static Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> zb(List<com.bytedance.adsdk.ycx.zb.zb.ycx> list, String str, int i5) {
        LinkedList<com.bytedance.adsdk.ycx.zb.zb.ycx> linkedList = new LinkedList(list);
        int i11 = 5;
        while (i11 > 0) {
            LinkedList linkedList2 = new LinkedList();
            for (com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar : linkedList) {
                if (!linkedList2.isEmpty() && sya.ycx(((com.bytedance.adsdk.ycx.zb.zb.ycx) linkedList2.peekLast()).ycx()) && ((sya) ((com.bytedance.adsdk.ycx.zb.zb.ycx) linkedList2.peekLast()).ycx()).zb() == i11) {
                    com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar2 = (com.bytedance.adsdk.ycx.zb.zb.ycx) linkedList2.pollLast();
                    com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar3 = (com.bytedance.adsdk.ycx.zb.zb.ycx) linkedList2.pollLast();
                    if (sya.ycx(ycxVar3.ycx()) || sya.ycx(ycxVar.ycx())) {
                        throw new IllegalArgumentException(str.substring(0, i5));
                    }
                    linkedList2.addLast(ycx(ycxVar3, ycxVar2, ycxVar));
                } else {
                    linkedList2.addLast(ycxVar);
                }
            }
            i11--;
            linkedList = linkedList2;
        }
        return linkedList;
    }

    private static Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> ycx(Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> deque) {
        LinkedList linkedList = new LinkedList();
        for (com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar : deque) {
            if (!linkedList.isEmpty() && ((com.bytedance.adsdk.ycx.zb.zb.ycx) linkedList.peekLast()).ycx() == sya.COLON) {
                linkedList.pollLast();
                com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar2 = (com.bytedance.adsdk.ycx.zb.zb.ycx) linkedList.pollLast();
                if (((com.bytedance.adsdk.ycx.zb.zb.ycx) linkedList.pollLast()).ycx() == sya.QUESTION) {
                    com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar3 = (com.bytedance.adsdk.ycx.zb.zb.ycx) linkedList.pollLast();
                    uh uhVar = new uh();
                    uhVar.ycx(ycxVar3);
                    uhVar.zb(ycxVar2);
                    uhVar.sya(ycxVar);
                    linkedList.addLast(uhVar);
                } else {
                    throw new IllegalStateException();
                }
            } else {
                linkedList.addLast(ycxVar);
            }
        }
        return linkedList;
    }

    private static com.bytedance.adsdk.ycx.zb.zb.ycx ycx(com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar, com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar2, com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar3) {
        wie eaVar;
        switch (AnonymousClass1.ycx[((sya) ycxVar2.ycx()).ordinal()]) {
            case 1:
                eaVar = new ea();
                break;
            case 2:
                eaVar = new pmi();
                break;
            case 3:
                eaVar = new com.bytedance.adsdk.ycx.zb.zb.ycx.ycx();
                break;
            case 4:
                eaVar = new ry();
                break;
            case 5:
                eaVar = new ok();
                break;
            case 6:
                eaVar = new com.bytedance.adsdk.ycx.zb.zb.ycx.dj();
                break;
            case 7:
                eaVar = new xkz();
                break;
            case 8:
                eaVar = new lt();
                break;
            case 9:
                eaVar = new jw();
                break;
            case 10:
                eaVar = new lud();
                break;
            case 11:
                eaVar = new fby();
                break;
            case 12:
                eaVar = new com.bytedance.adsdk.ycx.zb.zb.ycx.zb();
                break;
            case 13:
                eaVar = new com.bytedance.adsdk.ycx.zb.zb.ycx.sya();
                break;
            default:
                throw new UnsupportedOperationException(ycxVar2.ycx().toString());
        }
        eaVar.ycx(ycxVar);
        eaVar.zb(ycxVar3);
        return eaVar;
    }

    public static boolean ycx(Object obj) {
        if (obj == null) {
            return false;
        }
        if (!(obj instanceof Boolean) || ((Boolean) obj).booleanValue()) {
            return !(obj instanceof Number) || ((Number) obj).floatValue() >= 0.0f;
        }
        return false;
    }
}
