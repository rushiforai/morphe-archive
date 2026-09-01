package com.android.billingclient.api;

import android.text.TextUtils;
import defpackage.ay0;
import defpackage.ho2;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class UnfetchedProduct {
    private final String jsonString;
    private final String productId;
    private final String productType;
    private final String serializedDocid;
    private final int statusCode;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Retention(RetentionPolicy.SOURCE)
    public @interface StatusCode {
        public static final int INVALID_PRODUCT_ID_FORMAT = 2;
        public static final int NO_ELIGIBLE_OFFER = 4;
        public static final int PRODUCT_NOT_FOUND = 3;
        public static final int UNKNOWN = 0;
    }

    public UnfetchedProduct(String str) {
        this.jsonString = str;
        JSONObject jSONObject = new JSONObject(str);
        this.productId = jSONObject.optString("productId");
        String strOptString = jSONObject.optString("type");
        this.productType = strOptString;
        this.statusCode = jSONObject.has("statusCode") ? jSONObject.optInt("statusCode") : 0;
        if (TextUtils.isEmpty(strOptString)) {
            ay0.e("Product type cannot be empty.");
            throw null;
        }
        this.serializedDocid = jSONObject.optString("serializedDocid");
    }

    public static UnfetchedProduct fromJson(String str) {
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

    public String getProductId() {
        return this.productId;
    }

    public String getProductType() {
        return this.productType;
    }

    public String getSerializedDocid() {
        return this.serializedDocid;
    }

    public int getStatusCode() {
        return this.statusCode;
    }

    public int hashCode() {
        return this.jsonString.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("UnfetchedProduct{productId='");
        sb.append(this.productId);
        sb.append("', productType='");
        sb.append(this.productType);
        sb.append("', statusCode=");
        return ho2.H(sb, this.statusCode, "}");
    }
}
