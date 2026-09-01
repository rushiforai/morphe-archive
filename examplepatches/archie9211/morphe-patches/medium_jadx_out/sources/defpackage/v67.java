package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class v67 implements x45 {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;
    public final Object d;

    public /* synthetic */ v67(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    public static /* synthetic */ void a(int i) {
        String str = (i == 3 || i == 4) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 3 || i == 4) ? 2 : 3];
        if (i == 1) {
            objArr[0] = "map";
        } else if (i == 2) {
            objArr[0] = "compute";
        } else if (i == 3 || i == 4) {
            objArr[0] = "kotlin/reflect/jvm/internal/impl/storage/LockBasedStorageManager$MapBasedMemoizedFunction";
        } else {
            objArr[0] = "storageManager";
        }
        if (i == 3) {
            objArr[1] = "recursionDetected";
        } else if (i != 4) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/storage/LockBasedStorageManager$MapBasedMemoizedFunction";
        } else {
            objArr[1] = "raceCondition";
        }
        if (i != 3 && i != 4) {
            objArr[2] = "<init>";
        }
        String str2 = String.format(str, objArr);
        if (i != 3 && i != 4) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    public AssertionError d(Object obj, Object obj2) {
        AssertionError assertionError = new AssertionError("Inconsistent key detected. " + w67.COMPUTING + " is expected, was: " + obj2 + ", most probably race condition detected on input " + obj + " under " + ((x67) this.b));
        x67.e(assertionError);
        return assertionError;
    }

    public AssertionError g(Object obj, Object obj2) {
        AssertionError assertionError = new AssertionError("Race condition detected on input " + obj + ". Old value is " + obj2 + " under " + ((x67) this.b));
        x67.e(assertionError);
        return assertionError;
    }

    public AssertionError h(Object obj, Throwable th) {
        AssertionError assertionError = new AssertionError("Unable to remove " + obj + " under " + ((x67) this.b), th);
        x67.e(assertionError);
        return assertionError;
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x00ba A[Catch: all -> 0x00b3, PHI: r6
      0x00ba: PHI (r6v2 java.lang.Object) = (r6v1 java.lang.Object), (r6v7 java.lang.Object) binds: [B:27:0x009f, B:31:0x00ab] A[DONT_GENERATE, DONT_INLINE], TryCatch #1 {all -> 0x00b3, blocks: (B:25:0x0096, B:28:0x00a1, B:30:0x00a9, B:32:0x00ad, B:36:0x00b6, B:37:0x00b9, B:38:0x00ba, B:40:0x00be, B:42:0x00c4, B:44:0x00c8, B:45:0x00cb, B:46:0x00ce, B:48:0x00d1, B:62:0x00f3, B:65:0x00fd, B:67:0x0101, B:68:0x0105, B:69:0x0106, B:70:0x0108, B:75:0x0111, B:77:0x011e, B:78:0x0122, B:79:0x0123, B:80:0x0126, B:82:0x012a, B:83:0x012d, B:85:0x012f, B:86:0x0133, B:72:0x010a, B:73:0x010e, B:51:0x00d8, B:55:0x00e5, B:59:0x00ed, B:60:0x00f1, B:64:0x00f9, B:81:0x0127), top: B:91:0x0096, inners: #0, #2, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00cf  */
    @Override // defpackage.x45
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object invoke(java.lang.Object r14) {
        /*
            Method dump skipped, instruction units count: 320
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.v67.invoke(java.lang.Object):java.lang.Object");
    }
}
