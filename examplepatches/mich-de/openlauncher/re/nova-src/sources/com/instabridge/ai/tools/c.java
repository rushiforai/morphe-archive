package com.instabridge.ai.tools;

import com.android.billingclient.api.Purchase;
import com.instabridge.ai.proactive.OptimisticToolSpec;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class c implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35559a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Set f35560b;

    public /* synthetic */ c(Set set, int i5) {
        this.f35559a = i5;
        this.f35560b = set;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        boolean z11;
        switch (this.f35559a) {
            case 0:
                return Boolean.valueOf(ToolPreloader.runBestEffort$lambda$0(this.f35560b, (OptimisticToolSpec) obj));
            default:
                List<String> products = ((Purchase) obj).getProducts();
                if ((products instanceof Collection) && products.isEmpty()) {
                    z11 = false;
                } else {
                    Iterator<T> it = products.iterator();
                    while (it.hasNext()) {
                        if (this.f35560b.contains((String) it.next())) {
                            z11 = true;
                        }
                    }
                    z11 = false;
                }
                return Boolean.valueOf(z11);
        }
    }
}
