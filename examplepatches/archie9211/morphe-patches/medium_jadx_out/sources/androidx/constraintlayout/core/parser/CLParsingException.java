package androidx.constraintlayout.core.parser;

import defpackage.m21;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class CLParsingException extends Exception {
    public final String a;
    public final String b;

    public CLParsingException(String str, m21 m21Var) {
        super(str);
        this.a = str;
        if (m21Var != null) {
            this.b = m21Var.s();
        } else {
            this.b = "unknown";
        }
    }

    @Override // java.lang.Throwable
    public final String toString() {
        StringBuilder sb = new StringBuilder("CLParsingException (");
        sb.append(hashCode());
        sb.append(") : ");
        sb.append(this.a + " (" + this.b + " at line 0)");
        return sb.toString();
    }
}
