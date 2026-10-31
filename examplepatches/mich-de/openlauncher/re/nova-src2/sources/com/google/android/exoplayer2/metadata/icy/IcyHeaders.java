package com.google.android.exoplayer2.metadata.icy;

import ab.w;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.exoplayer2.metadata.Metadata;
import fe.v0;
import java.util.List;
import java.util.Map;
import qm.e;
import wf.a;
import wf.v;

/* loaded from: classes3.dex */
public final class IcyHeaders implements Metadata.Entry {
    public static final Parcelable.Creator<IcyHeaders> CREATOR = new w(27);

    /* renamed from: a, reason: collision with root package name */
    public final int f31497a;

    /* renamed from: b, reason: collision with root package name */
    public final String f31498b;

    /* renamed from: c, reason: collision with root package name */
    public final String f31499c;

    /* renamed from: d, reason: collision with root package name */
    public final String f31500d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f31501e;

    /* renamed from: f, reason: collision with root package name */
    public final int f31502f;

    public IcyHeaders(int i5, int i11, String str, String str2, String str3, boolean z11) {
        a.e(i11 == -1 || i11 > 0);
        this.f31497a = i5;
        this.f31498b = str;
        this.f31499c = str2;
        this.f31500d = str3;
        this.f31501e = z11;
        this.f31502f = i11;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00c9  */
    /* JADX WARN: Removed duplicated region for block: B:56:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static IcyHeaders a(Map map) throws NumberFormatException {
        boolean z11;
        int i5;
        List list;
        String str;
        List list2;
        String str2;
        List list3;
        String str3;
        List list4;
        boolean zEquals;
        List list5;
        int i11;
        List list6 = (List) map.get("icy-br");
        boolean z12 = true;
        int i12 = -1;
        if (list6 != null) {
            String str4 = (String) list6.get(0);
            try {
                i11 = Integer.parseInt(str4) * 1000;
                if (i11 > 0) {
                    z11 = true;
                } else {
                    try {
                        a.D("IcyHeaders", "Invalid bitrate: " + str4);
                        z11 = false;
                        i11 = -1;
                    } catch (NumberFormatException unused) {
                        e.f("Invalid bitrate header: ", str4, "IcyHeaders");
                        z11 = false;
                        i5 = i11;
                        list = (List) map.get("icy-genre");
                        if (list == null) {
                        }
                        list2 = (List) map.get("icy-name");
                        if (list2 == null) {
                        }
                        list3 = (List) map.get("icy-url");
                        if (list3 == null) {
                        }
                        list4 = (List) map.get("icy-pub");
                        if (list4 == null) {
                        }
                        list5 = (List) map.get("icy-metaint");
                        if (list5 != null) {
                        }
                        int i13 = i12;
                        if (z11) {
                        }
                    }
                }
            } catch (NumberFormatException unused2) {
                i11 = -1;
            }
            i5 = i11;
        } else {
            z11 = false;
            i5 = -1;
        }
        list = (List) map.get("icy-genre");
        if (list == null) {
            str = (String) list.get(0);
            z11 = true;
        } else {
            str = null;
        }
        list2 = (List) map.get("icy-name");
        if (list2 == null) {
            str2 = (String) list2.get(0);
            z11 = true;
        } else {
            str2 = null;
        }
        list3 = (List) map.get("icy-url");
        if (list3 == null) {
            str3 = (String) list3.get(0);
            z11 = true;
        } else {
            str3 = null;
        }
        list4 = (List) map.get("icy-pub");
        if (list4 == null) {
            zEquals = ((String) list4.get(0)).equals("1");
            z11 = true;
        } else {
            zEquals = false;
        }
        list5 = (List) map.get("icy-metaint");
        if (list5 != null) {
            String str5 = (String) list5.get(0);
            try {
                int i14 = Integer.parseInt(str5);
                if (i14 > 0) {
                    i12 = i14;
                } else {
                    try {
                        a.D("IcyHeaders", "Invalid metadata interval: " + str5);
                        z12 = z11;
                    } catch (NumberFormatException unused3) {
                        i12 = i14;
                        e.f("Invalid metadata interval: ", str5, "IcyHeaders");
                        int i132 = i12;
                        if (z11) {
                        }
                    }
                }
                z11 = z12;
            } catch (NumberFormatException unused4) {
            }
        }
        int i1322 = i12;
        if (z11) {
            return new IcyHeaders(i5, i1322, str, str2, str3, zEquals);
        }
        return null;
    }

    @Override // com.google.android.exoplayer2.metadata.Metadata.Entry
    public final void W(v0 v0Var) {
        String str = this.f31499c;
        if (str != null) {
            v0Var.D = str;
        }
        String str2 = this.f31498b;
        if (str2 != null) {
            v0Var.B = str2;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && IcyHeaders.class == obj.getClass()) {
            IcyHeaders icyHeaders = (IcyHeaders) obj;
            if (this.f31497a == icyHeaders.f31497a && v.a(this.f31498b, icyHeaders.f31498b) && v.a(this.f31499c, icyHeaders.f31499c) && v.a(this.f31500d, icyHeaders.f31500d) && this.f31501e == icyHeaders.f31501e && this.f31502f == icyHeaders.f31502f) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int i5 = (527 + this.f31497a) * 31;
        String str = this.f31498b;
        int iHashCode = (i5 + (str != null ? str.hashCode() : 0)) * 31;
        String str2 = this.f31499c;
        int iHashCode2 = (iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31;
        String str3 = this.f31500d;
        return ((((iHashCode2 + (str3 != null ? str3.hashCode() : 0)) * 31) + (this.f31501e ? 1 : 0)) * 31) + this.f31502f;
    }

    public final String toString() {
        return "IcyHeaders: name=\"" + this.f31499c + "\", genre=\"" + this.f31498b + "\", bitrate=" + this.f31497a + ", metadataInterval=" + this.f31502f;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f31497a);
        parcel.writeString(this.f31498b);
        parcel.writeString(this.f31499c);
        parcel.writeString(this.f31500d);
        int i11 = v.f94376a;
        parcel.writeInt(this.f31501e ? 1 : 0);
        parcel.writeInt(this.f31502f);
    }

    public IcyHeaders(Parcel parcel) {
        this.f31497a = parcel.readInt();
        this.f31498b = parcel.readString();
        this.f31499c = parcel.readString();
        this.f31500d = parcel.readString();
        int i5 = v.f94376a;
        this.f31501e = parcel.readInt() != 0;
        this.f31502f = parcel.readInt();
    }
}
