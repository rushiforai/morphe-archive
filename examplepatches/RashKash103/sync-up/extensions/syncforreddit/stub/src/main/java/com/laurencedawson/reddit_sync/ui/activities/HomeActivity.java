package com.laurencedawson.reddit_sync.ui.activities;

/**
 * The screen the app settles on, and where it decides whether to ask for a lock on the way in.
 *
 * <p>Compile only, and named as the app names it. `h0` is the deciding method: it reads whether
 * the login lock is on for an account and either asks for a fingerprint or carries on. Asking
 * for a PIN first means handing the decision back once the PIN is right, which is a call to this
 * same method, so it is declared here. It is already public in the app, so nothing has to be
 * opened up for the call to be allowed.
 */
public class HomeActivity extends BaseActivity {
    /** Decides what the app asks for before opening an account, and then opens it. */
    public void h0(String account) {
        throw new UnsupportedOperationException("Stub");
    }
}
