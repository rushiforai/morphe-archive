package com.facebook.ads.redexgen.X;

import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* renamed from: com.facebook.ads.redexgen.X.Mf, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1079Mf implements InterfaceC1692eW {
    public static String[] A02 = {"tHIxLrLE", "IxFhKPvaoxD0VQesnJF3iXAhHFCBXd3U", "Mt7WkNRkSixWeZ", "3NLK6E697RszsRzeaJINeoLCJHfPDhsT", "JeqM7ySnSEcfJ46rEA5WOjR5cPawbBex", "7hWC3g29mNlfw9Sa6a96dfCrmBFd", "u4ezoTfN06taZhCQIP75LuZm3JbllhhD", "boKPMSmNS7UHIj0vys9qYc8OI4xdhwBV"};
    public static final C1079Mf A03 = new C1079Mf(Collections.emptyMap());
    public int A00;
    public final Map<String, byte[]> A01;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static void A02(HashMap<String, byte[]> map, Map<String, Object> map2) {
        for (Map.Entry<String, Object> entry : map2.entrySet()) {
            map.put(entry.getKey(), A04(entry.getValue()));
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 6 out of bounds for length 6
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static boolean A03(Map<String, byte[]> map, Map<String, byte[]> map2) {
        if (map.size() != map2.size()) {
            return false;
        }
        for (Map.Entry<String, byte[]> entry : map.entrySet()) {
            if (!Arrays.equals(entry.getValue(), map2.get(entry.getKey()))) {
                return false;
            }
        }
        return true;
    }

    public C1079Mf() {
        this(Collections.emptyMap());
    }

    public C1079Mf(Map<String, byte[]> metadata) {
        this.A01 = Collections.unmodifiableMap(metadata);
    }

    public static Map<String, byte[]> A00(Map<String, byte[]> otherMetadata, C1693eX c1693eX) {
        HashMap map = new HashMap(otherMetadata);
        A01(map, c1693eX.A08());
        A02(map, c1693eX.A09());
        return map;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A01(HashMap<String, byte[]> metadata, List<String> names) {
        for (int i5 = 0; i5 < i; i5++) {
            metadata.remove(names.get(i5));
        }
    }

    public static byte[] A04(Object obj) {
        if (obj instanceof Long) {
            return ByteBuffer.allocate(8).putLong(((Long) obj).longValue()).array();
        }
        if (obj instanceof String) {
            return ((String) obj).getBytes(XA.A05);
        }
        if (obj instanceof byte[]) {
            return (byte[]) obj;
        }
        throw new IllegalArgumentException();
    }

    public final C1079Mf A05(C1693eX c1693eX) {
        Map<String, byte[]> mapA00 = A00(this.A01, c1693eX);
        Map<String, byte[]> mutatedMetadata = this.A01;
        if (A03(mutatedMetadata, mapA00)) {
            return this;
        }
        return new C1079Mf(mapA00);
    }

    public final Set<Map.Entry<String, byte[]>> A06() {
        return this.A01.entrySet();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1692eW
    public final long A7H(String str, long j11) {
        byte[] bytes = this.A01.get(str);
        if (bytes != null) {
            return ByteBuffer.wrap(bytes).getLong();
        }
        return j11;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1692eW
    public final String A7J(String str, String str2) {
        byte[] bArr = this.A01.get(str);
        if (bArr != null) {
            return new String(bArr, XA.A05);
        }
        return str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        Class<?> cls = getClass();
        if (A02[1].charAt(18) == 'T') {
            throw new RuntimeException();
        }
        String[] strArr = A02;
        strArr[7] = "6r2AG8KzSIJYPm0ymJrbXII3fUPa22Nm";
        strArr[4] = "C0ekPVmQSraQipc5Ub5LGRKtpypKPfgh";
        if (cls != obj.getClass()) {
            return false;
        }
        return A03(this.A01, ((C1079Mf) obj).A01);
    }

    public final int hashCode() {
        if (this.A00 == 0) {
            int i5 = 0;
            for (Map.Entry<String, byte[]> entry : this.A01.entrySet()) {
                int iHashCode = entry.getKey().hashCode();
                int result = Arrays.hashCode(entry.getValue());
                i5 += iHashCode ^ result;
            }
            this.A00 = i5;
        }
        int i11 = this.A00;
        if (A02[1].charAt(18) == 'T') {
            throw new RuntimeException();
        }
        String[] strArr = A02;
        strArr[0] = "KdxSxAZt";
        strArr[2] = "LTz56xi50lNSvM";
        return i11;
    }
}
