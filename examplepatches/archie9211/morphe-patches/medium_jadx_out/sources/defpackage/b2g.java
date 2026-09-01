package defpackage;

import com.google.android.play.core.integrity.StandardIntegrityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b2g implements m1g {
    public final x2g a;
    public boolean b = true;
    public final l5g c;

    public b2g(l5g l5gVar, x2g x2gVar) {
        this.c = l5gVar;
        this.a = x2gVar;
    }

    @Override // defpackage.m1g
    public final ycg a(arf arfVar) {
        return new ycg(new t1g(arfVar, this, null, 0));
    }

    @Override // defpackage.m1g
    public final /* synthetic */ ycg b(String str, arf arfVar, yu yuVar) {
        return wgd.g(this, str, arfVar);
    }

    @Override // defpackage.m1g
    public final ycg c(orf orfVar, j5d j5dVar) {
        return new ycg(new t1g(this, orfVar, (n92) null));
    }

    @Override // defpackage.m1g
    public final /* synthetic */ wcg d(orf orfVar, yu yuVar) {
        return wgd.f(this, orfVar);
    }

    @Override // defpackage.m1g
    public final boolean e() {
        return this.b;
    }

    @Override // defpackage.m1g
    public final b1g f(Exception exc, i1g i1gVar) {
        int i;
        Throwable cause = exc.getCause();
        if (cause != null) {
            exc = cause;
        }
        if (exc instanceof StandardIntegrityException) {
            int i2 = ((StandardIntegrityException) exc).a.a;
            if (i2 == -100) {
                i = 44;
            } else if (i2 == -12) {
                i = 39;
            } else if (i2 == -3) {
                i = 30;
            } else if (i2 == -2) {
                i = 29;
            } else if (i2 != -1) {
                switch (i2) {
                    case -19:
                        i = 54;
                        break;
                    case -18:
                        i = 53;
                        break;
                    case -17:
                        i = 52;
                        break;
                    case -16:
                        i = 43;
                        break;
                    case -15:
                        i = 42;
                        break;
                    case -14:
                        i = 41;
                        break;
                    default:
                        switch (i2) {
                            case -9:
                                i = 36;
                                break;
                            case -8:
                                i = 35;
                                break;
                            case -7:
                                i = 34;
                                break;
                            case -6:
                                i = 33;
                                break;
                            case -5:
                                i = 32;
                                break;
                            default:
                                i = 2;
                                break;
                        }
                        break;
                }
            } else {
                i = 28;
            }
        } else {
            i = 45;
        }
        btf btfVarV = ctf.v();
        btfVarV.c();
        ((ctf) btfVarV.b).y(i);
        btfVarV.c();
        ((ctf) btfVarV.b).x(15);
        return en7.b0(this, (ctf) btfVarV.e());
    }

    @Override // defpackage.m1g
    public final int zza() {
        return 2;
    }
}
