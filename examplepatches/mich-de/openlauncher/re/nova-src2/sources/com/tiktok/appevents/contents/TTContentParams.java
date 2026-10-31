package com.tiktok.appevents.contents;

import android.text.TextUtils;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.JSON;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class TTContentParams {
    private String brand;
    private String contentCategory;
    private String contentId;
    private String contentName;
    private float price;
    private int quantity;
    private boolean priceAvailable = false;
    private boolean quantityAvailable = false;

    public static class Builder {
        private String brand;
        private String contentCategory;
        private String contentId;
        private String contentName;
        private float price = Float.NaN;
        private int quantity = -1;
        private boolean priceAvailable = false;
        private boolean quantityAvailable = false;

        public TTContentParams build() {
            TTContentParams tTContentParams = new TTContentParams();
            tTContentParams.price = this.price;
            tTContentParams.priceAvailable = this.priceAvailable;
            tTContentParams.quantity = this.quantity;
            tTContentParams.quantityAvailable = this.quantityAvailable;
            tTContentParams.contentId = this.contentId;
            tTContentParams.contentCategory = this.contentCategory;
            tTContentParams.contentName = this.contentName;
            tTContentParams.brand = this.brand;
            return tTContentParams;
        }

        public Builder setBrand(String str) {
            this.brand = str;
            return this;
        }

        public Builder setContentCategory(String str) {
            this.contentCategory = str;
            return this;
        }

        public Builder setContentId(String str) {
            this.contentId = str;
            return this;
        }

        public Builder setContentName(String str) {
            this.contentName = str;
            return this;
        }

        public Builder setPrice(float f11) {
            this.price = f11;
            this.priceAvailable = true;
            return this;
        }

        public Builder setQuantity(int i5) {
            this.quantity = i5;
            this.quantityAvailable = true;
            return this;
        }
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    public JSONObject toJSONObject() {
        try {
            JSONObject jSONObjectBuild = JSON.build();
            try {
                if (this.quantityAvailable) {
                    JSON.putInt(jSONObjectBuild, "quantity", this.quantity);
                }
                if (!TextUtils.isEmpty(this.contentId)) {
                    JSON.putObject(jSONObjectBuild, TTContentsEventConstants.Params.EVENT_PROPERTY_CONTENT_ID, this.contentId);
                }
                if (!TextUtils.isEmpty(this.contentCategory)) {
                    JSON.putObject(jSONObjectBuild, "content_category", this.contentCategory);
                }
                if (!TextUtils.isEmpty(this.contentName)) {
                    JSON.putObject(jSONObjectBuild, "content_name", this.contentName);
                }
                if (!TextUtils.isEmpty(this.brand)) {
                    JSON.putObject(jSONObjectBuild, "brand", this.brand);
                }
                if (this.priceAvailable && !Float.isNaN(this.price)) {
                    JSON.putObject(jSONObjectBuild, "price", String.valueOf(this.price));
                }
                return jSONObjectBuild;
            } catch (Throwable unused) {
                return jSONObjectBuild;
            }
        } catch (Throwable unused2) {
            return null;
        }
    }
}
