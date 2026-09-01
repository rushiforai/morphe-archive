package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class c63 implements mzb {
    public final CharSequence a;
    public final int b;
    public final b55 c;

    public c63(CharSequence charSequence, int i, b55 b55Var) {
        charSequence.getClass();
        this.a = charSequence;
        this.b = i;
        this.c = b55Var;
    }

    @Override // defpackage.mzb
    public final Iterator iterator() {
        return new b63(this);
    }
}
