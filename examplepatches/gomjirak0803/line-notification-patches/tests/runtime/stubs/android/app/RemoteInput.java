package android.app;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.HashSet;
import java.util.Set;

public final class RemoteInput implements Parcelable {
    public static final int EDIT_CHOICES_BEFORE_SENDING_AUTO = 0;

    private final String resultKey;
    private final CharSequence label;
    private final boolean allowFreeFormInput;
    private final CharSequence[] choices;
    private final Bundle extras;
    private final Set<String> allowedDataTypes;

    private RemoteInput(Builder b) {
        this.resultKey = b.resultKey;
        this.label = b.label;
        this.allowFreeFormInput = b.allowFreeFormInput;
        this.choices = b.choices == null ? null : b.choices.clone();
        this.extras = new Bundle(b.extras);
        this.allowedDataTypes = new HashSet<String>(b.allowedDataTypes);
    }

    public String getResultKey() { return resultKey; }
    public CharSequence getLabel() { return label; }
    public boolean getAllowFreeFormInput() { return allowFreeFormInput; }
    public CharSequence[] getChoices() { return choices; }
    public Bundle getExtras() { return extras; }
    public Set<String> getAllowedDataTypes() { return allowedDataTypes; }

    @Override public int describeContents() { return 0; }
    @Override public void writeToParcel(Parcel dest, int flags) {}

    public static final class Builder {
        private final String resultKey;
        private CharSequence label;
        private boolean allowFreeFormInput = true;
        private CharSequence[] choices;
        private final Bundle extras = new Bundle();
        private final Set<String> allowedDataTypes = new HashSet<String>();

        public Builder(String resultKey) { this.resultKey = resultKey; }
        public Builder setLabel(CharSequence label) { this.label = label; return this; }
        public Builder setAllowFreeFormInput(boolean allow) { this.allowFreeFormInput = allow; return this; }
        public Builder setChoices(CharSequence[] choices) { this.choices = choices; return this; }
        public Builder addExtras(Bundle extras) { this.extras.putAll(extras); return this; }
        public Builder setAllowDataType(String mimeType, boolean doAlow) {
            if (doAlow) allowedDataTypes.add(mimeType);
            else allowedDataTypes.remove(mimeType);
            return this;
        }
        public Builder setEditChoicesBeforeSending(int mode) { return this; }
        public RemoteInput build() { return new RemoteInput(this); }
    }
}
