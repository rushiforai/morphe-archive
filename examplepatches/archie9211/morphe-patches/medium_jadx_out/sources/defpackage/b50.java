package defpackage;

import java.util.ArrayList;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class b50 {
    public static final Map a;
    public static final Map b;
    public static final Map c;

    static {
        q40 q40Var = q40.ANON_ID;
        v92 v92Var = v92.USER_DATA;
        f09 f09Var = new f09(q40Var, new x40(v92Var, w92.ANON_ID));
        f09 f09Var2 = new f09(q40.APP_USER_ID, new x40(v92Var, w92.FB_LOGIN_ID));
        f09 f09Var3 = new f09(q40.ADVERTISER_ID, new x40(v92Var, w92.MAD_ID));
        f09 f09Var4 = new f09(q40.PAGE_ID, new x40(v92Var, w92.PAGE_ID));
        f09 f09Var5 = new f09(q40.PAGE_SCOPED_USER_ID, new x40(v92Var, w92.PAGE_SCOPED_USER_ID));
        q40 q40Var2 = q40.ADV_TE;
        v92 v92Var2 = v92.APP_DATA;
        a = ei7.Q(f09Var, f09Var2, f09Var3, f09Var4, f09Var5, new f09(q40Var2, new x40(v92Var2, w92.ADV_TE)), new f09(q40.APP_TE, new x40(v92Var2, w92.APP_TE)), new f09(q40.CONSIDER_VIEWS, new x40(v92Var2, w92.CONSIDER_VIEWS)), new f09(q40.DEVICE_TOKEN, new x40(v92Var2, w92.DEVICE_TOKEN)), new f09(q40.EXT_INFO, new x40(v92Var2, w92.EXT_INFO)), new f09(q40.INCLUDE_DWELL_DATA, new x40(v92Var2, w92.INCLUDE_DWELL_DATA)), new f09(q40.INCLUDE_VIDEO_DATA, new x40(v92Var2, w92.INCLUDE_VIDEO_DATA)), new f09(q40.INSTALL_REFERRER, new x40(v92Var2, w92.INSTALL_REFERRER)), new f09(q40.INSTALLER_PACKAGE, new x40(v92Var2, w92.INSTALLER_PACKAGE)), new f09(q40.RECEIPT_DATA, new x40(v92Var2, w92.RECEIPT_DATA)), new f09(q40.URL_SCHEMES, new x40(v92Var2, w92.URL_SCHEMES)), new f09(q40.USER_DATA, new x40(v92Var, null)));
        f09 f09Var6 = new f09(wl2.EVENT_TIME, new w40(null, t92.EVENT_TIME));
        f09 f09Var7 = new f09(wl2.EVENT_NAME, new w40(null, t92.EVENT_NAME));
        wl2 wl2Var = wl2.VALUE_TO_SUM;
        v92 v92Var3 = v92.CUSTOM_DATA;
        b = ei7.Q(f09Var6, f09Var7, new f09(wl2Var, new w40(v92Var3, t92.VALUE_TO_SUM)), new f09(wl2.CONTENT_IDS, new w40(v92Var3, t92.CONTENT_IDS)), new f09(wl2.CONTENTS, new w40(v92Var3, t92.CONTENTS)), new f09(wl2.CONTENT_TYPE, new w40(v92Var3, t92.CONTENT_TYPE)), new f09(wl2.CURRENCY, new w40(v92Var3, t92.CURRENCY)), new f09(wl2.DESCRIPTION, new w40(v92Var3, t92.DESCRIPTION)), new f09(wl2.LEVEL, new w40(v92Var3, t92.LEVEL)), new f09(wl2.MAX_RATING_VALUE, new w40(v92Var3, t92.MAX_RATING_VALUE)), new f09(wl2.NUM_ITEMS, new w40(v92Var3, t92.NUM_ITEMS)), new f09(wl2.PAYMENT_INFO_AVAILABLE, new w40(v92Var3, t92.PAYMENT_INFO_AVAILABLE)), new f09(wl2.REGISTRATION_METHOD, new w40(v92Var3, t92.REGISTRATION_METHOD)), new f09(wl2.SEARCH_STRING, new w40(v92Var3, t92.SEARCH_STRING)), new f09(wl2.SUCCESS, new w40(v92Var3, t92.SUCCESS)), new f09(wl2.ORDER_ID, new w40(v92Var3, t92.ORDER_ID)), new f09(wl2.AD_TYPE, new w40(v92Var3, t92.AD_TYPE)));
        c = ei7.Q(new f09("fb_mobile_achievement_unlocked", u92.UNLOCKED_ACHIEVEMENT), new f09("fb_mobile_activate_app", u92.ACTIVATED_APP), new f09("fb_mobile_add_payment_info", u92.ADDED_PAYMENT_INFO), new f09("fb_mobile_add_to_cart", u92.ADDED_TO_CART), new f09("fb_mobile_add_to_wishlist", u92.ADDED_TO_WISHLIST), new f09("fb_mobile_complete_registration", u92.COMPLETED_REGISTRATION), new f09("fb_mobile_content_view", u92.VIEWED_CONTENT), new f09("fb_mobile_initiated_checkout", u92.INITIATED_CHECKOUT), new f09("fb_mobile_level_achieved", u92.ACHIEVED_LEVEL), new f09("fb_mobile_purchase", u92.PURCHASED), new f09("fb_mobile_rate", u92.RATED), new f09("fb_mobile_search", u92.SEARCHED), new f09("fb_mobile_spent_credits", u92.SPENT_CREDITS), new f09("fb_mobile_tutorial_completion", u92.COMPLETED_TUTORIAL));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v4, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r1v7, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r1v8, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r1v9, types: [java.util.HashMap] */
    public static final Object a(String str, Object obj) {
        z40.Companion.getClass();
        z40 z40Var = (str.equals(q40.EXT_INFO.getRawValue()) || str.equals(q40.URL_SCHEMES.getRawValue()) || str.equals(wl2.CONTENT_IDS.getRawValue()) || str.equals(wl2.CONTENTS.getRawValue()) || str.equals(v40.OPTIONS.getRawValue())) ? z40.ARRAY : (str.equals(q40.ADV_TE.getRawValue()) || str.equals(q40.APP_TE.getRawValue())) ? z40.BOOL : str.equals(wl2.EVENT_TIME.getRawValue()) ? z40.INT : null;
        String str2 = obj instanceof String ? (String) obj : null;
        if (z40Var == null || str2 == null) {
            return obj;
        }
        int i = a50.a[z40Var.ordinal()];
        if (i != 1) {
            if (i != 2) {
                if (i == 3) {
                    return tuc.O(obj.toString());
                }
                ygf.a();
                return null;
            }
            Integer numO = tuc.O(str2.toString());
            if (numO != null) {
                return Boolean.valueOf(numO.intValue() != 0);
            }
            return null;
        }
        try {
            ArrayList<??> arrayListK = epe.k(new JSONArray(str2));
            ArrayList arrayList = new ArrayList();
            for (?? K : arrayListK) {
                try {
                    try {
                        K = epe.l(new JSONObject((String) K));
                    } catch (JSONException unused) {
                    }
                } catch (JSONException unused2) {
                    K = epe.k(new JSONArray((String) K));
                }
                arrayList.add(K);
            }
            return arrayList;
        } catch (JSONException e) {
            z46 z46Var = f87.b;
            z46.s(i87.APP_EVENTS, "AppEventsConversionsAPITransformer", "\n transformEvents JSONException: \n%s\n%s", obj, e);
            return c1e.a;
        }
    }
}
