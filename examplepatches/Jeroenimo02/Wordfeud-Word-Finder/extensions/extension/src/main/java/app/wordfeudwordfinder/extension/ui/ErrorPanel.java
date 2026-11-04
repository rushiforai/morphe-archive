package app.wordfeudwordfinder.extension.ui;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import app.wordfeudwordfinder.extension.core.BuildInfo;
import app.wordfeudwordfinder.extension.core.WfError;
import app.wordfeudwordfinder.extension.core.WordFinder;
import app.wordfeudwordfinder.extension.game.GameStore;
import app.wordfeudwordfinder.extension.hooks.RouteTap;
import app.wordfeudwordfinder.extension.play.RefreshDiagnostic;
import app.wordfeudwordfinder.extension.ui.Strings.Key;

/**
 * An error message in the overlay (spec sections 6.2 step 5 and 10): the short text, the code, "Retry" when it
 * applies ({@link ErrorDetails#retryable}) and "Copy details", which puts {@link ErrorDetails} text on the
 * clipboard ({@code route=} and {@code store=} lines included when known). {@link #showLoading} uses the same panel for
 * a game that is not in the GameStore yet: the GAME_LOADING text and "Copy details", no code or Retry. There is no
 * "copied" feedback of its own: Strings has no text for it, and Android 13+ confirms clipboard
 * writes itself. Main thread only. Hidden (GONE) until {@link #show}.
 */
final class ErrorPanel extends LinearLayout {
    private static final int GAP_DP = 8;

    private final String lang;
    private final TextView message;
    private final TextView code;
    private final TextView retry;
    private WfError error;
    private int rulesetId = -1;
    private Runnable onRetry;
    /** For a rejection: the server's reply shape for the {@code server=} line of Copy details; else null. */
    private String server;
    private boolean rejection;

    ErrorPanel(Context ctx, Theme theme, String lang, float density) {
        super(ctx);
        this.lang = lang;
        setOrientation(VERTICAL);
        setGravity(Gravity.CENTER_HORIZONTAL);
        setVisibility(GONE);

        message = Widgets.text(ctx, 14, theme.textPrimary, Fonts.inter(ctx));
        message.setGravity(Gravity.CENTER);
        addView(message, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        code = Widgets.text(ctx, 12, theme.textSecondary, Fonts.mono(ctx));
        code.setGravity(Gravity.CENTER);
        code.setTextIsSelectable(true);
        addView(code, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout buttons = new LinearLayout(ctx);
        buttons.setOrientation(HORIZONTAL);
        buttons.setGravity(Gravity.CENTER);
        int h = FabPlacement.dp(density, Widgets.BUTTON_HEIGHT_DP);
        int gap = FabPlacement.dp(density, GAP_DP);

        retry = Widgets.button(ctx, theme, density, Strings.get(lang, Key.RETRY), true);
        retry.setOnClickListener(v -> {
            try {
                Runnable r = onRetry;
                if (r != null) r.run();
            } catch (Throwable ignored) {
                // keep the overlay alive
            }
        });
        LayoutParams rlp = new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, h);
        rlp.rightMargin = gap;
        buttons.addView(retry, rlp);

        TextView copy = Widgets.button(ctx, theme, density, Strings.get(lang, Key.COPY_DETAILS), false);
        copy.setOnClickListener(v -> {
            try {
                copyDetails();
            } catch (Throwable ignored) {
                // no clipboard: nothing to do
            }
        });
        buttons.addView(copy, new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, h));

        LayoutParams blp = new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        blp.topMargin = gap;
        addView(buttons, blp);
    }

    /**
     * Shows {@code e}. {@code rulesetId} is for the details (-1 when unknown). {@code retry} is offered only when
     * the error is retryable; pass null when there is nothing to retry.
     */
    void show(WfError e, int rulesetId, Runnable retry) {
        this.error = e;
        this.rulesetId = rulesetId;
        this.onRetry = ErrorDetails.retryable(e) ? retry : null;
        this.server = null;
        this.rejection = false;
        message.setText(Strings.get(lang, Strings.errorKey(e)));
        code.setText(String.format(Strings.get(lang, Key.ERROR_CODE), e.code()));
        code.setVisibility(VISIBLE);
        this.retry.setVisibility(onRetry != null ? VISIBLE : GONE);
        setVisibility(VISIBLE);
    }

    /**
     * A move the server refused: {@code text} (the rejected words), the code of {@code e}, and Copy details with a
     * {@code server=} line holding {@code server} (the reply's shape). No Retry.
     */
    void showRejection(String text, WfError e, int rulesetId, String server) {
        this.error = e;
        this.rulesetId = rulesetId;
        this.onRetry = null;
        this.server = server;
        this.rejection = true;
        message.setText(text);
        code.setText(String.format(Strings.get(lang, Key.ERROR_CODE), e.code()));
        code.setVisibility(VISIBLE);
        retry.setVisibility(GONE);
        setVisibility(VISIBLE);
    }

    /** True while a rejection from {@link #showRejection} is shown. */
    boolean isShowingRejection() {
        return rejection && isShowing();
    }

    /**
     * The open game is not in the GameStore yet (a new game): shows GAME_LOADING with "Copy details" only. The
     * details carry {@code detail=game not loaded yet} plus the route and the last games/detail summary.
     */
    void showLoading() {
        this.error = WfError.gsData("game not loaded yet");
        this.rulesetId = -1;
        this.onRetry = null;
        this.server = null;
        this.rejection = false;
        message.setText(Strings.get(lang, Key.GAME_LOADING));
        code.setVisibility(GONE);
        retry.setVisibility(GONE);
        setVisibility(VISIBLE);
    }

    void hide() {
        error = null;
        onRetry = null;
        server = null;
        rejection = false;
        setVisibility(GONE);
    }

    boolean isShowing() {
        return error != null && getVisibility() == VISIBLE;
    }

    private void copyDetails() {
        WfError e = error;
        if (e == null) return;
        Context ctx = getContext();
        Long gameId = RouteTap.currentGameId();
        String text = ErrorDetails.format(e, hostVersion(ctx), BuildInfo.PATCH_VERSION, rulesetId,
                System.currentTimeMillis(), RefreshDiagnostic.last(), RouteTap.lastRoute(), lastDetail(), gameId,
                source(gameId), server);
        ClipboardManager cm = (ClipboardManager) ctx.getSystemService(Context.CLIPBOARD_SERVICE);
        if (cm != null) cm.setPrimaryClip(ClipData.newPlainText(Strings.get(lang, Key.TITLE), text));
    }

    private static GameStore.UpdateSource source(Long gameId) {
        if (gameId == null) return null;
        try {
            WordFinder wf = WordFinder.get();
            return wf == null ? null : wf.gameStore().source(gameId);
        } catch (Throwable t) {
            return null;
        }
    }

    private static GameStore.DetailSummary lastDetail() {
        try {
            WordFinder wf = WordFinder.get();
            return wf == null ? null : wf.gameStore().lastDetail();
        } catch (Throwable t) {
            return null;
        }
    }

    /** versionName of the host app (Wordfeud), or null when unavailable. */
    @SuppressWarnings("deprecation")
    private static String hostVersion(Context ctx) {
        try {
            PackageInfo pi = ctx.getPackageManager().getPackageInfo(ctx.getPackageName(), 0);
            return pi == null ? null : pi.versionName;
        } catch (Throwable t) {
            return null;
        }
    }
}
