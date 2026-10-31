package io.github.emotionbug.patches.runtime;

import android.content.Context;
import android.net.Uri;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.IdentityHashMap;
import java.util.concurrent.CancellationException;

/** Exact 14.4.0 cloud coroutine scope; never mutates stored jmq/goq/pnq or the recording URI. */
public final class CloudMonoUpload {
    private static final IdentityHashMap<Object, Prepared> SCOPES = new IdentityHashMap<>();
    private static final IdentityHashMap<Object, Prepared> FILES = new IdentityHashMap<>();
    private CloudMonoUpload() {}

    /** Register ownership only. Original zoq file validation must precede all media I/O. */
    public static void begin(Object scope, Object item) throws Exception {
        end(scope);
        if (((Enum<?>) Binding.KIND.get(item)).ordinal() != 1) return;
        Object files = Binding.FILES.get(item);
        Prepared prepared = new Prepared(scope, files, invoke(Binding.PRIMARY, files));
        synchronized (SCOPES) {
            if (FILES.containsKey(files)) throw new IOException("Concurrent cloud descriptor ownership");
            SCOPES.put(scope, prepared); FILES.put(files, prepared);
        }
    }

    private static Prepared pending(Object item) throws IllegalAccessException {
        synchronized (SCOPES) { return FILES.get(Binding.FILES.get(item)); }
    }

    public static boolean active(Object item) throws Exception { return pending(item) != null; }

    /** False joins the ORIGINAL ooq(FAILED_FILE_ERROR) branch; cancellation never becomes a file error. */
    public static boolean prepare(Object item) throws Exception {
        Prepared prepared = pending(item);
        if (prepared == null || prepared.ready) return true;
        CloudMonoFiles.Lease lease = null;
        try {
            if (Looper.myLooper() == Looper.getMainLooper())
                throw new IOException("Cloud audio preparation requires the original background upload worker");
            Object original = prepared.selected;
            Uri source = (Uri) Binding.URI.get(original);
            if (source == null) return false;
            Cancellation cancellation = new Cancellation(prepared.scope);
            cancellation.check();
            Context context = (Context) invoke(Binding.CONTEXT, null);
            Object mono = Binding.MONO_FILE.get(prepared.files);
            Uri companion = null;
            if (mono != null && mono != original && Binding.ID.getLong(mono) == Binding.ID.getLong(original)
                    && Binding.TYPE.get(mono) == Binding.MONO && Binding.NAME.get(original).equals(Binding.NAME.get(mono)))
                companion = (Uri) Binding.URI.get(mono);
            CloudMonoAudio.Input input = CloudMonoAudio.prepare(context, source, companion, cancellation);
            lease = input == null ? null : input.lease;
            Object selected = input == null ? original : Binding.DESCRIPTOR.newInstance(
                    Binding.ID.getLong(original), Binding.MONO, input.uri, Binding.NAME.get(original), input.bytes);
            synchronized (SCOPES) {
                prepared.selected = selected; prepared.changed = input != null;
                prepared.lease = lease; prepared.ready = true;
            }
            lease = null;
            return true;
        } catch (CancellationException cancelled) {
            throw cancelled;
        } catch (Exception failure) {
            Log.w("EBPatcherCloud", "Saved audio unavailable for mono cloud input", failure);
            return false;
        } finally {
            if (lease != null) try { lease.close(); }
            catch (IOException failure) { Log.w("EBPatcherCloud", "Partial cloud audio cleanup deferred", failure); }
        }
    }

    /** Unchanged inputs retain the native existing-ID shortcut after file validation. */
    public static Long unchangedServerId(Object item) throws Exception {
        Prepared prepared = pending(item);
        return Binding.UPLOAD_KIND.get(item) == Binding.UPLOAD && prepared != null && prepared.ready && !prepared.changed
                ? (Long) Binding.SERVER_ID.get(item) : null;
    }

    /** Existing records use the native PATCH path with their original request ID, never POST again. */
    public static Object routingType(Object item) throws Exception {
        Prepared prepared = pending(item);
        return prepared != null && prepared.changed && Binding.SERVER_ID.get(item) != null
                ? Binding.UPDATE : Binding.UPLOAD_KIND.get(item);
    }

    /** Duplicate-request errors are not proof that new mono metadata was accepted. */
    public static Long duplicateFallbackId(Object item) throws Exception {
        Prepared prepared = pending(item);
        return prepared != null && prepared.changed ? null : (Long) Binding.SERVER_ID.get(item);
    }

    /** Replaces a() only inside gu3.L and knq.a, not the shared selector implementation. */
    public static Object selected(Object files) throws Exception {
        synchronized (SCOPES) {
            Prepared prepared = FILES.get(files);
            if (prepared != null) {
                if (!prepared.ready) throw new IOException("Cloud metadata requested before mono preparation");
                return prepared.selected;
            }
        }
        return invoke(Binding.PRIMARY, files);
    }

    /** Not called on COROUTINE_SUSPENDED. Native HTTP consumption/retries finish before release. */
    public static void end(Object scope) {
        Prepared prepared;
        synchronized (SCOPES) {
            prepared = SCOPES.remove(scope);
            if (prepared != null) FILES.remove(prepared.files);
        }
        if (prepared != null && prepared.lease != null) {
            try { prepared.lease.close(); }
            catch (Exception failure) { Log.w("EBPatcherCloud", "Temporary cloud audio cleanup deferred", failure); }
        }
    }

    private static final class Prepared {
        final Object scope, files;
        Object selected;
        CloudMonoFiles.Lease lease;
        boolean ready, changed;
        Prepared(Object scope, Object files, Object selected) {
            this.scope = scope; this.files = files; this.selected = selected;
        }
    }

    private static Object invoke(Method method, Object receiver, Object... arguments) throws Exception {
        try { return method.invoke(receiver, arguments); }
        catch (InvocationTargetException failure) {
            Throwable cause = failure.getCause();
            if (cause instanceof Exception) throw (Exception) cause;
            if (cause instanceof Error) throw (Error) cause;
            throw failure;
        }
    }

    private static final class Cancellation implements CloudMonoAudio.Cancellation {
        final Object job;
        long nextCheck;
        Cancellation(Object continuation) throws Exception {
            Object context = invoke(Binding.GET_CONTEXT, continuation);
            Object fold = Proxy.newProxyInstance(Binding.FUNCTION2.getClassLoader(), new Class<?>[] {Binding.FUNCTION2},
                    (proxy, method, args) -> {
                        if (!method.getName().equals("invoke")) throw new UnsupportedOperationException(method.getName());
                        return Binding.JOB.isInstance(args[1]) ? args[1] : args[0];
                    });
            job = invoke(Binding.FOLD, context, null, fold);
            if (job == null) throw new IOException("Original cloud worker has no cancellation Job");
        }
        @Override public void check() throws Exception {
            if (Thread.currentThread().isInterrupted()) throw new CancellationException("Cloud audio preparation interrupted");
            long now = SystemClock.elapsedRealtime();
            if (now < nextCheck) return;
            nextCheck = now + 100;
            if ((Boolean) invoke(Binding.CANCELLED, job)) throw (CancellationException) invoke(Binding.CANCEL_REASON, job);
        }
    }

    private static final class Binding {
        static final Field KIND, FILES, URI, ID, NAME, TYPE, MONO_FILE, UPLOAD_KIND, SERVER_ID;
        static final Method PRIMARY, CONTEXT, GET_CONTEXT, FOLD, CANCELLED, CANCEL_REASON;
        static final Constructor<?> DESCRIPTOR;
        static final Class<?> FUNCTION2, JOB;
        static final Object MONO, UPLOAD, UPDATE;
        static {
            try {
                Class<?> item = Class.forName("jmq"), files = Class.forName("goq"), descriptor = Class.forName("pnq");
                Class<?> type = Class.forName("lik");
                KIND = item.getField("a"); FILES = item.getField("q");
                UPLOAD_KIND = item.getField("b"); SERVER_ID = item.getField("e");
                UPLOAD = Class.forName("kmq").getField("d").get(null);
                UPDATE = Class.forName("kmq").getField("e").get(null);
                PRIMARY = files.getMethod("a"); URI = descriptor.getField("c");
                ID = descriptor.getField("a"); NAME = descriptor.getField("d");
                TYPE = descriptor.getField("b"); MONO_FILE = files.getField("a");
                MONO = type.getField("e").get(null);
                DESCRIPTOR = descriptor.getConstructor(long.class, type, Uri.class, String.class, long.class);
                CONTEXT = Class.forName("ts1").getMethod("j");
                GET_CONTEXT = Class.forName("h58").getMethod("getContext");
                FUNCTION2 = Class.forName("kotlin.jvm.functions.Function2");
                FOLD = Class.forName("kotlin.coroutines.CoroutineContext").getMethod("U", Object.class, FUNCTION2);
                JOB = Class.forName("wie");
                CANCELLED = JOB.getMethod("isCancelled"); CANCEL_REASON = JOB.getMethod("p");
            } catch (ReflectiveOperationException failure) { throw new ExceptionInInitializerError(failure); }
        }
    }
}
