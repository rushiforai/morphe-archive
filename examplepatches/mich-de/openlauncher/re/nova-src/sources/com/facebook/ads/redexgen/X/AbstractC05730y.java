package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import kotlin.Metadata;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* JADX WARN: Unexpected interfaces in signature: [kotlin.jvm.internal.markers.KMappedMarker] */
@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0y, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC05730y<E> implements Collection<E> {
    public static byte[] A00;
    public static String[] A01 = {"vpqNXUEZRAyywosRDfA1klskIajZed", "OHtIs9AL0l", "MLwNR7EASioILyVlIbGXwLV7TCbYE8Bh", "wPJI2GbFDuXbz4x7LgUCS1JDTvkmrQWe", "Oad1wY6FMbzjC20tZEnzqVoj9IblLiUi", "lRmyixXyRoksWskF89hESh3U8UhIe2Vs", "nkJYZkIWegDMfSCLriuG3dJId", "kWatFbSy5VoKX3rN5NMrFvDtFj2em1kx"};

    public static String A0A(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 28);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0B() {
        A00 = new byte[]{68, -112, -124, -123, -113, 60, 95, -117, -120, -120, -127, AbstractJsonLexerKt.TC_INVALID, -112, -123, -117, -118, 69, 87, 75, -126, -93, -104, -91, -108, -89, -100, -94, -95, 83, -100, -90, 83, -95, -94, -89, 83, -90, -88, -93, -93, -94, -91, -89, -104, -105, 83, -103, -94, -91, 83, -91, -104, -108, -105, 96, -94, -95, -97, -84, 83, -106, -94, -97, -97, -104, -106, -89, -100, -94, -95, -22, -99, -89, -72, -72, -89, -65, -10, -3, -10, -2, -10, -1, 5, 4};
    }

    public abstract int A0C();

    @Override // java.util.Collection
    public final boolean add(E e3) {
        throw new UnsupportedOperationException(A0A(19, 51, 23));
    }

    @Override // java.util.Collection
    public final boolean addAll(Collection<? extends E> collection) {
        throw new UnsupportedOperationException(A0A(19, 51, 23));
    }

    @Override // java.util.Collection
    public final void clear() {
        throw new UnsupportedOperationException(A0A(19, 51, 23));
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.Collection
    public final boolean containsAll(Collection<?> collection) {
        C1h.A09(collection, A0A(77, 8, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
        Collection<?> collection2 = collection;
        if (collection2.isEmpty()) {
            return true;
        }
        Iterator<T> it = collection2.iterator();
        while (it.hasNext()) {
            if (!contains(it.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.Collection, java.lang.Iterable, java.util.List
    public abstract Iterator<E> iterator();

    @Override // java.util.Collection
    public final boolean remove(Object obj) {
        throw new UnsupportedOperationException(A0A(19, 51, 23));
    }

    @Override // java.util.Collection
    public final boolean removeAll(Collection<?> collection) {
        throw new UnsupportedOperationException(A0A(19, 51, 23));
    }

    @Override // java.util.Collection
    public final boolean retainAll(Collection<?> collection) {
        throw new UnsupportedOperationException(A0A(19, 51, 23));
    }

    static {
        A0B();
    }

    public static final CharSequence A08(AbstractC05730y abstractC05730y, Object obj) {
        String strA0A = obj == abstractC05730y ? A0A(0, 17, 0) : String.valueOf(obj);
        if (A01[6].length() != 25) {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[1] = "bzgdEk706S";
        strArr[0] = "QSalxJR18k84fBzlQ7DrSdaJF2ak13";
        return strA0A;
    }

    @Override // java.util.Collection, java.util.List
    public boolean contains(Object obj) {
        AbstractC05730y<E> abstractC05730y = this;
        if ((abstractC05730y instanceof Collection) && abstractC05730y.isEmpty()) {
            return false;
        }
        Iterator<E> it = abstractC05730y.iterator();
        while (it.hasNext()) {
            boolean zA0C = C1h.A0C(it.next(), obj);
            String[] strArr = A01;
            if (strArr[1].length() == strArr[0].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[1] = "sRJmN2MMEv";
            strArr2[0] = "rlos11EJgA8vpDSt1wHrGDeXVXDu3T";
            if (zA0C) {
                return true;
            }
        }
        return false;
    }

    @Override // java.util.Collection
    public boolean isEmpty() {
        return size() == 0;
    }

    @Override // java.util.Collection
    public final /* bridge */ int size() {
        return A0C();
    }

    @Override // java.util.Collection
    public Object[] toArray() {
        return AbstractC05821j.A02(this);
    }

    @Override // java.util.Collection
    public <T> T[] toArray(T[] tArr) {
        C1h.A09(tArr, A0A(72, 5, 42));
        return (T[]) AbstractC05821j.A03(this, tArr);
    }

    public final String toString() {
        return AnonymousClass05.A03(this, A0A(17, 2, 15), A0A(70, 1, 115), A0A(71, 1, 36), 0, null, new InterfaceC05610m() { // from class: com.facebook.ads.redexgen.X.0c
            @Override // com.facebook.ads.redexgen.X.InterfaceC05610m
            public final Object AB1(Object obj) {
                return AbstractC05730y.A08(this.A00, obj);
            }
        }, 24, null);
    }
}
