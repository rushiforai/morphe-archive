package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class q67 extends t67 implements fi8 {
    public volatile mya d;
    public final /* synthetic */ z e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q67(x67 x67Var, v2 v2Var, z zVar) {
        super(x67Var, v2Var);
        this.e = zVar;
        if (x67Var == null) {
            h(0);
            throw null;
        }
        this.d = null;
    }

    public static /* synthetic */ void a(int i) {
        String str = i != 2 ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[i != 2 ? 2 : 3];
        if (i != 2) {
            objArr[0] = "kotlin/reflect/jvm/internal/impl/storage/LockBasedStorageManager$5";
        } else {
            objArr[0] = "value";
        }
        if (i != 2) {
            objArr[1] = "recursionDetected";
        } else {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/storage/LockBasedStorageManager$5";
        }
        if (i == 2) {
            objArr[2] = "doPostCompute";
        }
        String str2 = String.format(str, objArr);
        if (i == 2) {
            throw new IllegalArgumentException(str2);
        }
    }

    public static /* synthetic */ void h(int i) {
        String str = i != 2 ? "Argument for @NotNull parameter '%s' of %s.%s must not be null" : "@NotNull method %s.%s must not return null";
        Object[] objArr = new Object[i != 2 ? 3 : 2];
        if (i == 1) {
            objArr[0] = "computable";
        } else if (i != 2) {
            objArr[0] = "storageManager";
        } else {
            objArr[0] = "kotlin/reflect/jvm/internal/impl/storage/LockBasedStorageManager$LockBasedNotNullLazyValueWithPostCompute";
        }
        if (i != 2) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/storage/LockBasedStorageManager$LockBasedNotNullLazyValueWithPostCompute";
        } else {
            objArr[1] = "invoke";
        }
        if (i != 2) {
            objArr[2] = "<init>";
        }
        String str2 = String.format(str, objArr);
        if (i == 2) {
            throw new IllegalStateException(str2);
        }
    }

    @Override // defpackage.t67
    public final void d(Object obj) {
        this.d = new mya(obj);
        try {
            if (obj != null) {
                this.e.invoke(obj);
            } else {
                a(2);
                throw null;
            }
        } finally {
            this.d = null;
        }
    }

    @Override // defpackage.t67
    public final sv0 g(boolean z) {
        return new sv0(new y2(d46.Q(l24.d)), false, 3);
    }

    @Override // defpackage.t67, defpackage.m45
    public final Object invoke() throws Throwable {
        Object objInvoke;
        mya myaVar = this.d;
        if (myaVar == null || ((Thread) myaVar.c) != Thread.currentThread()) {
            objInvoke = super.invoke();
        } else if (((Thread) myaVar.c) == Thread.currentThread()) {
            objInvoke = myaVar.b;
        } else {
            ygf.f("No value in this thread (hasValue should be checked before)");
            objInvoke = null;
        }
        if (objInvoke != null) {
            return objInvoke;
        }
        h(2);
        throw null;
    }
}
