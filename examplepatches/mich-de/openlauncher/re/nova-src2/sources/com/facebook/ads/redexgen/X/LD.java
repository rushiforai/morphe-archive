package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class LD implements InterfaceC2617th {
    public static String[] A03 = {"Na1M2xtPmNO6TGoBOTfz6W7sL", "NXgjiqOw56LkYo9vjUyKCJFkjhtyi7C8", "4ziZA6ESoQLsGfJUoTByf59fKooQ7r8t", "rFFbDiuFtzKHqY9KAlXyAYcJ0hDplqAr", "v5vMjmEC9sFXjlaJD136yYX2MbKv0Grm", "0CTzYPQEJFurrXZBo", "OynCGhJ6itg9uXDX8VFFdDhh", "0r9XxdliGGlKFzR29Dn383gkf"};
    public final /* synthetic */ int A00;
    public final /* synthetic */ LB A01;
    public final /* synthetic */ GT A02;

    public LD(LB lb2, int i5, GT gt2) {
        this.A01 = lb2;
        this.A00 = i5;
        this.A02 = gt2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2617th
    public final void AFA(C2616tg c2616tg) {
        if (this.A00 == 0) {
            GT gt2 = this.A02;
            if (A03[5].length() == 1) {
                throw new RuntimeException();
            }
            String[] strArr = A03;
            strArr[2] = "2tqUSz0ARXn35PCtkpYy8WG3hanwOx3H";
            strArr[4] = "6Zde9YOrWRraU6s8i4byj3LUllDRZGeL";
            gt2.A1k(this.A01.A04);
        }
        this.A02.A1o(c2616tg.A00() != null, true);
    }
}
