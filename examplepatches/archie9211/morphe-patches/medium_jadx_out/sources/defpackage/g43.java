package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class g43 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ i43 b;
    public final /* synthetic */ Runnable c;
    public final /* synthetic */ zm7 d;

    public /* synthetic */ g43(i43 i43Var, Runnable runnable, zm7 zm7Var, int i) {
        this.a = i;
        this.b = i43Var;
        this.c = runnable;
        this.d = zm7Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        final zm7 zm7Var = this.d;
        final Runnable runnable = this.c;
        i43 i43Var = this.b;
        switch (i) {
            case 0:
                final int i2 = 0;
                i43Var.a.execute(new Runnable() { // from class: d43
                    @Override // java.lang.Runnable
                    public final void run() throws Exception {
                        int i3 = i2;
                        zm7 zm7Var2 = zm7Var;
                        Runnable runnable2 = runnable;
                        switch (i3) {
                            case 0:
                                try {
                                    runnable2.run();
                                    return;
                                } catch (Exception e) {
                                    ((k43) zm7Var2.b).l(e);
                                    throw e;
                                }
                            case 1:
                                try {
                                    runnable2.run();
                                    return;
                                } catch (Exception e2) {
                                    ((k43) zm7Var2.b).l(e2);
                                    return;
                                }
                            default:
                                k43 k43Var = (k43) zm7Var2.b;
                                try {
                                    runnable2.run();
                                    k43Var.k(null);
                                    return;
                                } catch (Exception e3) {
                                    k43Var.l(e3);
                                    return;
                                }
                        }
                    }
                });
                break;
            case 1:
                final int i3 = 2;
                i43Var.a.execute(new Runnable() { // from class: d43
                    @Override // java.lang.Runnable
                    public final void run() throws Exception {
                        int i32 = i3;
                        zm7 zm7Var2 = zm7Var;
                        Runnable runnable2 = runnable;
                        switch (i32) {
                            case 0:
                                try {
                                    runnable2.run();
                                    return;
                                } catch (Exception e) {
                                    ((k43) zm7Var2.b).l(e);
                                    throw e;
                                }
                            case 1:
                                try {
                                    runnable2.run();
                                    return;
                                } catch (Exception e2) {
                                    ((k43) zm7Var2.b).l(e2);
                                    return;
                                }
                            default:
                                k43 k43Var = (k43) zm7Var2.b;
                                try {
                                    runnable2.run();
                                    k43Var.k(null);
                                    return;
                                } catch (Exception e3) {
                                    k43Var.l(e3);
                                    return;
                                }
                        }
                    }
                });
                break;
            default:
                final int i4 = 1;
                i43Var.a.execute(new Runnable() { // from class: d43
                    @Override // java.lang.Runnable
                    public final void run() throws Exception {
                        int i32 = i4;
                        zm7 zm7Var2 = zm7Var;
                        Runnable runnable2 = runnable;
                        switch (i32) {
                            case 0:
                                try {
                                    runnable2.run();
                                    return;
                                } catch (Exception e) {
                                    ((k43) zm7Var2.b).l(e);
                                    throw e;
                                }
                            case 1:
                                try {
                                    runnable2.run();
                                    return;
                                } catch (Exception e2) {
                                    ((k43) zm7Var2.b).l(e2);
                                    return;
                                }
                            default:
                                k43 k43Var = (k43) zm7Var2.b;
                                try {
                                    runnable2.run();
                                    k43Var.k(null);
                                    return;
                                } catch (Exception e3) {
                                    k43Var.l(e3);
                                    return;
                                }
                        }
                    }
                });
                break;
        }
    }
}
