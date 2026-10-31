package ads_mobile_sdk;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.net.Uri;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class dx1 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ xu0 f2669a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f2670b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ double f2671c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f2672d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f2673e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dx1(xu0 xu0Var, String str, double d5, int i5, int i11) {
        super(0);
        this.f2669a = xu0Var;
        this.f2670b = str;
        this.f2671c = d5;
        this.f2672d = i5;
        this.f2673e = i11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        BitmapDrawable bitmapDrawable = new BitmapDrawable(Resources.getSystem(), (Bitmap) this.f2669a.f11834b);
        Uri uri = Uri.parse(this.f2670b);
        Intrinsics.f(uri, "parse(...)");
        return new wf1(bitmapDrawable, uri, this.f2671c, this.f2672d, this.f2673e);
    }
}
