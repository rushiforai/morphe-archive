package com.facebook.katana.activity;

/**
 * Stands in for the delegate Facebook's main screen hands its work to. Like the real one it holds
 * the tab bar's state in a lazy value, under the field name Kotlin gave it and Redex keeps.
 */
public final class FbMainTabActivityDelegate {
    @SuppressWarnings("unused")
    public Object tabBarStateManager$delegate;
}
