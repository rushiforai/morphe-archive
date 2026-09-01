package defpackage;

import android.os.Build;
import android.os.LocaleList;
import android.text.style.LocaleSpan;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class cm0 {
    public static /* synthetic */ LocaleList a(Locale[] localeArr) {
        return new LocaleList(localeArr);
    }

    public static /* synthetic */ LocaleSpan b(LocaleList localeList) {
        return new LocaleSpan(localeList);
    }

    public static /* synthetic */ void c() {
    }

    public static /* synthetic */ void d(dm0 dm0Var) {
        boolean zIsTerminated;
        if ((Build.VERSION.SDK_INT <= 23 || dm0Var != ForkJoinPool.commonPool()) && !(zIsTerminated = dm0Var.isTerminated())) {
            dm0Var.shutdown();
            boolean z = false;
            while (!zIsTerminated) {
                try {
                    zIsTerminated = dm0Var.awaitTermination(1L, TimeUnit.DAYS);
                } catch (InterruptedException unused) {
                    if (!z) {
                        dm0Var.shutdownNow();
                        z = true;
                    }
                }
            }
            if (z) {
                Thread.currentThread().interrupt();
            }
        }
    }

    public static void e(i43 i43Var) {
        if ((Build.VERSION.SDK_INT <= 23 || i43Var != ForkJoinPool.commonPool()) && !i43Var.a.isTerminated()) {
            i43Var.shutdown();
            throw null;
        }
    }

    public static /* synthetic */ void f(k87 k87Var) {
        boolean zIsTerminated;
        if ((Build.VERSION.SDK_INT <= 23 || k87Var != ForkJoinPool.commonPool()) && !(zIsTerminated = k87Var.isTerminated())) {
            k87Var.shutdown();
            boolean z = false;
            while (!zIsTerminated) {
                try {
                    zIsTerminated = k87Var.awaitTermination(1L, TimeUnit.DAYS);
                } catch (InterruptedException unused) {
                    if (!z) {
                        k87Var.shutdownNow();
                        z = true;
                    }
                }
            }
            if (z) {
                Thread.currentThread().interrupt();
            }
        }
    }

    public static /* synthetic */ void g(ExecutorService executorService) {
        boolean zIsTerminated;
        if ((Build.VERSION.SDK_INT <= 23 || executorService != ForkJoinPool.commonPool()) && !(zIsTerminated = executorService.isTerminated())) {
            executorService.shutdown();
            boolean z = false;
            while (!zIsTerminated) {
                try {
                    zIsTerminated = executorService.awaitTermination(1L, TimeUnit.DAYS);
                } catch (InterruptedException unused) {
                    if (!z) {
                        executorService.shutdownNow();
                        z = true;
                    }
                }
            }
            if (z) {
                Thread.currentThread().interrupt();
            }
        }
    }

    public static /* synthetic */ void h(ifg ifgVar) {
        boolean zIsTerminated;
        if ((Build.VERSION.SDK_INT <= 23 || ifgVar != ForkJoinPool.commonPool()) && !(zIsTerminated = ifgVar.isTerminated())) {
            ifgVar.shutdown();
            boolean z = false;
            while (!zIsTerminated) {
                try {
                    zIsTerminated = ifgVar.awaitTermination(1L, TimeUnit.DAYS);
                } catch (InterruptedException unused) {
                    if (!z) {
                        ifgVar.shutdownNow();
                        z = true;
                    }
                }
            }
            if (z) {
                Thread.currentThread().interrupt();
            }
        }
    }

    public static /* synthetic */ void i(ExecutorService executorService) {
        boolean zIsTerminated;
        if ((Build.VERSION.SDK_INT <= 23 || executorService != ForkJoinPool.commonPool()) && !(zIsTerminated = executorService.isTerminated())) {
            executorService.shutdown();
            boolean z = false;
            while (!zIsTerminated) {
                try {
                    zIsTerminated = executorService.awaitTermination(1L, TimeUnit.DAYS);
                } catch (InterruptedException unused) {
                    if (!z) {
                        executorService.shutdownNow();
                        z = true;
                    }
                }
            }
            if (z) {
                Thread.currentThread().interrupt();
            }
        }
    }
}
