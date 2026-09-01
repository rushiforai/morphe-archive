package defpackage;

import j$.util.concurrent.ConcurrentHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r67 extends v67 {
    public final /* synthetic */ int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r67(x67 x67Var, ConcurrentHashMap concurrentHashMap, x45 x45Var, int i) {
        super(x67Var, concurrentHashMap, x45Var, 0);
        this.e = i;
    }

    public static /* synthetic */ void a(int i) {
        String str = i != 3 ? "Argument for @NotNull parameter '%s' of %s.%s must not be null" : "@NotNull method %s.%s must not return null";
        Object[] objArr = new Object[i != 3 ? 3 : 2];
        if (i == 1) {
            objArr[0] = "map";
        } else if (i == 2) {
            objArr[0] = "computation";
        } else if (i != 3) {
            objArr[0] = "storageManager";
        } else {
            objArr[0] = "kotlin/reflect/jvm/internal/impl/storage/LockBasedStorageManager$CacheWithNotNullValuesBasedOnMemoizedFunction";
        }
        if (i != 3) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/storage/LockBasedStorageManager$CacheWithNotNullValuesBasedOnMemoizedFunction";
        } else {
            objArr[1] = "computeIfAbsent";
        }
        if (i == 2) {
            objArr[2] = "computeIfAbsent";
        } else if (i != 3) {
            objArr[2] = "<init>";
        }
        String str2 = String.format(str, objArr);
        if (i == 3) {
            throw new IllegalStateException(str2);
        }
    }

    @Override // defpackage.v67, defpackage.x45
    public Object invoke(Object obj) {
        switch (this.e) {
            case 1:
                Object objInvoke = super.invoke(obj);
                if (objInvoke != null) {
                    return objInvoke;
                }
                throw new IllegalStateException(String.format("@NotNull method %s.%s must not return null", "kotlin/reflect/jvm/internal/impl/storage/LockBasedStorageManager$MapBasedMemoizedFunctionToNotNull", "invoke"));
            default:
                return super.invoke(obj);
        }
    }
}
