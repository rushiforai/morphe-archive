package app.morphe.extension.tiktok.feedfilter;

import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Aweme;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class AdsFilter implements IFilter {
    @Override
    public boolean getEnabled() {
        return Settings.REMOVE_ADS.get();
    }

    @Override
    public boolean getFiltered(Aweme item) {
        return isFiltered(item);
    }

    private static boolean isFiltered(Aweme item) {
        if (item == null) return false;

        // Native flags are the strongest per-card signals on TikTok 46.4.3.
        try {
            if (item.isAd() || item.isSoftAd() || item.isWithPromotionalMusic()) {
                return true;
            }
        } catch (Throwable ignored) {
        }

        // Paid-content must be explicitly true. Do not treat the mere presence of
        // paid-content metadata as an ad: 46.4.3 populates several commercial model
        // containers on ordinary organic videos as well.
        if (truthy(item, "isPaidContent", "isPaidContent")) return true;

        // A real raw-ad payload is strong evidence that this feed card itself is an ad.
        if (nonNull(item, "getAwemeRawAd", "awemeRawAd")) return true;

        // The exact 46.4.3 Video model carries explicit ad identity/tag fields for
        // cards assembled later from preload/client-side ad paths.
        Object video = firstNonNull(invoke(item, "getVideo"), readField(item, "video"));
        if (video != null) {
            if (nonEmptyString(video, null, "adVideoId")) return true;
            if (nonEmptyString(video, null, "videoAdTag")) return true;
        }

        // Deliberately NOT hard blockers:
        // - mPaidContentInfo
        // - linkAdData
        // - commercialVideoInfo
        // - adAwemeSource / adLinkType
        // - hasEverAdvertised / promoteModel
        // Device diagnostics on dev.8 proved that at least one of these auxiliary
        // commercial fields is populated on normal organic videos. Using them as a
        // standalone ad signal empties entire FYP batches. Unknown metadata therefore
        // stays fail-open unless one of the strong signals above confirms the ad.
        return false;
    }

    private static boolean truthy(Object target, String methodName, String fieldName) {
        Object value = firstNonNull(invoke(target, methodName), readField(target, fieldName));
        return value instanceof Boolean && (Boolean) value;
    }

    private static boolean nonNull(Object target, String methodName, String fieldName) {
        return firstNonNull(invoke(target, methodName), readField(target, fieldName)) != null;
    }

    private static boolean nonEmptyString(Object target, String methodName, String fieldName) {
        Object value = firstNonNull(invoke(target, methodName), readField(target, fieldName));
        return value instanceof String && !((String) value).trim().isEmpty();
    }

    private static Object invoke(Object target, String methodName) {
        if (target == null || methodName == null) return null;
        try {
            Method method = target.getClass().getMethod(methodName);
            method.setAccessible(true);
            return method.invoke(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object readField(Object target, String fieldName) {
        if (target == null || fieldName == null) return null;
        for (Class<?> type = target.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(fieldName);
                field.setAccessible(true);
                return field.get(target);
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static Object firstNonNull(Object... values) {
        for (Object value : values) {
            if (value != null) return value;
        }
        return null;
    }
}
