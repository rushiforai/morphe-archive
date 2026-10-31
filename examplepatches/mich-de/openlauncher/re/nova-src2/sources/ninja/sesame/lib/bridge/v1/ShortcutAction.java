package ninja.sesame.lib.bridge.v1;

import android.content.Intent;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import androidx.annotation.Keep;
import z1.p;

@Keep
/* loaded from: classes5.dex */
public class ShortcutAction implements Parcelable {
    public static final Parcelable.Creator<ShortcutAction> CREATOR = new p(3);
    public String category;
    public Uri iconUri;
    public Intent intent;
    public boolean isSearch;
    public String label;
    public int rank;
    public String shortcutId;
    public int type;

    public ShortcutAction(Parcel parcel) {
        readFromParcel(parcel, getClass().getClassLoader());
    }

    private void readFromParcel(Parcel parcel, ClassLoader classLoader) {
        this.shortcutId = parcel.readString();
        this.rank = parcel.readInt();
        this.category = parcel.readString();
        this.type = parcel.readInt();
        this.label = parcel.readString();
        String string = parcel.readString();
        Intent uri = null;
        this.iconUri = TextUtils.isEmpty(string) ? null : Uri.parse(string);
        try {
            String string2 = parcel.readString();
            if (!TextUtils.isEmpty(string2)) {
                uri = Intent.parseUri(string2, 1);
            }
        } catch (Throwable unused) {
        }
        this.intent = uri;
        this.isSearch = parcel.readInt() != 0;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.shortcutId);
        parcel.writeInt(this.rank);
        parcel.writeString(this.category);
        parcel.writeInt(this.type);
        parcel.writeString(this.label);
        Uri uri = this.iconUri;
        parcel.writeString(uri == null ? null : uri.toString());
        Intent intent = this.intent;
        parcel.writeString(intent != null ? intent.toUri(1) : null);
        parcel.writeInt(this.isSearch ? 1 : 0);
    }

    public ShortcutAction(Parcel parcel, ClassLoader classLoader) {
        readFromParcel(parcel, classLoader);
    }

    public ShortcutAction(String str, int i5, String str2, int i11, String str3, Uri uri, Intent intent, boolean z11) {
        this.shortcutId = str;
        this.rank = i5;
        this.category = str2;
        this.type = i11;
        this.label = str3;
        this.iconUri = uri;
        this.intent = intent;
        this.isSearch = z11;
    }
}
