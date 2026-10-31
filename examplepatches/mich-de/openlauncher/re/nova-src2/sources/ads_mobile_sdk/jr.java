package ads_mobile_sdk;

import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.text.Regex;

/* loaded from: classes.dex */
public final class jr extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Intent f5353a;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f5354j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ jr(int i5, Intent intent) {
        super(1);
        this.f5354j = i5;
        this.f5353a = intent;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f5354j) {
            case 0:
                String it = (String) obj;
                Intrinsics.g(it, "it");
                return this.f5353a.setData(Uri.parse(it));
            case 1:
                String it2 = (String) obj;
                Intrinsics.g(it2, "it");
                return this.f5353a.setType(it2);
            case 2:
                String it3 = (String) obj;
                Intrinsics.g(it3, "it");
                return this.f5353a.setPackage(it3);
            default:
                String it4 = (String) obj;
                Intrinsics.g(it4, "it");
                String[] strArr = (String[]) new Regex("/").i(2, it4).toArray(new String[0]);
                if (strArr.length == 2) {
                    this.f5353a.setComponent(new ComponentName(strArr[0], strArr[1]));
                }
                return Unit.f71706a;
        }
    }
}
