package com.anderson.applemusic.one.screen;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.anderson.applemusic.one.UpdateManager;
import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;
import com.anderson.applemusic.one.widget.CircleButton;
import com.anderson.applemusic.one.widget.Icons;
import com.anderson.applemusic.one.widget.Pill;

/**
 * Atualizações panel in the same visual language as the rest of the UI: rounded surface,
 * installed/engine versions, state message, progress and the check/download/cancel
 * actions. The updater itself (updates.json, SHA-256, PackageInstaller) is unchanged.
 */
public final class UpdatesScreen {

    private final ScreenHost host;
    private final UpdateManager updater;
    private final FrameLayout root;
    private final TextView message;
    private final ProgressBar progress;
    private final Pill checkButton;
    private final Pill downloadButton;
    private final Pill cancelButton;
    private UpdateManager.Update pending;

    public UpdatesScreen(Context context, ScreenHost host, UpdateManager updater,
                         String installedVersion, String engineVersion) {
        this.host = host;
        this.updater = updater;

        root = new FrameLayout(context);
        root.setBackgroundColor(0xD9000000);
        root.setVisibility(View.GONE);
        root.setClickable(true);
        root.setContentDescription("Fechar");
        root.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.closeUpdates();
            }
        });

        LinearLayout panel = new LinearLayout(context);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setPadding(Tokens.dp(24), Tokens.dp(22), Tokens.dp(24), Tokens.dp(18));
        panel.setBackground(Shapes.rounded(Tokens.SURFACE, Tokens.RADIUS_SHEET));
        // Consume taps inside the panel without adding a clickable a11y node.
        panel.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, android.view.MotionEvent event) {
                return true;
            }
        });
        Shapes.clip(panel, Tokens.RADIUS_SHEET);

        LinearLayout titleRow = new LinearLayout(context);
        titleRow.setOrientation(LinearLayout.HORIZONTAL);
        titleRow.setGravity(Gravity.CENTER_VERTICAL);
        TextView title = Inter.text(context, "Atualizações", Tokens.SECTION, Inter.BOLD,
                Tokens.TEXT);
        titleRow.addView(title, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        CircleButton close = new CircleButton(context, Icons.CLOSE, 40f,
                0x00000000, Tokens.TEXT_DIM, 18f);
        close.setContentDescription("Fechar");
        close.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.closeUpdates();
            }
        });
        titleRow.addView(close, new LinearLayout.LayoutParams(Tokens.dp(40), Tokens.dp(40)));
        panel.addView(titleRow);

        TextView subtitle = Inter.text(context, "Apple Music One", Tokens.CAPTION,
                Inter.REGULAR, Tokens.TEXT_DIM);
        panel.addView(subtitle);

        LinearLayout versions = new LinearLayout(context);
        versions.setOrientation(LinearLayout.VERTICAL);
        versions.setPadding(0, Tokens.dp(14), 0, Tokens.dp(2));
        addVersionRow(context, versions, "Instalada", installedVersion);
        addVersionRow(context, versions, "Engine", engineVersion);
        panel.addView(versions);

        message = Inter.text(context, "", 14f, Inter.REGULAR, Tokens.TEXT);
        message.setLineSpacing(Tokens.dp(3), 1f);
        message.setMinHeight(Tokens.dp(56));
        LinearLayout.LayoutParams messageParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        messageParams.topMargin = Tokens.dp(12);
        panel.addView(message, messageParams);

        progress = new ProgressBar(context, null,
                android.R.attr.progressBarStyleHorizontal);
        progress.setMax(100);
        progress.setProgressTintList(android.content.res.ColorStateList.valueOf(Tokens.ACCENT));
        progress.setProgressBackgroundTintList(
                android.content.res.ColorStateList.valueOf(Tokens.TRACK));
        progress.setVisibility(View.GONE);
        LinearLayout.LayoutParams progressParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        progressParams.topMargin = Tokens.dp(4);
        panel.addView(progress, progressParams);

        checkButton = Pill.highlighted(context, Icons.REFRESH, "Verificar");
        checkButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                updater.check();
            }
        });
        downloadButton = Pill.accent(context, Icons.DOWNLOAD, "Baixar e instalar");
        downloadButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (pending != null) updater.download(pending);
            }
        });
        cancelButton = Pill.highlighted(context, Icons.CLOSE, "Cancelar download");
        cancelButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                updater.cancel();
            }
        });
        addButton(panel, checkButton);
        addButton(panel, downloadButton);
        addButton(panel, cancelButton);

        Pill closePanel = Pill.highlighted(context, 0, "Fechar");
        closePanel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.closeUpdates();
            }
        });
        LinearLayout.LayoutParams closeParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        closeParams.gravity = Gravity.CENTER_HORIZONTAL;
        closeParams.topMargin = Tokens.dp(18);
        panel.addView(closePanel, closeParams);

        int width = Math.min(Tokens.dp(520), Math.round(Tokens.screenWidth() * 0.88f));
        FrameLayout.LayoutParams panelParams = new FrameLayout.LayoutParams(
                width, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER);
        root.addView(panel, panelParams);

        render(updater.currentState());
    }

    private void addVersionRow(Context context, LinearLayout parent, String label,
                               String value) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(0, Tokens.dp(3), 0, Tokens.dp(3));
        TextView name = Inter.text(context, label, 13f, Inter.REGULAR, Tokens.TEXT_DIM);
        LinearLayout.LayoutParams nameParams =
                new LinearLayout.LayoutParams(Tokens.dp(90), ViewGroup.LayoutParams.WRAP_CONTENT);
        row.addView(name, nameParams);
        TextView content = Inter.text(context, value, 13f, Inter.MEDIUM, Tokens.TEXT);
        row.addView(content, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        parent.addView(row);
    }

    private void addButton(LinearLayout panel, View button) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = Tokens.dp(8);
        panel.addView(button, params);
    }

    public View view() {
        return root;
    }

    public void open() {
        root.setVisibility(View.VISIBLE);
        setState(updater.currentState());
    }

    public void close() {
        root.setVisibility(View.GONE);
    }

    public boolean isOpen() {
        return root.getVisibility() == View.VISIBLE;
    }

    public void setState(UpdateManager.State state) {
        if (state == null) return;
        if (state.update != null) pending = state.update;
        render(state);
    }

    private void render(UpdateManager.State state) {
        if (state.update != null) pending = state.update;
        String text = state.message;
        if (text == null || text.length() == 0 || state.phase == UpdateManager.IDLE) {
            text = "Verifique se há uma versão nova. O download confere o SHA-256 e instala "
                    + "por cima, mantendo a conta.";
        }
        message.setText(text);

        boolean downloading = state.phase == UpdateManager.DOWNLOADING;
        progress.setVisibility(downloading ? View.VISIBLE : View.GONE);
        if (downloading && state.progress >= 0) progress.setProgress(state.progress);

        boolean canCheck = state.phase == UpdateManager.IDLE
                || state.phase == UpdateManager.NONE
                || state.phase == UpdateManager.INSTALLED
                || state.phase == UpdateManager.ERROR
                || state.phase == UpdateManager.AVAILABLE;
        show(checkButton, canCheck);
        show(downloadButton, state.phase == UpdateManager.AVAILABLE && state.update != null);
        show(cancelButton, downloading);
    }

    private static void show(View view, boolean visible) {
        if (view != null) view.setVisibility(visible ? View.VISIBLE : View.GONE);
    }
}
