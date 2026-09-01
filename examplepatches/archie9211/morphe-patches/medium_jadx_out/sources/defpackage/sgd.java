package defpackage;

import android.view.textclassifier.TextClassification;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sgd {
    public final CharSequence a;
    public final long b;
    public final TextClassification c;

    public sgd(CharSequence charSequence, long j, TextClassification textClassification) {
        this.a = charSequence;
        this.b = j;
        this.c = textClassification;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sgd)) {
            return false;
        }
        sgd sgdVar = (sgd) obj;
        return g76.L(this.a, sgdVar.a) && bkd.b(this.b, sgdVar.b) && g76.L(this.c, sgdVar.c);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        int i = bkd.c;
        long j = this.b;
        return this.c.hashCode() + ((((int) (j ^ (j >>> 32))) + iHashCode) * 31);
    }

    public final String toString() {
        return "TextClassificationResult(text=" + ((Object) this.a) + ", selection=" + ((Object) bkd.h(this.b)) + ", textClassification=" + this.c + ')';
    }
}
