/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.IntSupplier;

/** Asks {@link OutsideTranslate} whether it would act, since the unpatched app has no messages to show. */
public final class OutsideTranslateForTests {
    private OutsideTranslateForTests() {}

    /** Whether the switch lets the translator work now. */
    public static boolean active() {
        return OutsideTranslate.active();
    }

    /** Turns a chat on or off in the account with user ID [owner], the way its header item does. */
    public static boolean toggleChat(long owner, long dialog) {
        return OutsideTranslate.toggleChat(owner, dialog);
    }

    public static boolean chatOn(long owner, long dialog) {
        return OutsideTranslate.chatOn(owner, dialog);
    }

    public static void reset() {
        OutsideTranslate.resetForTests();
    }

    /**
     * Draws one message in [owner]'s chat [dialog] with the worker held, so its request waits the
     * way it does behind a busy queue. The supplier runs what waited and says how many texts went
     * out, which is none when the request was no longer allowed to be sent.
     */
    public static IntSupplier queueOne(long owner, long dialog) {
        List<Runnable> queued = new ArrayList<>();
        OutsideTranslate.Message message = new OutsideTranslate.Message() {
            @Override public long owner() { return owner; }
            @Override public long dialog() { return dialog; }
            @Override public int id() { return 1; }
            @Override public boolean eligible() { return true; }
            @Override public String original() { return "Привет, мир"; }
            @Override public boolean translated() { return false; }
            @Override public String telegramTarget() { return null; }
            @Override public void apply(String text, String language) {}
            @Override public void refresh() {}
        };
        Executor kept = OutsideTranslate.executor;
        OutsideTranslate.executor = queued::add;
        try {
            OutsideTranslate.showMessage(message, message);
        } finally {
            OutsideTranslate.executor = kept;
        }
        // Otherwise a test that expects nothing sent passes on a message that never asked.
        if (queued.size() != 1) throw new AssertionError("expected one queued request, got " + queued.size());
        return () -> {
            AtomicInteger sent = new AtomicInteger();
            OutsideTranslate.Fetcher fetcher = OutsideTranslate.fetcher;
            OutsideTranslate.fetcher = (service, target, text) -> {
                sent.incrementAndGet();
                return new GoogleTranslate.Result("Hello, world", "ru");
            };
            try {
                for (Runnable task : queued) task.run();
            } finally {
                OutsideTranslate.fetcher = fetcher;
            }
            return sent.get();
        };
    }
}
