package io.branch.search.internal;

import android.text.TextUtils;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import io.branch.search.ui.Image;
import java.util.ArrayList;
import java.util.Map;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SpreadBuilder;

/* loaded from: classes4.dex */
public final class H7 {
    public static Image.Url a(b50.g gVar, F4 context, boolean z11, String imageUrl, H2 resultType, Map extraParams) {
        Intrinsics.g(gVar, "<this>");
        Intrinsics.g(context, "context");
        Intrinsics.g(imageUrl, "imageUrl");
        Intrinsics.g(resultType, "resultType");
        Intrinsics.g(extraParams, "extraParams");
        if (TextUtils.isEmpty(imageUrl)) {
            return null;
        }
        if (z11) {
            SpreadBuilder spreadBuilder = new SpreadBuilder(3);
            spreadBuilder.a(new Pair(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, imageUrl));
            spreadBuilder.a(new Pair(TTConst.TRACK_TYPE, resultType.toString()));
            ArrayList arrayList = new ArrayList(extraParams.size());
            for (Map.Entry entry : extraParams.entrySet()) {
                arrayList.add(new Pair((String) entry.getKey(), (String) entry.getValue()));
            }
            Object[] array = arrayList.toArray(new Pair[0]);
            Intrinsics.e(array, "null cannot be cast to non-null type kotlin.Array<T of kotlin.collections.ArraysKt__ArraysJVMKt.toTypedArray>");
            spreadBuilder.b(array);
            ArrayList arrayList2 = spreadBuilder.f71867a;
            imageUrl = context.a((Pair[]) arrayList2.toArray(new Pair[arrayList2.size()])).toString();
            Intrinsics.f(imageUrl, "context.createImageLoadi…Array(),\n    ).toString()");
        }
        return new Image.Url(imageUrl, resultType, null);
    }
}
