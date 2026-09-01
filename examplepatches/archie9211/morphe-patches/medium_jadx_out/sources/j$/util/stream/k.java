package j$.util.stream;

import j$.util.Spliterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class k extends h5 {
    public final /* synthetic */ int b = 2;
    public boolean c;
    public Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(h8 h8Var, l5 l5Var) {
        super(l5Var);
        this.d = h8Var;
        this.c = true;
    }

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final void n(Object obj) throws Exception {
        int i = this.b;
        l5 l5Var = this.a;
        switch (i) {
            case 0:
                if (obj == null) {
                    if (this.c) {
                        return;
                    }
                    this.c = true;
                    this.d = null;
                    l5Var.n((Object) null);
                    return;
                }
                Object obj2 = this.d;
                if (obj2 == null || !obj.equals(obj2)) {
                    this.d = obj;
                    l5Var.n(obj);
                    return;
                }
                return;
            case 1:
                Stream stream = (Stream) ((j$.util.n) ((p) this.d).m).apply(obj);
                if (stream != null) {
                    try {
                        if (this.c) {
                            Spliterator spliterator = ((Stream) stream.sequential()).spliterator();
                            while (!l5Var.e() && spliterator.tryAdvance(l5Var)) {
                            }
                        } else {
                            ((Stream) stream.sequential()).forEach(l5Var);
                        }
                    } catch (Throwable th) {
                        try {
                            stream.close();
                            break;
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                        throw th;
                    }
                    break;
                }
                if (stream != null) {
                    stream.close();
                    return;
                }
                return;
            default:
                if (this.c) {
                    boolean zTest = ((h8) this.d).m.test(obj);
                    this.c = zTest;
                    if (zTest) {
                        l5Var.n(obj);
                        return;
                    }
                    return;
                }
                return;
        }
    }

    @Override // j$.util.stream.h5, j$.util.stream.l5
    public final void c(long j) {
        switch (this.b) {
            case 0:
                this.c = false;
                this.d = null;
                this.a.c(-1L);
                break;
            case 1:
                this.a.c(-1L);
                break;
            default:
                this.a.c(-1L);
                break;
        }
    }

    @Override // j$.util.stream.h5, j$.util.stream.l5
    public boolean e() {
        switch (this.b) {
            case 1:
                this.c = true;
                return this.a.e();
            case 2:
                return !this.c || this.a.e();
            default:
                return super.e();
        }
    }

    @Override // j$.util.stream.h5, j$.util.stream.l5
    public void end() {
        switch (this.b) {
            case 0:
                this.c = false;
                this.d = null;
                this.a.end();
                break;
            default:
                super.end();
                break;
        }
    }

    public /* synthetic */ k(l5 l5Var) {
        super(l5Var);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(p pVar, l5 l5Var) {
        super(l5Var);
        this.d = pVar;
    }
}
