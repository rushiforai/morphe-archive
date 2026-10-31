package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import android.util.SparseArray;
import com.facebook.ads.androidx.media3.common.Bundleable;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.Lt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1068Lt {
    public static String[] A00 = {"4iWaQX9QL0TV7ciG", "xT1DBnx3cgqSI1EHRIJwYOLbDuZXZSSy", "zf4ERY3epGDBpzw7qq", "RVk2EvtAO6JxDlUsvytnaWlyeZGN0zQx", "4SbbE41KWjNAZ40flvn9aeYMmzNdDWTu", "VvpAlJlvg5jCIDhdzyGj2bOvFlVVLQ9f", "Y1o2uThHomph9fqnYqxDCn", "j5QvKsjh7m2QCLDYHybofUYs0e8V1AN4"};

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static <T extends InterfaceC1018Jt> AbstractC07549l<T> A01(InterfaceC1017Js<T> interfaceC1017Js, List<Bundle> list) {
        C06344e c06344eA01 = AbstractC07549l.A01();
        for (int i5 = 0; i5 < list.size(); i5++) {
            c06344eA01.A04(interfaceC1017Js.A7F((Bundle) AbstractC1062Ln.A01(list.get(i5))));
        }
        return c06344eA01.A05();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Js != com.facebook.ads.androidx.media3.common.Bundleable$Creator<T extends com.facebook.ads.redexgen.X.Jt> */
    public static <T extends InterfaceC1018Jt> SparseArray<T> A00(InterfaceC1017Js<T> interfaceC1017Js, SparseArray<Bundle> sparseArray) {
        Bundleable.Creator<T> creator = new SparseArray<>(sparseArray.size());
        int i5 = 0;
        while (true) {
            int size = sparseArray.size();
            int i11 = A00[1].charAt(5);
            if (i11 == 84) {
                throw new RuntimeException();
            }
            A00[0] = "yJ7q7c4kcteAallN";
            if (i5 < size) {
                int i12 = sparseArray.keyAt(i5);
                creator.put(i12, interfaceC1017Js.A7F(sparseArray.valueAt(i5)));
                i5++;
            } else {
                return creator;
            }
        }
    }

    public static void A02(Bundle bundle) {
        if (bundle != null) {
            bundle.setClassLoader((ClassLoader) N1.A0f(C1068Lt.class.getClassLoader()));
        }
    }
}
