package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aod extends mve {
    public final /* synthetic */ int a;
    public boolean b;
    public int c;
    public final /* synthetic */ Object d;

    public aod(kve kveVar) {
        this.a = 1;
        this.d = kveVar;
        this.b = false;
        this.c = 0;
    }

    @Override // defpackage.mve, defpackage.lve
    public void a() {
        switch (this.a) {
            case 0:
                this.b = true;
                break;
        }
    }

    @Override // defpackage.mve, defpackage.lve
    public final void b() {
        int i = this.a;
        Object obj = this.d;
        switch (i) {
            case 0:
                ((bod) obj).a.setVisibility(0);
                break;
            default:
                if (!this.b) {
                    this.b = true;
                    lve lveVar = ((kve) obj).d;
                    if (lveVar != null) {
                        lveVar.b();
                    }
                    break;
                }
                break;
        }
    }

    @Override // defpackage.lve
    public final void c() {
        int i = this.a;
        Object obj = this.d;
        switch (i) {
            case 0:
                if (!this.b) {
                    ((bod) obj).a.setVisibility(this.c);
                }
                break;
            default:
                int i2 = this.c + 1;
                this.c = i2;
                kve kveVar = (kve) obj;
                if (i2 == kveVar.a.size()) {
                    lve lveVar = kveVar.d;
                    if (lveVar != null) {
                        lveVar.c();
                    }
                    this.c = 0;
                    this.b = false;
                    kveVar.e = false;
                }
                break;
        }
    }

    public aod(bod bodVar, int i) {
        this.a = 0;
        this.d = bodVar;
        this.c = i;
        this.b = false;
    }
}
