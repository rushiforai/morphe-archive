package ninja.sesame.lib.bridge.v1;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import androidx.annotation.Keep;
import z1.p;

@Keep
/* loaded from: classes5.dex */
public class SesameShortcut implements Parcelable {
    public static final Parcelable.Creator<SesameShortcut> CREATOR = new p(2);
    public ShortcutAction[] actions;
    public String componentName;
    public String htmlLabel;
    public Uri iconUri;

    /* renamed from: id, reason: collision with root package name */
    public String f78349id;
    public String packageName;
    public String plainLabel;
    public String type;

    public SesameShortcut() {
    }

    private void readFromParcel(Parcel parcel, ClassLoader classLoader) {
        this.f78349id = parcel.readString();
        this.type = parcel.readString();
        this.packageName = parcel.readString();
        this.componentName = parcel.readString();
        this.plainLabel = parcel.readString();
        this.htmlLabel = parcel.readString();
        String string = parcel.readString();
        this.iconUri = TextUtils.isEmpty(string) ? null : Uri.parse(string);
        this.actions = (ShortcutAction[]) parcel.createTypedArray(ShortcutAction.CREATOR);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f78349id);
        parcel.writeString(this.type);
        parcel.writeString(this.packageName);
        parcel.writeString(this.componentName);
        parcel.writeString(this.plainLabel);
        parcel.writeString(this.htmlLabel);
        Uri uri = this.iconUri;
        parcel.writeString(uri == null ? null : uri.toString());
        parcel.writeTypedArray(this.actions, i5);
    }

    public SesameShortcut(Parcel parcel) {
        readFromParcel(parcel, getClass().getClassLoader());
    }

    public SesameShortcut(Parcel parcel, ClassLoader classLoader) {
        readFromParcel(parcel, classLoader);
    }
}
