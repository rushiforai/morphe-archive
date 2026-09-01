package defpackage;

import com.adobe.internal.xmp.XMPException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class cw8 {
    public int a;

    public cw8(int i) throws XMPException {
        this.a = 0;
        b(i);
        b(i);
        this.a = i;
    }

    public final void b(int i) throws XMPException {
        int i2 = (~d()) & i;
        if (i2 == 0) {
            a(i);
            return;
        }
        throw new XMPException("The option bit(s) 0x" + Integer.toHexString(i2) + " are invalid!", 103);
    }

    public final boolean c(int i) {
        return (this.a & i) != 0;
    }

    public abstract int d();

    public final void e(int i, boolean z) {
        int i2 = this.a;
        this.a = z ? i | i2 : (~i) & i2;
    }

    public final boolean equals(Object obj) {
        return this.a == ((cw8) obj).a;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return "0x" + Integer.toHexString(this.a);
    }

    public cw8() {
        this.a = 0;
    }

    public void a(int i) {
    }
}
