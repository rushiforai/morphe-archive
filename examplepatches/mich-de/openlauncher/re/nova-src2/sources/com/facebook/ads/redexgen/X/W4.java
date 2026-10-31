package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.AbstractSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.annotation.CheckForNull;

/* JADX INFO: Add missing generic type declarations: [V, K] */
/* loaded from: assets/audience_network/classes.dex */
public class W4<K, V> extends AbstractSet<Map.Entry<K, V>> {
    public static String[] A01 = {"WodfJ9zhEnlXNtqdV", "y0kWzKoaH0eMYeNB35wHkc7qqJzFWN0", "tpy6", b.f42142b, "7nQRkIlYhCKQBMnXyW4Er", "ww9Z", "RpAcaNkygWJa3mpBy5ICAZSZh27fiMgF", b.f42142b};
    public final /* synthetic */ W0 A00;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 6 out of bounds for length 6
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(@CheckForNull Object o) {
        Map<K, V> mapA0h = this.A00.A0h();
        if (mapA0h == null) {
            if (!(o instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry) o;
            int iA07 = this.A00.A07(entry.getKey());
            return iA07 != -1 && A6.A01(this.A00.A0F(iA07), entry.getValue());
        }
        boolean zContains = mapA0h.entrySet().contains(o);
        String[] strArr = A01;
        if (strArr[5].length() != strArr[2].length()) {
            throw new RuntimeException();
        }
        A01[6] = "FpCjpgmyESJyu6z0fuva3OnAmLys7XVv";
        return zContains;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W4 != com.google.common.collect.CompactHashMap<K, V>$EntrySetView */
    public W4(final W0 this$0) {
        this.A00 = this$0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W4 != com.google.common.collect.CompactHashMap<K, V>$EntrySetView */
    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        this.A00.clear();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W4 != com.google.common.collect.CompactHashMap<K, V>$EntrySetView */
    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator<Map.Entry<K, V>> iterator() {
        return this.A00.A0d();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W4 != com.google.common.collect.CompactHashMap<K, V>$EntrySetView */
    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean remove(@CheckForNull Object o) {
        int iA00;
        int iA06;
        Map<K, V> delegate = this.A00.A0h();
        if (delegate != null) {
            Set<Map.Entry<K, V>> setEntrySet = delegate.entrySet();
            if (A01[6].charAt(10) != 'J') {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[3] = b.f42142b;
            strArr[7] = b.f42142b;
            return setEntrySet.remove(o);
        }
        if (!(o instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry) o;
        if (this.A00.A0p() || (iA06 = AbstractC1315Vz.A06(entry.getKey(), entry.getValue(), (iA00 = this.A00.A00()), this.A00.A0C(), this.A00.A0T(), this.A00.A0V(), this.A00.A0W())) == -1) {
            return false;
        }
        this.A00.A0n(iA06, iA00);
        W0.A04(this.A00);
        this.A00.A0j();
        return true;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W4 != com.google.common.collect.CompactHashMap<K, V>$EntrySetView */
    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.A00.size();
    }
}
