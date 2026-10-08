/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.spoof.region;

import android.os.Build;
import androidx.annotation.Nullable;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.spoof.sim.SimPreset;
import app.morphe.extension.tiktok.spoof.sim.SimPresets;
import app.morphe.extension.tiktok.spoof.sim.SpoofSimPatch;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;
import java.util.concurrent.atomic.AtomicInteger;

public final class RegionSpoof {
    private static final Set<String> COUNTRIES = new HashSet<>(Arrays.asList(Locale.getISOCountries()));

    /*
     * The patch sends every Locale.getDefault() and TimeZone.getDefault() in the app through
     * here, on every thread, and those are asked for all the time: each String.format, each
     * date and each lower-casing. Each answer used to compile a regex, build a Locale and scan
     * the presets (or ICU's whole zone table for a custom country). The last answer is kept
     * with what it was worked out from, so a changed setting still takes effect at once.
     */
    private static volatile String[] lastCountry = {"", ""};
    private static volatile LocaleAnswer lastLocale;
    private static volatile Object[] lastZone = {"", null};

    private static final class LocaleAnswer {
        final Locale original;
        final String country;
        final Locale answer;

        LocaleAnswer(Locale original, String country, Locale answer) {
            this.original = original;
            this.country = country;
            this.answer = answer;
        }
    }

    private RegionSpoof() { }

    public static boolean validCountry(String value) {
        if (value == null) return false;
        String code = value.trim();
        if (code.length() != 2) return false;
        for (int index = 0; index < 2; index++) {
            char letter = code.charAt(index);
            if ((letter < 'A' || letter > 'Z') && (letter < 'a' || letter > 'z')) return false;
        }
        return COUNTRIES.contains(code.toUpperCase(Locale.ROOT));
    }

    /*
     * Sign-in requests. TTNet's common-parameter handler hands over each request's path just
     * before it builds that request's parameters, on the same thread, and calls requestDone()
     * right after. While a /passport/ request's parameters are built with Match region fields in
     * requests on, that thread gets TikTok's own answers: the region getters, the locale, the
     * timezone and the request fields the builder hook would set. A value TikTok worked out
     * earlier and kept, like the copy of sys_region it makes at start-up, stays as it was.
     */
    private static final ThreadLocal<Boolean> SIGN_IN = new ThreadLocal<>();
    /** Threads building a sign-in request's parameters now, so every other call skips the ThreadLocal. */
    private static final AtomicInteger signingIn = new AtomicInteger();
    private static final String SIGN_IN_PATH = "passport/";

    /** From the common-parameter handler, with the path of the request it's about to fill. */
    public static void requestPath(@Nullable String path) {
        try {
            mark(isSignIn(path) && Utils.getContext() != null && Settings.REGION_REQUEST_SPOOF.get());
        } catch (RuntimeException error) {
            Logger.printException(() -> "Region spoof could not read a request's path", error);
        }
    }

    /**
     * From the token interceptor, with the full URL of the request it's about to fill. It fills
     * common parameters of its own for the token heartbeat, token change and logout, which
     * never pass the handler's path read.
     */
    public static void requestUrl(@Nullable String url) {
        requestPath(pathOf(url));
    }

    /** The path of a URL, without its scheme, host, query or fragment. Null when it has none. */
    @Nullable
    static String pathOf(@Nullable String url) {
        if (url == null) return null;
        int scheme = url.indexOf("://");
        int start = scheme < 0 ? 0 : scheme + 3;
        // The host ends at the first slash, query or fragment. Only a slash starts a path.
        while (start < url.length() && "/?#".indexOf(url.charAt(start)) < 0) start++;
        if (start == url.length() || url.charAt(start) != '/') return null;
        int end = start;
        while (end < url.length() && "?#".indexOf(url.charAt(end)) < 0) end++;
        return url.substring(start, end);
    }

    /** From the common-parameter handler, once the request's parameters are built. */
    public static void requestDone() {
        mark(false);
    }

    private static void mark(boolean signIn) {
        if ((SIGN_IN.get() != null) == signIn) return;
        if (signIn) {
            SIGN_IN.set(Boolean.TRUE);
            signingIn.incrementAndGet();
        } else {
            SIGN_IN.remove();
            signingIn.decrementAndGet();
        }
    }

    /** TikTok's sign-in, sign-up and account verification endpoints all sit under /passport/. */
    static boolean isSignIn(@Nullable String path) {
        if (path == null) return false;
        int start = 0;
        while (start < path.length() && path.charAt(start) == '/') start++;
        return start > 0 && path.regionMatches(start, SIGN_IN_PATH, 0, SIGN_IN_PATH.length());
    }

    private static boolean signingIn() {
        return signingIn.get() > 0 && SIGN_IN.get() != null;
    }

    private static String selectedCountry() {
        return signingIn() ? "" : presetCountry();
    }

    private static String presetCountry() {
        if (Utils.getContext() == null || !Settings.SIM_SPOOF.get() || !Settings.REGION_SPOOF.get()) return "";
        String value = Settings.SIM_SPOOF_ISO.get();
        if (value == null) return "";
        String[] last = lastCountry;
        if (value.equals(last[0])) return last[1];
        String country = validCountry(value) ? value.trim().toUpperCase(Locale.ROOT) : "";
        lastCountry = new String[]{value, country};
        return country;
    }

    public static String country(String original) {
        String country = selectedCountry();
        return country.isEmpty() ? original : country;
    }

    public static String storeCountry(String original) {
        return Utils.getContext() != null && Settings.REGION_STORE_SPOOF.get() ? country(original) : original;
    }

    /*
     * The region fields AppLog's common-parameter builder puts on every request TikTok sends.
     * carrier_region, sys_region and region are the region hub's own answers, which the getter
     * hooks already turn into the preset, so they are only looked at here, never written.
     * current_region and residence are what TikTok's servers last told this phone, kept in its
     * preferences, and carrier_region_v2 is the network's country code (an MCC) read from the
     * system configuration. No getter hook reaches those three.
     */
    static final String[] SAVED_REGION_FIELDS = {"current_region", "residence"};
    static final String NETWORK_COUNTRY_FIELD = "carrier_region_v2";
    static final String[] HUB_REGION_FIELDS = {"carrier_region", "sys_region", "region"};
    private static volatile String lastRequestReport = "";

    /**
     * Called with the parameter map at the end of the builder. Only fields TikTok already put in
     * the map are changed: one it left out stays out.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void requestParams(Map params) {
        try {
            if (params == null || Utils.getContext() == null || !Settings.REGION_REQUEST_SPOOF.get()) return;
            if (signingIn()) {
                // A sign-in goes out with the fields TikTok set, so the account sees the real region.
                String preset = presetCountry();
                if (!preset.isEmpty()) report(params, preset, null);
                return;
            }
            String country = selectedCountry();
            if (country.isEmpty()) return;
            List<String> set = new ArrayList<>();
            for (String field : SAVED_REGION_FIELDS) {
                if (params.get(field) instanceof String) {
                    params.put(field, country);
                    set.add(field);
                }
            }
            Object network = params.get(NETWORK_COUNTRY_FIELD);
            String mcc = presetMcc();
            if (mcc != null && network instanceof String && isMcc((String) network)) {
                params.put(NETWORK_COUNTRY_FIELD, mcc);
                set.add(NETWORK_COUNTRY_FIELD);
            }
            report(params, country, set);
        } catch (RuntimeException error) {
            Logger.printException(() -> "Region spoof could not set a request's region fields", error);
        }
    }

    /** The first three digits of the SIM preset's operator code, or null when there isn't a usable one. */
    private static String presetMcc() {
        String code = Settings.SIMSPOOF_MCCMNC.get();
        if (code == null || !SpoofSimPatch.validMccMnc(code)) return null;
        return code.trim().substring(0, 3);
    }

    private static boolean isMcc(String value) {
        if (value.length() != 3) return false;
        for (int index = 0; index < 3; index++) {
            if (value.charAt(index) < '0' || value.charAt(index) > '9') return false;
        }
        return true;
    }

    /*
     * One debug line each time the outcome changes, not one per request. It names fields and says
     * whether the hub's fields already carry the preset, and never prints a value the phone had
     * before, since that is the real region. A null set is a sign-in request, where nothing is set
     * and every region field is looked at.
     */
    @SuppressWarnings("rawtypes")
    private static void report(Map params, String country, @Nullable List<String> set) {
        if (!BaseSettings.DEBUG.get()) return;
        List<String> matching = new ArrayList<>();
        List<String> other = new ArrayList<>();
        List<String> fields = new ArrayList<>(Arrays.asList(HUB_REGION_FIELDS));
        if (set == null) fields.addAll(Arrays.asList(SAVED_REGION_FIELDS));
        for (String field : fields) {
            Object value = params.get(field);
            if (!(value instanceof String)) continue;
            (country.equalsIgnoreCase((String) value) ? matching : other).add(field);
        }
        String line = set == null
                ? "Sign-in request region fields left as TikTok set them for " + country
                        + ". Still the preset " + matching + ", something else " + other
                : "Request region fields for " + country + ". Set to the preset " + set
                        + ", already the preset " + matching + ", something else " + other;
        if (line.equals(lastRequestReport)) return;
        lastRequestReport = line;
        Logger.printDebug(() -> line);
    }

    public static Locale locale(Locale original) {
        String country = selectedCountry();
        if (original == null || country.isEmpty() || country.equals(original.getCountry())) return original;
        LocaleAnswer last = lastLocale;
        if (last != null && last.country.equals(country)
                && (last.original == original || last.original.equals(original))) {
            return last.answer;
        }
        Locale answer = withCountry(original, country);
        lastLocale = new LocaleAnswer(original, country, answer);
        return answer;
    }

    private static Locale withCountry(Locale original, String country) {
        try {
            return new Locale.Builder().setLocale(original).setRegion(country).build();
        } catch (java.util.IllformedLocaleException error) {
            // Legacy variants can be invalid BCP 47. Keep the other locale fields intact.
            try {
                Locale.Builder builder = new Locale.Builder().setLanguage(original.getLanguage())
                        .setScript(original.getScript()).setRegion(country);
                for (Character key : original.getExtensionKeys()) {
                    builder.setExtension(key, original.getExtension(key));
                }
                return builder.build();
            } catch (java.util.IllformedLocaleException invalidLanguage) {
                return original;
            }
        }
    }

    public static TimeZone timeZone(TimeZone original) {
        String country = selectedCountry();
        if (original == null || country.isEmpty()) return original;
        Object[] last = lastZone;
        TimeZone zone;
        if (country.equals(last[0])) {
            zone = (TimeZone) last[1];
        } else {
            zone = zoneOf(country);
            lastZone = new Object[]{country, zone};
        }
        // A copy each time, as TimeZone.getDefault() gives: a TimeZone can be changed by whoever
        // holds it, and the kept one is shared by every caller.
        return zone == null ? original : (TimeZone) zone.clone();
    }

    private static TimeZone zoneOf(String country) {
        for (SimPreset preset : SimPresets.PRESETS) {
            if (country.equalsIgnoreCase(preset.iso)) return TimeZone.getTimeZone(preset.timeZone);
        }
        if (Build.VERSION.SDK_INT >= 24) {
            String[] zones = android.icu.util.TimeZone.getAvailableIDs(country);
            if (zones.length > 0) return TimeZone.getTimeZone(zones[0]);
        }
        return null;
    }
}
