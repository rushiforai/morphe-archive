package cm;

import java.util.concurrent.ExecutorService;

/* loaded from: classes3.dex */
public final /* synthetic */ class d implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f20109a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f20110b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Runnable f20111c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ f f20112d;

    public /* synthetic */ d(e eVar, Runnable runnable, f fVar, int i5) {
        this.f20109a = i5;
        this.f20110b = eVar;
        this.f20111c = runnable;
        this.f20112d = fVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f20109a) {
            case 0:
                ExecutorService executorService = this.f20110b.f20113a;
                final int i5 = 0;
                final Runnable runnable = this.f20111c;
                final f fVar = this.f20112d;
                executorService.execute(new Runnable() { // from class: cm.b
                    @Override // java.lang.Runnable
                    public final void run() throws Exception {
                        switch (i5) {
                            case 0:
                                try {
                                    runnable.run();
                                    return;
                                } catch (Exception e3) {
                                    fVar.I(e3);
                                    throw e3;
                                }
                            case 1:
                                try {
                                    runnable.run();
                                    return;
                                } catch (Exception e11) {
                                    fVar.I(e11);
                                    return;
                                }
                            default:
                                Runnable runnable2 = runnable;
                                f fVar2 = fVar;
                                try {
                                    runnable2.run();
                                    fVar2.E(null);
                                    return;
                                } catch (Exception e12) {
                                    fVar2.I(e12);
                                    return;
                                }
                        }
                    }
                });
                break;
            case 1:
                ExecutorService executorService2 = this.f20110b.f20113a;
                final int i11 = 2;
                final Runnable runnable2 = this.f20111c;
                final f fVar2 = this.f20112d;
                executorService2.execute(new Runnable() { // from class: cm.b
                    @Override // java.lang.Runnable
                    public final void run() throws Exception {
                        switch (i11) {
                            case 0:
                                try {
                                    runnable2.run();
                                    return;
                                } catch (Exception e3) {
                                    fVar2.I(e3);
                                    throw e3;
                                }
                            case 1:
                                try {
                                    runnable2.run();
                                    return;
                                } catch (Exception e11) {
                                    fVar2.I(e11);
                                    return;
                                }
                            default:
                                Runnable runnable22 = runnable2;
                                f fVar22 = fVar2;
                                try {
                                    runnable22.run();
                                    fVar22.E(null);
                                    return;
                                } catch (Exception e12) {
                                    fVar22.I(e12);
                                    return;
                                }
                        }
                    }
                });
                break;
            default:
                ExecutorService executorService3 = this.f20110b.f20113a;
                final int i12 = 1;
                final Runnable runnable3 = this.f20111c;
                final f fVar3 = this.f20112d;
                executorService3.execute(new Runnable() { // from class: cm.b
                    @Override // java.lang.Runnable
                    public final void run() throws Exception {
                        switch (i12) {
                            case 0:
                                try {
                                    runnable3.run();
                                    return;
                                } catch (Exception e3) {
                                    fVar3.I(e3);
                                    throw e3;
                                }
                            case 1:
                                try {
                                    runnable3.run();
                                    return;
                                } catch (Exception e11) {
                                    fVar3.I(e11);
                                    return;
                                }
                            default:
                                Runnable runnable22 = runnable3;
                                f fVar22 = fVar3;
                                try {
                                    runnable22.run();
                                    fVar22.E(null);
                                    return;
                                } catch (Exception e12) {
                                    fVar22.I(e12);
                                    return;
                                }
                        }
                    }
                });
                break;
        }
    }
}
