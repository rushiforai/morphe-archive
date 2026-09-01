package defpackage;

import java.lang.reflect.Field;
import java.security.PrivilegedExceptionAction;
import sun.misc.Unsafe;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jig implements hig {
    public static final Unsafe a;
    public static final int b;
    public static final /* synthetic */ jig[] c;
    public static final jig zza;
    public static final jig zzb;

    static {
        Unsafe unsafeA;
        jig jigVar = new jig("UNSAFE_LITTLE_ENDIAN", 0);
        zza = jigVar;
        jig jigVar2 = new jig("UNSAFE_BIG_ENDIAN", 1);
        zzb = jigVar2;
        c = new jig[]{jigVar, jigVar2};
        try {
            try {
                try {
                    unsafeA = Unsafe.getUnsafe();
                } catch (SecurityException unused) {
                    unsafeA = (Unsafe) Class.forName("java.security.AccessController").getMethod("doPrivileged", PrivilegedExceptionAction.class).invoke(null, l2e.b);
                }
            } catch (Exception e) {
                lg8.p("Could not initialize intrinsics", e);
                return;
            }
        } catch (Exception unused2) {
            unsafeA = a();
        }
        a = unsafeA;
        b = unsafeA.arrayBaseOffset(byte[].class);
        if (unsafeA.arrayIndexScale(byte[].class) == 1) {
            return;
        }
        ywb.d();
    }

    public static /* synthetic */ Unsafe a() throws IllegalAccessException {
        for (Field field : Unsafe.class.getDeclaredFields()) {
            field.setAccessible(true);
            Object obj = field.get(null);
            if (Unsafe.class.isInstance(obj)) {
                return (Unsafe) Unsafe.class.cast(obj);
            }
        }
        throw new NoSuchFieldError("the Unsafe");
    }

    public static jig[] values() {
        return (jig[]) c.clone();
    }

    @Override // defpackage.hig
    public final /* synthetic */ long zza(byte[] bArr, int i) {
        int iOrdinal = ordinal();
        int i2 = b;
        Unsafe unsafe = a;
        if (iOrdinal == 0) {
            return unsafe.getLong(bArr, ((long) i) + ((long) i2));
        }
        if (iOrdinal == 1) {
            return Long.reverseBytes(unsafe.getLong(bArr, ((long) i) + ((long) i2)));
        }
        throw null;
    }
}
