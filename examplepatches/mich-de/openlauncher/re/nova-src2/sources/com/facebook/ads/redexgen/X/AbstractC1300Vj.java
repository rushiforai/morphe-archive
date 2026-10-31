package com.facebook.ads.redexgen.X;

import androidx.compose.ui.node.LayoutNode;
import com.google.common.collect.ElementTypesAreNonnullByDefault;
import com.google.common.collect.ParametricNullness;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;
import javax.annotation.CheckForNull;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.Vj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1300Vj {
    public static byte[] A00;
    public static String[] A01 = {"mAiG95c3PV6PZIbr7CcPZ2Ck9GyMUpyZ", "lw1YZWJ7U1azUuYYKbHXMkT4U3dm1VrT", "aobcnUjLVsEBWzcZtt7kfs9RrWYxZtyr", "ImQAKjjqLJZmYiBF", "uvOQvbJY9PZ3K3nvM", "gEpMLyAnmLcugNo9FYFiqlLdewCmgbEy", "MN0b4tvR", "A6MYtCMGqLq8yCAegpkwWAUcqV2auHKn"};

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @CheckForNull
    public static <V> V A05(@CheckForNull Map<?, V> map, Object key) {
        AbstractC1335Wu.A04(map);
        try {
            return map.get(key);
        } catch (ClassCastException | NullPointerException unused) {
            return null;
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @CheckForNull
    public static <V> V A06(@CheckForNull Map<?, V> map, Object key) {
        AbstractC1335Wu.A04(map);
        try {
            return map.remove(key);
        } catch (ClassCastException | NullPointerException unused) {
            return null;
        }
    }

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 77);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        A00 = new byte[]{12, 0, 101, 120, 112, 101, 99, 116, 101, 100, 83, 105, 122, 101};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 3 out of bounds for length 3
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static boolean A0B(@CheckForNull Map<?, ?> map, Object object) {
        if (map == object) {
            return true;
        }
        if (object instanceof Map) {
            return map.entrySet().equals(((Map) object).entrySet());
        }
        return false;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static boolean A0C(@CheckForNull Map<?, ?> map, Object key) {
        AbstractC1335Wu.A04(map);
        try {
            return map.containsKey(key);
        } catch (ClassCastException | NullPointerException unused) {
            return false;
        }
    }

    static {
        A09();
    }

    public static int A00(int expectedSize) {
        if (expectedSize < 3) {
            W7.A00(expectedSize, A07(2, 12, 77));
            return expectedSize + 1;
        }
        if (expectedSize < 1073741824) {
            return (int) Math.ceil(expectedSize / 0.75d);
        }
        return LayoutNode.NotPlacedPlaceOrder;
    }

    public static <K, V> Map.Entry<K, V> A01(@ParametricNullness K key, @ParametricNullness V value) {
        return new C07559m(key, value);
    }

    public static <K, V> Iterator<K> A02(final Iterator<Map.Entry<K, V>> entryIterator) {
        return new VW<Map.Entry<K, V>, K>(entryIterator) { // from class: com.facebook.ads.redexgen.X.9h
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.VW
            @ParametricNullness
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final K A01(Map.Entry<K, V> entry) {
                return entry.getKey();
            }
        };
    }

    public static <K, V> Iterator<V> A03(final Iterator<Map.Entry<K, V>> entryIterator) {
        return new VW<Map.Entry<K, V>, V>(entryIterator) { // from class: com.facebook.ads.redexgen.X.9g
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.VW
            @ParametricNullness
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final V A01(Map.Entry<K, V> entry) {
                return entry.getValue();
            }
        };
    }

    public static <V> InterfaceC1338Wy<Map.Entry<?, V>, V> A04() {
        return EnumC07489f.A04;
    }

    public static String A08(Map<?, ?> map) {
        StringBuilder sbAppend = W5.A01(map.size()).append(AbstractJsonLexerKt.BEGIN_OBJ);
        boolean z11 = true;
        for (Map.Entry<?, ?> entry : map.entrySet()) {
            if (!z11) {
                sbAppend.append(A07(0, 2, 109));
            }
            z11 = false;
            sbAppend.append(entry.getKey()).append('=').append(entry.getValue());
        }
        StringBuilder sbAppend2 = sbAppend.append(AbstractJsonLexerKt.END_OBJ);
        if (A01[4].length() != 17) {
            throw new RuntimeException();
        }
        A01[4] = "WvXOrP2Pule709zdu";
        return sbAppend2.toString();
    }

    public static boolean A0A(@CheckForNull Map<?, ?> map, Object value) {
        return AbstractC1304Vn.A0D(A03(map.entrySet().iterator()), value);
    }
}
