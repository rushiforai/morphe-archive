/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.content.Intent;
import android.util.Pair;
import android.view.KeyEvent;

import com.google.common.util.concurrent.ListenableFuture;
import com.google.protobuf.MessageLite;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.function.BooleanSupplier;

import app.morphe.extension.music.shared.VideoInformation;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Per-request replay, with native queue navigation and cancellation ownership retained by Music. */
@SuppressWarnings("unused")
public final class PlayerFallback {
    public interface Request {
        String rvxVideoId();
        Object rvxPlayerResponse(byte[] bytes);
        void rvxCancelPlayer(Object callback);
    }

    public interface Navigation {
        Enum<?> rvxKind();
        Object rvxRecovery();
        void rvxRecovery(Object token);
    }

    public interface Navigator {
        List<?> rvxItems();
        String rvxVideoId(Object item);
        long rvxItemId(Object item);
        int rvxCurrent();
        Object rvxPlayback();
        void rvxCancelAndStop();
        boolean rvxOwnsRequest(Object request);
        void rvxCancelLoad();
        Object rvxJump(int index, boolean restart);
        void rvxDispatch(Object command);
    }

    public interface PlaySource {
        Object rvxPlayNavigator();
    }

    public interface Packed {
        Object rvxRecover(Object request);
    }

    public interface QueueRow {
        Object rvxQueueRenderer();
    }

    private record Selection(Navigator owner, long itemId, String videoId, boolean advancing, int remaining,
                             ExhaustedPlayback.Occurrence previous, long navigationGeneration) { }

    private record Recovery(Navigator owner, int index, long itemId, String videoId, Selection previous, int remaining,
                            boolean resume, long generation) { }

    private static volatile Selection selection;
    private static volatile Navigator navigator;
    private static volatile List<?> initialQueue = List.of();
    private static final ExhaustedPlayback EXHAUSTED = new ExhaustedPlayback();
    private static volatile long navigationGeneration;

    private PlayerFallback() { }

    /** Selector-scoped predicate: the descriptor's original getter/hash/equality never change. */
    public static boolean routeOffline(Object request) {
        return request instanceof Request && OfflineReplay.enabled() && !Utils.isInternetReachable();
    }

    /** Native preparation can start a separate Onesie load before the ordinary response callback arrives. */
    public static boolean skipOnesiePreparation(Object request) {
        return routeOffline(request) && OfflineReplay.holds(((Request) request).rvxVideoId());
    }

    public static void captureNavigator(Object owner) {
        if (owner instanceof Navigator nativeOwner && nativeOwner != navigator) {
            navigator = nativeOwner;
            selection = null;
            EXHAUSTED.clear();
            navigationGeneration++;
        }
    }

    static void reconnected() {
        EXHAUSTED.reconnected();
    }

    /** Invalidate before the coroutine/index boundary, including a replacement command queued before Play. */
    public static void navigationStarted(Object owner, Object command) {
        if (owner == navigator && command instanceof Navigation navigation && navigation.rvxRecovery() == null) {
            navigationGeneration++;
            EXHAUSTED.clear();
        }
    }

    /** Raw explicit PLAY only: preserve stock toggle/headset multi-tap, Pause, key-up and repeated-key handling. */
    public static boolean recoverMediaPlay(Object source, Intent intent) {
        if (!EXHAUSTED.armed() || intent == null || !Intent.ACTION_MEDIA_BUTTON.equals(intent.getAction())) return false;
        KeyEvent event = intent.getParcelableExtra(Intent.EXTRA_KEY_EVENT);
        return event != null && PlayerFallbackLogic.isExplicitPlayKey(event.getAction(), event.getRepeatCount(),
                event.getKeyCode()) && recoverPlay(source);
    }

    /** Native UI, session and raw-key entrypoints share the same one-shot, occurrence-scoped decision. */
    public static boolean recoverPlay(Object source) {
        if (!EXHAUSTED.armed()) return false;
        if (!OfflineReplay.enabled() || Utils.isInternetReachable()) {
            EXHAUSTED.clear();
            return false;
        }
        Navigator owner = navigator;
        if (owner == null || (source instanceof PlaySource playSource
                ? playSource.rvxPlayNavigator() != owner : owner.rvxPlayback() != source)) return false;

        List<?> items = owner.rvxItems();
        int current = owner.rvxCurrent();
        long itemId = current >= 0 && current < items.size() ? owner.rvxItemId(items.get(current)) : Long.MIN_VALUE;
        ExhaustedPlayback.Resume resume = EXHAUSTED.take(owner, selection, itemId, true, false);
        if (resume == null) return false;
        int target = findOccurrence(owner, items, resume.previous());
        if (target < 0 || !OfflineReplay.holds(resume.previous().videoId())) return false;

        try {
            Object command = owner.rvxJump(target, true);
            ((Navigation) command).rvxRecovery(new Recovery(owner, target, resume.previous().itemId(),
                    resume.previous().videoId(), selection, 1, true, resume.generation()));
            Logger.printDebug(() -> "PlayerFallback: exhausted Play -> " + target + "#"
                    + resume.previous().itemId() + " v=" + resume.previous().videoId() + " start=0");
            owner.rvxDispatch(command);
            return true;
        } catch (Exception failure) {
            Logger.printException(() -> "PlayerFallback: exhausted Play dispatch failed", failure);
            return false;
        }
    }

    private static int findOccurrence(Navigator owner, List<?> items, ExhaustedPlayback.Occurrence target) {
        int found = -1;
        for (int index = 0; index < items.size(); index++) {
            Object item = items.get(index);
            if (owner.rvxItemId(item) != target.itemId()) continue;
            if (found >= 0 || !target.videoId().equals(owner.rvxVideoId(item))) return -1;
            found = index;
        }
        return found;
    }

    private static ExhaustedPlayback.Occurrence previousPlayable(Navigator owner, List<?> items) {
        if (!OfflineReplay.enabled()) return null;
        String playing = VideoInformation.getVideoId();
        int current = owner.rvxCurrent();
        if (current >= 0 && current < items.size()) {
            Object item = items.get(current);
            String videoId = owner.rvxVideoId(item);
            if (playing.equals(videoId) && OfflineReplay.holds(videoId)) {
                return new ExhaustedPlayback.Occurrence(owner.rvxItemId(item), videoId);
            }
        }
        Selection prior = selection;
        if (prior != null && prior.owner() == owner && prior.previous() != null
                && playing.equals(prior.previous().videoId()) && OfflineReplay.holds(playing)
                && findOccurrence(owner, items, prior.previous()) >= 0) return prior.previous();
        return null;
    }

    private static void logStop(Navigator owner, List<?> items, int failed, int remaining,
                                boolean advancing, String reason) {
        Logger.printDebug(() -> {
            List<ExhaustedPlayback.Occurrence> queue = new ArrayList<>(items.size());
            for (Object item : items) {
                queue.add(new ExhaustedPlayback.Occurrence(owner.rvxItemId(item), owner.rvxVideoId(item)));
            }
            return PlayerFallbackLogic.describeStop(queue, owner.rvxCurrent(), failed, remaining,
                    advancing, reason, OfflineReplay::holds);
        });
    }

    static Object ownership(Object request) {
        Navigator active = navigator;
        if (active == null || !active.rvxOwnsRequest(request)) return null;
        Selection selected = selection;
        return selected == null ? active : selected;
    }

    static boolean owns(Object request, Object ownership) {
        Navigator active = navigator;
        return ownership != null && active != null
                && (ownership == selection || selection == null && ownership == active)
                && active.rvxOwnsRequest(request);
    }

    public static boolean replayFailure(Object request, Throwable failure) {
        return PlaybackConnectionLoss.find(failure) != null || routeOffline(request);
    }

    static boolean currentFailure(Object request, ReplayFuture result, Throwable failure) {
        PlaybackConnectionLoss loss = PlaybackConnectionLoss.find(failure);
        if (loss == null || PlaybackRequestIdentity.same(loss.request, request) && owns(request, loss.ownership)) {
            return true;
        }
        result.cancel(false);
        return false;
    }

    static void completeRecovery(Object request, ReplayFuture result, Object response, Throwable failure) {
        if (PlaybackConnectionLoss.find(failure) != null) {
            Utils.runOnMainThreadNowOrLater(() -> {
                if (result.isCancelled() || !currentFailure(request, result, failure)) return;
                if (response == null) finishUnavailable(request, result);
                else if (result.set(response)) {
                    Logger.printDebug(() -> "PlayerFallback: connectivity loss answered v="
                            + ((Request) request).rvxVideoId());
                }
            });
        } else if (response != null) result.set(response);
        else finishUnavailable(request, result);
    }

    /** Runs inline at the stock index boundary; reads in-memory copy indexes, never files or the network. */
    public static int chooseIndex(Object owner, Object command, int target) {
        if (!(owner instanceof Navigator nativeOwner) || !(command instanceof Navigation navigation)) return target;
        captureNavigator(nativeOwner);
        Recovery recovery = navigation.rvxRecovery() instanceof Recovery token ? token : null;
        if (recovery != null) {
            navigation.rvxRecovery(null);
            if (recovery.owner() != nativeOwner || recovery.previous() != selection) return -1;
            if (recovery.previous() != null
                    && recovery.previous().navigationGeneration() != navigationGeneration) return -1;
            if (recovery.resume() && (recovery.generation() != EXHAUSTED.generation()
                    || !OfflineReplay.enabled() || Utils.isInternetReachable())) return -1;
            target = recovery.index();
        }
        EXHAUSTED.clear();
        List<?> items = nativeOwner.rvxItems();
        if (recovery != null && (target < 0 || target >= items.size()
                || nativeOwner.rvxItemId(items.get(target)) != recovery.itemId())) {
            target = -1;
            for (int index = 0; index < items.size(); index++) {
                if (nativeOwner.rvxItemId(items.get(index)) == recovery.itemId()) {
                    target = index;
                    break;
                }
            }
            if (target < 0) {
                logStop(nativeOwner, items, -1, recovery.remaining(), false, "removed-recovery-occurrence");
                stop(nativeOwner, null);
            }
        }
        if (target < 0 || target >= items.size()) return target;
        if (recovery != null && recovery.resume()
                && !recovery.videoId().equals(nativeOwner.rvxVideoId(items.get(target)))) return -1;
        String kind = navigation.rvxKind().name();
        boolean advance = recovery != null ? !recovery.resume()
                : "NEXT".equals(kind) || "AUTOPLAY".equals(kind) || "AUTONAV".equals(kind);
        int originalTarget = target;
        int remaining = recovery == null ? items.size() - target : recovery.remaining();

        String videoId = nativeOwner.rvxVideoId(items.get(target));
        if (OfflineReplay.enabled() && !Utils.isInternetReachable()) {
            List<String> ids = new ArrayList<>(items.size());
            for (Object item : items) ids.add(nativeOwner.rvxVideoId(item));
            PlayerFallbackLogic.Decision decision = PlayerFallbackLogic.decide(true, false, videoId, !advance,
                    ids, target, OfflineReplay::holds);
            if (decision.route() == PlayerFallbackLogic.Route.UNAVAILABLE) {
                if (advance) {
                    logStop(nativeOwner, items, target, remaining, true, "preflight-exhausted");
                    stop(nativeOwner, null);
                } else unavailable();
                return -1;
            }
            if (decision.route() == PlayerFallbackLogic.Route.SKIP) {
                int skipped = target;
                target = decision.nextIndex();
                Logger.printDebug(() -> "PlayerFallback: native skip index=" + skipped + " -> "
                        + decision.nextIndex() + " size=" + ids.size() + " kind=" + kind);
                videoId = ids.get(target);
            }
        }
        if (remaining <= target - originalTarget) {
            logStop(nativeOwner, items, originalTarget, remaining, advance, "recovery-budget-exhausted");
            stop(nativeOwner, null);
            return -1;
        }
        ExhaustedPlayback.Occurrence previous = recovery == null ? previousPlayable(nativeOwner, items)
                : recovery.previous() == null ? null : recovery.previous().previous();
        selection = new Selection(nativeOwner, nativeOwner.rvxItemId(items.get(target)), videoId,
                advance, remaining - (target - originalTarget), previous, navigationGeneration);
        return target;
    }

    /** Initial response capture only; established queues are read from the current native projection each time. */
    static void captureQueue(List<?> items) {
        if (OfflineReplay.enabled() && items != null && !items.isEmpty()) initialQueue = List.copyOf(items);
    }

    static byte[] nextBytes(String playlistId, String videoId, Object command) throws IOException {
        if (!(command instanceof NativeDownloads.Command message)) return null;
        Navigator owner = navigator;
        List<?> items = owner == null ? initialQueue : List.copyOf(owner.rvxItems());
        if (items.isEmpty()) return null;

        List<byte[]> renderers = new ArrayList<>(items.size());
        int index = -1;
        int nativeIndex = owner == null ? -1 : owner.rvxCurrent();
        for (int position = 0; position < items.size(); position++) {
            if (!(items.get(position) instanceof QueueRow item)
                    || !(item.rvxQueueRenderer() instanceof MessageLite proto)) return null;
            byte[] bytes = proto.toByteArray();
            String id = owner == null ? TapCommand.parse(bytes).videoId : owner.rvxVideoId(items.get(position));
            if (videoId.equals(id) && (index < 0 || position == nativeIndex)) index = position;
            renderers.add(bytes);
        }
        return index < 0 ? null : OfflineWatchNext.buildCaptured(playlistId, renderers, index, message.toByteArray());
    }

    /** Direct scalar/callback producers also short-circuit before starting network work. */
    public static ListenableFuture<?> localPlayer(Object request) {
        if (!(request instanceof Request replay) || !routeOffline(request)) return null;

        ReplayFuture result = new ReplayFuture();
        Utils.runOnBackgroundThread(() -> {
            if (result.isCancelled()) return;
            Object response = localResponse(replay);
            if (response != null) result.set(response);
            else stopUnavailable(request, replay.rvxVideoId(), () -> result.cancel(false),
                    () -> !result.isCancelled(), -1);
        });
        return result;
    }

    public static ListenableFuture<?> wrapPlayer(Object request, ListenableFuture<?> stock) {
        if (!(request instanceof Request replay) || !OfflineReplay.enabled()) return stock;

        PlayerFallbackFuture future = PlayerFallbackFuture.recoverAsync(stock, Utils::runOnBackgroundThread,
                (result, failure) -> {
            if (!currentFailure(request, result, failure)) return;
            if (!replayFailure(request, failure)) {
                result.setException(failure);
                return;
            }
            Object response = localResponse(replay, PlaybackConnectionLoss.find(failure) != null);
            if (response != null && PlaybackConnectionLoss.find(failure) == null) {
                Logger.printDebug(() -> "PlayerFallback: transport failure answered v=" + replay.rvxVideoId());
            }
            completeRecovery(request, result, response, failure);
        });
        PlaybackConnectivity.watch(request, future, false);
        return future;
    }

    public static Pair<?, ?> localPair(Object request) {
        return routeOffline(request) ? Pair.create(localPlayer(request), OfflineReplay.localNext(request)) : null;
    }

    public static Pair<?, ?> wrapPair(Object request, Pair<?, ?> stock) {
        if (!OfflineReplay.enabled()) return stock;
        return Pair.create(wrapPlayer(request, (ListenableFuture<?>) stock.first),
                OfflineReplay.wrapNext(request, (ListenableFuture<?>) stock.second));
    }

    public static Object wrapPacked(Object request, Object stock) {
        return OfflineReplay.enabled() && stock instanceof Packed packed ? packed.rvxRecover(request) : stock;
    }

    /** A reactive failure's replacement starts asynchronously; unavailable cancellation follows native STOP. */
    public static ListenableFuture<?> recoverFuture(Object request, boolean next, Throwable failure) {
        ReplayFuture result = new ReplayFuture();
        Utils.runOnBackgroundThread(() -> {
            if (result.isCancelled()) return;
            if (!currentFailure(request, result, failure)) return;
            if (!replayFailure(request, failure)) {
                result.setException(failure);
                return;
            }
            Request replay = (Request) request;
            Object response = next ? OfflineReplay.nextResponse(request)
                    : localResponse(replay, PlaybackConnectionLoss.find(failure) != null);
            completeRecovery(request, result, response, failure);
        });
        return result;
    }

    private static Object localResponse(Request request) {
        return localResponse(request, false);
    }

    private static Object localResponse(Request request, boolean connectivityLoss) {
        try {
            byte[] bytes = OfflineReplay.storedForPlayer(request.rvxVideoId(), connectivityLoss);
            return bytes == null ? null : request.rvxPlayerResponse(bytes);
        } catch (Exception unavailable) {
            Logger.printException(() -> "PlayerFallback: saved response could not be constructed", unavailable);
            return null;
        }
    }

    public static boolean rejectPlayer(Object request, Object callback) {
        if (!(request instanceof Request replay) || !routeOffline(request)) return false;
        stopUnavailable(request, replay.rvxVideoId(), () -> replay.rvxCancelPlayer(callback), () -> true, -1);
        return true;
    }

    static void finishUnavailable(Object request, ReplayFuture result) {
        String videoId = request instanceof Request replay ? replay.rvxVideoId() : "";
        stopUnavailable(request, videoId, () -> result.cancel(false), () -> !result.isCancelled(), -1);
    }

    static void finishUncached(Object request, Object ownership, Runnable completed) {
        if (!owns(request, ownership)) {
            completed.run();
            return;
        }
        Logger.printDebug(() -> "PlayerFallback: connectivity loss uncached v=" + ((Request) request).rvxVideoId());
        stopUnavailable(request, ((Request) request).rvxVideoId(), completed, () -> true, EXHAUSTED.generation());
    }

    private static void stopUnavailable(Object request, String videoId, Runnable completed,
                                        BooleanSupplier currentRequest, long lossGeneration) {
        Selection expected = selection;
        Navigator active = navigator;
        Utils.runOnMainThreadNowOrLater(() -> {
            if (!currentRequest.getAsBoolean()) return;
            if (active == null || active != navigator || !active.rvxOwnsRequest(request)) {
                if (completed != null) completed.run();
                return;
            }
            // A new native selection owns its own runner: a late failure must never cancel it.
            if (expected != selection) {
                if (completed != null) completed.run();
                return;
            }
            List<?> items = active.rvxItems();
            int failedIndex = -1;
            int remaining = expected == null ? 0 : expected.remaining();
            boolean advancing = expected != null && expected.advancing();
            boolean dispatchFailed = false;
            if (expected != null && expected.owner() == active && videoId.equals(expected.videoId())) {
                List<String> ids = new ArrayList<>(items.size());
                for (int index = 0; index < items.size(); index++) {
                    Object item = items.get(index);
                    ids.add(active.rvxVideoId(item));
                    if (active.rvxItemId(item) == expected.itemId()) failedIndex = index;
                }
                int next = expected.advancing() && failedIndex >= 0
                        ? PlayerFallbackLogic.nextCached(ids, failedIndex, expected.remaining(), OfflineReplay::holds)
                        : -1;
                if (next >= 0) {
                    try {
                        Object command = active.rvxJump(next, false);
                        ((Navigation) command).rvxRecovery(new Recovery(active, next,
                                active.rvxItemId(items.get(next)), ids.get(next), expected,
                                expected.remaining() - (next - failedIndex), false, 0));
                        active.rvxCancelLoad();
                        if (completed != null) completed.run();
                        if (expected == selection) {
                            Logger.printDebug(() -> "PlayerFallback: native skip after transport -> " + next);
                            active.rvxDispatch(command);
                        }
                        return;
                    } catch (Exception failure) {
                        dispatchFailed = true;
                        Logger.printException(() -> "PlayerFallback: native recovery navigation failed", failure);
                    }
                }
            }
            String reason = dispatchFailed ? "recovery-dispatch-failed" : expected == null ? "missing-selection"
                    : !videoId.equals(expected.videoId()) ? "request-selection-mismatch"
                    : failedIndex < 0 ? "missing-failed-occurrence"
                    : !advancing ? "explicit-unavailable" : "in-flight-exhausted";
            logStop(active, items, failedIndex, remaining, advancing, reason);
            int current = active.rvxCurrent();
            ExhaustedPlayback.Occurrence failed = current >= 0 && current < items.size()
                    && videoId.equals(active.rvxVideoId(items.get(current)))
                    ? new ExhaustedPlayback.Occurrence(active.rvxItemId(items.get(current)), videoId) : null;
            ExhaustedPlayback.Occurrence previous = previousAtStop(active, items, expected, videoId);
            stop(active, completed);
            if (lossGeneration >= 0 && active == navigator && expected == selection && expected != null
                    && expected.navigationGeneration() == navigationGeneration) {
                EXHAUSTED.arm(active, expected, failed, previous, lossGeneration);
            }
        });
    }

    private static ExhaustedPlayback.Occurrence previousAtStop(Navigator owner, List<?> items, Selection expected,
                                                              String failedVideoId) {
        if (expected == null || expected.owner() != owner) return null;
        if (!failedVideoId.equals(expected.videoId()) && expected.videoId().equals(VideoInformation.getVideoId())
                && OfflineReplay.holds(expected.videoId())) {
            ExhaustedPlayback.Occurrence previous = new ExhaustedPlayback.Occurrence(expected.itemId(),
                    expected.videoId());
            if (findOccurrence(owner, items, previous) >= 0) return previous;
        }
        return expected.previous();
    }

    private static void stop(Navigator owner, Runnable completed) {
        Utils.runOnMainThreadNowOrLater(() -> {
            owner.rvxCancelAndStop();
            unavailable();
            if (completed != null) completed.run();
        });
    }

    static void unavailable() {
        Utils.showToastShort(str("morphe_music_player_unavailable_offline"));
        Logger.printDebug(() -> "PlayerFallback: unavailable offline; native queue retained");
    }
}
