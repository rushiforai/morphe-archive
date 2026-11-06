/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.rootmute;

import android.content.Context;
import android.util.AtomicFile;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Collections;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.function.Consumer;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;
import app.hushtumblr.extension.tumblr.timeline.DashboardPosts;
import app.hushtumblr.extension.tumblr.timeline.HushRootPost;
import app.hushtumblr.extension.tumblr.timeline.TimelinePaging;

/** Local account-partitioned mutes. Unknown, loading and invalidated accounts always keep posts. */
public final class RootPostMutes {
    private RootPostMutes() {}
    private static final Object ACCOUNT_LOCK = new Object(), FILE_LOCK = new Object();
    private static final ThreadLocal<Session> pendingCommit = new ThreadLocal<>();
    private static final ThreadLocal<Long> requestWindow = new ThreadLocal<>();
    private static final WeakHashMap<Object, Long> requests = new WeakHashMap<>();
    private static final List<WeakReference<Runnable>> accountObservers = new ArrayList<>();
    private static long generation;
    private static long credentialEpoch;
    private static boolean credentialsKnown = true, credentialsChanging;
    private static volatile Session session;
    private static RootPostMuteStore store;
    private static long revision;
    /** The generation of the session whose private read failed or never ran. Sessions start at 1, so 0 names none. */
    private static volatile long unreadGeneration;
    static Consumer<Runnable> workerForTests;
    static File fileForTests;

    static final class Session {
        final long generation;
        final String account;
        final Set<String> roots;
        final boolean loaded;
        final Object nativeAccount;
        Session(long generation, String account, Set<String> roots, boolean loaded, Object nativeAccount) {
            this.generation = generation; this.account = account; this.roots = roots; this.loaded = loaded;
            this.nativeAccount = nativeAccount;
        }
    }

    /** A fresh authenticated native response. Never serialize or include it in diagnostics. */
    public static final class AccountSnapshot {
        public final String accountKey;
        public final long credentialEpoch, generation;
        public final Object nativeAccount;
        private AccountSnapshot(Session value, long epoch) {
            accountKey = value.account; generation = value.generation;
            credentialEpoch = epoch; nativeAccount = value.nativeAccount;
        }
    }

    public static long credentialEpoch() { synchronized (ACCOUNT_LOCK) { return credentialEpoch; } }
    /** Observers retain their own callback and arrange any UI delivery on the main thread. */
    public static void addAccountObserver(Runnable observer) {
        if (observer == null) return;
        synchronized (ACCOUNT_LOCK) {
            accountObservers.removeIf(reference -> reference.get() == null);
            for (WeakReference<Runnable> reference : accountObservers) if (reference.get() == observer) return;
            if (accountObservers.size() < 32) accountObservers.add(new WeakReference<>(observer));
        }
    }
    private static void accountChanged() {
        List<Runnable> observers = new ArrayList<>();
        synchronized (ACCOUNT_LOCK) {
            for (Iterator<WeakReference<Runnable>> entries = accountObservers.iterator(); entries.hasNext();) {
                Runnable observer = entries.next().get();
                if (observer == null) entries.remove(); else observers.add(observer);
            }
        }
        for (Runnable observer : observers) try { observer.run(); }
        catch (Throwable unavailable) { /* A detached consumer cannot interrupt native account persistence. */ }
    }
    public static AccountSnapshot accountSnapshot() {
        synchronized (ACCOUNT_LOCK) {
            return session == null || !credentialsKnown || credentialsChanging ? null : new AccountSnapshot(session, credentialEpoch);
        }
    }
    public static boolean isCurrent(AccountSnapshot value) {
        synchronized (ACCOUNT_LOCK) {
            return value != null && session != null && credentialsKnown && !credentialsChanging
                    && value.credentialEpoch == credentialEpoch && value.generation == generation
                    && value.accountKey.equals(session.account) && value.nativeAccount == session.nativeAccount;
        }
    }

    static final class Undo {
        final Session account;
        final Set<String> before;
        final long revision;
        final boolean confirmed;
        Undo(Session account, Set<String> before, long revision, boolean confirmed) {
            this.account = account; this.before = before; this.revision = revision; this.confirmed = confirmed;
        }
    }

    /** Always runs, including while paused, before the native account object starts persisting. */
    public static void beginAccountChange(Object account) {
        Long request = requestWindow.get();
        requestWindow.remove();
        long expected;
        boolean authenticated;
        synchronized (ACCOUNT_LOCK) {
            session = null; expected = ++generation; pendingCommit.remove();
            authenticated = request != null && request == credentialEpoch && credentialsKnown && !credentialsChanging;
        }
        accountChanged();
        if (!authenticated) return;
        String uuid;
        try { uuid = account instanceof HushAccountIdentity ? ((HushAccountIdentity) account).hushAccountId() : null; }
        catch (Throwable unreadable) { return; }
        if (uuid == null || uuid.isEmpty() || uuid.length() > 128 || !uuid.matches("[A-Za-z0-9:_-]+")) return;
        String key;
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(uuid.getBytes(StandardCharsets.UTF_8));
            StringBuilder hash = new StringBuilder(64);
            for (byte value : digest) hash.append(String.format(java.util.Locale.ROOT, "%02x", value & 255));
            key = hash.toString();
        } catch (Exception unavailable) { return; }
        pendingCommit.set(new Session(expected, key, Collections.emptySet(), false, account));
    }

    /** Native logout calls this before it clears credentials. A late old commit can't undo it. */
    public static void logout() {
        synchronized (ACCOUNT_LOCK) {
            session = null; generation++; credentialEpoch++; credentialsKnown = false;
            requests.clear(); pendingCommit.remove(); requestWindow.remove();
        }
        accountChanged();
    }

    /** A request created with old or transitional credentials can never commit a new identity. */
    public static void credentialsChanging() { logout(); synchronized (ACCOUNT_LOCK) { credentialsChanging = true; } }
    public static void credentialsChanged() {
        synchronized (ACCOUNT_LOCK) {
            credentialsChanging = false; credentialsKnown = true; credentialEpoch++;
            session = null; generation++; requests.clear(); pendingCommit.remove(); requestWindow.remove();
        }
        accountChanged();
    }
    public static void requestCreated(Object callback) {
        synchronized (ACCOUNT_LOCK) {
            if (!credentialsKnown || credentialsChanging) return;
            if (requests.size() >= 32) requests.clear();
            requests.put(callback, credentialEpoch);
        }
    }
    public static void requestEntered(Object callback) {
        requestWindow.remove();
        synchronized (ACCOUNT_LOCK) {
            Long epoch = requests.remove(callback);
            if (epoch != null && epoch == credentialEpoch && credentialsKnown && !credentialsChanging) requestWindow.set(epoch);
        }
    }
    public static void requestExited() { requestWindow.remove(); pendingCommit.remove(); }

    /** Only a successful native commit consumes the UUID captured before its receiver is reused. */
    public static void commitAccount() {
        Session loading = pendingCommit.get();
        pendingCommit.remove();
        if (loading == null) return;
        synchronized (ACCOUNT_LOCK) {
            if (generation != loading.generation) return;
            session = loading;
        }
        accountChanged();
        // A worker with no room never runs the read, and nothing else would start one this session.
        // The account counts as unread instead, which Manage muted posts says and offers to retry.
        if (!submit(() -> { synchronized (FILE_LOCK) { load(loading); } })) unread(loading);
    }

    /** Call with FILE_LOCK held. A failed read leaves the account unloaded and the document as it is. */
    private static boolean load(Session target) {
        if (!current(target)) return false;
        try {
            if (store == null) store = read();
            publish(target, store.roots(target.account));
            return true;
        } catch (Exception failed) {
            // No untrusted document value reaches diagnostics. Only the fact of the failure is kept.
            unread(target);
            return false;
        }
    }

    /**
     * Records that [target]'s private read failed or never ran. An account that has since been
     * replaced records nothing, so it can't hide what happened to the one that took its place.
     */
    private static void unread(Session target) {
        synchronized (ACCOUNT_LOCK) {
            if (!current(target)) return;
            session = new Session(target.generation, target.account, Collections.emptySet(), false, target.nativeAccount);
            unreadGeneration = target.generation;
        }
    }

    /**
     * Reads again for an account whose read failed. This never writes, resets or deletes the
     * document; AtomicFile still restores its own backup while opening it.
     */
    static void retry(Session target, Consumer<Boolean> done) {
        if (target == null || !current(target)) { finish(done, false); return; }
        if (!submit(() -> {
            boolean loaded;
            synchronized (FILE_LOCK) { loaded = load(target); }
            finish(done, loaded);
        })) finish(done, false);
    }

    static Session capture() { Session value = session; return value != null && value.loaded ? value : null; }
    /** The current account when its private read failed or the worker refused it, else null. An account still loading isn't one. */
    static Session unreadable() {
        Session value = session;
        return value != null && !value.loaded && value.generation == unreadGeneration ? value : null;
    }
    static boolean current(Session value) {
        Session now = session;
        return value != null && now != null && now.generation == value.generation && now.account.equals(value.account);
    }
    private static void publish(Session target, Set<String> roots) {
        synchronized (ACCOUNT_LOCK) {
            if (current(target)) session = new Session(target.generation, target.account,
                    Collections.unmodifiableSet(new LinkedHashSet<>(roots)), true, target.nativeAccount);
        }
    }

    static boolean enabled() {
        return Utils.settingsReady() && PatchFamily.MUTE_ROOT_POSTS.inBuild()
                && PatchFamily.Capability.ROOT_POST_MUTES.installed() && Settings.MUTE_ROOT_POSTS.get();
    }
    /** Missing roots fall back only for a proven original, never for an unknown-root reblog. */
    public static String canonicalRoot(String root, String parent, String current, List<?> trail, boolean trailPresent) {
        if (root != null && !root.isEmpty()) return RootPostMuteStore.validRoot(root) ? root : null;
        try {
            return trailPresent && trail != null && trail.isEmpty() && (parent == null || parent.isEmpty())
                    && RootPostMuteStore.validRoot(current) ? current : null;
        } catch (Throwable unreadable) { return null; }
    }
    /**
     * The blog rule for a post by [blog]: its reblogs when it says what it reblogs or carries a
     * trail, its originals only when the trail arrived empty and it names no root or parent.
     * Anything else is unknown, and an unknown post is never hidden by a blog rule.
     */
    public static String blogRule(String blog, String root, String parent, List<?> trail, boolean trailPresent) {
        try {
            if (blog == null) return null;
            String name = blog.toLowerCase(Locale.ROOT);
            boolean rebloggedFrom = parent != null && !parent.isEmpty(), rooted = root != null && !root.isEmpty();
            String rule = rebloggedFrom || trail != null && !trail.isEmpty() ? RootPostMuteStore.REBLOGS + name
                    : trailPresent && trail != null && !rooted ? RootPostMuteStore.ORIGINALS + name : null;
            return RootPostMuteStore.validBlogRule(rule) ? rule : null;
        } catch (Throwable unreadable) { return null; }
    }
    public static boolean active() { Session value = capture(); return enabled() && value != null && !value.roots.isEmpty(); }
    /** A muted root hides its post on every page. Blog rules are left to {@link #dashboardPage}. */
    public static boolean shouldHide(Object post) {
        if (!active() || !(post instanceof HushRootPost)) return false;
        Session value = capture();
        if (value == null) return false;
        try {
            String root = ((HushRootPost) post).hushRootId();
            return RootPostMuteStore.validRoot(root) && value.roots.contains(root) && current(value);
        } catch (Throwable unreadable) { return false; }
    }

    /**
     * Injected at the head of the method every timeline screen gets its pages through. Parsing
     * can't tell which screen asked for a page, so the rules that only touch the dashboard wait
     * until here: on a dashboard screen blog rules take out that half of the blog's posts, then
     * {@link DashboardPosts} takes out liked posts and your own reblogs. Every other screen, the
     * blog's own page included, gets [items] back as it came. Never throws.
     */
    public static List<?> dashboardPage(Object fragment, List<?> items) {
        if (items == null || items.isEmpty()) return items;
        List<?> kept = blogRules(fragment, items);
        return kept == null || kept.isEmpty() ? kept : DashboardPosts.page(fragment, kept);
    }

    /** [items] without the posts a blog rule takes off a dashboard screen. Never throws. */
    private static List<?> blogRules(Object fragment, List<?> items) {
        try {
            if (!active() || !onDashboard(fragment)) return items;
            Session value = capture();
            if (value == null || !RootPostMuteStore.anyBlogRule(value.roots)) return items;
            List<Object> kept = new ArrayList<>(items.size());
            for (Object item : items) if (!ruled(item, value.roots)) kept.add(item);
            if (kept.size() == items.size() || !current(value)) return items;
            for (int i = kept.size(); i < items.size(); i++) HookStatus.counted(FamilyNames.MUTE_ROOT_POSTS, "post removed");
            // Tumblr takes an empty page for the end of the feed, so the fragment is told to go on.
            if (kept.isEmpty()) TimelinePaging.emptied(FamilyNames.MUTE_ROOT_POSTS);
            return kept;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MUTE_ROOT_POSTS, "dashboard page", failure);
            return items;
        }
    }
    /** A dashboard screen, asked each time: Explore's tabs share the dashboard tab's class. */
    public static boolean onDashboard(Object fragment) {
        return fragment instanceof HushDashboardTimeline && ((HushDashboardTimeline) fragment).hushDashboard();
    }
    private static boolean ruled(Object item, Set<String> entries) {
        try {
            String rule = RootPostMenu.blogRule(item);
            return RootPostMuteStore.validBlogRule(rule) && entries.contains(rule);
        } catch (Throwable unreadable) { return false; }
    }

    static void mute(Session target, String root, Consumer<Undo> done) { change(target, root, false, done); }
    static void remove(Session target, String root, Consumer<Undo> done) { change(target, root, true, done); }
    static void clear(Session target, Consumer<Undo> done) { change(target, null, true, done); }
    private static void change(Session target, String root, boolean remove, Consumer<Undo> done) {
        if (target == null || !current(target) || !remove && !enabled() || root != null && !RootPostMuteStore.validEntry(root)) { finish(done, null); return; }
        if (!submit(() -> {
            Undo undo = null;
            synchronized (FILE_LOCK) {
                Set<String> before = null;
                if (current(target) && (store != null || load(target))) try {
                    before = store.roots(target.account);
                    LinkedHashSet<String> roots = new LinkedHashSet<>(before);
                    if (root == null) roots.clear();
                    else if (remove) roots.remove(root);
                    else if (roots.size() < RootPostMuteStore.MAX_ROOTS || roots.contains(root)) roots.add(root);
                    else { finish(done, null); return; }
                    RootPostMuteStore next = store.withRoots(target.account, roots);
                    write(next);
                    store = next;
                    undo = new Undo(target, before, ++revision, true);
                    publish(target, roots);
                } catch (Exception unavailable) {
                    // A failed verification may follow a committed change. Preserve what Undo
                    // needs without presenting that token as a successful write receipt.
                    if (before != null && (store == null || !before.equals(store.roots(target.account)))) {
                        undo = new Undo(target, before, ++revision, false);
                    }
                }
            }
            finish(done, undo);
        })) finish(done, null);
    }

    static void undo(Undo undo, Consumer<Boolean> done) {
        if (undo == null || !current(undo.account)) { finish(done, false); return; }
        if (!submit(() -> {
            boolean restored = false;
            synchronized (FILE_LOCK) {
                if (current(undo.account) && revision == undo.revision && (store != null || load(undo.account))) try {
                    RootPostMuteStore next = store.withRoots(undo.account.account, undo.before);
                    write(next); store = next; revision++;
                    publish(undo.account, undo.before); restored = true;
                } catch (Exception unavailable) { /* The caller shows a generic failure without private values. */ }
            }
            finish(done, restored);
        })) finish(done, false);
    }

    private static <T> void finish(Consumer<T> callback, T value) { Utils.runOnMainThreadNowOrLater(() -> callback.accept(value)); }
    private static boolean submit(Runnable task) {
        if (workerForTests != null) { workerForTests.accept(task); return true; }
        return Utils.runOnBackgroundThread(task);
    }
    private static AtomicFile file() throws Exception {
        Context context = Utils.getContext();
        if (fileForTests == null && context == null) throw new IllegalStateException("Private storage unavailable");
        return new AtomicFile(fileForTests != null ? fileForTests : new File(context.getNoBackupFilesDir(), "hushtumblr-root-mutes.json"));
    }
    private static RootPostMuteStore read() throws Exception {
        AtomicFile file = file();
        try (FileInputStream input = file.openRead(); ByteArrayOutputStream bytes = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[4096];
            int count;
            while ((count = input.read(buffer)) >= 0) {
                if (bytes.size() + count > RootPostMuteStore.MAX_BYTES) throw new IllegalStateException("Private storage unavailable");
                bytes.write(buffer, 0, count);
            }
            return RootPostMuteStore.decode(bytes.toString(StandardCharsets.UTF_8.name()));
        } catch (FileNotFoundException absent) {
            if (file.getBaseFile().exists() || new File(file.getBaseFile().getPath() + ".bak").exists()) throw absent;
            return new RootPostMuteStore();
        }
    }
    private static void write(RootPostMuteStore next) throws Exception {
        byte[] bytes = next.encode().getBytes(StandardCharsets.UTF_8);
        if (bytes.length > RootPostMuteStore.MAX_BYTES) throw new IllegalStateException("Private storage unavailable");
        AtomicFile file = file();
        FileOutputStream output = file.startWrite();
        boolean finished = false;
        try {
            output.write(bytes);
            output.flush();
            output.getFD().sync();
            file.finishWrite(output);
            finished = true;
            // finishWrite can log a failed rename and return normally. A read-back checks the
            // replacement; the explicit sync above is what acknowledges synchronization.
            try (FileInputStream input = file.openRead()) {
                byte[] buffer = new byte[4096];
                int offset = 0, count;
                while ((count = input.read(buffer)) != -1) {
                    if (count > bytes.length - offset) throw new IOException("Private storage unavailable");
                    for (int i = 0; i < count; i++) {
                        if (buffer[i] != bytes[offset + i]) throw new IOException("Private storage unavailable");
                    }
                    offset += count;
                }
                if (offset != bytes.length) throw new IOException("Private storage unavailable");
            }
        } catch (Exception failure) {
            try {
                // Once finishWrite returned, rollback could delete a successfully committed file
                // on older Android. Its result is uncertain until a fresh read reconciles it.
                if (!finished) file.failWrite(output);
            } finally {
                store = null;
                Session target = session;
                unread(target);
                // Reconcile on this worker before the UI can retry. A readable old or new file
                // is authoritative; an unreadable file leaves every mutation unavailable.
                if (target != null) load(target);
            }
            throw failure;
        }
    }

    static void resetForTests() {
        logout();
        synchronized (ACCOUNT_LOCK) { credentialsKnown = true; credentialsChanging = false; }
        synchronized (FILE_LOCK) { store = null; revision = 0; }
    }
}
