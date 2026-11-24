package android.app;

import android.graphics.drawable.Icon;
import android.os.Parcel;
import android.os.Parcelable;

public final class Person implements Parcelable {
    private final CharSequence name;
    private final String key;
    private final Icon icon;

    private Person(Builder b) {
        this.name = b.name;
        this.key = b.key;
        this.icon = b.icon;
    }

    public CharSequence getName() { return name; }
    public String getKey() { return key; }
    public Icon getIcon() { return icon; }

    @Override public int describeContents() { return 0; }
    @Override public void writeToParcel(Parcel dest, int flags) {}

    public static final class Builder {
        private CharSequence name;
        private String key;
        private Icon icon;

        public Builder setName(CharSequence name) { this.name = name; return this; }
        public Builder setKey(String key) { this.key = key; return this; }
        public Builder setIcon(Icon icon) { this.icon = icon; return this; }
        public Person build() { return new Person(this); }
    }
}
