package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\b\n\u0002\u0010\u0006\n\u0002\b\u0007\b\u0087\b\u0018\u00002\u00020\u0001R\u001a\u0010\u0007\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\u001c\u0010\r\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\t\u0010\n\u001a\u0004\b\u000b\u0010\fR\u001c\u0010\u0010\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000e\u0010\n\u001a\u0004\b\u000f\u0010\fR\u001c\u0010\u0014\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000f\u0010\u0012\u001a\u0004\b\t\u0010\u0013R\u001c\u0010\u0015\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000b\u0010\u0012\u001a\u0004\b\u000e\u0010\u0013R\u001c\u0010\u0017\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0016\u0010\u0004\u001a\u0004\b\u0003\u0010\u0006¨\u0006\u0018"}, d2 = {"Lsw5;", "Landroid/os/Parcelable;", "", "a", "Ljava/lang/String;", "getId", "()Ljava/lang/String;", "id", "", "b", "Ljava/lang/Integer;", "e", "()Ljava/lang/Integer;", "originalWidth", "c", "d", "originalHeight", "", "Ljava/lang/Double;", "()Ljava/lang/Double;", "focusPercentX", "focusPercentY", "f", "alt", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class sw5 implements Parcelable {
    public static final Parcelable.Creator<sw5> CREATOR = new h74(13);

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("id")
    private final String id;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    @g0c("originalWidth")
    private final Integer originalWidth;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    @g0c("originalHeight")
    private final Integer originalHeight;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    @g0c("focusPercentX")
    private final Double focusPercentX;

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    @g0c("focusPercentY")
    private final Double focusPercentY;

    /* JADX INFO: renamed from: f, reason: from kotlin metadata */
    @g0c("alt")
    private final String alt;

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ sw5(String str, Integer num, Integer num2, String str2, int i) {
        Double dValueOf = Double.valueOf(0.0d);
        this(str, (i & 2) != 0 ? null : num, (i & 4) != 0 ? null : num2, (i & 8) != 0 ? null : dValueOf, (i & 16) != 0 ? null : dValueOf, (i & 32) != 0 ? null : str2);
    }

    /* JADX INFO: renamed from: a, reason: from getter */
    public final String getAlt() {
        return this.alt;
    }

    /* JADX INFO: renamed from: b, reason: from getter */
    public final Double getFocusPercentX() {
        return this.focusPercentX;
    }

    /* JADX INFO: renamed from: c, reason: from getter */
    public final Double getFocusPercentY() {
        return this.focusPercentY;
    }

    /* JADX INFO: renamed from: d, reason: from getter */
    public final Integer getOriginalHeight() {
        return this.originalHeight;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    /* JADX INFO: renamed from: e, reason: from getter */
    public final Integer getOriginalWidth() {
        return this.originalWidth;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sw5)) {
            return false;
        }
        sw5 sw5Var = (sw5) obj;
        return g76.L(this.id, sw5Var.id) && g76.L(this.originalWidth, sw5Var.originalWidth) && g76.L(this.originalHeight, sw5Var.originalHeight) && g76.L(this.focusPercentX, sw5Var.focusPercentX) && g76.L(this.focusPercentY, sw5Var.focusPercentY) && g76.L(this.alt, sw5Var.alt);
    }

    public final String getId() {
        return this.id;
    }

    public final int hashCode() {
        int iHashCode = this.id.hashCode() * 31;
        Integer num = this.originalWidth;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.originalHeight;
        int iHashCode3 = (iHashCode2 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Double d = this.focusPercentX;
        int iHashCode4 = (iHashCode3 + (d == null ? 0 : d.hashCode())) * 31;
        Double d2 = this.focusPercentY;
        int iHashCode5 = (iHashCode4 + (d2 == null ? 0 : d2.hashCode())) * 31;
        String str = this.alt;
        return iHashCode5 + (str != null ? str.hashCode() : 0);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeString(this.id);
        Integer num = this.originalWidth;
        if (num == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            parcel.writeInt(num.intValue());
        }
        Integer num2 = this.originalHeight;
        if (num2 == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            parcel.writeInt(num2.intValue());
        }
        Double d = this.focusPercentX;
        if (d == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            parcel.writeDouble(d.doubleValue());
        }
        Double d2 = this.focusPercentY;
        if (d2 == null) {
            parcel.writeInt(0);
        } else {
            parcel.writeInt(1);
            parcel.writeDouble(d2.doubleValue());
        }
        parcel.writeString(this.alt);
    }

    public final String toString() {
        return "ImageData(id=" + this.id + ", originalWidth=" + this.originalWidth + ", originalHeight=" + this.originalHeight + ", focusPercentX=" + this.focusPercentX + ", focusPercentY=" + this.focusPercentY + ", alt=" + this.alt + AEVqIoD.nVWjTOeV;
    }

    public sw5(String str, Integer num, Integer num2, Double d, Double d2, String str2) {
        str.getClass();
        this.id = str;
        this.originalWidth = num;
        this.originalHeight = num2;
        this.focusPercentX = d;
        this.focusPercentY = d2;
        this.alt = str2;
    }
}
