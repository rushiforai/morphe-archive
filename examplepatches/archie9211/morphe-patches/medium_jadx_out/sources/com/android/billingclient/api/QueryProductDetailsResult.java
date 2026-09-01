package com.android.billingclient.api;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class QueryProductDetailsResult {
    private final List<ProductDetails> productDetailsList;
    private final List<UnfetchedProduct> unfetchedProductList;

    public QueryProductDetailsResult(List<ProductDetails> list, List<UnfetchedProduct> list2) {
        this.productDetailsList = list;
        this.unfetchedProductList = list2;
    }

    public static QueryProductDetailsResult create(List<ProductDetails> list, List<UnfetchedProduct> list2) {
        return new QueryProductDetailsResult(list, list2);
    }

    public List<ProductDetails> getProductDetailsList() {
        return this.productDetailsList;
    }

    public List<UnfetchedProduct> getUnfetchedProductList() {
        return this.unfetchedProductList;
    }
}
