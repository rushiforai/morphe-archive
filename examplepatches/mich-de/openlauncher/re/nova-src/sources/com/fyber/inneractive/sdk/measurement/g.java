package com.fyber.inneractive.sdk.measurement;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.model.vast.x;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public final class g implements com.fyber.inneractive.sdk.response.i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ List f28517a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i f28518b;

    public g(List list, i iVar) {
        this.f28517a = list;
        this.f28518b = iVar;
    }

    @Override // com.fyber.inneractive.sdk.response.i
    public final List a(x xVar) {
        if (xVar == null || this.f28517a == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (String str : this.f28517a) {
            if (!TextUtils.isEmpty(str)) {
                arrayList.add(str.replace("[REASON]", String.valueOf(this.f28518b.mReason)));
            }
        }
        return arrayList;
    }
}
