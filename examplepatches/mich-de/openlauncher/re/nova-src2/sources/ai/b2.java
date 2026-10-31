package ai;

import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.os.Bundle;
import android.text.TextUtils;
import b.kc;
import com.amplitude.android.Amplitude;
import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import com.instabridge.ai.tools.SharedPreferencesToolRegistrationStateStore;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Collections;
import java.util.HashSet;

/* loaded from: classes3.dex */
public abstract class b2 {

    /* renamed from: a, reason: collision with root package name */
    public static final String[] f12854a = {"ad_activeview", "ad_click", "ad_exposure", "ad_query", "ad_reward", "adunit_exposure", "app_clear_data", "app_exception", "app_remove", "app_store_refund", "app_store_subscription_cancel", "app_store_subscription_convert", "app_store_subscription_renew", "app_upgrade", "app_update", "ga_campaign", "error", "first_open", "first_visit", "in_app_purchase", "notification_dismiss", "notification_foreground", "notification_open", "notification_receive", "os_update", Amplitude.START_SESSION_EVENT, "session_start_with_rollout", "user_engagement", "ad_impression", "screen_view", "ga_extra_parameter", "app_background", "firebase_campaign"};

    /* renamed from: b, reason: collision with root package name */
    public static final String[] f12855b = {"ad_impression"};

    /* renamed from: c, reason: collision with root package name */
    public static final String[] f12856c = {"ad_impression", "in_app_purchase"};

    /* renamed from: d, reason: collision with root package name */
    public static final String[] f12857d = {"ad_impression"};

    /* renamed from: e, reason: collision with root package name */
    public static final String[] f12858e = {"ad_impression", "in_app_purchase"};

    /* renamed from: f, reason: collision with root package name */
    public static final String[] f12859f = {"_aa", "_ac", "_xa", "_aq", "_ar", "_xu", "_cd", "_ae", "_ui", "app_store_refund", "app_store_subscription_cancel", "app_store_subscription_convert", "app_store_subscription_renew", "_ug", "_au", "_cmp", "_err", "_f", "_v", "_iap", "_nd", "_nf", "_no", "_nr", "_ou", "_s", "_ssr", "_e", "_ai", "_vs", "_ep", "_ab", "_cmp"};

    /* renamed from: g, reason: collision with root package name */
    public static final String[] f12860g = {"purchase", "refund", "add_payment_info", "add_shipping_info", "add_to_cart", "add_to_wishlist", "begin_checkout", "remove_from_cart", "select_item", "select_promotion", "view_cart", "view_item", "view_item_list", "view_promotion", "ecommerce_purchase", "purchase_refund", "set_checkout_option", "checkout_progress", "select_content", "view_search_results"};

    /* renamed from: h, reason: collision with root package name */
    public static final String[] f12861h = {"ga_conversion", "engagement_time_msec", "exposure_time", "ad_event_id", MolocoMediationAdapter.KEY_AD_UNIT_ID, "ga_error", "ga_error_value", "ga_error_length", "ga_event_origin", "ga_screen", "ga_screen_class", "ga_screen_id", "ga_previous_screen", "ga_previous_class", "ga_previous_id", "manual_tracking", "message_device_time", "message_id", "message_name", "message_time", "message_tracking_id", "message_type", "previous_app_version", "previous_os_version", "topic", "update_with_analytics", "previous_first_open_count", "system_app", "system_app_update", "previous_install_count", "ga_event_id", "ga_extra_params_ct", "ga_group_name", "ga_list_length", "ga_index", "ga_event_name", "campaign_info_source", "cached_campaign", "deferred_analytics_collection", "ga_session_number", "ga_session_id", "campaign_extra_referrer", "app_in_background", "firebase_feature_rollouts", "customer_type", "firebase_conversion", "firebase_error", "firebase_error_value", "firebase_error_length", "firebase_event_origin", "firebase_screen", "firebase_screen_class", "firebase_screen_id", "firebase_previous_screen", "firebase_previous_class", "firebase_previous_id", "session_number", SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID};

    /* renamed from: i, reason: collision with root package name */
    public static final String[] f12862i = {"_c", "_et", "_xt", "_aeid", "_ai", "_err", "_ev", "_el", "_o", "_sn", "_sc", "_si", "_pn", "_pc", "_pi", "_mst", "_ndt", "_nmid", "_nmn", "_nmt", "_nmtid", "_nmc", "_pv", "_po", "_nt", "_uwa", "_pfo", "_sys", "_sysu", "_pin", "_eid", "_epc", "_gn", "_ll", "_i", "_en", "_cis", "_cc", "_dac", "_sno", "_sid", "_cer", "_aib", "_ffr", "_ct", "_c", "_err", "_ev", "_el", "_o", "_sn", "_sc", "_si", "_pn", "_pc", "_pi", "_sno", "_sid"};

    /* renamed from: j, reason: collision with root package name */
    public static final String[] f12863j = {"items"};

    /* renamed from: k, reason: collision with root package name */
    public static final String[] f12864k = {"affiliation", "coupon", "creative_name", "creative_slot", TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, "_ct", "discount", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "item_id", "item_brand", "item_category", "item_category2", "item_category3", "item_category4", "item_category5", "item_list_name", "item_list_id", "item_name", "item_variant", "location_id", "payment_type", "price", "promotion_id", "promotion_name", "quantity", "shipping", "shipping_tier", "tax", "transaction_id", "value", "item_list", "checkout_step", "checkout_option", "item_location_id"};

    /* renamed from: l, reason: collision with root package name */
    public static final String[] f12865l = {"firebase_last_notification", "first_open_time", "first_visit_time", "last_deep_link_referrer", "user_id", "last_advertising_id_reset", "first_open_after_install", "lifetime_user_engagement", "session_user_engagement", "non_personalized_ads", "ga_session_number", "ga_session_id", "last_gclid", "session_number", SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID};

    /* renamed from: m, reason: collision with root package name */
    public static final String[] f12866m = {"_ln", "_fot", "_fvt", "_ldl", "_id", "_lair", "_fi", "_lte", "_se", "_npa", "_sno", "_sid", "_lgclid", "_sno", "_sid"};
    public static kc n;

    public static String a(Context context) {
        try {
            return context.getResources().getResourcePackageName(2132017653);
        } catch (Resources.NotFoundException unused) {
            return context.getPackageName();
        }
    }

    public static String b(Context context, String str) {
        sg.w.h(context);
        Resources resources = context.getResources();
        if (TextUtils.isEmpty(str)) {
            str = a(context);
        }
        int identifier = resources.getIdentifier("google_app_id", "string", str);
        if (identifier == 0) {
            return null;
        }
        try {
            return resources.getString(identifier);
        } catch (Resources.NotFoundException unused) {
            return null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x003e  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0082 A[Catch: SQLiteException -> 0x00b7, TryCatch #1 {SQLiteException -> 0x00b7, blocks: (B:26:0x0044, B:28:0x0074, B:30:0x0082, B:32:0x008a, B:33:0x008d, B:34:0x00b6, B:38:0x00bc, B:40:0x00bf, B:42:0x00c7, B:43:0x00ce, B:44:0x00d1, B:46:0x00d7, B:49:0x00e6, B:50:0x00ea, B:27:0x006d), top: B:60:0x0044, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00bc A[Catch: SQLiteException -> 0x00b7, LOOP:1: B:38:0x00bc->B:43:0x00ce, LOOP_START, PHI: r1
      0x00bc: PHI (r1v5 int) = (r1v4 int), (r1v6 int) binds: [B:37:0x00ba, B:43:0x00ce] A[DONT_GENERATE, DONT_INLINE], TryCatch #1 {SQLiteException -> 0x00b7, blocks: (B:26:0x0044, B:28:0x0074, B:30:0x0082, B:32:0x008a, B:33:0x008d, B:34:0x00b6, B:38:0x00bc, B:40:0x00bf, B:42:0x00c7, B:43:0x00ce, B:44:0x00d1, B:46:0x00d7, B:49:0x00e6, B:50:0x00ea, B:27:0x006d), top: B:60:0x0044, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00d7 A[Catch: SQLiteException -> 0x00b7, TryCatch #1 {SQLiteException -> 0x00b7, blocks: (B:26:0x0044, B:28:0x0074, B:30:0x0082, B:32:0x008a, B:33:0x008d, B:34:0x00b6, B:38:0x00bc, B:40:0x00bf, B:42:0x00c7, B:43:0x00ce, B:44:0x00d1, B:46:0x00d7, B:49:0x00e6, B:50:0x00ea, B:27:0x006d), top: B:60:0x0044, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:73:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:74:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void c(o0 o0Var, SQLiteDatabase sQLiteDatabase, String str, String str2, String str3, String[] strArr) throws Throwable {
        SQLiteDatabase sQLiteDatabase2;
        Throwable th2;
        Cursor cursorQuery;
        HashSet hashSet;
        Cursor cursorRawQuery;
        boolean zMoveToFirst;
        if (o0Var == null) {
            throw new IllegalArgumentException("Monitor must not be null");
        }
        Cursor cursor = null;
        try {
            try {
                sQLiteDatabase2 = sQLiteDatabase;
            } catch (Throwable th3) {
                th2 = th3;
                if (cursor != null) {
                }
            }
        } catch (SQLiteException e3) {
            e = e3;
            sQLiteDatabase2 = sQLiteDatabase;
        }
        try {
            try {
                try {
                    cursorQuery = sQLiteDatabase2.query("SQLITE_MASTER", new String[]{PendingUpgradeStore.KEY_NAME}, "name=?", new String[]{str}, null, null, null);
                    try {
                        try {
                            zMoveToFirst = cursorQuery.moveToFirst();
                            cursorQuery.close();
                        } catch (SQLiteException e11) {
                            e = e11;
                            o0Var.f13193i.c(str, "Error querying for table", e);
                            if (cursorQuery != null) {
                                cursorQuery.close();
                            }
                            sQLiteDatabase2.execSQL(str2);
                            hashSet = new HashSet();
                            StringBuilder sb2 = new StringBuilder(str.length() + 22);
                            sb2.append("SELECT * FROM ");
                            sb2.append(str);
                            sb2.append(" LIMIT 0");
                            cursorRawQuery = sQLiteDatabase2.rawQuery(sb2.toString(), null);
                            Collections.addAll(hashSet, cursorRawQuery.getColumnNames());
                            cursorRawQuery.close();
                            while (i < r0) {
                            }
                            if (strArr != null) {
                            }
                            if (hashSet.isEmpty()) {
                            }
                        }
                    } catch (Throwable th4) {
                        th2 = th4;
                        cursor = cursorQuery;
                        if (cursor != null) {
                            throw th2;
                        }
                        cursor.close();
                        throw th2;
                    }
                } catch (SQLiteException e12) {
                    e = e12;
                    cursorQuery = null;
                    o0Var.f13193i.c(str, "Error querying for table", e);
                    if (cursorQuery != null) {
                    }
                    sQLiteDatabase2.execSQL(str2);
                    hashSet = new HashSet();
                    StringBuilder sb22 = new StringBuilder(str.length() + 22);
                    sb22.append("SELECT * FROM ");
                    sb22.append(str);
                    sb22.append(" LIMIT 0");
                    cursorRawQuery = sQLiteDatabase2.rawQuery(sb22.toString(), null);
                    Collections.addAll(hashSet, cursorRawQuery.getColumnNames());
                    cursorRawQuery.close();
                    while (i < r0) {
                    }
                    if (strArr != null) {
                    }
                    if (hashSet.isEmpty()) {
                    }
                }
                Collections.addAll(hashSet, cursorRawQuery.getColumnNames());
                cursorRawQuery.close();
                for (String str4 : str3.split(",")) {
                    if (!hashSet.remove(str4)) {
                        StringBuilder sb3 = new StringBuilder(str.length() + 35 + String.valueOf(str4).length());
                        sb3.append("Table ");
                        sb3.append(str);
                        sb3.append(" is missing required column: ");
                        sb3.append(str4);
                        throw new SQLiteException(sb3.toString());
                    }
                }
                if (strArr != null) {
                    for (int i5 = 0; i5 < strArr.length; i5 += 2) {
                        if (!hashSet.remove(strArr[i5])) {
                            sQLiteDatabase2.execSQL(strArr[i5 + 1]);
                        }
                    }
                }
                if (hashSet.isEmpty()) {
                    return;
                }
                o0Var.f13193i.c(str, "Table has extra columns. table, columns", TextUtils.join(", ", hashSet));
                return;
            } catch (Throwable th5) {
                cursorRawQuery.close();
                throw th5;
            }
            hashSet = new HashSet();
            StringBuilder sb222 = new StringBuilder(str.length() + 22);
            sb222.append("SELECT * FROM ");
            sb222.append(str);
            sb222.append(" LIMIT 0");
            cursorRawQuery = sQLiteDatabase2.rawQuery(sb222.toString(), null);
        } catch (SQLiteException e13) {
            o0Var.f13190f.b(str, "Failed to verify columns on table that was just created");
            throw e13;
        }
        if (!zMoveToFirst) {
            sQLiteDatabase2.execSQL(str2);
        }
    }

    public static void d(Bundle bundle, Object obj) {
        if (obj instanceof Double) {
            bundle.putDouble("value", ((Double) obj).doubleValue());
        } else if (obj instanceof Long) {
            bundle.putLong("value", ((Long) obj).longValue());
        } else {
            bundle.putString("value", obj.toString());
        }
    }

    public static Object e(Bundle bundle, String str, Class cls, Object obj) {
        Object obj2 = bundle.get(str);
        if (obj2 == null) {
            return obj;
        }
        if (cls.isAssignableFrom(obj2.getClass())) {
            return obj2;
        }
        String canonicalName = cls.getCanonicalName();
        throw new IllegalStateException(b.c0.q(b.c0.w("Invalid conditional user property field type. '", str, "' expected [", canonicalName, "] but was ["), obj2.getClass().getCanonicalName(), "]"));
    }

    public static Object f(Object obj) throws Throwable {
        Throwable th2;
        ObjectInputStream objectInputStream;
        ObjectOutputStream objectOutputStream;
        try {
            if (obj != null) {
                try {
                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                    objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
                    try {
                        objectOutputStream.writeObject(obj);
                        objectOutputStream.flush();
                        objectInputStream = new ObjectInputStream(new ByteArrayInputStream(byteArrayOutputStream.toByteArray()));
                        try {
                            Object object = objectInputStream.readObject();
                            objectOutputStream.close();
                            objectInputStream.close();
                            return object;
                        } catch (Throwable th3) {
                            th2 = th3;
                            if (objectOutputStream != null) {
                                objectOutputStream.close();
                            }
                            if (objectInputStream == null) {
                                throw th2;
                            }
                            objectInputStream.close();
                            throw th2;
                        }
                    } catch (Throwable th4) {
                        th2 = th4;
                        objectInputStream = null;
                    }
                } catch (Throwable th5) {
                    th2 = th5;
                    objectInputStream = null;
                    objectOutputStream = null;
                }
            }
        } catch (IOException | ClassNotFoundException unused) {
        }
        return null;
    }

    public static void g(o0 o0Var, SQLiteDatabase sQLiteDatabase) {
        if (o0Var == null) {
            throw new IllegalArgumentException("Monitor must not be null");
        }
        m0 m0Var = o0Var.f13193i;
        File file = new File(sQLiteDatabase.getPath());
        if (!file.setReadable(false, false)) {
            m0Var.a("Failed to turn off database read permission");
        }
        if (!file.setWritable(false, false)) {
            m0Var.a("Failed to turn off database write permission");
        }
        if (!file.setReadable(true, true)) {
            m0Var.a("Failed to turn on database read permission for owner");
        }
        if (file.setWritable(true, true)) {
            return;
        }
        m0Var.a("Failed to turn on database write permission for owner");
    }

    public static final Boolean h(Resources resources, String str) {
        int identifier = resources.getIdentifier("google_analytics_force_disable_updates", "bool", str);
        if (identifier == 0) {
            return null;
        }
        try {
            return Boolean.valueOf(resources.getBoolean(identifier));
        } catch (Resources.NotFoundException unused) {
            return null;
        }
    }

    public static String i(String str, String[] strArr, String[] strArr2) {
        int iMin = Math.min(strArr.length, strArr2.length);
        for (int i5 = 0; i5 < iMin; i5++) {
            String str2 = strArr[i5];
            if ((str == null && str2 == null) || (str != null && str.equals(str2))) {
                return strArr2[i5];
            }
        }
        return null;
    }
}
