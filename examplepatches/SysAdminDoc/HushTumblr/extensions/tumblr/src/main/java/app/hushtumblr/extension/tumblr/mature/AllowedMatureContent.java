/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.mature;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;

import java.util.IdentityHashMap;
import java.util.function.Consumer;
import java.util.function.LongSupplier;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.rootmute.RootPostMutes;
import app.hushtumblr.extension.tumblr.rootmute.RootPostMutes.AccountSnapshot;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/** Changes presentation only after explicit adult eligibility for the current authenticated account. */
public final class AllowedMatureContent {
    private AllowedMatureContent() {}

    // An allowing answer is asked again in its last REFRESH_MS, so a card bound then never flips back to covered.
    static final long CACHE_MS = 5 * 60_000L, RETRY_MS = 60_000L, REQUEST_MS = 30_000L, REFRESH_MS = 60_000L;
    // Tumblr decides a card's cover when it builds the dashboard rows and keeps that decision, and the rows
    // usually arrive before a fresh answer. The last allowing answer for the same account (a hash and a time,
    // never content) covers that gap for REMEMBER_MS while a fresh check runs; a keeping or unreadable answer erases it.
    static final long REMEMBER_MS = 24 * 60 * 60_000L;
    // Diagnostic report counts: they say where a reveal stopped when a cover stays up.
    static final String SENT = "settings checks sent", FAILED = "settings checks that failed",
            TIMED_OUT = "settings checks timed out", ALLOWING = "answers allowing mature posts",
            KEEPING = "answers keeping covers", UNUSABLE = "answers that were not readable",
            LATE = "answers too late to use", LIFTED = "covers lifted", SAVED = "saved answers used";
    private static final String MEMORY_FILE = "hushtumblr_mature", MEMORY_KEY = "last_allowing_answer";
    private static final Object LOCK = new Object();
    // Identity matters: a missing JSON field must not equal an explicitly parsed false value.
    private static final IdentityHashMap<Object, Boolean> ageGates = new IdentityHashMap<>();
    private static final IdentityHashMap<Object, Boolean> permissions = new IdentityHashMap<>();
    private static HushMatureService service;
    private static Request pending;
    private static Evidence evidence;
    private static String memory;
    private static boolean memoryRead;
    static LongSupplier clockForTests, wallClockForTests;
    static Consumer<Runnable> workerForTests;

    private static final class Request {
        final AccountSnapshot account;
        final HushMatureService service;
        final long started;
        Request(AccountSnapshot account, HushMatureService service, long started) {
            this.account = account; this.service = service; this.started = started;
        }
    }
    private static final class Evidence {
        final AccountSnapshot account;
        final boolean allowed;
        final long expires;
        Evidence(AccountSnapshot account, boolean allowed, long expires) {
            this.account = account; this.allowed = allowed; this.expires = expires;
        }
    }

    /** Called on both successful JSON constructor paths, preserving the native default mask. */
    public static void ageGateParsed(Object value, int defaultMask) {
        synchronized (LOCK) {
            ageGates.remove(value);
            if ((defaultMask & 1) != 0 || !(value instanceof HushAgeVerification)) return;
            try {
                if (ageGates.size() >= 128) ageGates.clear();
                ageGates.put(value, ((HushAgeVerification) value).hushBlockApp());
            } catch (Throwable unreadable) { /* An unreadable gate stays unknown. */ }
        }
    }

    /** Missing can_edit defaults to true natively, so both permission keys need explicit presence. */
    public static void permissionParsed(Object value, int defaultMask) {
        synchronized (LOCK) {
            permissions.remove(value);
            if ((defaultMask & 0x30) != 0 || !(value instanceof HushMaturePermission)) return;
            if (permissions.size() >= 128) permissions.clear();
            permissions.put(value, true);
        }
    }

    /**
     * Captures the existing native service. With the option on and an adult account it asks right away,
     * because a card bound before the answer keeps its cover until it binds again. Otherwise no request.
     */
    public static void service(Object value) {
        if (!(value instanceof HushMatureService)) return;
        synchronized (LOCK) {
            if (service != value) { service = (HushMatureService) value; pending = null; evidence = null; }
        }
        try {
            if (!enabled()) return;
            AccountSnapshot account = RootPostMutes.accountSnapshot();
            if (!adult(account)) return;
            Request request = null;
            synchronized (LOCK) {
                if (pending == null && evidence == null && service != null) request = pending = new Request(account, service, now());
            }
            if (request != null) fetch(request);
        } catch (Throwable unreadable) { /* The first labeled bind asks instead. */ }
    }

    /**
     * Every unknown, restricted, stale or disabled state returns the original native cover result, except that
     * a saved allowing answer for this account opens covers while the fresh check it starts is still out.
     */
    public static boolean cover(boolean nativeCover) {
        if (!nativeCover) return false;
        try {
            if (!enabled()) { synchronized (LOCK) { pending = null; evidence = null; } return true; }
            HookStatus.invoked(FamilyNames.REVEAL_ALLOWED_MATURE_CONTENT);
            AccountSnapshot account = RootPostMutes.accountSnapshot();
            if (!adult(account)) return true;
            Request request = null;
            long now = now();
            boolean keep = true;
            synchronized (LOCK) {
                if (evidence != null && same(account, evidence.account) && now < evidence.expires) {
                    keep = !evidence.allowed || !RootPostMutes.isCurrent(account);
                    if (!keep) {
                        HookStatus.counted(FamilyNames.REVEAL_ALLOWED_MATURE_CONTENT, LIFTED);
                        if (pending == null && service != null && evidence.expires - now <= REFRESH_MS)
                            request = pending = new Request(account, service, now);
                    }
                    if (request == null) return keep;
                } else {
                    evidence = null;
                    if (pending != null && (!same(account, pending.account) || pending.service != service)) pending = null;
                    if (pending != null && now - pending.started >= REQUEST_MS) {
                        pending = null;
                        HookStatus.counted(FamilyNames.REVEAL_ALLOWED_MATURE_CONTENT, TIMED_OUT);
                        evidence = new Evidence(account, false, now + RETRY_MS);
                    } else if (pending == null && service != null && RootPostMutes.isCurrent(account)) {
                        request = pending = new Request(account, service, now);
                    }
                    if (evidence == null && remembered(account)) {
                        keep = false;
                        HookStatus.counted(FamilyNames.REVEAL_ALLOWED_MATURE_CONTENT, SAVED);
                    }
                }
            }
            if (request != null) fetch(request);
            return keep;
        } catch (Throwable unreadable) { /* Native eligibility and the native cover remain intact. */ }
        return true;
    }

    private static boolean enabled() {
        return Utils.settingsReady() && PatchFamily.REVEAL_ALLOWED_MATURE_CONTENT.inBuild()
                && PatchFamily.Capability.ACCOUNT_SAFE_MATURE_REVEAL.installed()
                && Settings.REVEAL_ALLOWED_MATURE_CONTENT.get();
    }
    private static boolean adult(AccountSnapshot account) {
        if (account == null || !(account.nativeAccount instanceof HushMatureAccount) || !RootPostMutes.isCurrent(account)) return false;
        HushMatureAccount value = (HushMatureAccount) account.nativeAccount;
        if (value.hushAge() < 18 || !value.hushCanModifySafeMode()) return false;
        Object age = value.hushAgeVerification();
        synchronized (LOCK) { return Boolean.FALSE.equals(ageGates.get(age)); }
    }
    private static boolean same(AccountSnapshot a, AccountSnapshot b) {
        return a != null && b != null && a.credentialEpoch == b.credentialEpoch && a.generation == b.generation
                && a.nativeAccount == b.nativeAccount && a.accountKey.equals(b.accountKey);
    }
    private static long now() { return clockForTests == null ? SystemClock.elapsedRealtime() : clockForTests.getAsLong(); }
    private static long wallNow() { return wallClockForTests == null ? System.currentTimeMillis() : wallClockForTests.getAsLong(); }

    private static SharedPreferences memoryStore() {
        Context context = Utils.getContext();
        return context == null ? null : context.getSharedPreferences(MEMORY_FILE, Context.MODE_PRIVATE);
    }
    /** Caller holds LOCK. Only an allowing answer for this same account, saved less than REMEMBER_MS ago. */
    private static boolean remembered(AccountSnapshot account) {
        if (!memoryRead) {
            try {
                SharedPreferences store = memoryStore();
                memory = store == null ? null : store.getString(MEMORY_KEY, null);
                memoryRead = store != null;
            } catch (Throwable unreadable) { memory = null; }
        }
        int at = memory == null ? -1 : memory.lastIndexOf('@');
        if (at <= 0 || !memory.substring(0, at).equals(account.accountKey)) return false;
        try {
            long age = wallNow() - Long.parseLong(memory.substring(at + 1));
            return age >= 0 && age < REMEMBER_MS;
        } catch (NumberFormatException unreadable) { return false; }
    }
    /** Caller holds LOCK. Null erases the saved answer. */
    private static void remember(String value) {
        if (value == null && memoryRead && memory == null) return;
        memory = value; memoryRead = true;
        try {
            SharedPreferences store = memoryStore();
            if (store == null) return;
            if (value == null) store.edit().remove(MEMORY_KEY).apply();
            else store.edit().putString(MEMORY_KEY, value).apply();
        } catch (Throwable unwritable) { /* The copy in this process still applies. */ }
    }

    private static void fetch(Request request) {
        Runnable work = () -> {
            synchronized (LOCK) {
                if (pending != request || service != request.service || !RootPostMutes.isCurrent(request.account)) return;
            }
            if (!enabled()) { received(request, null); return; }
            HookStatus.counted(FamilyNames.REVEAL_ALLOWED_MATURE_CONTENT, SENT);
            try { request.service.hushFetchMaturePermission(request); }
            catch (Throwable unavailable) {
                HookStatus.threw(FamilyNames.REVEAL_ALLOWED_MATURE_CONTENT, "settings check", unavailable);
                received(request, null);
            }
        };
        try {
            if (workerForTests != null) workerForTests.accept(work);
            else if (!Utils.runOnBackgroundThread(work)) received(request, null);
        } catch (Throwable unavailable) { received(request, null); }
    }

    /** Handles immediate and suspended native results. Old-account completions never publish. */
    public static void received(Object token, Object response) {
        if (!(token instanceof Request)) return;
        Request request = (Request) token;
        boolean valid = false, allowed = false;
        try {
            if (enabled() && adult(request.account) && response instanceof HushMatureResponse) {
                HushMatureResponse result = (HushMatureResponse) response;
                Object body = result.hushResponse();
                if (result.hushStatus() == 200 && body instanceof HushMaturePermission) {
                    synchronized (LOCK) { valid = Boolean.TRUE.equals(permissions.get(body)); }
                    HushMaturePermission permission = (HushMaturePermission) body;
                    allowed = valid && Boolean.TRUE.equals(permission.hushCanEditMatureContent())
                            && Boolean.TRUE.equals(permission.hushShowMatureContent());
                }
            }
        } catch (Throwable unreadable) { valid = false; allowed = false; }
        String outcome = response == null ? FAILED : allowed ? ALLOWING : valid ? KEEPING : UNUSABLE;
        synchronized (LOCK) {
            if (pending != request) { HookStatus.counted(FamilyNames.REVEAL_ALLOWED_MATURE_CONTENT, LATE); return; }
            pending = null;
            if (service != request.service || !RootPostMutes.isCurrent(request.account) || !enabled()) {
                HookStatus.counted(FamilyNames.REVEAL_ALLOWED_MATURE_CONTENT, LATE);
                evidence = null;
                return;
            }
            HookStatus.counted(FamilyNames.REVEAL_ALLOWED_MATURE_CONTENT, outcome);
            evidence = new Evidence(request.account, allowed, now() + (valid ? CACHE_MS : RETRY_MS));
            // A failed check says nothing about the setting, so it leaves the saved answer alone.
            if (allowed) remember(request.account.accountKey + "@" + wallNow());
            else if (response != null) remember(null);
        }
    }

    static void resetForTests() {
        synchronized (LOCK) {
            ageGates.clear(); permissions.clear(); service = null; pending = null; evidence = null;
            remember(null); memory = null; memoryRead = false;
        }
        clockForTests = null; wallClockForTests = null; workerForTests = null;
    }

    /** A process restart: the saved answer and parsed account stay, everything else in memory goes. */
    static void restartForTests() {
        synchronized (LOCK) { service = null; pending = null; evidence = null; memory = null; memoryRead = false; }
    }
}
