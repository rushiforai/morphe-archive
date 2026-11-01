package app.noam.extension.chesscom.gamereview;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.webkit.CookieManager;
import android.webkit.JavascriptInterface;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import androidx.annotation.RequiresApi;

import org.json.JSONObject;

import java.io.IOException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import app.noam.extension.chesscom.Utils;

/**
 * The user's own Lichess session, in a WebView that stays out of sight: it logs in once (on a
 * Lichess login page), then imports a game and presses "Request computer analysis" the way
 * lichess.org's own pages do, so Lichess's servers analyse it.
 */
final class LichessSession {
    static final String ORIGIN = "https://lichess.org";
    /** Lichess's answer for a game it has analysed before (fishnet Analyser.Result.AlreadyAnalysed). */
    private static final String ALREADY_ANALYSED = "This game is already analysed";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long CALL_MS = 30_000;
    private static final long LOGIN_MS = 10 * 60_000;

    @SuppressLint("StaticFieldLeak")
    private static WebView web;
    private static boolean pageReady;
    private static Answer pending;
    private static CountDownLatch login;
    private static volatile boolean loggedIn;
    /** Android ended the page's renderer (it does, when memory runs low, with pages not on screen). */
    private static volatile boolean rendererLost;

    private interface Answer {
        void accept(String value);
    }

    private LichessSession() {}

    /**
     * Imports the game on Lichess and asks Lichess's servers to analyse it; returns the Lichess
     * game id. Blocks, so never on the main thread. Fails with a message to show the user.
     */
    static String analyse(String pgn) throws IOException {
        if (!"yes".equals(call("fetch('/', {credentials: 'same-origin'}).then(r => r.text())"
                + ".then(t => MorpheLichess.answer(t.indexOf('id=\"user_tag\"') >= 0 ? 'yes' : 'no'))"))
                && !logIn()) {
            throw new IOException("Log in to Lichess to analyse with Lichess.");
        }
        String url = call("(() => { const body = new URLSearchParams(); body.append('pgn', " + JSONObject.quote(pgn)
            + "); fetch('/import', {method: 'POST', body: body, credentials: 'same-origin'})"
            + ".then(r => !r.ok ? MorpheLichess.answer('') : r.url.indexOf('/import') < 0 ? MorpheLichess.answer(r.url)"
            + " : r.json().then(j => MorpheLichess.answer(j.url || '')))"
            + ".catch(() => MorpheLichess.answer('')); })()");
        String id = gameId(url);
        if (id == null) throw new IOException("Lichess couldn't import this game.");
        String refused = call("fetch('/game/" + id + "/request-analysis', {method: 'POST', credentials: 'same-origin'})"
            + ".then(r => r.ok ? MorpheLichess.answer('') : r.text().then(t => MorpheLichess.answer(t || ('HTTP ' + r.status))))"
            + ".catch(() => MorpheLichess.answer('No connection to Lichess'))");
        // A game reviewed before is already analysed on Lichess: its analysis is simply read again.
        if (refused != null && !refused.isEmpty() && !refused.contains(ALREADY_ANALYSED)) {
            throw new IOException("Lichess: " + refused);
        }
        return id;
    }

    /** "https://lichess.org/game/AbCd1234" (or the older "https://lichess.org/AbCd1234/white") as "AbCd1234". */
    private static String gameId(String url) {
        if (url == null || !url.startsWith(ORIGIN + "/")) return null;
        String[] path = url.substring(ORIGIN.length() + 1).split("[/?#]");
        String id = path.length > 1 && path[0].equals("game") ? path[1] : path[0];
        return id.length() == 8 ? id : null;
    }

    /** Opens Lichess's login page and waits until the user has logged in or left it. */
    private static boolean logIn() throws IOException {
        Activity activity = Utils.topActivity();
        if (activity == null) return false;
        login = new CountDownLatch(1);
        loggedIn = false;
        MAIN.post(() -> activity.startActivity(new Intent(activity, LichessLoginActivity.class)));
        try {
            if (!login.await(LOGIN_MS, TimeUnit.MILLISECONDS)) return false;
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new IOException("Interrupted");
        }
        return loggedIn;
    }

    /** The login page closed: whether the user is now logged in. */
    static void onLogin(boolean ok) {
        loggedIn = ok;
        CookieManager.getInstance().flush();
        if (login != null) login.countDown();
    }

    /** Runs a script on a lichess.org page; it answers through MorpheLichess.answer(value). */
    private static String call(String script) throws IOException {
        try {
            return callOnce(script);
        } catch (IOException e) {
            // The page whose renderer Android ended is replaced: once more, on the new one.
            if (!rendererLost) throw e;
            rendererLost = false;
            return callOnce(script);
        }
    }

    private static String callOnce(String script) throws IOException {
        CountDownLatch done = new CountDownLatch(1);
        String[] result = {null};
        MAIN.post(() -> {
            pending = value -> {
                result[0] = value;
                done.countDown();
            };
            WebView view = view();
            if (view == null) {
                done.countDown();
                return;
            }
            if (pageReady) view.evaluateJavascript(script, null);
            else view.setTag(script);
        });
        try {
            if (!done.await(CALL_MS, TimeUnit.MILLISECONDS)) throw new IOException("Lichess didn't answer.");
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new IOException("Interrupted");
        }
        if (result[0] == null) throw new IOException("Lichess didn't answer.");
        return result[0];
    }

    /** The out-of-sight page on lichess.org that the scripts run on; main thread only. */
    @SuppressLint("SetJavaScriptEnabled")
    private static WebView view() {
        if (web != null) return web;
        Context context = Utils.context();
        if (context == null) return null;
        web = new WebView(context);
        web.getSettings().setJavaScriptEnabled(true);
        web.getSettings().setDomStorageEnabled(true);
        CookieManager.getInstance().setAcceptCookie(true);
        web.addJavascriptInterface(new Object() {
            @JavascriptInterface
            public void answer(String value) {
                MAIN.post(() -> {
                    Answer answer = pending;
                    pending = null;
                    if (answer != null) answer.accept(value);
                });
            }
        }, "MorpheLichess");
        web.setWebViewClient(new WebViewClient() {
            @Override
            public void onPageFinished(WebView view, String url) {
                pageReady = true;
                Object waiting = view.getTag();
                view.setTag(null);
                if (waiting instanceof String) view.evaluateJavascript((String) waiting, null);
            }

            // Left unhandled, a WebView whose renderer is gone takes the whole app down with it.
            @RequiresApi(26)
            @Override
            public boolean onRenderProcessGone(WebView view, RenderProcessGoneDetail detail) {
                rendererLost = true;
                if (web == view) web = null;
                pageReady = false;
                view.destroy();
                Answer answer = pending;
                pending = null;
                if (answer != null) answer.accept(null);
                return true;
            }
        });
        // A small page of lichess.org: scripts there talk to Lichess with the user's session.
        web.loadUrl(ORIGIN + "/robots.txt");
        return web;
    }
}
