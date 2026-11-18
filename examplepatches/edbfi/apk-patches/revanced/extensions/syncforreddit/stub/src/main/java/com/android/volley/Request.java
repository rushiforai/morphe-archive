// SPDX-License-Identifier: AGPL-3.0-or-later
package com.android.volley;

import java.util.Map;

/** Compile-only stand-in for the Volley request class bundled in the app. */
public abstract class Request<T> {
    public String getUrl() {
        throw new UnsupportedOperationException("stub");
    }

    public Map<String, String> getHeaders() throws AuthFailureError {
        throw new UnsupportedOperationException("stub");
    }

    public byte[] getBody() throws AuthFailureError {
        throw new UnsupportedOperationException("stub");
    }

    public String getBodyContentType() {
        throw new UnsupportedOperationException("stub");
    }

    public boolean isCanceled() {
        throw new UnsupportedOperationException("stub");
    }
}
