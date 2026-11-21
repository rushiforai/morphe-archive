package de.deconta.extension.rossmann;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

public final class AutoClaimCoupons {

    private static final String TAG = "DecontaPatches";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long ACTIVATION_DELAY_MS = 350;

    private static final Set<String> inFlightCoupons = Collections.synchronizedSet(new HashSet<String>());
    private static boolean isProcessing = false;

    private AutoClaimCoupons() {
    }

    public static void onCouponsLoaded(final Object fragment, final Object data) {
        if (fragment == null || data == null) {
            return;
        }

        MAIN.post(new Runnable() {
            @Override
            public void run() {
                try {
                    processCoupons(fragment, data);
                } catch (Throwable t) {
                    Log.e(TAG, "Error in onCouponsLoaded", t);
                }
            }
        });
    }

    private static void processCoupons(final Object fragment, Object data) throws Exception {
        if (isProcessing) {
            return;
        }

        Method getContextMethod = fragment.getClass().getMethod("getContext");
        final Context context = (Context) getContextMethod.invoke(fragment);
        if (context == null) {
            return;
        }

        Field factoryField = null;
        for (Field f : fragment.getClass().getFields()) {
            if (f.getType().getName().contains("CouponPresenterFactory")) {
                factoryField = f;
                break;
            }
        }
        if (factoryField == null) {
            factoryField = fragment.getClass().getField("p");
        }

        final Object factory = factoryField.get(fragment);
        if (factory == null) {
            Log.e(TAG, "CouponPresenterFactory is null");
            return;
        }

        final Method createPresenterMethod = factory.getClass().getMethod("a");
        Object testPresenter = createPresenterMethod.invoke(factory);
        if (testPresenter == null) {
            Log.e(TAG, "CouponPresenter is null");
            return;
        }

        Class<?> displayInterface = Class.forName("de.rossmann.app.android.ui.coupon.CouponDisplay");
        final Object dummyDisplay = Proxy.newProxyInstance(
            displayInterface.getClassLoader(),
            new Class<?>[]{displayInterface},
            new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) {
                    if ("m".equals(method.getName()) || boolean.class.equals(method.getReturnType())) {
                        return Boolean.FALSE;
                    }
                    return null;
                }
            }
        );

        Field displayFieldCandidate = null;
        Class<?> curr = testPresenter.getClass();
        while (curr != null && displayFieldCandidate == null) {
            for (Field f : curr.getDeclaredFields()) {
                if ("a".equals(f.getName()) || "f41627a".equals(f.getName()) || displayInterface.isAssignableFrom(f.getType())) {
                    displayFieldCandidate = f;
                    break;
                }
            }
            curr = curr.getSuperclass();
        }
        if (displayFieldCandidate == null) {
            displayFieldCandidate = testPresenter.getClass().getField("a");
        }
        displayFieldCandidate.setAccessible(true);
        final Field displayField = displayFieldCandidate;

        Method activateMethodCandidate = null;
        for (Method m : testPresenter.getClass().getDeclaredMethods()) {
            Class<?>[] params = m.getParameterTypes();
            if (params.length == 2 && params[0].getName().contains("CouponDisplayModel") && Context.class.isAssignableFrom(params[1])) {
                activateMethodCandidate = m;
                break;
            }
        }
        if (activateMethodCandidate == null) {
            Log.e(TAG, "Activation method j(CouponDisplayModel, Context) not found on presenter");
            return;
        }
        final Method activateMethod = activateMethodCandidate;
        activateMethod.setAccessible(true);

        List<Object> allCoupons = new ArrayList<>();

        for (Field f : data.getClass().getDeclaredFields()) {
            f.setAccessible(true);
            Object val = f.get(data);
            if (val instanceof List) {
                for (Object item : (List<?>) val) {
                    if (item != null && item.getClass().getName().contains("CouponDisplayModel")) {
                        allCoupons.add(item);
                    }
                }
            }
        }

        if (allCoupons.isEmpty()) {
            return;
        }

        final List<Object> toClaim = new ArrayList<>();
        Method getCouponIdMethod = null;
        Method isInWalletMethod = null;
        Method isRedeemedMethod = null;
        Method isPreviewMethod = null;
        Method shouldHideButtonMethod = null;

        for (Object coupon : allCoupons) {
            Class<?> couponCls = coupon.getClass();
            if (getCouponIdMethod == null) {
                getCouponIdMethod = couponCls.getMethod("getCouponId");
                isInWalletMethod = couponCls.getMethod("isInWallet");
                isRedeemedMethod = couponCls.getMethod("isRedeemed");
                isPreviewMethod = couponCls.getMethod("isPreview");
                shouldHideButtonMethod = couponCls.getMethod("shouldHideButton");
            }

            String id = (String) getCouponIdMethod.invoke(coupon);
            boolean inWallet = (Boolean) isInWalletMethod.invoke(coupon);
            boolean redeemed = (Boolean) isRedeemedMethod.invoke(coupon);
            boolean preview = (Boolean) isPreviewMethod.invoke(coupon);
            boolean hideButton = (Boolean) shouldHideButtonMethod.invoke(coupon);

            if (!inWallet && !redeemed && !preview && !hideButton && id != null) {
                if (!inFlightCoupons.contains(id)) {
                    toClaim.add(coupon);
                }
            }
        }

        if (toClaim.isEmpty()) {
            return;
        }

        Log.i(TAG, "Found " + toClaim.size() + " coupons to auto-activate");

        isProcessing = true;

        for (Object c : toClaim) {
            try {
                String cid = (String) getCouponIdMethod.invoke(c);
                if (cid != null) {
                    inFlightCoupons.add(cid);
                }
            } catch (Throwable ignored) {
            }
        }

        final AtomicInteger successCount = new AtomicInteger(0);

        processQueue(0, toClaim, factory, createPresenterMethod, displayField, dummyDisplay, activateMethod, context, fragment, getCouponIdMethod, successCount);
    }

    private static void processQueue(
        final int index,
        final List<Object> queue,
        final Object factory,
        final Method createPresenterMethod,
        final Field displayField,
        final Object dummyDisplay,
        final Method activateMethod,
        final Context context,
        final Object fragment,
        final Method getCouponIdMethod,
        final AtomicInteger successCount
    ) {
        if (index >= queue.size()) {
            isProcessing = false;
            inFlightCoupons.clear();

            MAIN.post(new Runnable() {
                @Override
                public void run() {
                    try {
                        Field adapterField = null;
                        for (Field f : fragment.getClass().getFields()) {
                            if ("w".equals(f.getName()) || f.getType().getName().contains("LegacyCouponsAdapter")) {
                                adapterField = f;
                                break;
                            }
                        }
                        if (adapterField != null) {
                            Object adapter = adapterField.get(fragment);
                            if (adapter != null) {
                                Method notifyMethod = adapter.getClass().getMethod("notifyDataSetChanged");
                                notifyMethod.invoke(adapter);
                            }
                        }
                    } catch (Throwable t) {
                        Log.d(TAG, "Could not notify adapter", t);
                    }

                    int total = successCount.get();
                    if (total > 0) {
                        Toast.makeText(
                            context,
                            "DecontaPatches: " + total + " Coupons automatisch aktiviert!",
                            Toast.LENGTH_SHORT
                        ).show();
                    }
                }
            });
            return;
        }

        Object coupon = queue.get(index);
        try {
            String id = (String) getCouponIdMethod.invoke(coupon);
            Object presenter = createPresenterMethod.invoke(factory);
            if (displayField != null) {
                displayField.set(presenter, dummyDisplay);
            }
            activateMethod.invoke(presenter, coupon, context);
            successCount.incrementAndGet();
            Log.d(TAG, "Successfully activated coupon: " + id);
        } catch (Throwable t) {
            Log.e(TAG, "Failed activating coupon index " + index, t);
        }

        MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                processQueue(index + 1, queue, factory, createPresenterMethod, displayField, dummyDisplay, activateMethod, context, fragment, getCouponIdMethod, successCount);
            }
        }, ACTIVATION_DELAY_MS);
    }
}
