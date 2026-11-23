package android.support.v4.media.session;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * Stand-in for the app's own copy of the AndroidX compat session class. Its token crosses
 * the host Binder boundary by class name, so the real class must stay un-relocated and the
 * extension must not bundle another. The app keeps a public two-argument constructor.
 */
public final class MediaSessionCompat {
    private MediaSessionCompat() { }

    public static final class Token implements Parcelable {
        public static final Parcelable.Creator<Token> CREATOR = null;

        public Token(Parcelable inner, b extraBinder) { }

        @Override public int describeContents() { return 0; }

        @Override public void writeToParcel(Parcel dest, int flags) { }
    }
}
