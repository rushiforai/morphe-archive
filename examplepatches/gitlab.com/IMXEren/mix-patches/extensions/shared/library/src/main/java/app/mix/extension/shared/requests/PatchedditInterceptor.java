/*
 * Copyright 2026 wchill, IMXEren.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.extension.shared.requests;

import androidx.annotation.NonNull;

import java.io.IOException;

import okhttp3.Interceptor;
import okhttp3.Response;

public abstract class PatchedditInterceptor implements Interceptor {
    public boolean isEnabled() {
        // TODO: Make this toggleable via settings instead of just using isPatchIncluded.
        return isPatchIncluded();
    }
    public abstract boolean isPatchIncluded();

    @NonNull
    protected abstract Response doIntercept(@NonNull Chain chain) throws IOException;

    @NonNull
    @Override
    public final Response intercept(@NonNull Chain chain) throws IOException {
        if (isEnabled()) {
            return doIntercept(chain);
        } else {
            return chain.proceed(chain.request());
        }
    }
}
