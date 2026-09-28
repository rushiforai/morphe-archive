package com.facebook.katana.activity;

import android.app.Activity;
import android.content.Intent;

/**
 * Stands in for Facebook's main screen, under its manifest name: the tab it shows and the delegate
 * it hands its work to, by the method names Redex keeps. A test can also make its intent throw.
 */
public class FbMainTabActivity extends Activity {
    public Object currentTab;
    public Object delegate;
    public boolean failGetIntent;

    public Object getCurrentTab() {
        return currentTab;
    }

    public final Object getFragmentActivityDelegate() {
        return delegate;
    }

    @Override
    public Intent getIntent() {
        if (failGetIntent) throw new IllegalStateException("no intent for this test");
        return super.getIntent();
    }
}
