package software.santodan.extension.nuvioupdate;

import java.lang.ref.WeakReference;
import java.util.*;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/** Shares native transfer callbacks with a foreground waiter on the native download mutex. */
public final class UpdateProgress {
    private static final Map<String, Transfer> TRANSFERS = new LinkedHashMap<>();
    private static final long TTL = 15 * 60 * 1000L;
    private UpdateProgress() {}
    public static Object wrap(Object update, Object callback) {
        if (callback == null || update == null || callback instanceof Listener) return callback;
        try {
            String url = (String) update.getClass().getField("f").get(update);
            Long size = (Long) update.getClass().getField("g").get(update);
            return listen(url, size, (Function2<Object, Object, Object>) callback);
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Validated Nuvio update contract is missing", error);
        }
    }
    public static Object listen(String url, Long size, Function2<Object, Object, Object> callback) {
        long now = System.nanoTime() / 1_000_000L;
        String key = url + "\n" + (size == null ? 0 : size);
        Transfer transfer;
        Listener listener;
        synchronized (TRANSFERS) {
            TRANSFERS.entrySet().removeIf(entry -> now - entry.getValue().touched > TTL);
            transfer = TRANSFERS.get(key);
            if (transfer == null) {
                while (TRANSFERS.size() >= 16) TRANSFERS.remove(TRANSFERS.keySet().iterator().next());
                transfer = new Transfer(); TRANSFERS.put(key, transfer);
            }
            transfer.touched = now;
            transfer.listeners.removeIf(reference -> reference.get() == null);
            if (transfer.listeners.isEmpty()) { transfer.bytes = 0; transfer.total = null; }
            if (transfer.listeners.size() >= 8) transfer.listeners.remove(0);
            listener = new Listener(transfer, size, callback);
            transfer.listeners.add(new WeakReference<>(listener));
        }
        if (transfer.bytes > 0 && (transfer.total == null || transfer.bytes < transfer.total)) listener.emit(transfer.bytes, transfer.total, true);
        return listener;
    }
    private static final class Transfer {
        final List<WeakReference<Listener>> listeners = new ArrayList<>();
        volatile long bytes, touched;
        volatile Long total;
    }
    private static final class Listener implements Function2<Object, Object, Object> {
        final Transfer transfer;
        final Long expected;
        final Function2<Object, Object, Object> callback;
        long lastTime = Long.MIN_VALUE;
        Listener(Transfer transfer, Long expected, Function2<Object, Object, Object> callback) {
            this.transfer = transfer; this.expected = expected; this.callback = callback;
        }
        @Override public Object invoke(Object written, Object reported) {
            long bytes = Math.max(0, ((Number) written).longValue());
            Long total = reported instanceof Number && ((Number) reported).longValue() > 0 ? Long.valueOf(((Number) reported).longValue()) : expected;
            if (total != null && total <= 0) total = null;
            List<Listener> listeners = new ArrayList<>();
            synchronized (TRANSFERS) {
                transfer.bytes = bytes; transfer.total = total; transfer.touched = System.nanoTime() / 1_000_000L;
                for (var reference : transfer.listeners) { var value = reference.get(); if (value != null) listeners.add(value); }
            }
            for (Listener listener : listeners) {
                try { listener.emit(bytes, total, false); }
                catch (RuntimeException error) { if (listener == this) throw error; }
            }
            return Unit.INSTANCE;
        }
        synchronized void emit(long bytes, Long total, boolean replay) {
            if ((total == null || total <= 0) && expected != null && expected > 0) total = expected;
            long now = System.nanoTime() / 1_000_000L;
            boolean complete = total != null && bytes >= total;
            if (!replay && !complete && lastTime != Long.MIN_VALUE && now - lastTime < 250) return;
            lastTime = now;
            callback.invoke(total == null ? bytes : Math.min(bytes, total), total);
        }
    }
}
