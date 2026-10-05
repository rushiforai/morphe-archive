package dev.twitchpatches.extension.ads;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;
import java.util.function.BooleanSupplier;

public final class TokenResult {
    private final CountDownLatch completion = new CountDownLatch(1);
    private Object disposable;
    private boolean cancelled;
    private Token token;
    private final Consumer<Boolean> outcome;
    private boolean completed;

    public TokenResult(Consumer<Boolean> outcome) { this.outcome = outcome; }

    public synchronized void acceptDisposable(Object value) {
        if (cancelled) cancelDisposable(value);
        else disposable = value;
    }

    public void onSuccess(Object value) { decode(value, this); }
    public void onError(Throwable error) { fail(); }
    public synchronized void fail() {
        if (!completed && !cancelled) { completed = true; outcome.accept(false); }
        completion.countDown();
    }

    public synchronized void receive(String signature, String value) {
        if (completed || cancelled) return;
        completed = true;
        if (signature != null && value != null && !signature.isEmpty() && !value.isEmpty())
            token = new Token(signature, value);
        outcome.accept(token != null);
        completion.countDown();
    }

    Token await(long milliseconds) throws InterruptedException {
        return await(milliseconds, () -> true);
    }

    Token await(long milliseconds, BooleanSupplier active) throws InterruptedException {
        long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(milliseconds);
        try {
            while (active.getAsBoolean()) {
                long remaining = deadline - System.nanoTime();
                if (remaining <= 0) return null;
                if (completion.await(Math.min(remaining, TimeUnit.MILLISECONDS.toNanos(50)), TimeUnit.NANOSECONDS))
                    synchronized (this) { return cancelled ? null : token; }
            }
            return null;
        } finally { cancel(); }
    }

    synchronized void cancel() {
        cancelled = true;
        if (disposable != null) cancelDisposable(disposable);
        disposable = null;
        completion.countDown();
    }

    public static void decode(Object value, TokenResult result) {
        throw new IllegalStateException("Token result bridge was not installed");
    }

    public static void cancelDisposable(Object value) {
        throw new IllegalStateException("Token cancellation bridge was not installed");
    }

    static final class Token {
        final String signature;
        final String value;
        Token(String signature, String value) { this.signature = signature; this.value = value; }
    }
}
