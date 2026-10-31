package com.google.android.libraries.places.internal;

import com.google.android.libraries.places.api.model.PlaceTypes;
import java.lang.reflect.Field;
import java.nio.Buffer;
import java.nio.ByteOrder;
import java.security.AccessController;
import java.util.logging.Level;
import java.util.logging.Logger;
import libcore.io.Memory;
import sun.misc.Unsafe;

/* loaded from: classes3.dex */
final class zzawx {
    static final long zza;
    static final boolean zzb;
    private static final Unsafe zzc;
    private static final Class zzd;
    private static final boolean zze;
    private static final zzaww zzf;
    private static final boolean zzg;
    private static final boolean zzh;

    /* JADX WARN: Removed duplicated region for block: B:11:0x003d  */
    static {
        boolean z11;
        boolean z12;
        zzaww zzawwVar;
        Unsafe unsafeZzg = zzg();
        zzc = unsafeZzg;
        int i5 = zzarx.zza;
        zzd = Memory.class;
        Class cls = Long.TYPE;
        boolean zZzv = zzv(cls);
        zze = zZzv;
        Class cls2 = Integer.TYPE;
        boolean zZzv2 = zzv(cls2);
        zzaww zzawuVar = null;
        if (unsafeZzg != null) {
            if (zZzv) {
                zzawuVar = new zzawv(unsafeZzg);
            } else if (zZzv2) {
                zzawuVar = new zzawu(unsafeZzg);
            }
        }
        zzf = zzawuVar;
        if (zzawuVar == null) {
            z11 = false;
        } else {
            try {
                Class<?> cls3 = zzawuVar.zza.getClass();
                cls3.getMethod("objectFieldOffset", Field.class);
                cls3.getMethod("getLong", Object.class, cls);
                if (zzB() != null) {
                    z11 = true;
                }
            } catch (Throwable th2) {
                zzh(th2);
            }
        }
        zzg = z11;
        zzaww zzawwVar2 = zzf;
        if (zzawwVar2 == null) {
            z12 = false;
        } else {
            try {
                Class<?> cls4 = zzawwVar2.zza.getClass();
                cls4.getMethod("objectFieldOffset", Field.class);
                cls4.getMethod("arrayBaseOffset", Class.class);
                cls4.getMethod("arrayIndexScale", Class.class);
                cls4.getMethod("getInt", Object.class, cls);
                cls4.getMethod("putInt", Object.class, cls, cls2);
                cls4.getMethod("getLong", Object.class, cls);
                cls4.getMethod("putLong", Object.class, cls, cls);
                cls4.getMethod("getObject", Object.class, cls);
                cls4.getMethod("putObject", Object.class, cls, Object.class);
                z12 = true;
            } catch (Throwable th3) {
                zzh(th3);
            }
        }
        zzh = z12;
        zza = zzz(byte[].class);
        zzz(boolean[].class);
        zzA(boolean[].class);
        zzz(int[].class);
        zzA(int[].class);
        zzz(long[].class);
        zzA(long[].class);
        zzz(float[].class);
        zzA(float[].class);
        zzz(double[].class);
        zzA(double[].class);
        zzz(Object[].class);
        zzA(Object[].class);
        Field fieldZzB = zzB();
        if (fieldZzB != null && (zzawwVar = zzf) != null) {
            zzawwVar.zza.objectFieldOffset(fieldZzB);
        }
        zzb = ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN;
    }

    private zzawx() {
    }

    private static int zzA(Class cls) {
        if (zzh) {
            return zzf.zza.arrayIndexScale(cls);
        }
        return -1;
    }

    private static Field zzB() {
        int i5 = zzarx.zza;
        Field fieldZzC = zzC(Buffer.class, "effectiveDirectAddress");
        if (fieldZzC != null) {
            return fieldZzC;
        }
        Field fieldZzC2 = zzC(Buffer.class, PlaceTypes.ADDRESS);
        if (fieldZzC2 == null || fieldZzC2.getType() != Long.TYPE) {
            return null;
        }
        return fieldZzC2;
    }

    private static Field zzC(Class cls, String str) {
        try {
            return cls.getDeclaredField(str);
        } catch (Throwable unused) {
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void zzD(Object obj, long j11, byte b11) {
        zzaww zzawwVar = zzf;
        long j12 = (-4) & j11;
        int i5 = zzawwVar.zza.getInt(obj, j12);
        int i11 = ((~((int) j11)) & 3) << 3;
        zzawwVar.zza.putInt(obj, j12, ((255 & b11) << i11) | (i5 & (~(255 << i11))));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void zzE(Object obj, long j11, byte b11) {
        zzaww zzawwVar = zzf;
        long j12 = (-4) & j11;
        int i5 = (((int) j11) & 3) << 3;
        zzawwVar.zza.putInt(obj, j12, ((255 & b11) << i5) | (zzawwVar.zza.getInt(obj, j12) & (~(255 << i5))));
    }

    public static double zza(Object obj, long j11) {
        return zzf.zza(obj, j11);
    }

    public static float zzb(Object obj, long j11) {
        return zzf.zzb(obj, j11);
    }

    public static int zzc(Object obj, long j11) {
        return zzf.zza.getInt(obj, j11);
    }

    public static long zzd(Object obj, long j11) {
        return zzf.zza.getLong(obj, j11);
    }

    public static Object zze(Class cls) {
        try {
            return zzc.allocateInstance(cls);
        } catch (InstantiationException e3) {
            throw new IllegalStateException(e3);
        }
    }

    public static Object zzf(Object obj, long j11) {
        return zzf.zza.getObject(obj, j11);
    }

    public static Unsafe zzg() {
        try {
            return (Unsafe) AccessController.doPrivileged(new zzawt());
        } catch (Throwable unused) {
            return null;
        }
    }

    public static /* bridge */ /* synthetic */ void zzh(Throwable th2) {
        Logger.getLogger(zzawx.class.getName()).logp(Level.WARNING, "com.google.protobuf.UnsafeUtil", "logMissingMethod", "platform method missing - proto runtime falling back to safer methods: ".concat(th2.toString()));
    }

    public static void zzm(Object obj, long j11, boolean z11) {
        zzf.zzc(obj, j11, z11);
    }

    public static void zzn(byte[] bArr, long j11, byte b11) {
        zzf.zzd(bArr, zza + j11, b11);
    }

    public static void zzo(Object obj, long j11, double d5) {
        zzf.zze(obj, j11, d5);
    }

    public static void zzp(Object obj, long j11, float f11) {
        zzf.zzf(obj, j11, f11);
    }

    public static void zzq(Object obj, long j11, int i5) {
        zzf.zza.putInt(obj, j11, i5);
    }

    public static void zzr(Object obj, long j11, long j12) {
        zzf.zza.putLong(obj, j11, j12);
    }

    public static void zzs(Object obj, long j11, Object obj2) {
        zzf.zza.putObject(obj, j11, obj2);
    }

    public static /* bridge */ /* synthetic */ boolean zzt(Object obj, long j11) {
        return ((byte) ((zzf.zza.getInt(obj, (-4) & j11) >>> ((int) (((~j11) & 3) << 3))) & 255)) != 0;
    }

    public static /* bridge */ /* synthetic */ boolean zzu(Object obj, long j11) {
        return ((byte) ((zzf.zza.getInt(obj, (-4) & j11) >>> ((int) ((j11 & 3) << 3))) & 255)) != 0;
    }

    public static boolean zzv(Class cls) {
        int i5 = zzarx.zza;
        try {
            Class cls2 = zzd;
            Class cls3 = Boolean.TYPE;
            cls2.getMethod("peekLong", cls, cls3);
            cls2.getMethod("pokeLong", cls, Long.TYPE, cls3);
            Class cls4 = Integer.TYPE;
            cls2.getMethod("pokeInt", cls, cls4, cls3);
            cls2.getMethod("peekInt", cls, cls3);
            cls2.getMethod("pokeByte", cls, Byte.TYPE);
            cls2.getMethod("peekByte", cls);
            cls2.getMethod("pokeByteArray", cls, byte[].class, cls4, cls4);
            cls2.getMethod("peekByteArray", cls, byte[].class, cls4, cls4);
            return true;
        } catch (Throwable unused) {
            return false;
        }
    }

    public static boolean zzw(Object obj, long j11) {
        return zzf.zzg(obj, j11);
    }

    public static boolean zzx() {
        return zzh;
    }

    public static boolean zzy() {
        return zzg;
    }

    private static int zzz(Class cls) {
        if (zzh) {
            return zzf.zza.arrayBaseOffset(cls);
        }
        return -1;
    }
}
