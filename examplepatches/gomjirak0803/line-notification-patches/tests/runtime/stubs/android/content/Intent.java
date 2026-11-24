package android.content;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.HashMap;
import java.util.Map;

public class Intent implements Parcelable {
    public static final int FLAG_ACTIVITY_NEW_TASK = 0x10000000;
    public static final int FLAG_ACTIVITY_CLEAR_TOP = 0x04000000;
    public static final int FLAG_ACTIVITY_SINGLE_TOP = 0x20000000;

    private String action;
    private String componentPackage;
    private String componentClass;
    private Uri data;
    private int flags;
    private final Map<String, String> stringExtras = new HashMap<String, String>();

    public Intent() {}
    public Intent(String action) { this.action = action; }

    public Intent setClassName(String packageName, String className) {
        this.componentPackage = packageName;
        this.componentClass = className;
        return this;
    }

    public Intent setData(Uri data) { this.data = data; return this; }
    public Intent addFlags(int flags) { this.flags |= flags; return this; }
    public Intent putExtra(String name, String value) { stringExtras.put(name, value); return this; }
    public String getAction() { return action; }
    public String getStringExtra(String name) { return stringExtras.get(name); }
    public Uri getData() { return data; }
    public int getFlags() { return flags; }
    public String getComponentClassForTest() { return componentClass; }

    @Override public int describeContents() { return 0; }
    @Override public void writeToParcel(Parcel dest, int flags) {}
}
