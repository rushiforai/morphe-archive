package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.FacebookException;
import com.facebook.FacebookServiceException;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b94 implements Parcelable {
    public final int a;
    public final int b;
    public final int c;
    public final String d;
    public final String e;
    public final String f;
    public final Object g;
    public final String h;
    public final FacebookException i;
    public static final fa4 j = new fa4(17);
    public static final Parcelable.Creator<b94> CREATOR = new h74(1);

    public b94(int i, int i2, int i3, String str, String str2, String str3, String str4, Object obj, FacebookException facebookException, boolean z) {
        Set set;
        Set set2;
        Set set3;
        a94 a94Var;
        this.a = i;
        this.b = i2;
        this.c = i3;
        this.d = str;
        this.e = str3;
        this.f = str4;
        this.g = obj;
        this.h = str2;
        fa4 fa4Var = j;
        if (facebookException != null) {
            this.i = facebookException;
            a94Var = a94.OTHER;
        } else {
            this.i = new FacebookServiceException(this, a());
            m50 m50VarV = fa4Var.v();
            Map map = (Map) m50VarV.c;
            Map map2 = (Map) m50VarV.d;
            Map map3 = (Map) m50VarV.b;
            a94Var = z ? a94.TRANSIENT : (map3 != null && map3.containsKey(Integer.valueOf(i2)) && ((set3 = (Set) map3.get(Integer.valueOf(i2))) == null || set3.contains(Integer.valueOf(i3)))) ? a94.OTHER : (map2 != null && map2.containsKey(Integer.valueOf(i2)) && ((set2 = (Set) map2.get(Integer.valueOf(i2))) == null || set2.contains(Integer.valueOf(i3)))) ? a94.LOGIN_RECOVERABLE : (map != null && map.containsKey(Integer.valueOf(i2)) && ((set = (Set) map.get(Integer.valueOf(i2))) == null || set.contains(Integer.valueOf(i3)))) ? a94.TRANSIENT : a94.OTHER;
        }
        fa4Var.v();
        if (a94Var == null) {
            return;
        }
        int i4 = c94.a[a94Var.ordinal()];
    }

    public final String a() {
        String str = this.h;
        if (str != null) {
            return str;
        }
        FacebookException facebookException = this.i;
        if (facebookException != null) {
            return facebookException.getLocalizedMessage();
        }
        return null;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final String toString() {
        return "{HttpStatus: " + this.a + ", errorCode: " + this.b + ", subErrorCode: " + this.c + ", errorType: " + this.d + ", errorMessage: " + a() + "}";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeInt(this.a);
        parcel.writeInt(this.b);
        parcel.writeInt(this.c);
        parcel.writeString(this.d);
        parcel.writeString(a());
        parcel.writeString(this.e);
        parcel.writeString(this.f);
    }

    public b94(Exception exc) {
        this(-1, -1, -1, null, null, null, null, null, exc instanceof FacebookException ? (FacebookException) exc : new FacebookException(exc), false);
    }

    public b94(String str, int i, String str2) {
        this(-1, i, -1, str, str2, null, null, null, null, false);
    }
}
