package defpackage;

import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class woa extends ovc {
    public static final voa[] e = new voa[0];
    public static final voa[] f = new voa[0];
    public final AtomicReference c = new AtomicReference(f);
    public Throwable d;

    /* JADX WARN: Multi-variable type inference failed */
    public final void F0(voa voaVar) {
        voa[] voaVarArr;
        while (true) {
            AtomicReference atomicReference = this.c;
            voa[] voaVarArr2 = (voa[]) atomicReference.get();
            if (voaVarArr2 == e || voaVarArr2 == (voaVarArr = f)) {
                return;
            }
            int length = voaVarArr2.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    i = -1;
                    break;
                } else if (voaVarArr2[i] == voaVar) {
                    break;
                } else {
                    i++;
                }
            }
            if (i < 0) {
                return;
            }
            if (length != 1) {
                voaVarArr = new voa[length - 1];
                System.arraycopy(voaVarArr2, 0, voaVarArr, 0, i);
                System.arraycopy(voaVarArr2, i + 1, voaVarArr, i, (length - i) - 1);
            }
            while (!atomicReference.compareAndSet(voaVarArr2, voaVarArr)) {
                if (atomicReference.get() != voaVarArr2) {
                    break;
                }
            }
            return;
        }
    }

    @Override // defpackage.jn8
    public final void a(sh3 sh3Var) {
        if (this.c.get() == e) {
            sh3Var.dispose();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.vn7
    public final void c0(jn8 jn8Var) {
        voa voaVar = new voa(jn8Var, this);
        jn8Var.a(voaVar);
        while (true) {
            AtomicReference atomicReference = this.c;
            voa[] voaVarArr = (voa[]) atomicReference.get();
            if (voaVarArr == e) {
                Throwable th = this.d;
                if (th != null) {
                    jn8Var.onError(th);
                    return;
                } else {
                    jn8Var.onComplete();
                    return;
                }
            }
            int length = voaVarArr.length;
            voa[] voaVarArr2 = new voa[length + 1];
            System.arraycopy(voaVarArr, 0, voaVarArr2, 0, length);
            voaVarArr2[length] = voaVar;
            while (!atomicReference.compareAndSet(voaVarArr, voaVarArr2)) {
                if (atomicReference.get() != voaVarArr) {
                    break;
                }
            }
            if (voaVar.get()) {
                F0(voaVar);
                return;
            }
            return;
        }
    }

    @Override // defpackage.jn8
    public final void onComplete() {
        AtomicReference atomicReference = this.c;
        Object obj = atomicReference.get();
        Object obj2 = e;
        if (obj == obj2) {
            return;
        }
        voa[] voaVarArr = (voa[]) atomicReference.getAndSet(obj2);
        for (voa voaVar : voaVarArr) {
            if (!voaVar.get()) {
                voaVar.a.onComplete();
            }
        }
    }

    @Override // defpackage.jn8
    public final void onError(Throwable th) {
        il7.B("onError called with null. Null values are generally not allowed in 2.x operators and sources.", th);
        AtomicReference atomicReference = this.c;
        Object obj = atomicReference.get();
        Object obj2 = e;
        if (obj == obj2) {
            ok7.H(th);
            return;
        }
        this.d = th;
        for (voa voaVar : (voa[]) atomicReference.getAndSet(obj2)) {
            if (voaVar.get()) {
                ok7.H(th);
            } else {
                voaVar.a.onError(th);
            }
        }
    }

    @Override // defpackage.jn8
    public final void onNext(Object obj) {
        il7.B("onNext called with null. Null values are generally not allowed in 2.x operators and sources.", obj);
        for (voa voaVar : (voa[]) this.c.get()) {
            if (!voaVar.get()) {
                voaVar.a.onNext(obj);
            }
        }
    }
}
