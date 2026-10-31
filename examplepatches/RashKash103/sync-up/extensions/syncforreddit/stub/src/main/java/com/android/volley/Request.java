package com.android.volley;

/**
 * The real class is generic and abstract. Neither matters here, since instances are only ever
 * passed in and one method called on them.
 */
public class Request {
    public Request setRetryPolicy(RetryPolicy retryPolicy) {
        throw new UnsupportedOperationException("Stub");
    }
}
