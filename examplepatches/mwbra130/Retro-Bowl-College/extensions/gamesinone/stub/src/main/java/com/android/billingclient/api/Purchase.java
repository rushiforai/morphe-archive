package com.android.billingclient.api;

import java.util.List;

/**
 * Compile-only stub of the Play Billing Purchase class. At runtime the
 * app's real billing library class is used; only the signatures matter
 * here.
 */
public class Purchase {
    public Purchase(String json, String signature) {
    }

    public List<String> getProducts() {
        return null;
    }

    public String getOriginalJson() {
        return null;
    }
}
