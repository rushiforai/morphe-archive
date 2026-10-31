package com.facebook.ads.redexgen.X;

import javax.annotation.Nullable;

/* loaded from: assets/audience_network/classes.dex */
public abstract class YQ {

    @Nullable
    public static final String A00 = null;

    @Nullable
    public static final Object[] A01 = null;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 1 out of bounds for length 1
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static <T> T A00(@Nullable T t6) {
        if (t6 != null) {
            return t6;
        }
        throw new NullPointerException();
    }
}
