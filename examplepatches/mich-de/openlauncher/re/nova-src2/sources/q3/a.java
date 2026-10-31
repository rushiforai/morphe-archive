package q3;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Typeface;
import android.graphics.fonts.FontVariationAxis;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class a implements n {

    /* renamed from: a, reason: collision with root package name */
    public final a0 f83517a;

    /* renamed from: b, reason: collision with root package name */
    public final b0 f83518b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f83519c;

    /* renamed from: d, reason: collision with root package name */
    public Typeface f83520d = d(null);

    /* renamed from: e, reason: collision with root package name */
    public final AssetManager f83521e;

    /* renamed from: f, reason: collision with root package name */
    public final String f83522f;

    public a(AssetManager assetManager, String str, b0 b0Var, a0 a0Var) {
        this.f83517a = a0Var;
        this.f83518b = b0Var;
        this.f83521e = assetManager;
        this.f83522f = str;
    }

    @Override // q3.n
    public final b0 a() {
        return this.f83518b;
    }

    @Override // q3.n
    public final int b() {
        return 0;
    }

    @Override // q3.n
    public final int c() {
        return 0;
    }

    public final Typeface d(Context context) {
        int size;
        FontVariationAxis[] fontVariationAxisArr;
        ArrayList arrayList = this.f83517a.f83523a;
        if (context == null) {
            return null;
        }
        Typeface.Builder builder = new Typeface.Builder(this.f83521e, this.f83522f);
        v30.e.a(context);
        int iA = f0.a(context);
        int i5 = 0;
        if (iA == 0) {
            int size2 = arrayList.size();
            fontVariationAxisArr = new FontVariationAxis[size2];
            while (i5 < size2) {
                fontVariationAxisArr[i5] = new FontVariationAxis(((x) arrayList.get(i5)).b(), ((x) arrayList.get(i5)).a());
                i5++;
            }
        } else {
            int size3 = arrayList.size();
            int i11 = 0;
            while (true) {
                if (i11 >= size3) {
                    size = arrayList.size() + 1;
                    break;
                }
                if (Intrinsics.b(((x) arrayList.get(i11)).b(), "wght")) {
                    size = arrayList.size();
                    break;
                }
                i11++;
            }
            FontVariationAxis[] fontVariationAxisArr2 = new FontVariationAxis[size];
            while (i5 < size) {
                fontVariationAxisArr2[i5] = i5 == arrayList.size() ? new FontVariationAxis("wght", kotlin.ranges.a.d0(iA + 400.0f, 1.0f, 1000.0f)) : Intrinsics.b(((x) arrayList.get(i5)).b(), "wght") ? new FontVariationAxis("wght", kotlin.ranges.a.d0(((x) arrayList.get(i5)).a() + iA, 1.0f, 1000.0f)) : new FontVariationAxis(((x) arrayList.get(i5)).b(), ((x) arrayList.get(i5)).a());
                i5++;
            }
            fontVariationAxisArr = fontVariationAxisArr2;
        }
        return builder.setFontVariationSettings(fontVariationAxisArr).build();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f83522f, aVar.f83522f) && Intrinsics.b(this.f83517a, aVar.f83517a);
    }

    public final int hashCode() {
        return this.f83517a.f83523a.hashCode() + (this.f83522f.hashCode() * 31);
    }

    public final String toString() {
        return "Font(assetManager, path=" + this.f83522f + ", weight=" + this.f83518b + ", style=" + ((Object) v.a(0)) + ')';
    }
}
