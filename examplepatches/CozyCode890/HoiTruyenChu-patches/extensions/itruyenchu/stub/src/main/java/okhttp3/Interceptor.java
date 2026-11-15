package okhttp3;

import java.io.IOException;

/** Compile-time stub, the real class is in the patched app. */
public interface Interceptor {
    Response intercept(Chain chain) throws IOException;

    interface Chain {
        Request request();

        Response proceed(Request request) throws IOException;
    }
}
