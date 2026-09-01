package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class iwb {
    public final byte[] a;
    public int b;
    public int c;
    public boolean d;
    public final boolean e;
    public iwb f;
    public iwb g;

    public iwb(byte[] bArr, int i, int i2, boolean z, boolean z2) {
        bArr.getClass();
        this.a = bArr;
        this.b = i;
        this.c = i2;
        this.d = z;
        this.e = z2;
    }

    public final iwb a() {
        iwb iwbVar = this.f;
        if (iwbVar == this) {
            iwbVar = null;
        }
        iwb iwbVar2 = this.g;
        iwbVar2.getClass();
        iwbVar2.f = this.f;
        iwb iwbVar3 = this.f;
        iwbVar3.getClass();
        iwbVar3.g = this.g;
        this.f = null;
        this.g = null;
        return iwbVar;
    }

    public final void b(iwb iwbVar) {
        iwbVar.getClass();
        iwbVar.g = this;
        iwbVar.f = this.f;
        iwb iwbVar2 = this.f;
        iwbVar2.getClass();
        iwbVar2.g = iwbVar;
        this.f = iwbVar;
    }

    public final iwb c() {
        this.d = true;
        return new iwb(this.a, this.b, this.c, true, false);
    }

    public final void d(iwb iwbVar, int i) {
        iwbVar.getClass();
        byte[] bArr = iwbVar.a;
        if (!iwbVar.e) {
            ygf.f("only owner can write");
            return;
        }
        int i2 = iwbVar.c;
        int i3 = i2 + i;
        if (i3 > 8192) {
            if (iwbVar.d) {
                lg8.r();
                return;
            }
            int i4 = iwbVar.b;
            if (i3 - i4 > 8192) {
                lg8.r();
                return;
            }
            k80.f0(0, i4, i2, bArr, bArr);
            i2 = iwbVar.c - iwbVar.b;
            iwbVar.c = i2;
            iwbVar.b = 0;
        }
        int i5 = this.b;
        k80.f0(i2, i5, i5 + i, this.a, bArr);
        iwbVar.c += i;
        this.b += i;
    }

    public iwb() {
        this.a = new byte[8192];
        this.e = true;
        this.d = false;
    }
}
