package app.jofslash.extension.booking;

import android.Manifest;
import android.app.Activity;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;

/**
 * Used by the Price watch patch. The user turns the watch on per stay (hotel, dates, adults, rooms)
 * on the Price watch tab. Once a day, on an unmetered network and with the battery not low, a
 * {@link PriceWatchJob} asks Booking.com for the price of each watched stay with the request the
 * property page makes (mobile.hotelPage, through the app's own OkHttp client, so it carries the
 * app's headers, sign-in and request signature), saves it with the other saved prices and notifies
 * when it dropped.
 *
 * <p>Nothing is fetched until the user watches a stay, at most {@link #MAX_WATCHES} stays can be
 * watched and each one is fetched at most once per {@link #MIN_INTERVAL_MS}.
 */
public final class PriceWatch {
    private PriceWatch() {
    }

    static final int MAX_WATCHES = 20;
    /** A watch isn't checked again sooner than this, even when the job runs more often. */
    static final long MIN_INTERVAL_MS = 20L * 60 * 60 * 1000;
    private static final long DAY_MS = 24L * 60 * 60 * 1000;
    /** "jofw" in ASCII, far from the small ids WorkManager gives its own jobs. */
    static final int JOB_ID = 0x6A6F6677;
    static final String CHANNEL_ID = "jofslash_price_drops";
    /** The debug broadcast (adb only: the receiver needs android.permission.DUMP). */
    public static final String ACTION_CHECK_NOW = "app.jofslash.booking.PRICE_WATCH_NOW";

    static final String STATUS_OK = "ok";
    static final String STATUS_SOLD_OUT = "sold_out";
    static final String STATUS_NO_PRICE = "no_price";
    static final String STATUS_ERROR = "error";

    /** A drop smaller than this share of the old price isn't worth a notification. */
    private static final double MIN_DROP_SHARE = 0.01;

    /** The fixed parameters of the property page's mobile.hotelPage request (HotelPageRequestBuilder). */
    private static final String FIXED_PARAMS = ""
            + "include_missing_survey_check=1&detail_level=1&show_deals=flash%2Clastm%2Csmart%2Cgenius&"
            + "include_taxes=1&show_extra_charges=1&include_price_warnings=1&include_just_booked=1&"
            + "include_mealplan=1&change_struct_rooms=1&show_price_with_no_genius=1&no_html=1&"
            + "show_future_flash_deal_dates=1&show_flash_deal_percentages=1&show_lastm_deal_percentages=1&"
            + "include_smoking_status=1&use_direct_payment=1&show_if_can_reserve_free_parking=1&"
            + "include_value_for_money_price=1&use_new_image_service=1&show_occupancy_for_price=1&"
            + "show_if_no_cc_allowed=2&show_if_class_is_estimated=1&show_max_children_free=1&"
            + "show_max_children_free_age=1&include_soldout_rooms=1&include_room_highlights=1&"
            + "include_room_size_highlight=0&show_meta_mealplans=1&apass_opt_in=1&incl_block_time_targeting=1&"
            + "selling_out_in_budget=1&pod_separate_policies_from_title=1&include_cpv2_for_room=1&"
            + "show_if_domestic_no_cc=1&show_roomtype=1&include_breakfast_price=1&show_if_domestic_rate=1&"
            + "include_room_size_average=1&include_ufi_room_size_average=1&show_high_demand_rooms=1&"
            + "include_nr_bookings_best_range_message=1&include_nr_bookings_today=1&"
            + "app_supports_custom_policies=1&facility_info_format=1&include_cancellation_special_condition=1&"
            + "add_chains_info=1&include_alternate_av_for_soldout_hotels=1&dotd=2&show_if_can_checkin_today=1&"
            + "show_if_in_real_heart=1&show_room_review_score=1&include_apt_config=1&include_highlight_strip=1&"
            + "pod_low_rate_copy=1&include_paymentterms=1&partially_refundable=1&add_genius_percentage_value=1&"
            + "get_rare_find_state=1&check_excluded_charge_or_tax=1&include_rl_use_block_filter=1&"
            + "include_payment_product=1&fix_max_children_age_zero=1&include_bwallet_room_eligibility=1&"
            + "rename_cancellation=1&show_house_rules_bp=1&include_cancellation_timeline=1&"
            + "include_prepayment_timeline=1&include_genius_benefits_per_placement=1&pss_just_booked_api=1&"
            + "show_if_mobile_deal=1&show_if_china_pos=1&just_booked_threshold_v=1&show_checkin_instructions=1&"
            + "include_facility_type=1&show_if_rare_find=1&just_booked_for_dates=1&upsort_refundable_ml=1&"
            + "meal_info_details=1&indicate_booked_block=2&include_detail_mealplan=1&highlight_private_bathroom=1&"
            + "include_gender_restriction=1&include_bh_quality_classification=1&include_tax_exception=1&"
            + "include_genius_benefits_list=1&include_excluded_charges_detail=1&include_bsb_offer=1&"
            + "include_child_policies_text=1&add_inclusion=1&include_composite_breakdown=1&"
            + "include_badges_in_price_breakdown=1&include_genius_badge=1&include_temporarily_closed_facilities=1&"
            + "include_sustainability=1&blackout_old_breakdown=1&include_is_block_fit=1&include_num_ceb_available=1&"
            + "include_bed_prices_in_user_currency=1&include_has_theme_park_benefits=1&include_decoupling_keys=1&"
            + "new_sustainability=1&hotelpage_handle_soldout_cases=1&include_popular_facilities=1";

    private static Boolean available;

    /**
     * Called from the property page's constructor: the Price watch button and tab, and keeps the
     * daily job scheduled while stays are watched.
     */
    public static void onPropertyPage(Activity activity) {
        PropertyPageButton.attach(activity, false, true, false);
        // The activity has no context yet while it is being constructed.
        keepScheduled(PriceRecorder.currentApplication());
    }

    /**
     * Called from BookingApplication.onCreate: an app update can drop the job, so schedule it
     * again at start, not only when a hotel is opened. Does nothing when no stay is watched.
     */
    public static void onAppStart(Context context) {
        keepScheduled(context);
    }

    private static void keepScheduled(final Context context) {
        if (context == null) return;
        new Thread(() -> {
            try {
                // No database yet: nothing was ever saved or watched, don't create one.
                if (!context.getDatabasePath(PriceDb.NAME).exists()) return;
                if (isAvailable(context)) updateSchedule(context);
            } catch (Throwable t) {
                Log.w(HotelInfo.TAG, "Price watch: couldn't schedule", t);
            }
        }, "jofslash-price-watch").start();
    }

    /** True when the Price watch patch is on: only then is its job service in the manifest. */
    static synchronized boolean isAvailable(Context context) {
        if (available == null) {
            try {
                context.getPackageManager().getServiceInfo(new ComponentName(context, PriceWatchJob.class), 0);
                available = true;
            } catch (PackageManager.NameNotFoundException e) {
                available = false;
            }
        }
        return available;
    }

    /** Schedules the daily job when stays are watched and cancels it when none are. */
    static void updateSchedule(Context context) {
        JobScheduler scheduler = (JobScheduler) context.getSystemService(Context.JOB_SCHEDULER_SERVICE);
        if (scheduler == null) return;
        int count = PriceDb.get(context).watchCount();
        JobInfo pending = scheduler.getPendingJob(JOB_ID);
        if (count == 0) {
            if (pending != null) scheduler.cancel(JOB_ID);
            return;
        }
        // Already scheduled: leave it, so the next run keeps its time.
        if (pending != null && pending.isPeriodic() && pending.getIntervalMillis() == DAY_MS) return;
        JobInfo job = new JobInfo.Builder(JOB_ID, new ComponentName(context, PriceWatchJob.class))
                .setPeriodic(DAY_MS, 6L * 60 * 60 * 1000)
                .setRequiredNetworkType(JobInfo.NETWORK_TYPE_UNMETERED)
                .setRequiresBatteryNotLow(true)
                .setPersisted(true)
                .build();
        int result = scheduler.schedule(job);
        Log.i(HotelInfo.TAG, "Price watch: daily check scheduled (" + count + " stays), result " + result);
    }

    // ---------------------------------------------------------------------------------------
    // Watching and unwatching, from the Price watch tab

    /** Result of {@link #watch}. */
    static final int WATCH_OK = 0, WATCH_FULL = 1;

    /**
     * Watches the stay from [hotel]'s price. With [pagePrice] that price is the one the page
     * shows now, and it's saved as the first point of the watch's chart.
     */
    static int watch(Context context, HotelInfo hotel, Stay stay, boolean pagePrice) {
        PriceDb db = PriceDb.get(context);
        if (db.watch(hotel.id, stay) == null && db.watchCount() >= MAX_WATCHES) return WATCH_FULL;
        long now = System.currentTimeMillis();
        db.addWatch(hotel.id, hotel.name, stay, hotel.currency, hotel.price, now);
        if (pagePrice && hotel.hasPrice()) db.add(hotel, stay, PriceDb.SOURCE_WATCH, now, true);
        updateSchedule(context);
        Log.i(HotelInfo.TAG, "Price watch: watching hotel " + hotel.id + " " + stay);
        return WATCH_OK;
    }

    static void unwatch(Context context, int hotelId, Stay stay) {
        PriceDb.get(context).removeWatch(hotelId, stay);
        updateSchedule(context);
        Log.i(HotelInfo.TAG, "Price watch: stopped watching hotel " + hotelId + " " + stay);
    }

    static boolean notificationsAllowed(Context context) {
        if (Build.VERSION.SDK_INT >= 33
                && context.checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED) {
            return false;
        }
        NotificationManager nm = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (nm == null || !nm.areNotificationsEnabled()) return false;
        if (Build.VERSION.SDK_INT >= 26) {
            NotificationChannel channel = nm.getNotificationChannel(CHANNEL_ID);
            return channel == null || channel.getImportance() != NotificationManager.IMPORTANCE_NONE;
        }
        return true;
    }

    // ---------------------------------------------------------------------------------------
    // The check

    /** Stops a running check early (the job was stopped). */
    interface Cancel {
        boolean cancelled();
    }

    /**
     * Checks every watched stay that is due. Runs on a background thread. With [force] every
     * stay is checked again now; with [testDrop] each one is compared with a price 10% higher
     * than the last, so a notification shows even when the price didn't change.
     * Returns false when the app's network client wasn't ready, so the job should be retried.
     */
    static boolean check(Context context, boolean force, boolean testDrop, Cancel cancel) {
        PriceDb db = PriceDb.get(context);
        String today = new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date());
        int dropped = db.dropPastWatches(today);
        if (dropped > 0) Log.i(HotelInfo.TAG, "Price watch: dropped " + dropped + " stays that have begun");
        List<PriceDb.Watch> watches = db.watches();
        if (watches.isEmpty()) {
            updateSchedule(context);
            return true;
        }
        Object client = waitForClient(cancel);
        if (client == null) return false;
        String base;
        try {
            base = (String) Class.forName("com.booking.network.EndpointSettings").getMethod("getJsonUrl").invoke(null);
        } catch (Throwable t) {
            Log.w(HotelInfo.TAG, "Price watch: no endpoint", t);
            return false;
        }

        Random random = new Random();
        int requests = 0;
        long now = System.currentTimeMillis();
        for (PriceDb.Watch w : watches) {
            if (cancel.cancelled()) return true;
            if (!force && w.lastCheck > 0 && now - w.lastCheck < MIN_INTERVAL_MS) continue;
            if (requests >= MAX_WATCHES) break;
            if (requests > 0) {
                // One request at a time, a few seconds apart, like someone opening the hotels.
                try {
                    Thread.sleep(force ? 1500 + random.nextInt(1500) : 4000 + random.nextInt(8000));
                } catch (InterruptedException e) {
                    return true;
                }
            }
            requests++;
            checkOne(context, db, client, base, w, force, testDrop);
        }
        Log.i(HotelInfo.TAG, "Price watch: checked " + requests + " of " + watches.size() + " stays");
        return true;
    }

    private static Object waitForClient(Cancel cancel) {
        // The job can start the app's process; its network module is set up during start-up.
        for (int i = 0; i < 30 && !cancel.cancelled(); i++) {
            try {
                Class<?> module = Class.forName("com.booking.network.NetworkModule");
                Object instance = module.getField("INSTANCE").get(null);
                Object client = module.getMethod("getOkHttpClient").invoke(instance);
                if (client != null) return client;
            } catch (Throwable t) {
                if (i == 29) Log.w(HotelInfo.TAG, "Price watch: the app's network client isn't ready", t);
            }
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                return null;
            }
        }
        return null;
    }

    private static void checkOne(Context context, PriceDb db, Object client, String base, PriceDb.Watch w,
                                 boolean force, boolean testDrop) {
        long now = System.currentTimeMillis();
        PriceDb.Row before = db.latest(w.hotelId, w.stay, w.currency);
        double previous = before != null ? before.price : w.lastPrice;
        Fetched f;
        try {
            f = fetch(client, base, w);
        } catch (Throwable t) {
            Log.w(HotelInfo.TAG, "Price watch: request for hotel " + w.hotelId + " failed", t);
            f = new Fetched();
            f.status = STATUS_ERROR;
        }
        w.lastCheck = now;
        w.status = f.status;
        if (f.name != null && w.name == null) w.name = f.name;
        if (STATUS_OK.equals(f.status)) {
            w.lastPrice = f.price;
            db.add(HotelInfo.ofPrice(w.hotelId, w.name, f.price, f.strike, f.currency), w.stay,
                    PriceDb.SOURCE_WATCH, now, force);
            Log.i(HotelInfo.TAG, "Price watch: hotel " + w.hotelId + " " + w.stay + " costs " + f.price + " "
                    + f.currency + " (was " + previous + ")");
            if (testDrop) previous = (Double.isNaN(previous) ? f.price : previous) * 1.1;
            if (!Double.isNaN(previous) && f.price < previous - Math.max(0.5, previous * MIN_DROP_SHARE)) {
                notifyDrop(context, w, previous, f.price, f.currency);
            }
        } else {
            Log.i(HotelInfo.TAG, "Price watch: hotel " + w.hotelId + " " + w.stay + ": " + f.status);
        }
        db.updateWatch(w);
    }

    private static final class Fetched {
        String status;
        double price = Double.NaN;
        double strike = Double.NaN;
        String currency;
        String name;
    }

    /** The property page's mobile.hotelPage request for one stay, through the app's client. */
    private static Fetched fetch(Object client, String base, PriceDb.Watch w) throws Exception {
        Stay s = w.stay;
        StringBuilder url = new StringBuilder(base).append("/mobile.hotelPage?").append(FIXED_PARAMS)
                .append("&hotel_id=").append(w.hotelId)
                .append("&arrival_date=").append(s.checkIn)
                .append("&departure_date=").append(s.checkOut)
                .append("&recommend_for=").append(s.adults)
                .append("&rec_guest_qty=").append(s.adults)
                .append("&rec_room_qty=").append(s.rooms)
                .append("&units=metric")
                .append("&currency_code=").append(URLEncoder.encode(w.currency, "UTF-8"))
                .append("&flex2nonref=1&cur_page=hp&include_sleeping_clarity=1&include_rtb=1");

        Class<?> builderClass = Class.forName("okhttp3.Request$Builder");
        Object builder = builderClass.getConstructor().newInstance();
        builderClass.getMethod("url", String.class).invoke(builder, url.toString());
        builderClass.getMethod("header", String.class, String.class).invoke(builder, "Cache-Control", "no-cache");
        Object request = builderClass.getMethod("build").invoke(builder);
        Object call = Class.forName("okhttp3.OkHttpClient").getMethod("newCall", Class.forName("okhttp3.Request"))
                .invoke(client, request);
        Object response = Class.forName("okhttp3.Call").getMethod("execute").invoke(call);
        String text;
        int code;
        try {
            Class<?> responseClass = Class.forName("okhttp3.Response");
            code = (Integer) responseClass.getMethod("code").invoke(response);
            Object body = responseClass.getMethod("body").invoke(response);
            text = body == null ? null : (String) Class.forName("okhttp3.ResponseBody").getMethod("string").invoke(body);
        } finally {
            ((java.io.Closeable) response).close();
        }
        Fetched f = new Fetched();
        if (code != 200 || text == null) {
            Log.w(HotelInfo.TAG, "Price watch: HTTP " + code + " for hotel " + w.hotelId + ": " + snippet(text));
            f.status = STATUS_ERROR;
            return f;
        }
        return parse(text, w, f);
    }

    private static Fetched parse(String text, PriceDb.Watch w, Fetched f) throws Exception {
        String trimmed = text.trim();
        JSONObject hotel = null;
        if (trimmed.startsWith("[")) {
            JSONArray array = new JSONArray(trimmed);
            if (array.length() > 0) hotel = array.optJSONObject(0);
        } else if (trimmed.startsWith("{")) {
            JSONObject o = new JSONObject(trimmed);
            JSONArray array = o.optJSONArray("result");
            if (array == null) array = o.optJSONArray("data");
            hotel = array != null && array.length() > 0 ? array.optJSONObject(0) : o;
        }
        if (hotel == null) {
            Log.w(HotelInfo.TAG, "Price watch: unexpected answer for hotel " + w.hotelId + ": " + snippet(text));
            f.status = STATUS_ERROR;
            return f;
        }
        String name = hotel.optString("hotel_name", null);
        if (name != null && !name.isEmpty()) f.name = name;

        // The price of the stay for these guests, as the property page shows it.
        JSONObject breakdown = hotel.optJSONObject("composite_price_breakdown");
        if (breakdown != null && money(breakdown.optJSONObject("gross_amount"), f)) {
            JSONObject strike = breakdown.optJSONObject("strikethrough_amount");
            if (strike == null) strike = breakdown.optJSONObject("strikethrough_price");
            if (strike != null && f.currency.equals(strike.optString("currency")) && strike.optDouble("value", 0) > 0) {
                f.strike = strike.optDouble("value");
            }
            f.status = STATUS_OK;
            return f;
        }
        // Otherwise the cheapest room that fits the adults, which is the same price for one room.
        JSONArray blocks = hotel.optJSONArray("block");
        if (blocks != null && w.stay.rooms == 1) {
            Fetched best = null;
            for (int i = 0; i < blocks.length(); i++) {
                JSONObject block = blocks.optJSONObject(i);
                if (block == null) continue;
                int adults = block.optInt("nr_adults", w.stay.adults);
                JSONObject product = block.optJSONObject("product_price_breakdown");
                if (product == null || adults < w.stay.adults) continue;
                Fetched candidate = new Fetched();
                if (money(product.optJSONObject("gross_amount"), candidate)
                        && (best == null || candidate.price < best.price)) {
                    best = candidate;
                }
            }
            if (best != null) {
                f.price = best.price;
                f.currency = best.currency;
                f.status = STATUS_OK;
                return f;
            }
        }
        boolean soldOut = hotel.optInt("soldout", 0) == 1 || hotel.optBoolean("soldout", false)
                || (blocks != null && blocks.length() == 0);
        f.status = soldOut ? STATUS_SOLD_OUT : STATUS_NO_PRICE;
        if (!soldOut) {
            Log.w(HotelInfo.TAG, "Price watch: no price for hotel " + w.hotelId + ", keys " + hotel.names());
        }
        return f;
    }

    private static boolean money(JSONObject money, Fetched into) {
        if (money == null) return false;
        double value = money.optDouble("value", Double.NaN);
        String currency = money.optString("currency", "");
        if (!(value > 0) || currency.isEmpty()) return false;
        into.price = value;
        into.currency = currency;
        return true;
    }

    private static String snippet(String text) {
        if (text == null) return "null";
        return text.length() > 300 ? text.substring(0, 300) + "…" : text;
    }

    // ---------------------------------------------------------------------------------------
    // Notification

    /** booking://hotel/ID opens the property page for these dates and guests. */
    static Intent propertyPageIntent(Context context, int hotelId, Stay stay) {
        Uri uri = Uri.parse("booking://hotel/" + hotelId).buildUpon()
                .appendQueryParameter("checkin", stay.checkIn)
                .appendQueryParameter("checkout", stay.checkOut)
                .appendQueryParameter("numberOfGuests", String.valueOf(stay.adults))
                .appendQueryParameter("numberOfRooms", String.valueOf(stay.rooms))
                .build();
        Intent intent = new Intent(Intent.ACTION_VIEW, uri);
        intent.setPackage(context.getPackageName());
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        return intent;
    }

    private static void notifyDrop(Context context, PriceDb.Watch w, double was, double now, String currency) {
        if (!notificationsAllowed(context)) {
            Log.i(HotelInfo.TAG, "Price watch: price dropped but notifications are off");
            return;
        }
        NotificationManager nm = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (Build.VERSION.SDK_INT >= 26 && nm.getNotificationChannel(CHANNEL_ID) == null) {
            NotificationChannel channel = new NotificationChannel(CHANNEL_ID, Strings.WATCH_CHANNEL,
                    NotificationManager.IMPORTANCE_DEFAULT);
            channel.setDescription(Strings.WATCH_CHANNEL_DESCRIPTION);
            nm.createNotificationChannel(channel);
        }
        int id = (w.hotelId * 31 + w.stay.toString().hashCode()) | 0x10000;
        PendingIntent open = PendingIntent.getActivity(context, id, propertyPageIntent(context, w.hotelId, w.stay),
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        String title = String.format(Strings.WATCH_NOTIFY_TITLE, w.name != null ? w.name : Strings.WATCH_UNNAMED);
        String text = String.format(Strings.WATCH_NOTIFY_TEXT, Panel.money(now, currency), Panel.money(was, currency),
                Panel.stayText(w.stay));
        Notification.Builder b = Build.VERSION.SDK_INT >= 26
                ? new Notification.Builder(context, CHANNEL_ID)
                : new Notification.Builder(context);
        b.setSmallIcon(smallIcon(context))
                .setContentTitle(title)
                .setContentText(text)
                .setStyle(new Notification.BigTextStyle().bigText(text))
                .setContentIntent(open)
                .setAutoCancel(true)
                .setWhen(System.currentTimeMillis())
                .setShowWhen(true);
        try {
            nm.notify("jofslash_price_watch", id, b.build());
            Log.i(HotelInfo.TAG, "Price watch: notified a drop for hotel " + w.hotelId);
        } catch (SecurityException e) {
            Log.w(HotelInfo.TAG, "Price watch: not allowed to notify", e);
        }
    }

    /** The app's own notification icon, or its launcher icon. */
    private static int smallIcon(Context context) {
        int id = context.getResources().getIdentifier("notification_icon_variant", "drawable", context.getPackageName());
        return id != 0 ? id : context.getApplicationInfo().icon;
    }
}
