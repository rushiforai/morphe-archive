package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import kotlin.Metadata;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.2e, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C05892e {
    public static byte[] A04;
    public final AnonymousClass13 A00;
    public final Map<C2K, Map<C06042y, C05912l<?, ?>>> A01;
    public final Map<C2K, C05912l<?, ?>> A02;
    public final Set<C05912l<?, ?>> A03;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 63);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A04 = new byte[]{39, 47, 50, 54, 59, 126, 66, 67, 89, 10, 124, 67, 79, 93, 90, 69, 67, 68, 94, 110, 75, 94, 75, 10, 66, 75, 89, 10, 72, 79, 79, 68, 10, 88, 79, 77, 67, 89, 94, 79, 88, 79, 78, 10, 72, 79, 76, 69, 88, 79, 10, 75, 68, 78, 10, 73, 75, 68, 68, 69, 94, 10, 72, 79, 10, 88, 79, 7, 95, 89, 79, 78, 4, 106, 104, AbstractJsonLexerKt.TC_INVALID, 98, 100, 101, 32, 46, 50, 11, 10, 1, 0, 73, 93, 123, 87, 86, 94, 81, 95, 78, 89, 79, 73, 80, 72, 29, 6, 60, 7, 27, 12, 14, 0, 26, 29, 12, 27, 51, 44, 32, 50, 53, 42, 44, 43, 49, 1, 36, 49, 36};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private final void A05(Map<String, Set<String>> map, C05912l<?, ?> c05912l) {
        C05912l<?, ?> c05912l2 = c05912l.A05;
        if (c05912l2 == C05912l.A0C || c05912l2 == null) {
            return;
        }
        String str = c05912l2.A02;
        LinkedHashSet linkedHashSet = map.get(str);
        if (linkedHashSet == null) {
            linkedHashSet = new LinkedHashSet();
            map.put(str, linkedHashSet);
        }
        linkedHashSet.add(c05912l.A02);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public final synchronized void A09(C2K c2k, C06042y c06042y, C05912l<?, ?> c05912l) {
        C1h.A09(c2k, A00(82, 4, 90));
        C1h.A09(c06042y, A00(79, 3, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE));
        C1h.A09(c05912l, A00(112, 13, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE));
        A03(c05912l);
        Map<C2K, Map<C06042y, C05912l<?, ?>>> map = this.A01;
        WeakHashMap weakHashMap = map.get(c2k);
        if (weakHashMap == null) {
            weakHashMap = new WeakHashMap();
            map.put(c2k, weakHashMap);
        }
        C05912l<?, ?> c05912lPut = weakHashMap.put(c06042y, c05912l);
        if (c05912lPut != null) {
            A02(c05912lPut);
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public final synchronized void A0B(C2K c2k, InterfaceC05610m<? super C05912l<?, ?>, AnonymousClass22> interfaceC05610m) {
        Collection<C05912l<?, ?>> collectionValues;
        C1h.A09(c2k, A00(82, 4, 90));
        C1h.A09(interfaceC05610m, A00(73, 6, 52));
        C05912l<?, ?> c05912l = this.A02.get(c2k);
        if (c05912l != null) {
            interfaceC05610m.AB1(c05912l);
        }
        Map<C06042y, C05912l<?, ?>> map = this.A01.get(c2k);
        if (map != null && (collectionValues = map.values()) != null) {
            Iterator<T> it = collectionValues.iterator();
            while (it.hasNext()) {
                interfaceC05610m.AB1((C05912l) it.next());
            }
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public final synchronized void A0C(Collection<C2K> collection, List<C05912l<?, ?>> list, Map<String, Set<String>> map) {
        C1h.A09(collection, A00(94, 6, 3));
        C1h.A09(list, A00(100, 12, 86));
        if (map != null) {
            map.clear();
        }
        if (!AnonymousClass14.A0C || (!this.A02.isEmpty())) {
            collection.addAll(this.A02.keySet());
        }
        if (this.A00.A01) {
            Set<C2K> setKeySet = this.A01.keySet();
            ArrayList arrayList = new ArrayList();
            for (Object obj : setKeySet) {
                if (!this.A02.containsKey((C2K) obj)) {
                    arrayList.add(obj);
                }
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                collection.add((C2K) it.next());
            }
        }
        if (!this.A03.isEmpty()) {
            list.addAll(this.A03);
            this.A03.clear();
        }
        if (map != null) {
            Iterator<T> it2 = this.A02.values().iterator();
            while (it2.hasNext()) {
                A05(map, (C05912l) it2.next());
            }
            if (this.A00.A01) {
                Iterator<T> it3 = this.A01.values().iterator();
                while (it3.hasNext()) {
                    Iterator it4 = ((Map) it3.next()).values().iterator();
                    while (it4.hasNext()) {
                        A05(map, (C05912l) it4.next());
                    }
                }
            }
        }
    }

    public C05892e(AnonymousClass13 anonymousClass13) {
        C1h.A09(anonymousClass13, A00(86, 8, 7));
        this.A00 = anonymousClass13;
        this.A02 = new WeakHashMap();
        this.A03 = new LinkedHashSet();
        this.A01 = new WeakHashMap();
    }

    private final void A02(C05912l<?, ?> c05912l) {
        if (c05912l.A04) {
            c05912l.A00 = EnumC05922m.A04;
            this.A03.add(c05912l);
        }
    }

    private final void A03(C05912l<?, ?> c05912l) {
        if (!c05912l.A04 || c05912l.A00 == EnumC05922m.A02) {
            c05912l.A00 = EnumC05922m.A03;
            return;
        }
        throw new IllegalArgumentException(A00(5, 68, 21));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ void A04(C05892e c05892e, Collection collection, List list, Map map, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            map = null;
        }
        c05892e.A0C(collection, list, map);
    }

    public final synchronized C05912l<?, ?> A06(C2K c2k) {
        C05912l<?, ?> c05912l;
        C1h.A09(c2k, A00(82, 4, 90));
        c05912l = this.A02.get(c2k);
        if (c05912l == null) {
            c05912l = C05912l.A0C;
            C1h.A08(c05912l, A00(0, 5, 93));
        }
        return c05912l;
    }

    public final synchronized void A07(C2K c2k) {
        C1h.A09(c2k, A00(82, 4, 90));
        C05912l it = this.A02.remove(c2k);
        if (it != null) {
            A02(it);
        }
    }

    public final synchronized void A08(C2K c2k, C06042y c06042y) {
        C1h.A09(c2k, A00(82, 4, 90));
        C1h.A09(c06042y, A00(79, 3, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE));
        Map<C06042y, C05912l<?, ?>> map = this.A01.get(c2k);
        if (map != null) {
            C05912l<?, ?> c05912lRemove = map.remove(c06042y);
            if (c05912lRemove != null) {
                A02(c05912lRemove);
            }
            if (map.isEmpty()) {
                Map nodeDataMap = this.A01;
                nodeDataMap.remove(c2k);
            }
        }
    }

    public final synchronized void A0A(C2K c2k, C05912l<?, ?> c05912l) {
        C1h.A09(c2k, A00(82, 4, 90));
        C1h.A09(c05912l, A00(112, 13, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE));
        A03(c05912l);
        C05912l it = this.A02.put(c2k, c05912l);
        if (it != null) {
            A02(it);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final synchronized boolean A0D() {
        boolean z11;
        if (!this.A02.isEmpty() || !this.A01.isEmpty()) {
            z11 = false;
        } else if (this.A03.isEmpty()) {
            z11 = true;
        }
        return z11;
    }
}
