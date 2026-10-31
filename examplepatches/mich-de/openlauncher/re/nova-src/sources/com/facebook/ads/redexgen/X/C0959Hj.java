package com.facebook.ads.redexgen.X;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/* renamed from: com.facebook.ads.redexgen.X.Hj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0959Hj implements InterfaceC2090l3 {
    public final Map<String, Set<String>> A00 = new HashMap();

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 4 out of bounds for length 4
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:147)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0013  */
    @Override // com.facebook.ads.redexgen.X.InterfaceC2090l3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final synchronized boolean AB4(String str, String str2) {
        boolean z11;
        Set<String> set = this.A00.get(str2);
        if (set != null) {
            z11 = set.contains(str);
        }
        return z11;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2090l3
    public final synchronized void A5Y(String str) {
        this.A00.remove(str);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2090l3
    public final synchronized void AKW(String str, String str2) {
        Set<String> hashSet = this.A00.get(str2);
        if (hashSet == null) {
            hashSet = new HashSet<>();
            this.A00.put(str2, hashSet);
        }
        hashSet.add(str);
    }
}
