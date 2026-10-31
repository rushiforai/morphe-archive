package com.google.android.libraries.places.internal;

import b.c0;
import b.u4;
import java.lang.reflect.Field;
import java.security.AccessController;
import java.security.PrivilegedActionException;
import java.security.PrivilegedExceptionAction;
import java.util.Locale;
import java.util.Objects;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import java.util.concurrent.locks.LockSupport;
import java.util.logging.Level;
import java.util.logging.Logger;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import sun.misc.Unsafe;

/* loaded from: classes3.dex */
public abstract class zzajp<V> extends zzake implements zzaka<V> {
    static final boolean zza;
    static final zzajz zzb;
    private static final zza zzc;
    private static final Object zzd;
    private volatile zzd listeners;
    private volatile Object value;
    private volatile zzj waiters;

    abstract class zza {
        public /* synthetic */ zza(zzajo zzajoVar) {
        }

        public abstract zzd zza(zzajp zzajpVar, zzd zzdVar);

        public abstract zzj zzb(zzajp zzajpVar, zzj zzjVar);

        public abstract void zzc(zzj zzjVar, zzj zzjVar2);

        public abstract void zzd(zzj zzjVar, Thread thread);

        public abstract boolean zze(zzajp zzajpVar, zzd zzdVar, zzd zzdVar2);

        public abstract boolean zzf(zzajp zzajpVar, Object obj, Object obj2);

        public abstract boolean zzg(zzajp zzajpVar, zzj zzjVar, zzj zzjVar2);
    }

    final class zzb {
        static final zzb zza;
        static final zzb zzb;
        final boolean zzc;
        final Throwable zzd;

        static {
            if (zzajp.zza) {
                zzb = null;
                zza = null;
            } else {
                zzb = new zzb(false, null);
                zza = new zzb(true, null);
            }
        }

        public zzb(boolean z11, Throwable th2) {
            this.zzc = z11;
            this.zzd = th2;
        }
    }

    final class zzc {
        static final zzc zza = new zzc(new Throwable("Failure occurred while trying to finish a future.") { // from class: com.google.android.libraries.places.internal.zzajp.zzc.1
            {
                super("Failure occurred while trying to finish a future.");
            }

            @Override // java.lang.Throwable
            public final synchronized Throwable fillInStackTrace() {
                return this;
            }
        });
        final Throwable zzb;

        public zzc(Throwable th2) {
            th2.getClass();
            this.zzb = th2;
        }
    }

    final class zzd {
        static final zzd zza = new zzd();
        zzd next;
        final Runnable zzb;
        final Executor zzc;

        public zzd() {
            this.zzb = null;
            this.zzc = null;
        }

        public zzd(Runnable runnable, Executor executor) {
            this.zzb = runnable;
            this.zzc = executor;
        }
    }

    final class zze extends zza {
        final AtomicReferenceFieldUpdater<zzj, Thread> zza;
        final AtomicReferenceFieldUpdater<zzj, zzj> zzb;
        final AtomicReferenceFieldUpdater<zzajp, zzj> zzc;
        final AtomicReferenceFieldUpdater<zzajp, zzd> zzd;
        final AtomicReferenceFieldUpdater<zzajp, Object> zze;

        public zze(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater2, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater3, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater4, AtomicReferenceFieldUpdater atomicReferenceFieldUpdater5) {
            super(null);
            this.zza = atomicReferenceFieldUpdater;
            this.zzb = atomicReferenceFieldUpdater2;
            this.zzc = atomicReferenceFieldUpdater3;
            this.zzd = atomicReferenceFieldUpdater4;
            this.zze = atomicReferenceFieldUpdater5;
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final zzd zza(zzajp zzajpVar, zzd zzdVar) {
            return this.zzd.getAndSet(zzajpVar, zzdVar);
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final zzj zzb(zzajp zzajpVar, zzj zzjVar) {
            return this.zzc.getAndSet(zzajpVar, zzjVar);
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final void zzc(zzj zzjVar, zzj zzjVar2) {
            this.zzb.lazySet(zzjVar, zzjVar2);
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final void zzd(zzj zzjVar, Thread thread) {
            this.zza.lazySet(zzjVar, thread);
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final boolean zze(zzajp zzajpVar, zzd zzdVar, zzd zzdVar2) {
            return zzajq.zza(this.zzd, zzajpVar, zzdVar, zzdVar2);
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final boolean zzf(zzajp zzajpVar, Object obj, Object obj2) {
            return zzajq.zza(this.zze, zzajpVar, obj, obj2);
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final boolean zzg(zzajp zzajpVar, zzj zzjVar, zzj zzjVar2) {
            return zzajq.zza(this.zzc, zzajpVar, zzjVar, zzjVar2);
        }
    }

    final class zzf<V> implements Runnable {
        final zzajp<V> zza;
        final zzaka<? extends V> zzb;

        @Override // java.lang.Runnable
        public final void run() {
            throw null;
        }
    }

    final class zzg extends zza {
        private zzg() {
            throw null;
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final zzd zza(zzajp zzajpVar, zzd zzdVar) {
            zzd zzdVar2;
            synchronized (zzajpVar) {
                try {
                    zzdVar2 = zzajpVar.listeners;
                    if (zzdVar2 != zzdVar) {
                        zzajpVar.listeners = zzdVar;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            return zzdVar2;
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final zzj zzb(zzajp zzajpVar, zzj zzjVar) {
            zzj zzjVar2;
            synchronized (zzajpVar) {
                try {
                    zzjVar2 = zzajpVar.waiters;
                    if (zzjVar2 != zzjVar) {
                        zzajpVar.waiters = zzjVar;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            return zzjVar2;
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final void zzc(zzj zzjVar, zzj zzjVar2) {
            zzjVar.next = zzjVar2;
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final void zzd(zzj zzjVar, Thread thread) {
            zzjVar.thread = thread;
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final boolean zze(zzajp zzajpVar, zzd zzdVar, zzd zzdVar2) {
            synchronized (zzajpVar) {
                try {
                    if (zzajpVar.listeners != zzdVar) {
                        return false;
                    }
                    zzajpVar.listeners = zzdVar2;
                    return true;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final boolean zzf(zzajp zzajpVar, Object obj, Object obj2) {
            synchronized (zzajpVar) {
                try {
                    if (zzajpVar.value != obj) {
                        return false;
                    }
                    zzajpVar.value = obj2;
                    return true;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final boolean zzg(zzajp zzajpVar, zzj zzjVar, zzj zzjVar2) {
            synchronized (zzajpVar) {
                try {
                    if (zzajpVar.waiters != zzjVar) {
                        return false;
                    }
                    zzajpVar.waiters = zzjVar2;
                    return true;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }

        public /* synthetic */ zzg(zzajr zzajrVar) {
            super(null);
        }
    }

    interface zzh<V> extends zzaka<V> {
    }

    final class zzi extends zza {
        static final Unsafe zza;
        static final long zzb;
        static final long zzc;
        static final long zzd;
        static final long zze;
        static final long zzf;

        static {
            Unsafe unsafe;
            try {
                try {
                    unsafe = Unsafe.getUnsafe();
                } catch (PrivilegedActionException e3) {
                    throw new RuntimeException("Could not initialize intrinsics", e3.getCause());
                }
            } catch (SecurityException unused) {
                unsafe = (Unsafe) AccessController.doPrivileged(new PrivilegedExceptionAction<Unsafe>() { // from class: com.google.android.libraries.places.internal.zzajp.zzi.1
                    @Override // java.security.PrivilegedExceptionAction
                    public final /* bridge */ /* synthetic */ Unsafe run() throws Exception {
                        for (Field field : Unsafe.class.getDeclaredFields()) {
                            field.setAccessible(true);
                            Object obj = field.get(null);
                            if (Unsafe.class.isInstance(obj)) {
                                return (Unsafe) Unsafe.class.cast(obj);
                            }
                        }
                        throw new NoSuchFieldError("the Unsafe");
                    }
                });
            }
            try {
                zzc = unsafe.objectFieldOffset(zzajp.class.getDeclaredField("waiters"));
                zzb = unsafe.objectFieldOffset(zzajp.class.getDeclaredField("listeners"));
                zzd = unsafe.objectFieldOffset(zzajp.class.getDeclaredField("value"));
                zze = unsafe.objectFieldOffset(zzj.class.getDeclaredField("thread"));
                zzf = unsafe.objectFieldOffset(zzj.class.getDeclaredField("next"));
                zza = unsafe;
            } catch (NoSuchFieldException e11) {
                throw new RuntimeException(e11);
            }
        }

        private zzi() {
            throw null;
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final zzd zza(zzajp zzajpVar, zzd zzdVar) {
            zzd zzdVar2;
            do {
                zzdVar2 = zzajpVar.listeners;
                if (zzdVar == zzdVar2) {
                    break;
                }
            } while (!zze(zzajpVar, zzdVar2, zzdVar));
            return zzdVar2;
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final zzj zzb(zzajp zzajpVar, zzj zzjVar) {
            zzj zzjVar2;
            do {
                zzjVar2 = zzajpVar.waiters;
                if (zzjVar == zzjVar2) {
                    break;
                }
            } while (!zzg(zzajpVar, zzjVar2, zzjVar));
            return zzjVar2;
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final void zzc(zzj zzjVar, zzj zzjVar2) {
            zza.putObject(zzjVar, zzf, zzjVar2);
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final void zzd(zzj zzjVar, Thread thread) {
            zza.putObject(zzjVar, zze, thread);
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final boolean zze(zzajp zzajpVar, zzd zzdVar, zzd zzdVar2) {
            return zzajs.zza(zza, zzajpVar, zzb, zzdVar, zzdVar2);
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final boolean zzf(zzajp zzajpVar, Object obj, Object obj2) {
            return zzajs.zza(zza, zzajpVar, zzd, obj, obj2);
        }

        @Override // com.google.android.libraries.places.internal.zzajp.zza
        public final boolean zzg(zzajp zzajpVar, zzj zzjVar, zzj zzjVar2) {
            return zzajs.zza(zza, zzajpVar, zzc, zzjVar, zzjVar2);
        }

        public /* synthetic */ zzi(zzajt zzajtVar) {
            super(null);
        }
    }

    final class zzj {
        static final zzj zza = new zzj(false);
        volatile zzj next;
        volatile Thread thread;

        public zzj(boolean z11) {
        }

        public zzj() {
            zzajp.zzc.zzd(this, Thread.currentThread());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    static {
        boolean z11;
        Throwable th2;
        zza zzgVar;
        Throwable th3;
        try {
            z11 = Boolean.parseBoolean(System.getProperty("guava.concurrent.generate_cancellation_cause", "false"));
        } catch (SecurityException unused) {
            z11 = false;
        }
        zza = z11;
        zzb = new zzajz(zzajp.class);
        Object[] objArr = 0;
        try {
            zzgVar = new zzi(null);
            th2 = null;
            th3 = null;
        } catch (Error | Exception e3) {
            try {
                th2 = null;
                th3 = e3;
                zzgVar = new zze(AtomicReferenceFieldUpdater.newUpdater(zzj.class, Thread.class, "thread"), AtomicReferenceFieldUpdater.newUpdater(zzj.class, zzj.class, "next"), AtomicReferenceFieldUpdater.newUpdater(zzajp.class, zzj.class, "waiters"), AtomicReferenceFieldUpdater.newUpdater(zzajp.class, zzd.class, "listeners"), AtomicReferenceFieldUpdater.newUpdater(zzajp.class, Object.class, "value"));
            } catch (Error | Exception e11) {
                th2 = e11;
                zzgVar = new zzg(objArr == true ? 1 : 0);
                th3 = e3;
            }
        }
        zzc = zzgVar;
        if (th2 != null) {
            zzajz zzajzVar = zzb;
            Logger loggerZza = zzajzVar.zza();
            Level level = Level.SEVERE;
            loggerZza.logp(level, "com.google.common.util.concurrent.AbstractFuture", "<clinit>", "UnsafeAtomicHelper is broken!", th3);
            zzajzVar.zza().logp(level, "com.google.common.util.concurrent.AbstractFuture", "<clinit>", "SafeAtomicHelper is broken!", th2);
        }
        zzd = new Object();
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static Object zzn(zzaka zzakaVar) {
        Throwable thZzf;
        if (zzakaVar instanceof zzh) {
            Object zzbVar = ((zzajp) zzakaVar).value;
            if (zzbVar instanceof zzb) {
                zzb zzbVar2 = (zzb) zzbVar;
                if (zzbVar2.zzc) {
                    Throwable th2 = zzbVar2.zzd;
                    zzbVar = th2 != null ? new zzb(false, th2) : zzb.zzb;
                }
            }
            Objects.requireNonNull(zzbVar);
            return zzbVar;
        }
        if ((zzakaVar instanceof zzake) && (thZzf = ((zzake) zzakaVar).zzf()) != null) {
            return new zzc(thZzf);
        }
        boolean zIsCancelled = zzakaVar.isCancelled();
        if ((!zza) && zIsCancelled) {
            zzb zzbVar3 = zzb.zzb;
            Objects.requireNonNull(zzbVar3);
            return zzbVar3;
        }
        try {
            Object objZzo = zzo(zzakaVar);
            return zIsCancelled ? new zzb(false, new IllegalArgumentException("get() did not throw CancellationException, despite reporting isCancelled() == true: ".concat(String.valueOf(zzakaVar)))) : objZzo == null ? zzd : objZzo;
        } catch (Error | Exception e3) {
            return new zzc(e3);
        } catch (CancellationException e11) {
            return !zIsCancelled ? new zzc(new IllegalArgumentException("get() threw CancellationException, despite reporting isCancelled() == false: ".concat(String.valueOf(zzakaVar)), e11)) : new zzb(false, e11);
        } catch (ExecutionException e12) {
            return zIsCancelled ? new zzb(false, new IllegalArgumentException("get() did not throw CancellationException, despite reporting isCancelled() == true: ".concat(String.valueOf(zzakaVar)), e12)) : new zzc(e12.getCause());
        }
    }

    private static Object zzo(Future future) throws ExecutionException {
        Object obj;
        boolean z11 = false;
        while (true) {
            try {
                obj = future.get();
                break;
            } catch (InterruptedException unused) {
                z11 = true;
            } catch (Throwable th2) {
                if (z11) {
                    Thread.currentThread().interrupt();
                }
                throw th2;
            }
        }
        if (z11) {
            Thread.currentThread().interrupt();
        }
        return obj;
    }

    private final void zzp(StringBuilder sb2) {
        try {
            Object objZzo = zzo(this);
            sb2.append("SUCCESS, result=[");
            if (objZzo == null) {
                sb2.append(AbstractJsonLexerKt.NULL);
            } else if (objZzo == this) {
                sb2.append("this future");
            } else {
                sb2.append(objZzo.getClass().getName());
                sb2.append("@");
                sb2.append(Integer.toHexString(System.identityHashCode(objZzo)));
            }
            sb2.append("]");
        } catch (CancellationException unused) {
            sb2.append("CANCELLED");
        } catch (ExecutionException e3) {
            sb2.append("FAILURE, cause=[");
            sb2.append(e3.getCause());
            sb2.append("]");
        } catch (Exception e11) {
            sb2.append("UNKNOWN, cause=[");
            sb2.append(e11.getClass());
            sb2.append(" thrown from get()]");
        }
    }

    private final void zzq(StringBuilder sb2) {
        String strConcat;
        int length = sb2.length();
        sb2.append("PENDING");
        Object obj = this.value;
        if (obj instanceof zzf) {
            sb2.append(", setFuture=[");
            zzr(sb2, ((zzf) obj).zzb);
            sb2.append("]");
        } else {
            try {
                strConcat = zznb.zza(zze());
            } catch (Exception | StackOverflowError e3) {
                strConcat = "Exception thrown from implementation: ".concat(String.valueOf(e3.getClass()));
            }
            if (strConcat != null) {
                c0.C(sb2, ", info=[", strConcat, "]");
            }
        }
        if (isDone()) {
            sb2.delete(length, sb2.length());
            zzp(sb2);
        }
    }

    private final void zzr(StringBuilder sb2, Object obj) {
        try {
            if (obj == this) {
                sb2.append("this future");
            } else {
                sb2.append(obj);
            }
        } catch (Exception e3) {
            e = e3;
            sb2.append("Exception thrown from implementation: ");
            sb2.append(e.getClass());
        } catch (StackOverflowError e11) {
            e = e11;
            sb2.append("Exception thrown from implementation: ");
            sb2.append(e.getClass());
        }
    }

    private static void zzs(zzajp zzajpVar, boolean z11) {
        zzd zzdVar = null;
        while (true) {
            for (zzj zzjVarZzb = zzc.zzb(zzajpVar, zzj.zza); zzjVarZzb != null; zzjVarZzb = zzjVarZzb.next) {
                Thread thread = zzjVarZzb.thread;
                if (thread != null) {
                    zzjVarZzb.thread = null;
                    LockSupport.unpark(thread);
                }
            }
            if (z11) {
                zzajpVar.zzk();
            }
            zzd zzdVar2 = zzdVar;
            zzd zzdVarZza = zzc.zza(zzajpVar, zzd.zza);
            zzd zzdVar3 = zzdVar2;
            while (zzdVarZza != null) {
                zzd zzdVar4 = zzdVarZza.next;
                zzdVarZza.next = zzdVar3;
                zzdVar3 = zzdVarZza;
                zzdVarZza = zzdVar4;
            }
            while (zzdVar3 != null) {
                Runnable runnable = zzdVar3.zzb;
                zzdVar = zzdVar3.next;
                Objects.requireNonNull(runnable);
                Runnable runnable2 = runnable;
                if (runnable2 instanceof zzf) {
                    zzf zzfVar = (zzf) runnable2;
                    zzajpVar = zzfVar.zza;
                    if (zzajpVar.value == zzfVar) {
                        if (zzc.zzf(zzajpVar, zzfVar, zzn(zzfVar.zzb))) {
                            break;
                        }
                    } else {
                        continue;
                    }
                } else {
                    Executor executor = zzdVar3.zzc;
                    Objects.requireNonNull(executor);
                    zzt(runnable2, executor);
                }
                zzdVar3 = zzdVar;
            }
            return;
            z11 = false;
        }
    }

    private static void zzt(Runnable runnable, Executor executor) {
        try {
            executor.execute(runnable);
        } catch (Exception e3) {
            zzb.zza().logp(Level.SEVERE, "com.google.common.util.concurrent.AbstractFuture", "executeListener", c0.m("RuntimeException while executing runnable ", String.valueOf(runnable), " with executor ", String.valueOf(executor)), (Throwable) e3);
        }
    }

    private final void zzu(zzj zzjVar) {
        zzjVar.thread = null;
        while (true) {
            zzj zzjVar2 = this.waiters;
            if (zzjVar2 != zzj.zza) {
                zzj zzjVar3 = null;
                while (zzjVar2 != null) {
                    zzj zzjVar4 = zzjVar2.next;
                    if (zzjVar2.thread != null) {
                        zzjVar3 = zzjVar2;
                    } else if (zzjVar3 != null) {
                        zzjVar3.next = zzjVar4;
                        if (zzjVar3.thread == null) {
                            break;
                        }
                    } else if (!zzc.zzg(this, zzjVar2, zzjVar4)) {
                        break;
                    }
                    zzjVar2 = zzjVar4;
                }
                return;
            }
            return;
        }
    }

    private static final Object zzv(Object obj) throws ExecutionException {
        if (obj instanceof zzb) {
            Throwable th2 = ((zzb) obj).zzd;
            CancellationException cancellationException = new CancellationException("Task was cancelled.");
            cancellationException.initCause(th2);
            throw cancellationException;
        }
        if (obj instanceof zzc) {
            throw new ExecutionException(((zzc) obj).zzb);
        }
        if (obj == zzd) {
            return null;
        }
        return obj;
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x0057, code lost:
    
        return true;
     */
    @Override // java.util.concurrent.Future
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean cancel(boolean z11) {
        zzb zzbVar;
        Object obj = this.value;
        if (!(obj instanceof zzf) && !(obj == null)) {
            return false;
        }
        if (zza) {
            zzbVar = new zzb(z11, new CancellationException("Future.cancel() was called."));
        } else {
            zzbVar = z11 ? zzb.zza : zzb.zzb;
            Objects.requireNonNull(zzbVar);
        }
        zzajp<V> zzajpVar = this;
        boolean z12 = false;
        while (true) {
            if (zzc.zzf(zzajpVar, obj, zzbVar)) {
                zzs(zzajpVar, z11);
                if (!(obj instanceof zzf)) {
                    break;
                }
                zzaka<? extends V> zzakaVar = ((zzf) obj).zzb;
                if (!(zzakaVar instanceof zzh)) {
                    zzakaVar.cancel(z11);
                    break;
                }
                zzajpVar = (zzajp) zzakaVar;
                obj = zzajpVar.value;
                if (!(obj == null) && !(obj instanceof zzf)) {
                    return true;
                }
                z12 = true;
            } else {
                obj = zzajpVar.value;
                if (!(obj instanceof zzf)) {
                    return z12;
                }
            }
        }
    }

    @Override // java.util.concurrent.Future
    public final Object get() throws ExecutionException, InterruptedException {
        Object obj;
        if (Thread.interrupted()) {
            throw new InterruptedException();
        }
        Object obj2 = this.value;
        if ((obj2 != null) && (!(obj2 instanceof zzf))) {
            return zzv(obj2);
        }
        zzj zzjVar = this.waiters;
        if (zzjVar != zzj.zza) {
            zzj zzjVar2 = new zzj();
            do {
                zza zzaVar = zzc;
                zzaVar.zzc(zzjVar2, zzjVar);
                if (zzaVar.zzg(this, zzjVar, zzjVar2)) {
                    do {
                        LockSupport.park(this);
                        if (Thread.interrupted()) {
                            zzu(zzjVar2);
                            throw new InterruptedException();
                        }
                        obj = this.value;
                    } while (!((obj != null) & (!(obj instanceof zzf))));
                    return zzv(obj);
                }
                zzjVar = this.waiters;
            } while (zzjVar != zzj.zza);
        }
        Object obj3 = this.value;
        Objects.requireNonNull(obj3);
        return zzv(obj3);
    }

    @Override // java.util.concurrent.Future
    public final boolean isCancelled() {
        return this.value instanceof zzb;
    }

    @Override // java.util.concurrent.Future
    public final boolean isDone() {
        return (this.value != null) & (!(r0 instanceof zzf));
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        if (getClass().getName().startsWith("com.google.common.util.concurrent.")) {
            sb2.append(getClass().getSimpleName());
        } else {
            sb2.append(getClass().getName());
        }
        sb2.append('@');
        sb2.append(Integer.toHexString(System.identityHashCode(this)));
        sb2.append("[status=");
        if (this.value instanceof zzb) {
            sb2.append("CANCELLED");
        } else if (isDone()) {
            zzp(sb2);
        } else {
            zzq(sb2);
        }
        sb2.append("]");
        return sb2.toString();
    }

    public String zze() {
        throw null;
    }

    @Override // com.google.android.libraries.places.internal.zzake
    public final Throwable zzf() {
        if (!(this instanceof zzh)) {
            return null;
        }
        Object obj = this.value;
        if (obj instanceof zzc) {
            return ((zzc) obj).zzb;
        }
        return null;
    }

    @Override // com.google.android.libraries.places.internal.zzaka
    public final void zzj(Runnable runnable, Executor executor) {
        zzd zzdVar;
        zzmt.zzc(executor, "Executor was null.");
        if (!isDone() && (zzdVar = this.listeners) != zzd.zza) {
            zzd zzdVar2 = new zzd(runnable, executor);
            do {
                zzdVar2.next = zzdVar;
                if (zzc.zze(this, zzdVar, zzdVar2)) {
                    return;
                } else {
                    zzdVar = this.listeners;
                }
            } while (zzdVar != zzd.zza);
        }
        zzt(runnable, executor);
    }

    public void zzk() {
    }

    public boolean zzl(Object obj) {
        if (obj == null) {
            obj = zzd;
        }
        if (!zzc.zzf(this, null, obj)) {
            return false;
        }
        zzs(this, false);
        return true;
    }

    public boolean zzm(Throwable th2) {
        if (!zzc.zzf(this, null, new zzc(th2))) {
            return false;
        }
        zzs(this, false);
        return true;
    }

    @Override // java.util.concurrent.Future
    public final Object get(long j11, TimeUnit timeUnit) throws ExecutionException, InterruptedException, TimeoutException {
        long nanos = timeUnit.toNanos(j11);
        if (!Thread.interrupted()) {
            Object obj = this.value;
            boolean z11 = true;
            if ((obj != null) & (!(obj instanceof zzf))) {
                return zzv(obj);
            }
            long jNanoTime = nanos > 0 ? System.nanoTime() + nanos : 0L;
            if (nanos >= 1000) {
                zzj zzjVar = this.waiters;
                if (zzjVar != zzj.zza) {
                    zzj zzjVar2 = new zzj();
                    do {
                        zza zzaVar = zzc;
                        zzaVar.zzc(zzjVar2, zzjVar);
                        if (zzaVar.zzg(this, zzjVar, zzjVar2)) {
                            do {
                                LockSupport.parkNanos(this, Math.min(nanos, 2147483647999999999L));
                                if (!Thread.interrupted()) {
                                    Object obj2 = this.value;
                                    if ((obj2 != null) & (!(obj2 instanceof zzf))) {
                                        return zzv(obj2);
                                    }
                                    nanos = jNanoTime - System.nanoTime();
                                } else {
                                    zzu(zzjVar2);
                                    throw new InterruptedException();
                                }
                            } while (nanos >= 1000);
                            zzu(zzjVar2);
                        } else {
                            zzjVar = this.waiters;
                        }
                    } while (zzjVar != zzj.zza);
                }
                Object obj3 = this.value;
                Objects.requireNonNull(obj3);
                return zzv(obj3);
            }
            while (nanos > 0) {
                Object obj4 = this.value;
                if ((obj4 != null) & (!(obj4 instanceof zzf))) {
                    return zzv(obj4);
                }
                if (!Thread.interrupted()) {
                    nanos = jNanoTime - System.nanoTime();
                } else {
                    throw new InterruptedException();
                }
            }
            String string = toString();
            String string2 = timeUnit.toString();
            Locale locale = Locale.ROOT;
            String lowerCase = string2.toLowerCase(locale);
            String strConcat = "Waited " + j11 + " " + timeUnit.toString().toLowerCase(locale);
            if (nanos + 1000 < 0) {
                String strConcat2 = strConcat.concat(" (plus ");
                long j12 = -nanos;
                long jConvert = timeUnit.convert(j12, TimeUnit.NANOSECONDS);
                long nanos2 = j12 - timeUnit.toNanos(jConvert);
                if (jConvert != 0 && nanos2 <= 1000) {
                    z11 = false;
                }
                if (jConvert > 0) {
                    String strConcat3 = strConcat2 + jConvert + " " + lowerCase;
                    if (z11) {
                        strConcat3 = strConcat3.concat(",");
                    }
                    strConcat2 = strConcat3.concat(" ");
                }
                if (z11) {
                    strConcat2 = strConcat2 + nanos2 + " nanoseconds ";
                }
                strConcat = strConcat2.concat("delay)");
            }
            if (isDone()) {
                throw new TimeoutException(strConcat.concat(" but future completed as timeout expired"));
            }
            throw new TimeoutException(u4.m(strConcat, " for ", string));
        }
        throw new InterruptedException();
    }
}
