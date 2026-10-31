package com.facebook.ads.redexgen.X;

import com.facebook.ads.redexgen.X.AbstractC2172mQ;
import com.facebook.ads.redexgen.X.C2170mO;
import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Queue;

/* renamed from: com.facebook.ads.redexgen.X.mP, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2171mP<T extends AbstractC2172mQ, E extends C2170mO> {
    public static String[] A02 = {"WBmgDKUAJnOjRPVdo459bnYJXDnRSoZA", "OZ5TpfWbSmXE", "sC9WLlq1dd0W0qrWeGI0su3O22TcCAEW", "0Ub2X", "5m4s5CvbohnvtMuC", "JEGJTDHJWZGaFE0Bjwe", "ELtjylBnyGpGsAAS3nfDjHYeujv6lcAm", "LzmA2INjpudrbI3uXcOOEdZHAsdjx9ZW"};
    public final Map<Class<E>, List<WeakReference<T>>> A00 = new HashMap();
    public final Queue<E> A01 = new ArrayDeque();

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 6 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    private void A00(E e3) {
        List<WeakReference<T>> list;
        if (this.A00 == null || (list = this.A00.get(e3.getClass())) == null) {
            return;
        }
        A01(list);
        if (list.isEmpty()) {
            return;
        }
        Iterator it = new ArrayList(list).iterator();
        while (it.hasNext()) {
            AbstractC2172mQ abstractC2172mQ = (AbstractC2172mQ) ((WeakReference) it.next()).get();
            if (abstractC2172mQ != null && abstractC2172mQ.A00(e3)) {
                abstractC2172mQ.A03(e3);
            }
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 3 out of bounds for length 3
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final synchronized void A02(E e3) {
        if (this.A01.isEmpty()) {
            this.A01.add(e3);
            while (!this.A01.isEmpty()) {
                A00(this.A01.peek());
                this.A01.remove();
            }
        } else {
            this.A01.add(e3);
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 7 out of bounds for length 7
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final synchronized boolean A05(T t6) {
        if (t6 == null) {
            return false;
        }
        Class<E> clsA01 = t6.A01();
        List<WeakReference<T>> arrayList = this.A00.get(clsA01);
        if (arrayList == null) {
            arrayList = new ArrayList<>();
            this.A00.put(clsA01, arrayList);
        }
        A01(arrayList);
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            if (arrayList.get(i5).get() == t6) {
                return false;
            }
        }
        return arrayList.add(new WeakReference<>(t6));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.mP != com.facebook.ads.internal.events.EventBus<T extends com.facebook.ads.redexgen.X.mQ, E extends com.facebook.ads.redexgen.X.mO> */
    /* JADX WARN: Incorrect condition in loop: B:5:0x0008 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A01(List<WeakReference<T>> list) {
        if (list != null) {
            int i5 = 0;
            for (int i11 = 0; i11 < writePtr; i11++) {
                WeakReference<T> weakReference = list.get(i11);
                T t6 = weakReference.get();
                int readPtr = A02[1].length();
                if (readPtr != 12) {
                    throw new RuntimeException();
                }
                String[] strArr = A02;
                strArr[6] = "MDutMibHR0xfS0kHpIX6qzWASaThPw85";
                strArr[0] = "nvT9JaP2TDwXv3h3yDNvutMp299h55Zc";
                if (t6 != null) {
                    int writePtr = i5 + 1;
                    list.set(i5, weakReference);
                    i5 = writePtr;
                }
            }
            int writePtr2 = list.size();
            for (int writePtr3 = writePtr2 - 1; writePtr3 >= i5; writePtr3--) {
                list.remove(writePtr3);
            }
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.mP != com.facebook.ads.internal.events.EventBus<T extends com.facebook.ads.redexgen.X.mQ, E extends com.facebook.ads.redexgen.X.mO> */
    public final synchronized void A03(T... subscribers) {
        if (subscribers == null) {
            return;
        }
        for (T t6 : subscribers) {
            A05(t6);
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.mP != com.facebook.ads.internal.events.EventBus<T extends com.facebook.ads.redexgen.X.mQ, E extends com.facebook.ads.redexgen.X.mO> */
    public final synchronized void A04(T... subscribers) {
        if (subscribers == null) {
            return;
        }
        for (T t6 : subscribers) {
            A06(t6);
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.mP != com.facebook.ads.internal.events.EventBus<T extends com.facebook.ads.redexgen.X.mQ, E extends com.facebook.ads.redexgen.X.mO> */
    public final synchronized boolean A06(T subscriber) {
        if (subscriber == null) {
            return false;
        }
        List<WeakReference<T>> list = this.A00.get(subscriber.A01());
        if (list == null) {
            return false;
        }
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            if (list.get(i5).get() == subscriber) {
                list.get(i5).clear();
                return true;
            }
        }
        return false;
    }
}
