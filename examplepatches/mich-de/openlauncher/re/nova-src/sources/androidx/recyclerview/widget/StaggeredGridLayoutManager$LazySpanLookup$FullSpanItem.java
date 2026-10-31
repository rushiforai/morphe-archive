package androidx.recyclerview.widget;

import android.annotation.SuppressLint;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes2.dex */
class StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem implements Parcelable {
    public static final Parcelable.Creator<StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem> CREATOR = new a3();

    /* renamed from: a, reason: collision with root package name */
    public int f14859a;

    /* renamed from: b, reason: collision with root package name */
    public int f14860b;

    /* renamed from: c, reason: collision with root package name */
    public int[] f14861c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f14862d;

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final String toString() {
        return "FullSpanItem{mPosition=" + this.f14859a + ", mGapDir=" + this.f14860b + ", mHasUnwantedGapAfter=" + this.f14862d + ", mGapPerSpan=" + Arrays.toString(this.f14861c) + AbstractJsonLexerKt.END_OBJ;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f14859a);
        parcel.writeInt(this.f14860b);
        parcel.writeInt(this.f14862d ? 1 : 0);
        int[] iArr = this.f14861c;
        if (iArr == null || iArr.length <= 0) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(iArr.length);
            parcel.writeIntArray(this.f14861c);
        }
    }
}
