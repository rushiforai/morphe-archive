package defpackage;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.Purchase;
import com.android.billingclient.api.QueryProductDetailsParams;
import java.util.ArrayList;
import java.util.Set;
import org.json.JSONException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class rxf {
    public static final int a = Runtime.getRuntime().availableProcessors();

    public static int a(String str, Bundle bundle) {
        if (bundle == null) {
            i(str, "Unexpected null bundle received!");
            return 6;
        }
        Object obj = bundle.get("RESPONSE_CODE");
        if (obj == null) {
            h(str, "getResponseCodeFromBundle() got null response code, assuming OK");
            return 0;
        }
        if (obj instanceof Integer) {
            return ((Integer) obj).intValue();
        }
        i(str, "Unexpected type for bundle response code: ".concat(obj.getClass().getName()));
        return 6;
    }

    public static void b(Bundle bundle, String str, long j) {
        bundle.putString("playBillingLibraryVersion", "9.0.0");
        if (str != null) {
            bundle.putString("playBillingLibraryWrapperVersion", str);
        }
        bundle.putLong("billingClientSessionId", j);
    }

    public static Bundle c(BillingResult billingResult, cbg cbgVar) {
        Bundle bundle = new Bundle();
        bundle.putInt("RESPONSE_CODE", billingResult.getResponseCode());
        bundle.putString("DEBUG_MESSAGE", billingResult.getDebugMessage());
        bundle.putInt("LOG_REASON", cbgVar.zza());
        return bundle;
    }

    public static Bundle d(String str, ArrayList arrayList, xy5 xy5Var, long j) {
        Bundle bundle = new Bundle();
        b(bundle, str, j);
        bundle.putBoolean("enablePendingPurchases", true);
        bundle.putString("SKU_DETAILS_RESPONSE_FORMAT", "PRODUCT_DETAILS");
        exf exfVar = uxf.b;
        Object[] objArr = {BillingClient.ProductType.SUBS, BillingClient.ProductType.INAPP};
        for (int i = 0; i < 2; i++) {
            if (objArr[i] == null) {
                z72.c(b09.w(i, "at index "));
                return null;
            }
        }
        bundle.putStringArrayList("PRODUCT_TYPES_TO_RETURN_MULTIPLE_OFFERS", new ArrayList<>(uxf.s(2, objArr)));
        Object[] objArr2 = {BillingClient.ProductType.INAPP};
        for (int i2 = 0; i2 < 1; i2++) {
            if (objArr2[i2] == null) {
                z72.c(b09.w(i2, "at index "));
                return null;
            }
        }
        bundle.putStringArrayList("PRODUCT_TYPES_TO_RETURN_PREORDER_OFFERS", new ArrayList<>(uxf.s(1, objArr2)));
        Object[] objArr3 = {BillingClient.ProductType.INAPP};
        for (int i3 = 0; i3 < 1; i3++) {
            if (objArr3[i3] == null) {
                z72.c(b09.w(i3, "at index "));
                return null;
            }
        }
        bundle.putStringArrayList("PRODUCT_TYPES_TO_RETURN_RENT_OFFERS", new ArrayList<>(uxf.s(1, objArr3)));
        bundle.putBoolean("SHOULD_RETURN_UNFETCHED_PRODUCTS", true);
        if (xy5Var.a) {
            bundle.putBoolean("enablePendingPurchaseForSubscriptions", true);
        }
        ArrayList<String> arrayList2 = new ArrayList<>();
        ArrayList<String> arrayList3 = new ArrayList<>();
        ArrayList<String> arrayList4 = new ArrayList<>();
        int size = arrayList.size();
        boolean z = false;
        boolean z2 = false;
        for (int i4 = 0; i4 < size; i4++) {
            QueryProductDetailsParams.Product product = (QueryProductDetailsParams.Product) arrayList.get(i4);
            arrayList2.add(null);
            z |= !TextUtils.isEmpty(null);
            arrayList4.add(product.getDynamicProductToken());
            z2 |= !TextUtils.isEmpty(product.getDynamicProductToken());
            if (product.zzb().equals("first_party")) {
                z72.c("Serialized DocId is required for constructing ExtraParams to query ProductDetails for all first party products.");
                return null;
            }
        }
        if (z) {
            bundle.putStringArrayList("SKU_OFFER_ID_TOKEN_LIST", arrayList2);
        }
        if (!arrayList3.isEmpty()) {
            bundle.putStringArrayList("SKU_SERIALIZED_DOCID_LIST", arrayList3);
        }
        if (!TextUtils.isEmpty(null)) {
            bundle.putString("accountName", null);
        }
        if (z2) {
            bundle.putStringArrayList("SKU_DYNAMIC_PRODUCT_TOKEN_LIST", arrayList4);
        }
        return bundle;
    }

    public static Bundle e(long j, String str) {
        Bundle bundle = new Bundle();
        b(bundle, str, j);
        return bundle;
    }

    public static BillingResult f(Intent intent, String str) {
        if (intent != null) {
            BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
            builderNewBuilder.setResponseCode(a(str, intent.getExtras()));
            builderNewBuilder.setDebugMessage(g(str, intent.getExtras()));
            return builderNewBuilder.build();
        }
        i("BillingHelper", "Got null intent!");
        BillingResult.Builder builderNewBuilder2 = BillingResult.newBuilder();
        builderNewBuilder2.setResponseCode(6);
        builderNewBuilder2.setDebugMessage("An internal error occurred.");
        return builderNewBuilder2.build();
    }

    public static String g(String str, Bundle bundle) {
        if (bundle == null) {
            i(str, "Unexpected null bundle received!");
            return "";
        }
        Object obj = bundle.get("DEBUG_MESSAGE");
        if (obj == null) {
            h(str, "getDebugMessageFromBundle() got null response code, assuming OK");
            return "";
        }
        if (obj instanceof String) {
            return (String) obj;
        }
        i(str, "Unexpected type for debug message: ".concat(obj.getClass().getName()));
        return "";
    }

    public static void h(String str, String str2) {
        if (Log.isLoggable(str, 2)) {
            if (str2.isEmpty()) {
                Log.v(str, str2);
                return;
            }
            int i = 40000;
            while (!str2.isEmpty() && i > 0) {
                int iMin = Math.min(str2.length(), Math.min(4000, i));
                Log.v(str, str2.substring(0, iMin));
                str2 = str2.substring(iMin);
                i -= iMin;
            }
        }
    }

    public static void i(String str, String str2) {
        if (Log.isLoggable(str, 5)) {
            Log.w(str, str2);
        }
    }

    public static void j(String str, String str2, Throwable th) {
        try {
            if (Log.isLoggable(str, 5)) {
                if (th == null) {
                    Log.w(str, str2);
                } else {
                    Log.w(str, str2, th);
                }
            }
        } catch (Throwable unused) {
        }
    }

    public static Purchase k(String str, String str2, Set set) {
        Purchase purchase;
        Purchase purchase2 = null;
        if (str == null || str2 == null) {
            h("BillingHelper", "Received a null purchase data.");
            return null;
        }
        try {
            purchase = new Purchase(str, str2);
        } catch (JSONException e) {
            e = e;
        }
        try {
            set.isEmpty();
            return purchase;
        } catch (JSONException e2) {
            e = e2;
            purchase2 = purchase;
            i("BillingHelper", "Got JSONException while parsing purchase data: ".concat(e.toString()));
            return purchase2;
        }
    }
}
