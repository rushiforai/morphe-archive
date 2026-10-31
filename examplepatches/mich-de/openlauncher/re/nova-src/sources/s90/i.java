package s90;

import android.net.http.InlineExecutionProhibitedException;
import android.net.http.NetworkException;
import android.net.http.QuicException;

/* loaded from: classes5.dex */
public abstract /* synthetic */ class i {
    public static /* bridge */ /* synthetic */ boolean A(Exception exc) {
        return exc instanceof QuicException;
    }

    public static /* bridge */ /* synthetic */ boolean D(Exception exc) {
        return exc instanceof NetworkException;
    }

    public static /* bridge */ /* synthetic */ NetworkException e(Exception exc) {
        return (NetworkException) exc;
    }

    public static /* bridge */ /* synthetic */ QuicException f(Exception exc) {
        return (QuicException) exc;
    }

    public static /* bridge */ /* synthetic */ boolean v(Exception exc) {
        return exc instanceof InlineExecutionProhibitedException;
    }

    public static /* bridge */ /* synthetic */ boolean w(Object obj) {
        return obj instanceof QuicException;
    }
}
