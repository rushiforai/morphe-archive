package com.facebook.ads.redexgen.X;

import android.net.Uri;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class LK implements InterfaceC1704ei {
    public static byte[] A0o;
    public static String[] A0p = {"pffUOHFsbkYgBuiJu7ARpuvPQkGrNkhZ", "BvccWwTCpG", "0meA5FJVxX5DgE5", "YePtA2RMVHx7NgHbnrYgVwrzWSYEbQ1I", "Qf6n1YvjZeW9gtXSw37rMADjtsvw8iaw", "w1EV2p9YRD2VJ3m0eDY9mCLTW1AndQPj", "0h3FbVKspnC9Z104DCdxRPxcboLPUKem", "Fty6e8XTkdUF2BLp98LdpCa12aPx9Eax"};
    public final int A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final int A04;
    public final int A05;
    public final int A06;
    public final int A07;
    public final int A08;
    public final int A09;
    public final int A0A;
    public final long A0B;
    public final Uri A0C;
    public final EnumC1703eh A0D;
    public final LA A0E;
    public final C2252ni A0F;
    public final C2252ni A0G;
    public final C2252ni A0H;
    public final C2253nj A0I;
    public final EnumC2256nm A0J;
    public final String A0K;
    public final String A0L;
    public final String A0M;
    public final String A0N;
    public final String A0O;
    public final String A0P;
    public final String A0Q;
    public final String A0R;
    public final String A0S;
    public final String A0T;
    public final String A0U;
    public final String A0V;
    public final String A0W;
    public final String A0X;
    public final String A0Y;
    public final String A0Z;
    public final String A0a;
    public final String A0b;
    public final String A0c;
    public final String A0d;
    public final String A0e;
    public final String A0f;
    public final Collection<String> A0g;
    public final List<LK> A0h;
    public final boolean A0i;
    public final boolean A0j;
    public final boolean A0k;
    public final boolean A0l;
    public final boolean A0m;
    public final boolean A0n;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 59 out of bounds for length 55
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public LK(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, String str10, String str11, String str12, String str13, String str14, String str15, C2252ni c2252ni, LA la2, C2252ni c2252ni2, C2252ni c2252ni3, C2253nj c2253nj, String str16, String str17, long j11, EnumC2256nm enumC2256nm, boolean z11, int i5, int i11, List<LK> list, String str18, String str19, int i12, String str20, Uri uri, String str21, boolean z12, boolean z13, int i13, int i14, int i15, int i16, EnumC1703eh enumC1703eh, Collection<String> collection, int i17, boolean z14, int i18, boolean z15, int i19, boolean z16, int i21) {
        this.A0M = str;
        this.A0K = str2;
        this.A0Y = str3;
        this.A0Z = str4;
        this.A0W = str5;
        this.A0V = str6;
        this.A0O = str7;
        this.A0T = str8;
        this.A0P = str9;
        this.A0U = str10;
        this.A0X = str11;
        this.A0S = str12;
        this.A0R = str13;
        this.A0Q = str14;
        this.A0L = str15;
        this.A0F = c2252ni;
        this.A0E = la2;
        this.A0G = c2252ni2;
        this.A0H = c2252ni3;
        this.A0I = c2253nj;
        this.A0f = str16;
        this.A0e = str17;
        this.A0B = j11;
        this.A0J = enumC2256nm;
        this.A0j = z11;
        this.A0h = list;
        this.A0a = str18;
        this.A0c = str19;
        this.A0N = A00(0, 9, 103);
        this.A02 = i5;
        this.A01 = i11;
        this.A00 = i12;
        this.A0b = str20;
        this.A0C = uri;
        this.A0d = str21;
        this.A0m = z12;
        this.A0n = z13;
        this.A06 = i13;
        this.A07 = i14;
        this.A09 = i15;
        this.A0A = i16;
        this.A0D = enumC1703eh;
        this.A0g = collection;
        this.A03 = i17;
        this.A0i = z14;
        this.A08 = i18;
        this.A0k = z15;
        this.A04 = i19;
        this.A0l = z16;
        this.A05 = i21;
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0o, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A0p;
            if (strArr[3].charAt(24) != strArr[5].charAt(24)) {
                throw new RuntimeException();
            }
            A0p[1] = "BzWfTynEe4h";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 117);
            i13++;
        }
    }

    public static void A01() {
        A0o = new byte[]{29, 64, 31, 68, 75, 69, 63, 65, 79};
    }

    static {
        A01();
    }

    public LK() {
        this.A0M = null;
        this.A0K = null;
        this.A0Y = null;
        this.A0Z = null;
        this.A0W = null;
        this.A0V = null;
        this.A0O = null;
        this.A0T = null;
        this.A0P = null;
        this.A0U = null;
        this.A0X = null;
        this.A0S = null;
        this.A0R = null;
        this.A0Q = null;
        this.A0L = null;
        this.A0N = null;
        this.A0E = null;
        this.A0G = null;
        this.A0H = null;
        this.A0I = null;
        this.A0e = null;
        this.A0f = null;
        this.A0F = null;
        this.A0B = -1L;
        this.A0J = EnumC2256nm.A03;
        this.A0j = false;
        this.A02 = -1;
        this.A01 = 0;
        this.A0i = false;
        String strA00 = A00(0, 0, 102);
        this.A0a = strA00;
        this.A0c = strA00;
        this.A00 = 0;
        this.A0b = null;
        this.A0C = null;
        this.A0d = null;
        this.A0m = false;
        this.A0n = false;
        this.A06 = 0;
        this.A07 = 0;
        this.A09 = 0;
        this.A0A = 0;
        this.A0D = null;
        this.A0g = null;
        this.A03 = 0;
        this.A0h = null;
        this.A08 = 0;
        this.A0k = false;
        this.A04 = 10;
        this.A0l = false;
        this.A05 = 1;
    }

    public final int A02() {
        return this.A00;
    }

    public final int A03() {
        return this.A01;
    }

    public final int A04() {
        return this.A02;
    }

    public final int A05() {
        return this.A03;
    }

    public final int A06() {
        return this.A04;
    }

    public final int A07() {
        return this.A05;
    }

    public final int A08() {
        return this.A06;
    }

    public final int A09() {
        return this.A07;
    }

    public final int A0A() {
        return this.A08;
    }

    public final int A0B() {
        return this.A09;
    }

    public final int A0C() {
        return this.A0A;
    }

    public final long A0D() {
        return this.A0B;
    }

    public final Uri A0E() {
        return this.A0C;
    }

    public final LA A0F() {
        return this.A0E;
    }

    public final C2252ni A0G() {
        return this.A0F;
    }

    public final C2252ni A0H() {
        return this.A0H;
    }

    public final C2252ni A0I() {
        return this.A0G;
    }

    public final C2253nj A0J() {
        return this.A0I;
    }

    public final EnumC2256nm A0K() {
        return this.A0J;
    }

    public final String A0L() {
        return this.A0K;
    }

    public final String A0M() {
        return this.A0M;
    }

    public final String A0N() {
        return this.A0N;
    }

    public final String A0O() {
        return this.A0O;
    }

    public final String A0P() {
        return this.A0P;
    }

    public final String A0Q() {
        return this.A0Q;
    }

    public final String A0R() {
        return this.A0R;
    }

    public final String A0S() {
        return this.A0S;
    }

    public final String A0T() {
        return this.A0T;
    }

    public final String A0U() {
        return this.A0U;
    }

    public final String A0V() {
        return this.A0W;
    }

    public final String A0W() {
        return this.A0X;
    }

    public final String A0X() {
        return this.A0Y;
    }

    public final String A0Y() {
        return this.A0Z;
    }

    public final String A0Z() {
        return this.A0L;
    }

    public final String A0a() {
        return this.A0b;
    }

    public final String A0b() {
        return this.A0c;
    }

    public final String A0c() {
        return this.A0d;
    }

    public final String A0d() {
        return this.A0e;
    }

    public final String A0e() {
        return this.A0f;
    }

    public final List<LK> A0f() {
        return this.A0h;
    }

    public final boolean A0g() {
        return this.A0l;
    }

    public final boolean A0h() {
        return this.A0k;
    }

    public final boolean A0i() {
        return this.A0i;
    }

    public final boolean A0j() {
        return this.A0j;
    }

    public final boolean A0k() {
        return this.A0m;
    }

    public final boolean A0l() {
        return this.A0n;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1704ei
    public final String A7z() {
        return this.A0a;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1704ei
    public final Collection<String> A8Q() {
        return this.A0g;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1704ei
    public final EnumC1703eh A8w() {
        return this.A0D;
    }
}
