package com.facebook.ads.redexgen.X;

import java.util.Collections;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.cz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1598cz {
    public final int A00;
    public final String A01;
    public final List<C1597cy> A02;
    public final byte[] A03;

    public C1598cz(int i5, String str, List<C1597cy> list, byte[] bArr) {
        List<C1597cy> listUnmodifiableList;
        this.A00 = i5;
        this.A01 = str;
        if (list == null) {
            listUnmodifiableList = Collections.emptyList();
        } else {
            listUnmodifiableList = Collections.unmodifiableList(list);
        }
        this.A02 = listUnmodifiableList;
        this.A03 = bArr;
    }
}
