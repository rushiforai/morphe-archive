package defpackage;

import android.graphics.PathMeasure;
import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.drew.imaging.riff.pvS.uuLAxLN;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class b18 extends co6 implements m45 {
    public static final b18 b;
    public static final b18 c;
    public static final b18 d;
    public static final b18 e;
    public static final b18 f;
    public static final b18 g;
    public static final b18 h;
    public static final b18 i;
    public static final b18 j;
    public static final b18 k;
    public static final b18 l;
    public static final b18 m;
    public static final b18 n;
    public static final b18 o;
    public static final b18 p;
    public static final b18 q;
    public static final b18 r;
    public static final b18 s;
    public static final b18 t;
    public static final b18 u;
    public final /* synthetic */ int a;

    static {
        int i2 = 0;
        b = new b18(i2, 0);
        c = new b18(i2, 1);
        d = new b18(i2, 2);
        e = new b18(i2, 3);
        f = new b18(i2, 4);
        g = new b18(i2, 5);
        h = new b18(i2, 6);
        i = new b18(i2, 7);
        j = new b18(i2, 8);
        k = new b18(i2, 9);
        l = new b18(i2, 10);
        m = new b18(i2, 11);
        n = new b18(i2, 12);
        o = new b18(i2, 13);
        p = new b18(i2, 14);
        q = new b18(i2, 15);
        r = new b18(i2, 16);
        s = new b18(i2, 17);
        t = new b18(i2, 18);
        u = new b18(i2, 19);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b18(u77 u77Var) {
        super(0);
        this.a = 20;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        switch (this.a) {
            case 0:
                return "Internal I/O operation failed";
            case 1:
                return "Can't move data from a null directory";
            case 2:
                return "Can't move data to a null directory";
            case 3:
                return new cr(new PathMeasure());
            case 4:
            case 5:
                return null;
            case 6:
                return qo7.q("_currency", "_valueToSum", "fb_availability", "fb_body_style", "fb_checkin_date", "fb_checkout_date", "fb_city", "fb_condition_of_vehicle", "fb_content_ids", "fb_content_type", "fb_contents", "fb_country", "fb_currency", "fb_delivery_category", "fb_departing_arrival_date", "fb_departing_departure_date", "fb_destination_airport", "fb_destination_ids", "fb_dma_code", "fb_drivetrain", "fb_exterior_color", "fb_fuel_type", "fb_hotel_score", "fb_interior_color", "fb_lease_end_date", "fb_lease_start_date", "fb_listing_type", "fb_make", "fb_mileage.unit", "fb_mileage.value", "fb_model", "fb_neighborhood", "fb_num_adults", "fb_num_children", "fb_num_infants", "fb_num_items", "fb_order_id", "fb_origin_airport", "fb_postal_code", "fb_predicted_ltv", "fb_preferred_baths_range", "fb_preferred_beds_range", "fb_preferred_neighborhoods", "fb_preferred_num_stops", "fb_preferred_price_range", "fb_preferred_star_ratings", "fb_price", "fb_property_type", "fb_region", "fb_returning_arrival_date", "fb_returning_departure_date", "fb_state_of_vehicle", "fb_suggested_destinations", "fb_suggested_home_listings", "fb_suggested_hotels", "fb_suggested_jobs", "fb_suggested_local_service_businesses", "fb_suggested_location_based_items", "fb_suggested_vehicles", "fb_transmission", "fb_travel_class", "fb_travel_end", "fb_travel_start", "fb_trim", "fb_user_bucket", "fb_value", "fb_vin", "fb_year", "lead_event_source", "predicted_ltv", "product_catalog_id", "app_user_id", "appVersion", "_eventName", "_eventName_md5", "_implicitlyLogged", "_inBackground", "_isTimedEvent", "_logTime", "_session_id", "_ui", "_valueToUpdate", "_is_fb_codeless", "_is_suggested_event", "_fb_pixel_referral_id", "fb_pixel_id", "trace_id", "subscription_id", "event_id", "_restrictedParams", aJzfoQ.klvSrrxUlFXyyPz, "purchase_valid_result_type", "core_lib_included", "login_lib_included", "share_lib_included", "place_lib_included", "messenger_lib_included", "applinks_lib_included", "marketing_lib_included", "_codeless_action", "sdk_initialized", "billing_client_lib_included", "billing_service_lib_included", "user_data_keys", "device_push_token", "fb_mobile_pckg_fp", "fb_mobile_app_cert_hash", "aggregate_id", "anonymous_id", "campaign_ids", "fb_post_attachment", aJzfoQ.xYwipFQDCYc, "ad_type", "fb_content", "fb_content_id", "fb_description", "fb_level", "fb_max_rating_value", "fb_payment_info_available", "fb_registration_method", "fb_success", "pm", "_audiencePropertyIds", "cs_maca");
            case 7:
                return new SecureRandom();
            case 8:
                return new rz5(19);
            case 9:
                return "Cannot generate SHA-256 hash.";
            case 10:
                return "Thread was unable to set its own interrupted state";
            case 11:
                return "Uncaught exception during the task execution";
            case 12:
                return "Thread was unable to set its own interrupted state";
            case 13:
                return "Thread tried to sleep for a negative amount of time";
            case 14:
                return "Datadog has not been initialized.";
            case 15:
                return c1e.a;
            case 16:
                return "Can't wipe data from a null directory";
            case 17:
                return "Error cancelling the UploadWorker";
            case 18:
                return "UploadWorker was scheduled.";
            case 19:
                return uuLAxLN.tWYN;
            default:
                return String.format(Locale.US, "Error serializing %s model", Arrays.copyOf(new Object[]{u77.class.getSimpleName()}, 1));
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b18(int i2, int i3) {
        super(i2);
        this.a = i3;
    }
}
