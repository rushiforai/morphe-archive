package nl.johninnl.deezer.auth;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Build;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.concurrent.atomic.AtomicInteger;

/** No exported component, account enumeration, token inspection, or result/exception logging. */
@SuppressWarnings("deprecation")
public final class GoogleConsent {
    private static final String MICROG = "app.revanced.android.gms";
    private static final String TAG = "morphe.deezer.google.consent";
    private static final AtomicInteger NEXT_REQUEST = new AtomicInteger(0x4000);
    private GoogleConsent() {}

    /** Implemented by a generated adapter calling the inspected native Deezer methods. */
    public interface Callbacks {
        boolean isCurrent(Request request);
        boolean install(Request request);
        void clear(Request request);
        void verifyDestination(Context context) throws Exception;
        Object parseResult(Intent data) throws Exception;
        boolean isComplete(Object credential, Object result);
        void success(Object credential, Object result) throws Exception;
        void retire();
        void cancel();
        void failure(int statusCode);
        int statusCode(Exception error);
    }

    private static boolean onMain() { return Looper.myLooper() == Looper.getMainLooper(); }

    private static Activity activity(Context context) {
        // Bound the unwrap and refuse cycles. Never retain the Activity in a ViewModel.
        for (int depth = 0; depth < 16 && context != null; depth++) {
            if (context instanceof Activity) return (Activity) context;
            if (!(context instanceof ContextWrapper)) return null;
            Context next = ((ContextWrapper) context).getBaseContext();
            if (next == context) return null;
            context = next;
        }
        return null;
    }

    private static boolean foreground(Activity activity) {
        return activity != null && !activity.isFinishing() && !activity.isDestroyed() && activity.hasWindowFocus();
    }

    public static Request prepare(Context context, ConsentGeneration generation, Callbacks callbacks) {
        if (!onMain()) {
            new Handler(Looper.getMainLooper()).post(() -> failPreparation(callbacks));
            return null;
        }
        final Request[] prepared = new Request[1];
        return ConsentPreparation.run(() -> {
            Activity host = activity(context);
            if (!foreground(host)) return null;
            FragmentManager manager = host.getFragmentManager();
            if (manager.isStateSaved()) return null;
            Fragment old = manager.findFragmentByTag(TAG);
            if (old instanceof ResultFragment) {
                Request active = ((ResultFragment) old).request;
                if (active != null && active.isActive()) return null;
                manager.beginTransaction().remove(old).commitNow();
            } else if (old != null) {
                return null;
            }
            callbacks.verifyDestination(host);
            ResultFragment fragment = new ResultFragment();
            fragment.setRetainInstance(true);
            Request request = new Request(fragment, generation, callbacks);
            prepared[0] = request;
            fragment.request = request;
            // commitNow can synchronously call onResume; publish ownership before it does.
            if (!callbacks.install(request)) return null;
            manager.beginTransaction().add(fragment, TAG).commitNow();
            return request;
        }, preparationFailure(callbacks, prepared));
    }

    private static ConsentPreparation.Failure preparationFailure(Callbacks callbacks, Request[] prepared) {
        return new ConsentPreparation.Failure() {
            @Override public void cancel() { callbacks.cancel(); }
            @Override public void cleanup() {
                if (prepared != null && prepared[0] != null) prepared[0].cleanupPreparation();
            }
            @Override public void retire() { callbacks.retire(); }
        };
    }

    private static void failPreparation(Callbacks callbacks) {
        // Scoped adapter cancellation runs while its generation is still current.
        ConsentPreparation.fail(preparationFailure(callbacks, null));
    }

    public static final class Request {
        private final ConsentAttempt attempt = new ConsentAttempt();
        private final ConsentGeneration generation;
        private final DeferredConsentDelivery delivery;
        private final WeakReference<ResultFragment> fragment;
        private Callbacks callbacks;
        private PendingIntent pending;
        private long offerDeadline;

        private Request(ResultFragment fragment, ConsentGeneration generation, Callbacks callbacks) {
            this.fragment = new WeakReference<>(fragment);
            this.generation = generation;
            this.delivery = new DeferredConsentDelivery(generation);
            this.callbacks = callbacks;
        }

        public boolean isActive() { return generation.isActive() && attempt.isActive(); }
        public boolean matches(Object originalCredential) {
            return isActive() && generation.matchesCredential(originalCredential) && current();
        }
        public boolean matchesGeneration(ConsentGeneration source) { return source == generation && current(); }
        private boolean current() { return generation.isActive() && callbacks != null && callbacks.isCurrent(this); }
        private Activity host() {
            ResultFragment retained = fragment.get();
            return retained == null ? null : retained.getActivity();
        }

        public void launch(PendingIntent resolution) {
            if (!onMain()) { new Handler(Looper.getMainLooper()).post(() -> launch(resolution)); return; }
            if (!current()) { discard(); return; }
            if (!attempt.isPrepared() || generation.credential() == null) return;
            delivery.offer(generation, DeferredConsentDelivery.Kind.RESOLUTION, resolution, 0, 0);
            drain();
        }

        public void completeNative(Object result) {
            if (!onMain()) { new Handler(Looper.getMainLooper()).post(() -> completeNative(result)); return; }
            if (!current()) { discard(); return; }
            if (!attempt.isPrepared() || generation.credential() == null) return;
            delivery.offer(generation, DeferredConsentDelivery.Kind.NATIVE_RESULT, result, 0, 0);
            drain();
        }

        private void result(int code, int resultCode, Intent data) {
            if (!attempt.matchesResult(code)) return;
            if (!current()) { discard(); return; }
            delivery.offer(generation, DeferredConsentDelivery.Kind.ACTIVITY_RESULT, data, code, resultCode);
            drain();
        }

        /** Retain matched data only in memory until the retained fragment reattaches/resumes. */
        private void drain() {
            if (!onMain()) { new Handler(Looper.getMainLooper()).post(this::drain); return; }
            if (!current()) { discard(); return; }
            ResultFragment retained = fragment.get();
            Activity host = host();
            boolean ready = retained != null && retained.isAdded() && retained.isResumed() &&
                    host != null && !host.isFinishing() && !host.isDestroyed();
            DeferredConsentDelivery.Event event = delivery.take(ready);
            if (event == null) return;
            try {
                callbacks.verifyDestination(host);
                if (event.kind == DeferredConsentDelivery.Kind.RESOLUTION) {
                    if (!attempt.isPrepared()) return;
                    PendingIntent resolution = (PendingIntent) event.payload;
                    int expectedUid = host.getPackageManager().getApplicationInfo(MICROG, 0).uid;
                    if (resolution == null || !MICROG.equals(resolution.getCreatorPackage()) ||
                            resolution.getCreatorUid() != expectedUid ||
                            (Build.VERSION.SDK_INT >= 31 && !resolution.isActivity())) { failStatus(8); return; }
                    if (!attempt.offerResolution()) return;
                    pending = resolution;
                    offerDeadline = SystemClock.elapsedRealtime() + 300_000L;
                    retained.offerWhenForeground(); // Offer only; the sender still needs a button click.
                } else if (event.kind == DeferredConsentDelivery.Kind.NATIVE_RESULT) {
                    if (!attempt.isPrepared()) return;
                    if (!callbacks.isComplete(generation.credential(), event.payload)) { failStatus(8); return; }
                    complete(event.payload);
                } else {
                    if (!attempt.matchesResult(event.requestCode)) return;
                    if (event.resultCode != Activity.RESULT_OK) { cancel(); return; }
                    if (event.payload == null) { failStatus(8); return; }
                    Object result = callbacks.parseResult((Intent) event.payload);
                    if (result == null || !callbacks.isComplete(generation.credential(), result)) { failStatus(8); return; }
                    complete(result);
                }
            } catch (Exception failure) {
                Callbacks target = callbacks;
                failStatus(target == null ? 8 : target.statusCode(failure));
            }
        }

        private void confirm(AlertDialog dialog) {
            ResultFragment retained = fragment.get();
            Activity host = host();
            if (!onMain() || !current() || retained == null || !retained.isResumed() ||
                    host == null || host.isFinishing() || host.isDestroyed() || !attempt.needsDecision() ||
                    dialog == null || !dialog.isShowing() || dialog.getWindow() == null ||
                    !dialog.getWindow().getDecorView().hasWindowFocus() || expired()) { cancel(); return; }
            try {
                callbacks.verifyDestination(host);
                PendingIntent resolution = pending;
                int expectedUid = host.getPackageManager().getApplicationInfo(MICROG, 0).uid;
                if (resolution == null || !MICROG.equals(resolution.getCreatorPackage()) ||
                        resolution.getCreatorUid() != expectedUid) { failStatus(8); return; }
                int code = NEXT_REQUEST.getAndIncrement();
                if (!attempt.beginLaunch(code)) { cancel(); return; }
                pending = null;
                retained.dismissConfirmation();
                retained.startIntentSenderForResult(resolution.getIntentSender(), code, null, 0, 0, 0, null);
            } catch (Exception failure) { failStatus(8); }
        }

        private boolean expired() { return SystemClock.elapsedRealtime() > offerDeadline; }

        private void complete(Object nativeResult) {
            Callbacks target = callbacks;
            if (target == null || !current() || !attempt.finish()) return;
            Object credential = generation.credential();
            target.clear(this);
            dispose();
            try { target.success(credential, nativeResult); }
            catch (Exception failure) { target.failure(target.statusCode(failure)); }
            finally { target.retire(); }
        }

        public void cancel() {
            if (!onMain()) { new Handler(Looper.getMainLooper()).post(this::cancel); return; }
            Callbacks target = callbacks;
            boolean notify = target != null && current();
            if (!attempt.finish()) return;
            if (target != null) target.clear(this);
            dispose();
            if (target != null) {
                try { if (notify) target.cancel(); } finally { target.retire(); }
            }
        }

        public void failStatus(int statusCode) {
            if (!onMain()) { new Handler(Looper.getMainLooper()).post(() -> failStatus(statusCode)); return; }
            Callbacks target = callbacks;
            boolean notify = target != null && current();
            if (!attempt.finish()) return;
            if (target != null) target.clear(this);
            dispose();
            if (target != null) {
                try { if (notify) target.failure(statusCode); } finally { target.retire(); }
            }
        }

        public void abandon() {
            if (!onMain()) { new Handler(Looper.getMainLooper()).post(this::abandon); return; }
            if (!attempt.finish()) return;
            Callbacks target = callbacks;
            if (target != null) target.clear(this);
            dispose();
            if (target != null) target.retire();
        }

        /** Preparation already owns reset/retirement ordering; only release local state here. */
        private void cleanupPreparation() {
            attempt.finish();
            Callbacks target = callbacks;
            if (target != null) target.clear(this);
            dispose();
        }

        private void discard() {
            attempt.finish();
            Callbacks target = callbacks;
            if (target != null) target.clear(this);
            dispose();
            if (target != null) target.retire();
        }

        private void dispose() {
            callbacks = null;
            pending = null;
            delivery.clear();
            ResultFragment retained = fragment.get();
            fragment.clear();
            if (retained == null) return;
            retained.dismissConfirmation();
            retained.request = null;
            FragmentManager manager = retained.getFragmentManager();
            if (manager != null) {
                try { manager.beginTransaction().remove(retained).commitAllowingStateLoss(); }
                catch (RuntimeException alreadyDestroyed) { /* References are already cleared. */ }
            }
        }
    }

    /** Kept across rotation only. Android recreates it empty after process death; no auto-prompt. */
    public static final class ResultFragment extends Fragment {
        private Request request;
        private AlertDialog confirmation;
        private View observedDecor;
        private final ViewTreeObserver.OnWindowFocusChangeListener focusListener = hasFocus -> {
            if (hasFocus) offerWhenForeground();
        };
        public ResultFragment() {}

        @Override public void onActivityResult(int requestCode, int resultCode, Intent data) {
            super.onActivityResult(requestCode, resultCode, data);
            Request active = request;
            if (active != null) active.result(requestCode, resultCode, data);
        }

        @Override public void onResume() {
            super.onResume();
            if (request == null) {
                FragmentManager manager = getFragmentManager();
                if (manager != null) manager.beginTransaction().remove(this).commitAllowingStateLoss();
            }
            Request active = request;
            if (active != null) active.drain();
            Activity host = getActivity();
            if (host != null && request != null) {
                observedDecor = host.getWindow().getDecorView();
                observedDecor.getViewTreeObserver().addOnWindowFocusChangeListener(focusListener);
                observedDecor.post(this::offerWhenForeground);
            }
            // Lifecycle callbacks may restore the foreground offer, never launch its sender.
        }

        private void offerWhenForeground() {
            Request active = request;
            if (active == null || !active.current() || !active.attempt.needsDecision() || !isResumed() ||
                    !foreground(getActivity()) || (confirmation != null && confirmation.isShowing())) return;
            if (active.expired()) { active.cancel(); return; }
            confirmation = new AlertDialog.Builder(getActivity())
                    .setTitle("Continue Google sign-in")
                    .setMessage("Continue to Google account authorization through microG-RE.")
                    .setPositiveButton("Continue", (dialog, which) -> {
                        Request current = request;
                        if (current != null) current.confirm(confirmation);
                    })
                    .setNegativeButton(android.R.string.cancel, (dialog, which) -> {
                        Request current = request;
                        if (current != null) current.cancel();
                    })
                    .setOnCancelListener(dialog -> {
                        Request current = request;
                        if (current != null) current.cancel();
                    }).create();
            confirmation.show();
        }

        private void dismissConfirmation() {
            AlertDialog shown = confirmation;
            confirmation = null;
            if (shown != null) { shown.setOnCancelListener(null); shown.dismiss(); }
        }

        @Override public void onPause() {
            if (observedDecor != null) {
                ViewTreeObserver observer = observedDecor.getViewTreeObserver();
                if (observer.isAlive()) observer.removeOnWindowFocusChangeListener(focusListener);
                observedDecor = null;
            }
            dismissConfirmation();
            super.onPause();
        }

        @Override public void onDestroy() {
            Request active = request;
            if (active != null) active.cancel();
            request = null;
            super.onDestroy();
        }
    }
}
