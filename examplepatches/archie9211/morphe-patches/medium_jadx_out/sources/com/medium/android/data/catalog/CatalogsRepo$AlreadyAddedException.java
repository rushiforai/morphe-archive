package com.medium.android.data.catalog;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"com/medium/android/data/catalog/CatalogsRepo$AlreadyAddedException", "Ljava/lang/Exception;", "Lkotlin/Exception;", "data_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogsRepo$AlreadyAddedException extends Exception {
    public final String a;
    public final String b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CatalogsRepo$AlreadyAddedException(String str, String str2) {
        super("Item already added to reading list");
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
    }
}
