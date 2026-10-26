package app.morphe.extension.chmate;

import android.content.*;
import android.content.pm.*;
import android.os.*;
import android.util.*;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;
import java.util.Map;
import org.lsposed.hiddenapibypass.HiddenApiBypass;

/** Isolated ads-only runtime. No settings, network workers or lifecycle observers. */
public final class Haiagaru {
    private static final String LOG_TAG = "HaiagaruAdsOnly";
    private static final String AD_CLASS_191 = "o.qheCC";
    private static boolean signatureSpoofInstalled;
    private static volatile String runtimePackageName = originalPackageName();
    private static final String ORIGINAL_CERTIFICATE =
            "MIICZTCCAc6gAwIBAgIETUOudzANBgkqhkiG9w0BAQUFADB2MQswCQYDVQQGEwJK"
            + "UDEOMAwGA1UECBMFVG9reW8xETAPBgNVBAcTCFNldGFnYXlhMRUwEwYDVQQKEwxB"
            + "SVJGUk9OVCBJbmMxFTATBgNVBAsTDEFJUkZST05UIEluYzEWMBQGA1UEAxMNSWl6"
            + "dWthIFl1dGFrYTAgFw0xMTAxMjkwNjA2NDdaGA8yMTExMDEwNTA2MDY0N1owdjEL"
            + "MAkGA1UEBhMCSlAxDjAMBgNVBAgTBVRva3lvMREwDwYDVQQHEwhTZXRhZ2F5YTEV"
            + "MBMGA1UEChMMQUlSRlJPTlQgSW5jMRUwEwYDVQQLEwxBSVJGUk9OVCBJbmMxFjAU"
            + "BgNVBAMTDUlpenVrYSBZdXRha2EwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGB"
            + "AIHFDp9gJvnNQ0I0oummb9HEMDi6gQJ3DwhHkTBymKn00gwInFEx+URZNzT1P2SV"
            + "8te21T199vUvBygujXaJknmoIPy2T6HNIVFt0hREWQqtsCQNeQWZj4Qdmcgr2T6C"
            + "DKl0Cgy20Qf5Q/DTmVSLKM6fIjabi9WzvZThLlhyFzbVAgMBAAEwDQYJKoZIhvcN"
            + "AQEFBQADgYEAOfY6cwtJbh2vX95s0Xlhsr6am63Gq78Fh39zP/vO7g2fkas4miT5"
            + "1ITb29uBm1Mggd2pD1mP6SELsexpdaz/6xBtWk5KagFAgS+4yuceXn9HQ5dgCk2v"
            + "9kQy5kSVkF2kCALI9DxTEE3yuzZFKw7f7pKGZzs3wZCyeMCZNCC2MRQ=";

public static synchronized void installSignatureSpoof() {
        if (signatureSpoofInstalled) return;

        runtimePackageName = resolveRuntimePackageName();

        final Signature originalSignature = new Signature(
                Base64.decode(ORIGINAL_CERTIFICATE, Base64.DEFAULT));
        final Parcelable.Creator<PackageInfo> originalCreator = PackageInfo.CREATOR;
        final Parcelable.Creator<PackageInfo> spoofingCreator = new Parcelable.Creator<PackageInfo>() {
            @Override
            public PackageInfo createFromParcel(Parcel source) {
                PackageInfo info = originalCreator.createFromParcel(source);
                if (originalPackageName().equals(info.packageName)
                        || runtimePackageName.equals(info.packageName)) {
                    if (info.signatures != null && info.signatures.length > 0) {
                        info.signatures[0] = originalSignature;
                    }
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P && info.signingInfo != null) {
                        Signature[] signers = info.signingInfo.getApkContentsSigners();
                        if (signers != null && signers.length > 0) {
                            signers[0] = originalSignature;
                        }
                    }
                }
                return info;
            }

            @Override
            public PackageInfo[] newArray(int size) {
                return originalCreator.newArray(size);
            }
        };

        try {
            HiddenApiBypass.addHiddenApiExemptions(
                    "Landroid/os/Parcel;", "Landroid/content/pm", "Landroid/app");
            findField(PackageInfo.class, "CREATOR").set(null, spoofingCreator);
            clearStaticCache(PackageManager.class, "sPackageInfoCache");
            clearStaticMap(Parcel.class, "mCreators");
            clearStaticMap(Parcel.class, "sPairedCreators");
            signatureSpoofInstalled = true;
        } catch (ReflectiveOperationException e) {
            throw new IllegalStateException("Unable to install ChMate signature spoof", e);
        }
    }

private static void clearStaticCache(Class<?> type, String name) {
        try {
            Object cache = findField(type, name).get(null);
            if (cache != null) cache.getClass().getMethod("clear").invoke(cache);
        } catch (Throwable ignored) {
        }
    }

private static void clearStaticMap(Class<?> type, String name) {
        try {
            Object value = findField(type, name).get(null);
            if (value instanceof Map) ((Map<?, ?>) value).clear();
        } catch (Throwable ignored) {
        }
    }

private static String resolveRuntimePackageName() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Object value = activityThread.getDeclaredMethod("currentPackageName").invoke(null);
            if (value instanceof String && !((String) value).isEmpty()) {
                return (String) value;
            }
        } catch (ReflectiveOperationException ignored) {
        }
        return originalPackageName();
    }

private static Field findField(Class<?> type, String name) throws NoSuchFieldException {
        Class<?> cursor = type;
        while (cursor != null && cursor != Object.class) {
            try {
                Field field = cursor.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
                cursor = cursor.getSuperclass();
            }
        }
        throw new NoSuchFieldException(type.getName() + "." + name);
    }

public static Intent retargetSelfIntent(Intent intent) {
        if (intent == null) return null;
        ComponentName component = intent.getComponent();
        String currentPackage = runtimePackageName;
        if (component == null || currentPackage == null
                || originalPackageName().equals(currentPackage)
                || !originalPackageName().equals(component.getPackageName())
                || !component.getClassName().startsWith("jp.syoboi.")) {
            return intent;
        }
        intent.setComponent(new ComponentName(currentPackage, component.getClassName()));
        return intent;
    }

public static void suppressTabletThreadHeaderAdSpace(Object owner) {
        if (owner == null) {
            return;
        }
        try {
            for (Field field : owner.getClass().getDeclaredFields()) {
                if (field.getType() == Boolean.TYPE
                        && !java.lang.reflect.Modifier.isStatic(field.getModifiers())) {
                    field.setAccessible(true);
                    field.setBoolean(owner, false);
                    return;
                }
            }
        } catch (Throwable throwable) {
            Log.w(LOG_TAG, "Unable to suppress tablet banner spacer", throwable);
        }
    }

private static void collapseAdView(View view) {
        boolean wasLaidOut = view != null && view.getHeight() > 0;
        collapseView(view);
        collapseAdContainer(view, wasLaidOut);
    }

private static void collapseAdContainer(View adView, boolean wasLaidOut) {
        // onViewCreated can reach the ad before measure/layout. At that point every
        // sibling also has height 0; walking upward would incorrectly collapse the
        // whole HomeActivity root and leave a black screen on launch.
        if (adView == null || !wasLaidOut) return;
        View current = adView;
        // Talk's inline slot is sometimes wrapped in a FrameLayout containing a second,
        // already-empty spacer. The old sole-child check left that wrapper at its reserved
        // height, producing a large blank row between two responses. Walk only the small
        // wrapper chain and collapse a parent after every child has become empty or hidden.
        for (int depth = 0; depth < 4 && current.getParent() instanceof ViewGroup; depth++) {
            ViewGroup container = (ViewGroup) current.getParent();
            if (AdContainerSafety.isScreenHost(container.getClass(), container.getId())) return;
            String name = container.getClass().getName();
            if (name.contains("RecyclerView") || name.contains("AbsListView")
                    || name.contains("ScrollView")) {
                return;
            }
            boolean hasVisibleChild = false;
            for (int i = 0; i < container.getChildCount(); i++) {
                View child = container.getChildAt(i);
                if (child.getVisibility() == View.VISIBLE && child.getHeight() > 0
                        && !isEmptySpacer(child)) {
                    hasVisibleChild = true;
                    break;
                }
            }
            if (hasVisibleChild) return;
            collapseView(container);
            current = container;
        }
    }

private static boolean isEmptySpacer(View view) {
        if (view != null && AdContainerSafety.isScreenHost(view.getClass(), view.getId())) return false;
        if (view == null || view.getVisibility() != View.VISIBLE || view.getHeight() <= 0) {
            return true;
        }
        if (view instanceof TextView) {
            CharSequence text = ((TextView) view).getText();
            return (text == null || text.length() == 0)
                    && view.getBackground() == null;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            // Talk 241 places the inline ad in a childless FrameLayout. The SDK
            // background remains attached even after the ad has no content, so
            // background presence alone cannot make this a non-empty row.
            if (group.getChildCount() == 0
                    && view.getHeight() >= dp(view.getContext(), 160)) {
                return true;
            }
            for (int i = 0; i < group.getChildCount(); i++) {
                if (!isEmptySpacer(group.getChildAt(i))) return false;
            }
            return view.getBackground() == null;
        }
        return view.getBackground() == null;
    }

private static void collapseView(View view) {
        // The image viewer is added later to an initially empty Fragment host.
        // Never turn that host (or the Activity content root) into an ad spacer.
        if (AdContainerSafety.isScreenHost(view.getClass(), view.getId())) return;
        view.setVisibility(View.GONE);
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (params != null) {
            params.height = 0;
            view.setLayoutParams(params);
        }
    }

private static void safeCollapseAdView(View view) {
        try {
            collapseAdView(view);
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to collapse ChMate ad view", error);
        }
    }

private static void safePostCollapseAdView(View view, long delayMillis) {
        try {
            if (delayMillis <= 0) {
                view.post(() -> safeCollapseAdView(view));
            } else {
                view.postDelayed(() -> safeCollapseAdView(view), delayMillis);
            }
        } catch (Throwable error) {
            Log.w(LOG_TAG, "Unable to schedule ChMate ad view collapse", error);
        }
    }

public static void hideAdView(View view) {
        if (view == null || !shouldHideAds()) return;

        safeCollapseAdView(view);
        safePostCollapseAdView(view, 0);
        safePostCollapseAdView(view, 300);
        safePostCollapseAdView(view, 1000);
        safePostCollapseAdView(view, 2500);
    }

public static void hideModernThreadListAd(View view) {
        if (view == null || !shouldHideAds()) return;
        safeCollapseAdView(view);
        safePostCollapseAdView(view, 0);
        safePostCollapseAdView(view, 300);
        safePostCollapseAdView(view, 1000);
        safePostCollapseAdView(view, 2500);
    }

public static void hideLegacyBanner(View root) {
        if (!(root instanceof ViewGroup) || !shouldHideAds()) return;
        hideKnownLegacyAds(root);
        root.post(() -> hideKnownLegacyAds(root));
        root.postDelayed(() -> hideKnownLegacyAds(root), 300);
        root.postDelayed(() -> hideKnownLegacyAds(root), 1000);
        root.postDelayed(() -> hideKnownLegacyAds(root), 2500);
    }

private static void hideKnownLegacyAds(View view) {
        // Search options also occupy a FrameLayout subclass. Neither child order
        // nor an adClass persisted by the old positional heuristic identifies ads.
        if (AD_CLASS_191.equals(view.getClass().getName())) {
            hideAdView(view);
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                hideKnownLegacyAds(group.getChildAt(i));
            }
        }
    }
    public static boolean adsOnlyBuild() { return true; }
    public static String originalPackageName() { return "jp.co.airfront.android.a2chMate"; }
    public static boolean shouldHideAds() { return true; }
    public static boolean shouldHideAds(Context ignored) { return true; }
    public static void hideLegacyThreadListAd(View view, BaseAdapter adapter, int position) {
        if (view == null || adapter == null) return;
        try {
            if (position == 0 && view.getPaddingTop() > 0)
                view.setPadding(view.getPaddingLeft(), 0, view.getPaddingRight(), view.getPaddingBottom());
            if (adapter.getItemViewType(position) == 5) hideAdView(view);
        } catch (Throwable error) { Log.w(LOG_TAG, "Unable to collapse ad row", error); }
    }
    // Match known ad classes only. A blank Fragment container is never an ad slot.
    public static void hideHomeBanner(View root) {
        if (root == null) return;
        scanAds(root);
        root.post(() -> scanAds(root));
        root.postDelayed(() -> scanAds(root), 300);
        root.postDelayed(() -> scanAds(root), 1000);
        root.postDelayed(() -> scanAds(root), 2500);
    }
    private static void scanAds(View view) {
        String name = view.getClass().getName();
        if (name.equals("o.qheCC") || name.equals("o.setUseHandlerThreadForCallbacks")
                || name.equals("o.zzbgb") || name.equals("o.zzexb")) { hideAdView(view); return; }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup)view;
            for (int i=0; i<group.getChildCount(); i++) scanAds(group.getChildAt(i));
        }
    }
    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
    private Haiagaru() {}
}
