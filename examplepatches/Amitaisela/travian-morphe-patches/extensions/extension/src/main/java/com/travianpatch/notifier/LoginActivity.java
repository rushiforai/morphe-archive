package com.travianpatch.notifier;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import org.json.JSONObject;

/**
 * One-time, in-app login screen. Runs Travian's own email+password grant
 * exactly once, keeps only the resulting long-lived lobby session cookie
 * (NotifierService refreshes the short-lived per-gameworld token from that
 * alone afterwards — see NotifierService#resumeSession), and never persists
 * the password anywhere; it lives only in local variables for the duration
 * of this one request.
 *
 * Does not support Google-linked accounts: the identity API used here is a
 * plain email+password grant, and the game's own "Sign in with Google" runs
 * inside the IL2CPP/Unity layer, which a bytecode patch can't reach into.
 */
public class LoginActivity extends Activity {

    private EditText emailField;
    private EditText passwordField;
    private TextView statusText;
    private Button loginButton;
    private ProgressBar progressBar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(buildLayout());
    }

    private View buildLayout() {
        int pad = dp(24);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(pad, pad, pad, pad);

        TextView title = new TextView(this);
        title.setText("Sign in to Travian: Legends");
        title.setTextSize(18);
        title.setPadding(0, 0, 0, dp(8));
        root.addView(title);

        TextView subtitle = new TextView(this);
        subtitle.setText("Used only to enable build/troop notifications. Your password is sent "
                + "to Travian's own login API and is never stored — only the resulting session "
                + "is kept, encrypted on this device.");
        subtitle.setTextSize(13);
        subtitle.setPadding(0, 0, 0, dp(16));
        root.addView(subtitle);

        emailField = new EditText(this);
        emailField.setHint("Email");
        emailField.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_EMAIL_ADDRESS);
        root.addView(emailField);

        passwordField = new EditText(this);
        passwordField.setHint("Password");
        passwordField.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        root.addView(passwordField);

        loginButton = new Button(this);
        loginButton.setText("Log in");
        loginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                attemptLogin();
            }
        });
        LinearLayout.LayoutParams buttonParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        buttonParams.gravity = Gravity.END;
        buttonParams.topMargin = dp(16);
        loginButton.setLayoutParams(buttonParams);
        root.addView(loginButton);

        progressBar = new ProgressBar(this);
        progressBar.setVisibility(View.GONE);
        root.addView(progressBar);

        statusText = new TextView(this);
        statusText.setPadding(0, dp(12), 0, 0);
        root.addView(statusText);

        return root;
    }

    private void attemptLogin() {
        final String email = emailField.getText().toString().trim();
        final String password = passwordField.getText().toString();
        if (email.length() == 0 || password.length() == 0) {
            statusText.setText("Enter your email and password.");
            return;
        }

        setBusy(true);

        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    String sessionCookie = performLogin(email, password);
                    SecureStore.saveSessionCookie(getApplicationContext(), sessionCookie);
                    NotifierService.start(getApplicationContext());
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            statusText.setText("Logged in. Notifications enabled.");
                            new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
                                @Override
                                public void run() {
                                    finish();
                                }
                            }, 900);
                        }
                    });
                } catch (final Exception e) {
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            setBusy(false);
                            statusText.setText("Login failed: " + describeError(e)
                                    + "\n\nNote: accounts that only ever used \"Sign in with "
                                    + "Google\" aren't supported yet — this needs a Travian "
                                    + "email + password.");
                        }
                    });
                }
            }
        }, "travian-notifier-login").start();
    }

    /** Performs the password grant once. The password only ever lives in local variables here. */
    private String performLogin(String email, String password) throws Exception {
        SimpleCookieJar cookieJar = new SimpleCookieJar();
        okhttp3.OkHttpClient http = TravianApi.newClient(cookieJar);

        String codeVerifier = TravianApi.randomUrlSafe(32);
        String codeChallenge = TravianApi.sha256UrlSafe(codeVerifier);

        JSONObject step1Body = new JSONObject();
        step1Body.put("code_challenge_method", "S256");
        step1Body.put("login", email);
        step1Body.put("password", password);
        step1Body.put("code_challenge", codeChallenge);
        JSONObject step1 = TravianApi.postJson(
                http, TravianApi.IDENTITY_HOST + "/provider/login?client_id=" + TravianApi.CLIENT_ID, step1Body);
        if (!step1.has("code")) {
            throw new IllegalStateException("no authorization code in response: " + step1);
        }
        String authCode = step1.getString("code");

        JSONObject step2Body = new JSONObject();
        step2Body.put("code", authCode);
        step2Body.put("code_verifier", codeVerifier);
        step2Body.put("locale", "en-US");
        TravianApi.postJson(http, TravianApi.LOBBY_HOST + "/api/auth/code", step2Body); // sets the lobby session cookie

        String sessionCookie = cookieJar.getCookieValue(
                TravianApi.hostOf(TravianApi.LOBBY_HOST), TravianApi.LOBBY_SESSION_COOKIE);
        if (sessionCookie == null) {
            throw new IllegalStateException("login succeeded but no lobby session cookie was set");
        }
        return sessionCookie;
    }

    private static String describeError(Exception e) {
        String msg = e.getMessage();
        return msg != null ? msg : e.getClass().getSimpleName();
    }

    private void setBusy(boolean busy) {
        loginButton.setEnabled(!busy);
        emailField.setEnabled(!busy);
        passwordField.setEnabled(!busy);
        progressBar.setVisibility(busy ? View.VISIBLE : View.GONE);
        if (busy) {
            statusText.setText("Logging in…");
        }
    }

    private int dp(int value) {
        float density = getResources().getDisplayMetrics().density;
        return Math.round(value * density);
    }
}
