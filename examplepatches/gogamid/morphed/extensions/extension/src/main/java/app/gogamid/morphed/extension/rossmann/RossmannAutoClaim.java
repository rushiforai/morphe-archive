package app.gogamid.morphed.extension.rossmann;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.os.Build;
import android.util.Log;
import arrow.core.Either;
import de.rossmann.app.android.business.coupon.ActivateCoupon;
import de.rossmann.app.android.business.coupon.CouponToggleResult.Success.Full;
import de.rossmann.app.android.models.coupon.Coupon;
import de.rossmann.app.android.models.coupon.Coupon.PreviewState.NotPreview;
import java.util.ArrayDeque;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/** Drives Rossmann's own activation action for eligible coupons loaded in the app. */
public final class RossmannAutoClaim {
    private static final String TAG = "MorphedCoupons";
    private static final String CHANNEL_ID = "morphed_coupon_activation";
    private static final int NOTIFICATION_ID = 0x4d43;
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor();
    private static final Set<String> ATTEMPTED = new HashSet<>();
    private static final ArrayDeque<Coupon> QUEUE = new ArrayDeque<>();

    // Only the worker accesses the queue, in-flight flag and count.
    private static boolean inFlight;
    private static int confirmed;
    private static Context app;
    private static CoroutineContext emptyContext;
    private static volatile ActivateCoupon action;

    private RossmannAutoClaim() {}

    /** Called after application startup, with Rossmann's Hilt action and Kotlin context. */
    public static void register(Context context, ActivateCoupon activate, CoroutineContext coroutineContext) {
        app = context;
        emptyContext = coroutineContext;
        action = activate;
    }

    public static void onCoupons(List<?> coupons) {
        if (coupons == null) return;
        for (Object item : coupons) {
            if (item instanceof Coupon) onCoupon((Coupon) item);
        }
    }

    public static void onCoupon(Coupon coupon) {
        if (action == null || coupon == null || coupon.q || coupon.R != NotPreview.a
                || coupon.l == null || coupon.l.isEmpty()) return;
        WORKER.execute(() -> {
            if (ATTEMPTED.add(coupon.l)) {
                QUEUE.addLast(coupon);
                drain();
            }
        });
    }

    private static void drain() {
        if (inFlight || QUEUE.isEmpty()) return;
        Coupon coupon = QUEUE.removeFirst();
        inFlight = true;
        try {
            Object result = action.c(coupon, new ClaimContinuation());
            if (result != CoroutineSingletons.COROUTINE_SUSPENDED) complete(result);
        } catch (Exception | LinkageError error) {
            Log.w(TAG, "Activation could not run: " + error.getClass().getSimpleName());
            complete(null);
        }
    }

    private static void complete(Object result) {
        // Schedule the next claim only after the entire suspend call completes.
        WORKER.execute(() -> {
            try {
                if (result instanceof Either.Right && ((Either.Right) result).a instanceof Full) {
                    notifyConfirmed(++confirmed);
                } else if (!(result instanceof Either)) {
                    Log.w(TAG, "Activation ended without an app result");
                }
            } finally {
                inFlight = false;
                drain();
            }
        });
    }

    @SuppressWarnings("deprecation") // Pre-channel constructor for API 24–25.
    private static void notifyConfirmed(int count) {
        NotificationManager manager = app.getSystemService(NotificationManager.class);
        if (manager == null || !manager.areNotificationsEnabled()) return;
        try {
            Notification.Builder builder;
            if (Build.VERSION.SDK_INT >= 26) {
                manager.createNotificationChannel(new NotificationChannel(
                        CHANNEL_ID, "Coupon-Aktivierung", NotificationManager.IMPORTANCE_DEFAULT));
                builder = new Notification.Builder(app, CHANNEL_ID);
            } else {
                builder = new Notification.Builder(app);
            }
            manager.notify(NOTIFICATION_ID, builder
                    .setSmallIcon(android.R.drawable.ic_dialog_info)
                    .setContentTitle("Coupons automatisch aktiviert")
                    .setContentText(count == 1 ? "1 Coupon aktiviert" : count + " Coupons aktiviert")
                    .setOnlyAlertOnce(true)
                    .setAutoCancel(true)
                    .build());
        } catch (SecurityException ignored) {
            // Permission may have changed between checking and posting.
        }
    }

    private static final class ClaimContinuation extends ContinuationImpl {
        ClaimContinuation() {
            super(new Continuation<Object>() {
                @Override public CoroutineContext getContext() { return emptyContext; }
                @Override public void resumeWith(Object result) { complete(result); }
            });
        }

        @Override public Object invokeSuspend(Object result) { return result; }
    }
}
