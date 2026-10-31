package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
@MetaExoPlayerCustomization
/* loaded from: assets/audience_network/classes.dex */
public final class XR {
    public static byte[] A00;
    public static final XR A01;

    static {
        A06();
        A01 = new XR();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 69);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A00 = new byte[]{101, 108, 101, 109, 101, 110, 116, 115};
    }

    @JvmStatic
    public static final <T> List<T> A01() {
        return AbstractC05700v.A09();
    }

    @JvmStatic
    public static final <T> List<T> A02(T... tArr) {
        C1h.A09(tArr, A00(0, 8, 69));
        Object[] objArrCopyOf = Arrays.copyOf(tArr, tArr.length);
        return new ArrayList(AbstractC05700v.A0A(Arrays.copyOf(objArrCopyOf, objArrCopyOf.length)));
    }

    @JvmStatic
    public static final <T> List<T> A03(T... tArr) {
        C1h.A09(tArr, A00(0, 8, 69));
        return new ArrayList(AbstractC05700v.A0A(Arrays.copyOf(tArr, tArr.length)));
    }

    @JvmStatic
    public static final <K, V> Map<K, V> A04(Map<K, ? extends V> map) {
        if (map == null) {
            return new HashMap();
        }
        Map it = new HashMap(map);
        return it;
    }

    @JvmStatic
    public static final <T> Set<T> A05(T... tArr) {
        C1h.A09(tArr, A00(0, 8, 69));
        return new HashSet(AbstractC05700v.A0A(Arrays.copyOf(tArr, tArr.length)));
    }
}
