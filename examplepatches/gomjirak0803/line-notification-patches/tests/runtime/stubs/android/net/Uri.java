package android.net;

import android.os.Parcel;
import android.os.Parcelable;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public final class Uri implements Parcelable {
    private final String raw;
    private final String path;

    private Uri(String raw, String path) {
        this.raw = raw;
        this.path = path;
    }

    public static Uri parse(String uriString) {
        if (uriString == null) return new Uri("", "");
        String path = uriString;
        int schemeIdx = uriString.indexOf("://");
        if (schemeIdx >= 0) {
            int slashIdx = uriString.indexOf('/', schemeIdx + 3);
            path = slashIdx >= 0 ? uriString.substring(slashIdx) : "";
        }
        return new Uri(uriString, path);
    }

    public String getPath() { return path; }
    @Override public String toString() { return raw; }
    @Override public int describeContents() { return 0; }
    @Override public void writeToParcel(Parcel dest, int flags) {}

    public static final class Builder {
        private String scheme = "";
        private String authority = "";
        private final StringBuilder pathBuilder = new StringBuilder();

        public Builder scheme(String s) { this.scheme = s == null ? "" : s; return this; }
        public Builder authority(String a) { this.authority = a == null ? "" : a; return this; }
        public Builder appendPath(String seg) {
            pathBuilder.append('/');
            if (seg != null) {
                try { pathBuilder.append(URLEncoder.encode(seg, "UTF-8")); }
                catch (UnsupportedEncodingException e) { pathBuilder.append(seg); }
            }
            return this;
        }
        public Uri build() {
            String p = pathBuilder.toString();
            return new Uri(scheme + "://" + authority + p, p);
        }
    }
}
