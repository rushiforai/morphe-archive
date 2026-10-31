package com.android.billingclient.api;

import android.text.TextUtils;
import b.c0;
import com.tiktok.util.TTConst;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import org.json.JSONException;
import org.json.JSONObject;

@zzv
/* loaded from: classes2.dex */
public final class UnfetchedProduct {
    private final String jsonString;
    private final String productId;
    private final String productType;
    private final String serializedDocid;
    private final int statusCode;

    @Retention(RetentionPolicy.SOURCE)
    public @interface StatusCode {

        @zzv
        public static final int INVALID_PRODUCT_ID_FORMAT = 2;

        @zzv
        public static final int NO_ELIGIBLE_OFFER = 4;

        @zzv
        public static final int PRODUCT_NOT_FOUND = 3;

        @zzv
        public static final int UNKNOWN = 0;
    }

    public UnfetchedProduct(String str) throws JSONException {
        this.jsonString = str;
        JSONObject jSONObject = new JSONObject(str);
        this.productId = jSONObject.optString("productId");
        String strOptString = jSONObject.optString(TTConst.TRACK_TYPE);
        this.productType = strOptString;
        this.statusCode = jSONObject.has("statusCode") ? jSONObject.optInt("statusCode") : 0;
        if (TextUtils.isEmpty(strOptString)) {
            throw new IllegalArgumentException("Product type cannot be empty.");
        }
        this.serializedDocid = jSONObject.optString("serializedDocid");
    }

    public static UnfetchedProduct fromJson(String str) throws JSONException {
        return new UnfetchedProduct(str);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof UnfetchedProduct) {
            return TextUtils.equals(this.jsonString, ((UnfetchedProduct) obj).jsonString);
        }
        return false;
    }

    @zzv
    public String getProductId() {
        return this.productId;
    }

    @zzv
    public String getProductType() {
        return this.productType;
    }

    public String getSerializedDocid() {
        return this.serializedDocid;
    }

    @zzv
    public int getStatusCode() {
        return this.statusCode;
    }

    public int hashCode() {
        return this.jsonString.hashCode();
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder("UnfetchedProduct{productId='");
        sb2.append(this.productId);
        sb2.append("', productType='");
        sb2.append(this.productType);
        sb2.append("', statusCode=");
        return c0.o(sb2, this.statusCode, "}");
    }
}
