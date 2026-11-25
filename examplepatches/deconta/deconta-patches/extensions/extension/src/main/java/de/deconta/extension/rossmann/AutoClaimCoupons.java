package de.deconta.extension.rossmann;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
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
    private static final String PREFS_NAME = "deconta_patches_prefs";
    private static final String KEY_AUTO_CLAIM = "auto_claim_enabled";
    private static final String KEY_SKIP_TEN = "skip_ten_percent";

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long ACTIVATION_DELAY_MS = 120;

    private static final Set<String> inFlightCoupons = Collections.synchronizedSet(new HashSet<String>());
    private static boolean isProcessing = false;

    private static volatile Object latestFragment = null;
    private static volatile Object latestData = null;

    private AutoClaimCoupons() {
    }

    public static void onCouponsLoaded(final Object fragment, final Object data) {
        if (fragment == null || data == null) {
            return;
        }

        latestFragment = fragment;
        latestData = data;

        MAIN.post(new Runnable() {
            @Override
            public void run() {
                try {
                    injectDecontaButton(fragment);
                    processCoupons(fragment, data, false);
                } catch (Throwable t) {
                    Log.e(TAG, "Error in onCouponsLoaded", t);
                }
            }
        });
    }

    private static void injectDecontaButton(final Object fragment) {
        try {
            Field adapterField = null;
            for (Field f : fragment.getClass().getFields()) {
                if ("w".equals(f.getName()) || f.getType().getName().contains("LegacyCouponsAdapter")) {
                    adapterField = f;
                    break;
                }
            }
            if (adapterField == null) {
                return;
            }

            Object adapter = adapterField.get(fragment);
            if (adapter == null) {
                return;
            }

            Field holderField = null;
            for (Field hf : adapter.getClass().getFields()) {
                if ("p".equals(hf.getName()) || hf.getType().getName().contains("SearchCouponsViewHolder")) {
                    holderField = hf;
                    break;
                }
            }
            if (holderField == null) {
                return;
            }

            Object searchHolder = holderField.get(adapter);
            if (searchHolder == null) {
                return;
            }

            Field tvField = null;
            for (Field tf : searchHolder.getClass().getFields()) {
                if ("d".equals(tf.getName()) || TextView.class.isAssignableFrom(tf.getType())) {
                    tvField = tf;
                    break;
                }
            }
            if (tvField == null) {
                return;
            }

            final TextView tvCount = (TextView) tvField.get(searchHolder);
            if (tvCount == null || !(tvCount.getParent() instanceof ViewGroup)) {
                return;
            }

            ViewGroup parent = (ViewGroup) tvCount.getParent();
            if (parent.findViewWithTag("deconta_btn") != null) {
                return;
            }

            final Context context = tvCount.getContext();
            int index = parent.indexOfChild(tvCount);
            ViewGroup.LayoutParams origParams = tvCount.getLayoutParams();

            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            LinearLayout.LayoutParams rowParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            );
            if (origParams instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) origParams;
                rowParams.setMargins(mlp.leftMargin, mlp.topMargin, mlp.rightMargin, mlp.bottomMargin);
            }
            row.setLayoutParams(rowParams);

            parent.removeView(tvCount);

            LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(
                0,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                1.0f
            );
            row.addView(tvCount, textParams);

            GradientDrawable pillBg = new GradientDrawable();
            pillBg.setColor(Color.parseColor("#B81528"));
            pillBg.setCornerRadius(dpToPx(context, 14));

            TextView decontaBtn = new TextView(context);
            decontaBtn.setTag("deconta_btn");
            decontaBtn.setText("⚙️ Deconta");
            decontaBtn.setTextColor(Color.WHITE);
            decontaBtn.setTextSize(12f);
            decontaBtn.setTypeface(Typeface.DEFAULT_BOLD);
            decontaBtn.setPadding(dpToPx(context, 12), dpToPx(context, 5), dpToPx(context, 12), dpToPx(context, 5));
            decontaBtn.setBackground(pillBg);
            decontaBtn.setGravity(Gravity.CENTER);

            LinearLayout.LayoutParams btnParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            );
            btnParams.setMargins(dpToPx(context, 8), 0, 0, 0);
            row.addView(decontaBtn, btnParams);

            parent.addView(row, index);

            decontaBtn.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    showSettingsDialog(context, fragment);
                }
            });

            Log.i(TAG, "Successfully injected Deconta button next to coupon count");
        } catch (Throwable t) {
            Log.d(TAG, "Could not inject Deconta button", t);
        }
    }

    private static void showSettingsDialog(final Context context, final Object fragment) {
        try {
            final SharedPreferences prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            boolean autoClaimEnabled = prefs.getBoolean(KEY_AUTO_CLAIM, true);
            boolean skipTenPercent = prefs.getBoolean(KEY_SKIP_TEN, false);

            ScrollView scrollView = new ScrollView(context);
            LinearLayout content = new LinearLayout(context);
            content.setOrientation(LinearLayout.VERTICAL);
            int pad = dpToPx(context, 20);
            content.setPadding(pad, pad, pad, pad);
            scrollView.addView(content);

            // Auto-claim checkbox
            final CheckBox cbAuto = new CheckBox(context);
            cbAuto.setText("Coupons automatisch aktivieren");
            cbAuto.setTextSize(15f);
            cbAuto.setChecked(autoClaimEnabled);
            content.addView(cbAuto);

            TextView tvAutoSub = new TextView(context);
            tvAutoSub.setText("Aktiviert beim Öffnen der Liste sofort alle verfügbaren Coupons.");
            tvAutoSub.setTextSize(12f);
            tvAutoSub.setTextColor(Color.GRAY);
            tvAutoSub.setPadding(dpToPx(context, 32), 0, 0, dpToPx(context, 14));
            content.addView(tvAutoSub);

            // Skip 10% checkbox
            final CheckBox cbSkipTen = new CheckBox(context);
            cbSkipTen.setText("10%-Coupons schonen");
            cbSkipTen.setTextSize(15f);
            cbSkipTen.setChecked(skipTenPercent);
            content.addView(cbSkipTen);

            TextView tvSkipSub = new TextView(context);
            tvSkipSub.setText("Spart 10%-Gutscheine für einen späteren Großeinkauf auf und zündet nur normale Rabatte.");
            tvSkipSub.setTextSize(12f);
            tvSkipSub.setTextColor(Color.GRAY);
            tvSkipSub.setPadding(dpToPx(context, 32), 0, 0, dpToPx(context, 16));
            content.addView(tvSkipSub);

            // Divider
            View divider = new View(context);
            divider.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dpToPx(context, 1)));
            divider.setBackgroundColor(Color.parseColor("#E0E0E0"));
            content.addView(divider);

            // Claim All Button
            Button btnClaimAll = new Button(context);
            btnClaimAll.setText("⚡ Alle Coupons jetzt aktivieren");
            btnClaimAll.setTextSize(13f);
            LinearLayout.LayoutParams lpClaim = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lpClaim.setMargins(0, dpToPx(context, 14), 0, 0);
            btnClaimAll.setLayoutParams(lpClaim);
            content.addView(btnClaimAll);

            // Deactivate All Button
            Button btnDeactAll = new Button(context);
            btnDeactAll.setText("🗑️ Alle Coupons deaktivieren");
            btnDeactAll.setTextSize(13f);
            btnDeactAll.setTextColor(Color.parseColor("#C8102E"));
            LinearLayout.LayoutParams lpDeact = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lpDeact.setMargins(0, dpToPx(context, 8), 0, 0);
            btnDeactAll.setLayoutParams(lpDeact);
            content.addView(btnDeactAll);

            AlertDialog.Builder builder = new AlertDialog.Builder(context);
            builder.setTitle("⚙️ DecontaPatches");
            builder.setView(scrollView);
            builder.setPositiveButton("Schließen", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    prefs.edit()
                        .putBoolean(KEY_AUTO_CLAIM, cbAuto.isChecked())
                        .putBoolean(KEY_SKIP_TEN, cbSkipTen.isChecked())
                        .apply();
                }
            });

            final AlertDialog dialog = builder.create();

            btnClaimAll.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    prefs.edit()
                        .putBoolean(KEY_AUTO_CLAIM, cbAuto.isChecked())
                        .putBoolean(KEY_SKIP_TEN, cbSkipTen.isChecked())
                        .apply();
                    dialog.dismiss();
                    if (latestFragment != null && latestData != null) {
                        try {
                            processCoupons(latestFragment, latestData, true);
                        } catch (Throwable t) {
                            Log.e(TAG, "Manual claim error", t);
                        }
                    }
                }
            });

            btnDeactAll.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    new AlertDialog.Builder(context)
                        .setTitle("Coupons deaktivieren")
                        .setMessage("Möchtest du wirklich alle aktiven Coupons aus deiner Kundenkarte entfernen?")
                        .setNegativeButton("Abbrechen", null)
                        .setPositiveButton("Ja, alle deaktivieren", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface d, int which) {
                                prefs.edit()
                                    .putBoolean(KEY_AUTO_CLAIM, cbAuto.isChecked())
                                    .putBoolean(KEY_SKIP_TEN, cbSkipTen.isChecked())
                                    .apply();
                                dialog.dismiss();
                                if (latestFragment != null && latestData != null) {
                                    try {
                                        processDeactivation(latestFragment, latestData);
                                    } catch (Throwable t) {
                                        Log.e(TAG, "Deactivation error", t);
                                    }
                                }
                            }
                        })
                        .show();
                }
            });

            dialog.show();
        } catch (Throwable t) {
            Log.e(TAG, "Error showing settings dialog", t);
        }
    }

    private static void processCoupons(final Object fragment, Object data, boolean forceRun) throws Exception {
        if (isProcessing) {
            return;
        }

        Method getContextMethod = fragment.getClass().getMethod("getContext");
        final Context context = (Context) getContextMethod.invoke(fragment);
        if (context == null) {
            return;
        }

        SharedPreferences prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        boolean autoClaimEnabled = prefs.getBoolean(KEY_AUTO_CLAIM, true);
        boolean skipTenPercent = prefs.getBoolean(KEY_SKIP_TEN, false);

        if (!autoClaimEnabled && !forceRun) {
            Log.i(TAG, "Auto claim disabled in settings; skipping");
            return;
        }

        PresenterContext pContext = resolvePresenter(fragment);
        if (pContext == null) {
            return;
        }

        List<Object> allCoupons = extractCoupons(data);
        if (allCoupons.isEmpty()) {
            return;
        }

        Method getCouponIdMethod = allCoupons.get(0).getClass().getMethod("getCouponId");
        Method isInWalletMethod = allCoupons.get(0).getClass().getMethod("isInWallet");
        Method isRedeemedMethod = allCoupons.get(0).getClass().getMethod("isRedeemed");
        Method isPreviewMethod = allCoupons.get(0).getClass().getMethod("isPreview");
        Method shouldHideButtonMethod = allCoupons.get(0).getClass().getMethod("shouldHideButton");

        boolean singletonAlreadyInWallet = false;
        for (Object coupon : allCoupons) {
            if (isSingletonCoupon(coupon)) {
                try {
                    boolean inWallet = (Boolean) isInWalletMethod.invoke(coupon);
                    if (inWallet) {
                        singletonAlreadyInWallet = true;
                        break;
                    }
                } catch (Throwable ignored) {
                }
            }
        }

        final List<Object> toClaim = new ArrayList<>();
        boolean claimedSingleton = false;

        for (Object coupon : allCoupons) {
            String id = (String) getCouponIdMethod.invoke(coupon);
            boolean inWallet = (Boolean) isInWalletMethod.invoke(coupon);
            boolean redeemed = (Boolean) isRedeemedMethod.invoke(coupon);
            boolean preview = (Boolean) isPreviewMethod.invoke(coupon);
            boolean hideButton = (Boolean) shouldHideButtonMethod.invoke(coupon);

            if (!inWallet && !redeemed && !preview && !hideButton && id != null) {
                if (isSingletonCoupon(coupon)) {
                    if (skipTenPercent) {
                        Log.d(TAG, "Skipping 10% coupon because skip_ten_percent is enabled: " + id);
                        continue;
                    }
                    if (singletonAlreadyInWallet || claimedSingleton) {
                        Log.d(TAG, "Skipping additional singleton coupon: " + id);
                        continue;
                    }
                    claimedSingleton = true;
                }

                if (!inFlightCoupons.contains(id)) {
                    toClaim.add(coupon);
                }
            }
        }

        if (toClaim.isEmpty()) {
            if (forceRun) {
                Toast.makeText(context, "DecontaPatches: Keine neuen Coupons zum Aktivieren vorhanden.", Toast.LENGTH_SHORT).show();
            }
            return;
        }

        Log.i(TAG, "Found " + toClaim.size() + " coupons to activate");
        isProcessing = true;

        Toast.makeText(
            context,
            "DecontaPatches: Aktiviere " + toClaim.size() + " Coupons...",
            Toast.LENGTH_SHORT
        ).show();

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
        processQueue(0, toClaim, pContext, context, fragment, getCouponIdMethod, successCount, false);
    }

    private static void processDeactivation(final Object fragment, Object data) throws Exception {
        if (isProcessing) {
            return;
        }

        Method getContextMethod = fragment.getClass().getMethod("getContext");
        final Context context = (Context) getContextMethod.invoke(fragment);
        if (context == null) {
            return;
        }

        PresenterContext pContext = resolvePresenter(fragment);
        if (pContext == null) {
            return;
        }

        List<Object> allCoupons = extractCoupons(data);
        if (allCoupons.isEmpty()) {
            return;
        }

        Method getCouponIdMethod = allCoupons.get(0).getClass().getMethod("getCouponId");
        Method isInWalletMethod = allCoupons.get(0).getClass().getMethod("isInWallet");

        final List<Object> toDeactivate = new ArrayList<>();
        for (Object coupon : allCoupons) {
            boolean inWallet = (Boolean) isInWalletMethod.invoke(coupon);
            String id = (String) getCouponIdMethod.invoke(coupon);
            if (inWallet && id != null) {
                toDeactivate.add(coupon);
            }
        }

        if (toDeactivate.isEmpty()) {
            Toast.makeText(context, "DecontaPatches: Keine aktiven Coupons zum Deaktivieren vorhanden.", Toast.LENGTH_SHORT).show();
            return;
        }

        Log.i(TAG, "Found " + toDeactivate.size() + " coupons to deactivate");
        isProcessing = true;

        Toast.makeText(
            context,
            "DecontaPatches: Deaktiviere " + toDeactivate.size() + " Coupons...",
            Toast.LENGTH_SHORT
        ).show();

        final AtomicInteger successCount = new AtomicInteger(0);
        processQueue(0, toDeactivate, pContext, context, fragment, getCouponIdMethod, successCount, true);
    }

    private static void processQueue(
        final int index,
        final List<Object> queue,
        final PresenterContext pContext,
        final Context context,
        final Object fragment,
        final Method getCouponIdMethod,
        final AtomicInteger successCount,
        final boolean isDeactivation
    ) {
        if (index >= queue.size()) {
            isProcessing = false;
            inFlightCoupons.clear();

            MAIN.post(new Runnable() {
                @Override
                public void run() {
                    notifyAdapter(fragment);
                    int total = successCount.get();
                    if (total > 0) {
                        String msg = isDeactivation
                            ? "DecontaPatches: " + total + " Coupons erfolgreich deaktiviert!"
                            : "DecontaPatches: " + total + " Coupons erfolgreich aktiviert!";
                        Toast.makeText(context, msg, Toast.LENGTH_SHORT).show();
                    }
                }
            });
            return;
        }

        Object coupon = queue.get(index);
        try {
            String id = (String) getCouponIdMethod.invoke(coupon);
            Object presenter = pContext.createPresenterMethod.invoke(pContext.factory);
            if (pContext.displayField != null) {
                pContext.displayField.set(presenter, pContext.dummyDisplay);
            }
            pContext.activateMethod.invoke(presenter, coupon, context);
            successCount.incrementAndGet();
            Log.d(TAG, "Successfully processed coupon: " + id);
        } catch (Throwable t) {
            Log.e(TAG, "Failed processing coupon index " + index, t);
        }

        MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                processQueue(index + 1, queue, pContext, context, fragment, getCouponIdMethod, successCount, isDeactivation);
            }
        }, ACTIVATION_DELAY_MS);
    }

    private static void notifyAdapter(Object fragment) {
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
    }

    private static List<Object> extractCoupons(Object data) throws Exception {
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
        return allCoupons;
    }

    private static PresenterContext resolvePresenter(Object fragment) throws Exception {
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

        Object factory = factoryField.get(fragment);
        if (factory == null) {
            Log.e(TAG, "CouponPresenterFactory is null");
            return null;
        }

        Method createPresenterMethod = factory.getClass().getMethod("a");
        Object testPresenter = createPresenterMethod.invoke(factory);
        if (testPresenter == null) {
            Log.e(TAG, "CouponPresenter is null");
            return null;
        }

        Class<?> displayInterface = Class.forName("de.rossmann.app.android.ui.coupon.CouponDisplay");
        Object dummyDisplay = Proxy.newProxyInstance(
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
            return null;
        }
        activateMethodCandidate.setAccessible(true);

        return new PresenterContext(factory, createPresenterMethod, displayFieldCandidate, dummyDisplay, activateMethodCandidate);
    }

    private static boolean isSingletonCoupon(Object coupon) {
        if (coupon == null) {
            return false;
        }
        try {
            Class<?> cls = coupon.getClass();
            Method getRebateText = getMethodOrNull(cls, "getRebateText");
            Method getRebateSubText = getMethodOrNull(cls, "getRebateSubText");
            Method getTitle = getMethodOrNull(cls, "getTitle");
            Method getSubtitle = getMethodOrNull(cls, "getSubtitle");

            String rebateText = getRebateText != null ? (String) getRebateText.invoke(coupon) : "";
            String rebateSubText = getRebateSubText != null ? (String) getRebateSubText.invoke(coupon) : "";
            String title = getTitle != null ? (String) getTitle.invoke(coupon) : "";
            String subtitle = getSubtitle != null ? (String) getSubtitle.invoke(coupon) : "";

            String combined = (
                (rebateText != null ? rebateText : "") + " " +
                (rebateSubText != null ? rebateSubText : "") + " " +
                (title != null ? title : "") + " " +
                (subtitle != null ? subtitle : "")
            ).toLowerCase();

            if (combined.contains("auf alles") || combined.contains("gesamten einkauf")) {
                return true;
            }
            if ((combined.contains("10%") || combined.contains("10 %")) && (combined.contains("filiale") || combined.contains("rabatt"))) {
                return true;
            }
        } catch (Throwable t) {
            Log.d(TAG, "Error checking singleton coupon", t);
        }
        return false;
    }

    private static Method getMethodOrNull(Class<?> cls, String name) {
        try {
            return cls.getMethod(name);
        } catch (Throwable t) {
            return null;
        }
    }

    private static int dpToPx(Context context, int dp) {
        return (int) (dp * context.getResources().getDisplayMetrics().density + 0.5f);
    }

    private static final class PresenterContext {
        final Object factory;
        final Method createPresenterMethod;
        final Field displayField;
        final Object dummyDisplay;
        final Method activateMethod;

        PresenterContext(Object factory, Method createPresenterMethod, Field displayField, Object dummyDisplay, Method activateMethod) {
            this.factory = factory;
            this.createPresenterMethod = createPresenterMethod;
            this.displayField = displayField;
            this.dummyDisplay = dummyDisplay;
            this.activateMethod = activateMethod;
        }
    }
}
