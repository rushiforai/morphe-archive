package com.p1.mobile.putong.data.extension.signature;

import android.util.Log;

import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.HttpUrl;

import java.io.IOException;

/**
 * Interceptor that replaces Google Maps API signature headers with the original
 * Tantan app's signature. This allows Maps to work even when the APK is re-signed.
 * 
 * Strategy:
 * 1. If the request already has X-Android-Package or X-Android-Cert headers,
 *    replace them with the original Tantan values (catches Maps SDK auth requests).
 * 2. If the request is to a known Google Maps/Places API endpoint, add the headers
 *    even if they're not already present.
 * 
 * The Maps SDK sends two headers to Google's servers:
 * - X-Android-Package: The app's package name
 * - X-Android-Cert: SHA-1 fingerprint of the signing certificate
 * 
 * We replace these with the original Tantan values to bypass signature validation.
 */
public class MapsSignatureInterceptor implements Interceptor {
    private static final String TAG = "MapsSignatureInterceptor";
    
    // Original Tantan app package name
    private static final String ORIGINAL_PACKAGE = "com.tantantribe.tribe";
    
    // Original Tantan signing certificate SHA-1 (without colons)
    private static final String ORIGINAL_SHA1 = "715BAB0F363395FE34D187684B0EF771A9D400F0";
    
    @Override
    public Response intercept(Chain chain) throws IOException {
        Request originalRequest = chain.request();
        HttpUrl url = originalRequest.url();
        String host = url.host();
        
        // Check if this request needs signature header replacement
        boolean hasExistingHeaders = originalRequest.header("X-Android-Package") != null
                || originalRequest.header("X-Android-Cert") != null;
        boolean isGoogleMapsEndpoint = isGoogleMapsApiRequest(host, url.toString());
        
        if (hasExistingHeaders || isGoogleMapsEndpoint) {
            Request.Builder builder = originalRequest.newBuilder();
            
            // Always set/replace with original Tantan values
            builder.header("X-Android-Package", ORIGINAL_PACKAGE);
            builder.header("X-Android-Cert", ORIGINAL_SHA1);
            
            Request modifiedRequest = builder.build();
            
            if (hasExistingHeaders) {
                Log.d(TAG, "Replaced existing signature headers for: " + host);
            } else {
                Log.d(TAG, "Added signature headers for Maps endpoint: " + url.toString());
            }
            
            return chain.proceed(modifiedRequest);
        }
        
        return chain.proceed(originalRequest);
    }
    
    /**
     * Check if this is a Google Maps/Places API request that needs signature headers.
     */
    private boolean isGoogleMapsApiRequest(String host, String fullUrl) {
        // Google Maps API endpoints
        if (host.contains("maps.googleapis.com")) return true;
        
        // Google Places API
        if (host.contains("places.googleapis.com")) return true;
        
        // Google Maps tile servers
        if (host.contains("mt0.googleapis.com") || 
            host.contains("mt1.googleapis.com") ||
            host.contains("mt2.googleapis.com") ||
            host.contains("mt3.googleapis.com")) return true;
        
        // Google Maps client API paths
        if (fullUrl.contains("/maps/api/")) return true;
        
        return false;
    }
}
