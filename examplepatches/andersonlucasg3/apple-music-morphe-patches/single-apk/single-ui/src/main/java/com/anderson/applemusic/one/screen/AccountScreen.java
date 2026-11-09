package com.anderson.applemusic.one.screen;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.anderson.applemusic.one.media.AccountSession;
import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;
import com.anderson.applemusic.one.widget.CircleButton;
import com.anderson.applemusic.one.widget.Icons;
import com.anderson.applemusic.one.widget.Pill;

/**
 * Conta panel: shows the engine's current Apple account when one is signed in, and the
 * official sign-in when it is not. The sign-in itself is still the engine's Compose AMS
 * sheet driven from {@code OneActivity}; this panel only gives it a proper entry point.
 *
 * <p>The account state is read from the engine's own StoreApi/DataStore files on every
 * open (see {@link AccountSession}), so returning from the sign-in sheet updates it.
 */
public final class AccountScreen {

    private final Context context;
    private final ScreenHost host;
    private final FrameLayout root;
    private final LinearLayout panel;

    public AccountScreen(Context context, final ScreenHost host) {
        this.context = context;
        this.host = host;

        root = new FrameLayout(context);
        root.setBackgroundColor(0xD9000000);
        root.setVisibility(View.GONE);
        root.setClickable(true);
        root.setContentDescription("Fechar");
        root.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.closeAccount();
            }
        });

        panel = new LinearLayout(context);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setGravity(Gravity.CENTER_HORIZONTAL);
        panel.setPadding(Tokens.dp(24), Tokens.dp(26), Tokens.dp(24), Tokens.dp(20));
        // Consume taps inside the panel without adding a clickable a11y node.
        panel.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, android.view.MotionEvent event) {
                return true;
            }
        });

        // The panel outgrows the 360 dp of a rotated phone; a ScrollView keeps every link
        // reachable there instead of clipping "Conta Apple"/"Ajustes"/"Fechar".
        ScrollView scroll = new ScrollView(context);
        scroll.setBackground(Shapes.rounded(Tokens.SURFACE, Tokens.RADIUS_SHEET));
        scroll.setVerticalScrollBarEnabled(false);
        scroll.setOverScrollMode(View.OVER_SCROLL_NEVER);
        scroll.setFocusable(false);
        scroll.addView(panel, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        Shapes.clip(scroll, Tokens.RADIUS_SHEET);

        int width = Math.min(Tokens.dp(460), Math.round(Tokens.screenWidth() * 0.88f));
        FrameLayout.LayoutParams panelParams = new FrameLayout.LayoutParams(
                width, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER);
        root.addView(scroll, panelParams);
    }

    /** Rebuilds the panel contents from the account the engine has right now. */
    private void render() {
        panel.removeAllViews();
        AccountSession.Profile profile = AccountSession.load(context);
        if (profile.signedIn) {
            addProfile(profile);
        } else {
            addSignedOut();
        }
        addClose();
    }

    private void addProfile(AccountSession.Profile profile) {
        TextView avatar = Inter.text(context, profile.initial, 26f, Inter.BOLD, Tokens.TEXT);
        avatar.setGravity(Gravity.CENTER);
        avatar.setBackground(Shapes.circle(Tokens.ACCENT_DIM));
        avatar.setFocusable(false);
        avatar.setClickable(false);
        panel.addView(avatar, new LinearLayout.LayoutParams(Tokens.dp(64), Tokens.dp(64)));

        TextView name = Inter.text(context, profile.name, Tokens.SECTION, Inter.BOLD, Tokens.TEXT);
        name.setGravity(Gravity.CENTER);
        name.setMaxLines(2);
        name.setEllipsize(android.text.TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams nameParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        nameParams.topMargin = Tokens.dp(14);
        panel.addView(name, nameParams);

        TextView subtitle = Inter.text(context, "Conta Apple", Tokens.CAPTION, Inter.REGULAR,
                Tokens.TEXT_DIM);
        subtitle.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams subtitleParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        subtitleParams.topMargin = Tokens.dp(4);
        panel.addView(subtitle, subtitleParams);

        if (profile.email.length() > 0) {
            addField("APPLE ID", profile.email);
        }
        addField("ASSINATURA", profile.subscription);
        addAccountLink("Gerenciar assinatura");
        addAccountLink("Conta Apple");
        addEngineSettingsLink();

        TextView hint = Inter.text(context,
                "Gerenciar assinatura e Conta Apple abrem a tela oficial do Apple Music. "
                        + "Ajustes do Apple Music abre a tela do engine. "
                        + "Sair da conta não é feito por este painel.",
                Tokens.CAPTION, Inter.REGULAR, Tokens.TEXT_DIM);
        hint.setGravity(Gravity.CENTER);
        hint.setLineSpacing(Tokens.dp(3), 1f);
        hint.setPadding(0, Tokens.dp(16), 0, 0);
        panel.addView(hint);
    }

    /**
     * Engine settings shortcut. The manifest's {@code equalizer.EQActivity} is declared
     * without a theme and its fragment crashes with a NullPointerException in engine
     * 7.0.0, so the equalizer entry stays hidden instead of taking the app down; the
     * equalizer toggle itself lives inside these settings.
     */
    private void addEngineSettingsLink() {
        if (!host.engineSettingsAvailable()) return;
        Pill link = Pill.surface(context, 0, "Ajustes do Apple Music");
        link.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.closeAccount();
                host.openEngineSettings();
            }
        });
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = Tokens.dp(10);
        panel.addView(link, params);
    }

    private void addField(String label, String value) {
        TextView labelView = Inter.text(context, label, Tokens.CAPTION, Inter.MEDIUM, Tokens.TEXT_DIM);
        labelView.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        labelParams.topMargin = Tokens.dp(18);
        panel.addView(labelView, labelParams);

        TextView valueView = Inter.text(context, value, Tokens.BODY, Inter.REGULAR, Tokens.TEXT);
        valueView.setGravity(Gravity.CENTER);
        valueView.setMaxLines(2);
        valueView.setEllipsize(android.text.TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams valueParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        valueParams.topMargin = Tokens.dp(3);
        panel.addView(valueView, valueParams);
    }

    /** Opens the engine's official account screen (subscription/account management). */
    private void addAccountLink(String label) {
        Pill link = Pill.surface(context, 0, label);
        link.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.openAccountSummary();
            }
        });
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = Tokens.dp(10);
        panel.addView(link, params);
    }

    private void addSignedOut() {
        CircleButton icon = new CircleButton(context, Icons.ACCOUNT, 56f,
                Tokens.ACCENT_DIM, Tokens.TEXT, 28f);
        icon.setFocusable(false);
        icon.setClickable(false);
        panel.addView(icon, new LinearLayout.LayoutParams(Tokens.dp(56), Tokens.dp(56)));

        TextView title = Inter.text(context, "Conta", Tokens.SECTION, Inter.BOLD, Tokens.TEXT);
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        titleParams.topMargin = Tokens.dp(14);
        panel.addView(title, titleParams);

        TextView body = Inter.text(context,
                "O Apple ID e a biblioteca pertencem ao Apple Music instalado. "
                        + "Entre na sua conta para ver biblioteca, estações e recomendações.",
                Tokens.BODY, Inter.REGULAR, Tokens.TEXT_DIM);
        body.setGravity(Gravity.CENTER);
        body.setLineSpacing(Tokens.dp(4), 1f);
        LinearLayout.LayoutParams bodyParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        bodyParams.topMargin = Tokens.dp(8);
        panel.addView(body, bodyParams);

        Pill signIn = Pill.accent(context, Icons.ACCOUNT, "Entrar na conta Apple");
        signIn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.closeAccount();
                host.openAccount();
            }
        });
        LinearLayout.LayoutParams signInParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        signInParams.topMargin = Tokens.dp(20);
        panel.addView(signIn, signInParams);

        TextView hint = Inter.text(context, "O login é o mesmo do app oficial; ao terminar, "
                + "esta tela é recarregada.", Tokens.CAPTION, Inter.REGULAR, Tokens.TEXT_DIM);
        hint.setGravity(Gravity.CENTER);
        hint.setPadding(0, Tokens.dp(14), 0, 0);
        panel.addView(hint);
    }

    private void addClose() {
        Pill closePanel = Pill.highlighted(context, 0, "Fechar");
        closePanel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.closeAccount();
            }
        });
        LinearLayout.LayoutParams closeParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        closeParams.topMargin = Tokens.dp(10);
        panel.addView(closePanel, closeParams);
    }

    public View view() {
        return root;
    }

    public void open() {
        render();
        root.setVisibility(View.VISIBLE);
    }

    public void close() {
        root.setVisibility(View.GONE);
    }

    public boolean isOpen() {
        return root.getVisibility() == View.VISIBLE;
    }
}
