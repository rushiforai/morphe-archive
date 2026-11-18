// SPDX-License-Identifier: AGPL-3.0-or-later
package com.android.volley;

import java.util.Map;

/** Compile-only stand-in for the Volley response class bundled in the app. */
public class NetworkResponse {
    public NetworkResponse(int statusCode, byte[] data, Map<String, String> headers, boolean notModified, long networkTimeMs) {
        throw new UnsupportedOperationException("stub");
    }
}
