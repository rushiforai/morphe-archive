/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package com.facebook.react.bridge;

/**
 * A test stand-in for React Native's map interface, which Redex keeps. The Marketplace ad filter
 * looks it up by name and reads the request data's tracking name through its getString, the read
 * Facebook's Networking module makes itself.
 */
public interface ReadableMap {
    boolean hasKey(String name);

    /** The string under [name], or null when there's none, as Facebook's Networking module expects. */
    String getString(String name);
}
