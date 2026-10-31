package com.amplitude.core.events;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\u0006\n\u0002\b\n\n\u0002\u0010%\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0016\u0018\u0000 12\u00020\u0001:\u00011B\u0005¢\u0006\u0002\u0010\u0002J\u0006\u0010,\u001a\u00020-J\u0016\u0010\"\u001a\u00020\u00002\u0006\u0010 \u001a\u00020\u00042\u0006\u0010.\u001a\u00020\u0004J\u0006\u0010/\u001a\u000200R\u001c\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\bR*\u0010\u000b\u001a\u0004\u0018\u00010\n2\b\u0010\t\u001a\u0004\u0018\u00010\n@FX\u0086\u000e¢\u0006\u0010\n\u0002\u0010\u0010\u001a\u0004\b\f\u0010\r\"\u0004\b\u000e\u0010\u000fR(\u0010\u0011\u001a\u0004\u0018\u00010\u00042\b\u0010\t\u001a\u0004\u0018\u00010\u0004@FX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0012\u0010\u0006\"\u0004\b\u0013\u0010\bR*\u0010\u0014\u001a\u0012\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0015X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0016\u0010\u0017\"\u0004\b\u0018\u0010\u0019R$\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\t\u001a\u00020\u001a@FX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001c\u0010\u001d\"\u0004\b\u001e\u0010\u001fR\u001c\u0010 \u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b!\u0010\u0006\"\u0004\b\"\u0010\bR\u001c\u0010#\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b$\u0010\u0006\"\u0004\b%\u0010\bR*\u0010&\u001a\u0004\u0018\u00010\n2\b\u0010\t\u001a\u0004\u0018\u00010\n@FX\u0086\u000e¢\u0006\u0010\n\u0002\u0010\u0010\u001a\u0004\b'\u0010\r\"\u0004\b(\u0010\u000fR\u001c\u0010)\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b*\u0010\u0006\"\u0004\b+\u0010\b¨\u00062"}, d2 = {"Lcom/amplitude/core/events/Revenue;", b.f42142b, "()V", TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, b.f42142b, "getCurrency", "()Ljava/lang/String;", "setCurrency", "(Ljava/lang/String;)V", "value", b.f42142b, "price", "getPrice", "()Ljava/lang/Double;", "setPrice", "(Ljava/lang/Double;)V", "Ljava/lang/Double;", "productId", "getProductId", "setProductId", "properties", b.f42142b, "getProperties", "()Ljava/util/Map;", "setProperties", "(Ljava/util/Map;)V", b.f42142b, "quantity", "getQuantity", "()I", "setQuantity", "(I)V", "receipt", "getReceipt", "setReceipt", "receiptSig", "getReceiptSig", "setReceiptSig", "revenue", "getRevenue", "setRevenue", "revenueType", "getRevenueType", "setRevenueType", "isValid", b.f42142b, "receiptSignature", "toRevenueEvent", "Lcom/amplitude/core/events/RevenueEvent;", k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public class Revenue {

    @NotNull
    public static final String REVENUE = "$revenue";

    @NotNull
    public static final String REVENUE_CURRENCY = "$currency";

    @NotNull
    public static final String REVENUE_PRICE = "$price";

    @NotNull
    public static final String REVENUE_PRODUCT_ID = "$productId";

    @NotNull
    public static final String REVENUE_QUANTITY = "$quantity";

    @NotNull
    public static final String REVENUE_RECEIPT = "$receipt";

    @NotNull
    public static final String REVENUE_RECEIPT_SIG = "$receiptSig";

    @NotNull
    public static final String REVENUE_TYPE = "$revenueType";

    @Nullable
    private String currency;

    @Nullable
    private Double price;

    @Nullable
    private String productId;

    @Nullable
    private Map<String, Object> properties;
    private int quantity = 1;

    @Nullable
    private String receipt;

    @Nullable
    private String receiptSig;

    @Nullable
    private Double revenue;

    @Nullable
    private String revenueType;

    @Nullable
    public final String getCurrency() {
        return this.currency;
    }

    @Nullable
    public final Double getPrice() {
        return this.price;
    }

    @Nullable
    public final String getProductId() {
        return this.productId;
    }

    @Nullable
    public final Map<String, Object> getProperties() {
        return this.properties;
    }

    public final int getQuantity() {
        return this.quantity;
    }

    @Nullable
    public final String getReceipt() {
        return this.receipt;
    }

    @Nullable
    public final String getReceiptSig() {
        return this.receiptSig;
    }

    @Nullable
    public final Double getRevenue() {
        return this.revenue;
    }

    @Nullable
    public final String getRevenueType() {
        return this.revenueType;
    }

    public final boolean isValid() {
        return this.price != null;
    }

    public final void setCurrency(@Nullable String str) {
        this.currency = str;
    }

    public final void setPrice(@Nullable Double d5) {
        if (d5 != null) {
            this.price = d5;
        }
    }

    public final void setProductId(@Nullable String str) {
        if (str == null || str.length() == 0) {
            return;
        }
        this.productId = str;
    }

    public final void setProperties(@Nullable Map<String, Object> map) {
        this.properties = map;
    }

    public final void setQuantity(int i5) {
        if (i5 > 0) {
            this.quantity = i5;
        }
    }

    public final void setReceipt(@Nullable String str) {
        this.receipt = str;
    }

    public final void setReceiptSig(@Nullable String str) {
        this.receiptSig = str;
    }

    public final void setRevenue(@Nullable Double d5) {
        if (d5 != null) {
            this.revenue = d5;
        }
    }

    public final void setRevenueType(@Nullable String str) {
        this.revenueType = str;
    }

    @NotNull
    public final RevenueEvent toRevenueEvent() {
        RevenueEvent revenueEvent = new RevenueEvent();
        Map<String, Object> linkedHashMap = this.properties;
        if (linkedHashMap == null) {
            linkedHashMap = new LinkedHashMap<>();
        }
        String str = this.productId;
        if (str != null) {
            linkedHashMap.put(REVENUE_PRODUCT_ID, str);
        }
        linkedHashMap.put(REVENUE_QUANTITY, Integer.valueOf(this.quantity));
        Double d5 = this.price;
        if (d5 != null) {
            linkedHashMap.put(REVENUE_PRICE, Double.valueOf(d5.doubleValue()));
        }
        String str2 = this.revenueType;
        if (str2 != null) {
            linkedHashMap.put(REVENUE_TYPE, str2);
        }
        String str3 = this.currency;
        if (str3 != null) {
            linkedHashMap.put(REVENUE_CURRENCY, str3);
        }
        String str4 = this.receipt;
        if (str4 != null) {
            linkedHashMap.put(REVENUE_RECEIPT, str4);
        }
        String str5 = this.receiptSig;
        if (str5 != null) {
            linkedHashMap.put(REVENUE_RECEIPT_SIG, str5);
        }
        Double d11 = this.revenue;
        if (d11 != null) {
            linkedHashMap.put(REVENUE, Double.valueOf(d11.doubleValue()));
        }
        revenueEvent.setEventProperties(linkedHashMap);
        return revenueEvent;
    }

    @NotNull
    public final Revenue setReceipt(@NotNull String receipt, @NotNull String receiptSignature) {
        Intrinsics.g(receipt, "receipt");
        Intrinsics.g(receiptSignature, "receiptSignature");
        this.receipt = receipt;
        this.receiptSig = receiptSignature;
        return this;
    }
}
