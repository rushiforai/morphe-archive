package app.bitchord.telegram;

import android.app.*;
import android.content.*;
import android.os.*;
import android.text.InputType;
import android.text.method.PasswordTransformationMethod;
import android.view.*;
import android.widget.*;

import org.drinkless.tdlib.TdApi;
import org.json.JSONObject;

import java.util.*;

/** Themed application configuration, authorization and music-library screen. */
public final class TelegramActivity extends Activity {
    TelegramBridge bridge;
    TelegramStyle style;
    LinearLayout body;
    TextView status, error, hashVisibility;
    ScrollView scroll;
    final List<View> actions = new ArrayList<>();
    final List<EditText> secrets = new ArrayList<>();
    final Handler handler = new Handler(Looper.getMainLooper());
    String screen = "";
    volatile boolean busy;
    boolean editCredentials, resumed;
    long channelId;
    ChannelView channelView;
    LinearLayout namesList;
    int namesRevision;
    TextView indexLine, importLine, checkLine;

    /** Keeps the Saved index line counting while the page is open. */
    final Runnable indexTicker =
            new Runnable() {
                public void run() {
                    TextView copying = importLine;
                    if (bridge != null
                            && copying != null
                            && bridge.importOption("import")
                            && !bridge.importStatus().isEmpty())
                        copying.setText(bridge.importStatus());
                    TextView checked = checkLine;
                    if (bridge != null && checked != null) {
                        String text = bridge.checkStatus();
                        checked.setText(text);
                        checked.setVisibility(text.isEmpty() ? View.GONE : View.VISIBLE);
                    }
                    TextView line = indexLine;
                    if (bridge != null && line != null && bridge.searchIndex())
                        bridge.work.execute(
                                () -> {
                                    String text = bridge.indexStatus();
                                    runOnUiThread(
                                            () -> {
                                                if (line == indexLine && bridge.searchIndex())
                                                    line.setText(text);
                                            });
                                });
                    handler.postDelayed(this, 2000);
                }
            };

    final Runnable refresh =
            new Runnable() {
                public void run() {
                    render();
                    handler.postDelayed(this, 500);
                }
            };

    @Override
    public void onCreate(Bundle saved) {
        boolean dark = TelegramStyle.isDark(this);
        int theme =
                getResources()
                        .getIdentifier(
                                dark ? "TelegramNativeTheme" : "TelegramNativeThemeLight",
                                "style",
                                getPackageName());
        setTheme(
                theme != 0
                        ? theme
                        : dark
                                ? android.R.style.Theme_Material_NoActionBar
                                : android.R.style.Theme_Material_Light_NoActionBar);
        super.onCreate(saved);
        secureWindow(getWindow());
        if (Build.VERSION.SDK_INT >= 33) setRecentsScreenshotEnabled(false);
        style = new TelegramStyle(this);
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        getWindow().setStatusBarColor(style.background);
        getWindow().setNavigationBarColor(style.background);
        getWindow()
                .getDecorView()
                .setSystemUiVisibility(
                        style.dark
                                ? 0
                                : View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                                        | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
        TelegramBridge.init(getApplicationContext());
        bridge = TelegramBridge.instance;
        editCredentials = bridge != null && !bridge.credentials().configured();
        scroll = new ScrollView(this);
        scroll.setBackgroundColor(style.background);
        scroll.setFillViewport(true);
        body = new LinearLayout(this);
        body.setFilterTouchesWhenObscured(true);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setFocusableInTouchMode(true);
        body.setDescendantFocusability(ViewGroup.FOCUS_BEFORE_DESCENDANTS);
        scroll.addView(body);
        // Arabic and Urdu read right to left, whether or not BitChord itself is set up for it.
        scroll.setLayoutDirection(
                Strings.rightToLeft() ? View.LAYOUT_DIRECTION_RTL : View.LAYOUT_DIRECTION_LTR);
        setContentView(scroll);
        scroll.setOnApplyWindowInsetsListener(
                (view, insets) -> {
                    body.setPadding(
                            0,
                            insets.getSystemWindowInsetTop(),
                            0,
                            style.dp(28) + insets.getSystemWindowInsetBottom());
                    return insets;
                });
        refresh.run();
    }

    @Override
    protected void onResume() {
        super.onResume();
        resumed = true;
        if (channelView != null) channelView.resume();
        handler.removeCallbacks(indexTicker);
        handler.postDelayed(indexTicker, 2000);
    }

    @Override
    protected void onDestroy() {
        if (channelView != null) channelView.close();
        handler.removeCallbacks(refresh);
        super.onDestroy();
    }

    @Override
    protected void onPause() {
        resumed = false;
        handler.removeCallbacks(indexTicker);
        if (channelView != null) channelView.pause();
        for (EditText field : secrets)
            field.setTransformationMethod(PasswordTransformationMethod.getInstance());
        if (hashVisibility != null) hashVisibility.setText(Strings.t("Show hash"));
        super.onPause();
    }

    @Override
    public void onBackPressed() {
        if (channelId != 0) {
            channelId = 0;
            screen = "";
            render();
        } else super.onBackPressed();
    }

    void secureWindow(Window window) {
        if (window == null) return;
        window.addFlags(WindowManager.LayoutParams.FLAG_SECURE);
        if (Build.VERSION.SDK_INT >= 31) window.setHideOverlayWindows(true);
    }

    /** The page last built, kept so a rebuild of the same page can restore its scroll. */
    String shown = "";

    void render() {
        if (bridge != null && !bridge.ready()) channelId = 0;
        String state =
                bridge == null
                        ? "error"
                        : channelId != 0
                                ? "channel:" + channelId + ":" + bridge.generation
                                : editCredentials
                                        ? "credentials"
                                        : bridge.auth == null
                                                ? "starting"
                                                : bridge.auth.getClass().getSimpleName()
                                                        + (advanced ? ":advanced" : "");
        if (state.equals(screen)) {
            updateStatus();
            return;
        }
        screen = state;
        // Rebuilding the same page (after an action) keeps the reader where they were.
        final int keepY = state.equals(shown) && scroll != null ? scroll.getScrollY() : 0;
        shown = state;
        if (keepY > 0)
            scroll.getViewTreeObserver()
                    .addOnPreDrawListener(
                            new android.view.ViewTreeObserver.OnPreDrawListener() {
                                int frames;

                                @Override
                                public boolean onPreDraw() {
                                    // Wait until the new page is laid out tall enough to hold
                                    // the old position, or give up after a few frames.
                                    View page = scroll.getChildAt(0);
                                    boolean ready =
                                            page != null
                                                    && page.getHeight()
                                                            >= keepY + scroll.getHeight();
                                    if (ready || ++frames > 10) {
                                        scroll.getViewTreeObserver().removeOnPreDrawListener(this);
                                        scroll.scrollTo(0, keepY);
                                    }
                                    return true;
                                }
                            });
        if (channelView != null) {
            channelView.close();
            channelView = null;
        }
        body.removeAllViews();
        namesList = null;
        actions.clear();
        secrets.clear();
        hashVisibility = null;
        LinearLayout top = new LinearLayout(this);
        top.setOrientation(LinearLayout.VERTICAL);
        top.setPadding(style.dp(20), style.dp(16), style.dp(20), style.dp(18));
        ImageButton back =
                style.backButton(
                        () -> {
                            if (channelId != 0) {
                                channelId = 0;
                                screen = "";
                                render();
                            } else if (editCredentials
                                    && bridge != null
                                    && bridge.credentials().configured()) {
                                editCredentials = false;
                                screen = "";
                                render();
                            } else finish();
                        });
        top.addView(back, new LinearLayout.LayoutParams(style.dp(48), style.dp(48)));
        TextView title =
                style.text(
                        Strings.t(
                                channelId != 0
                                        ? "Channel View"
                                        : editCredentials
                                                ? "Application setup"
                                                : "Unofficial Telegram"),
                        34,
                        style.foreground,
                        style.heavy);
        title.setLetterSpacing(-0.025f);
        LinearLayout.LayoutParams tl = new LinearLayout.LayoutParams(-1, -2);
        tl.topMargin = style.dp(26);
        top.addView(title, tl);
        TextView subtitle =
                style.text(
                        Strings.t(
                                "An unofficial client using the Telegram API. Your account, inside"
                                        + " BitChord."),
                        14,
                        style.secondary,
                        style.regular);
        LinearLayout.LayoutParams sl = new LinearLayout.LayoutParams(-1, -2);
        sl.topMargin = style.dp(7);
        top.addView(subtitle, sl);
        body.addView(top);
        if (bridge == null) {
            paragraph(card("Connection"), TelegramBridge.startupError);
            return;
        }
        if (channelId != 0) {
            channelView = new ChannelView(this, channelId);
            body.addView(channelView);
            if (resumed) channelView.resume();
        } else if (editCredentials) credentialsForm();
        else if (bridge.ready() && advanced) {
            tabs();
            advancedPage();
        } else {
            if (bridge.ready()) {
                tabs();
                comeBack();
            }
            LinearLayout app = card("Application");
            row(
                    app,
                    "App API ID",
                    bridge.credentials().configured()
                            ? Integer.toString(bridge.credentials().apiId)
                            : "Not configured",
                    "Change",
                    () -> {
                        editCredentials = true;
                        screen = "";
                        render();
                    });
            divider(app);
            row(app, "App API hash", "••••••••••••••••", null, null);
            account();
            if (bridge.ready()) {
                library();
                trackNames();
                session();
            }
        }
        if (channelId == 0 && !(advanced && bridge != null && bridge.ready())) about();
        LinearLayout connection = card(null);
        status = style.text("", 14, style.secondary, style.regular);
        connection.addView(status);
        error = style.text("", 14, 0xfffa2d48, style.regular);
        error.setPadding(0, style.dp(8), 0, 0);
        connection.addView(error);
        updateStatus();
        if (keepY == 0) {
            // A different page starts at the top.
            body.requestFocus();
            scroll.post(() -> scroll.scrollTo(0, 0));
        }
    }

    /** Which tab is open: Basic (false) or Advanced. */
    boolean advanced;

    /** Basic and Advanced: the everyday settings, and the rest. */
    void tabs() {
        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        String[] names = {"Basic", "Advanced"};
        for (int i = 0; i < 2; i++) {
            boolean open = (i == 1) == advanced, toAdvanced = i == 1;
            TextView tab =
                    style.button(
                            Strings.t(names[i]),
                            open,
                            () -> {
                                if (busy || advanced == toAdvanced) return;
                                advanced = toAdvanced;
                                screen = "";
                                render();
                            });
            tab.setContentDescription(Strings.t(names[i]));
            tab.setSelected(open);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -2, 1);
            if (i == 1) lp.leftMargin = style.dp(8);
            bar.addView(tab, lp);
        }
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, -2);
        lp.setMargins(style.dp(16), style.dp(4), style.dp(16), style.dp(4));
        body.addView(bar, lp);
    }

    void credentialsForm() {
        LinearLayout app = card("Application credentials");
        paragraph(
                app,
                "Enter the App API ID and App API hash from your Telegram application. The hash"
                        + " stays masked and is stored encrypted on this device.");
        ApplicationCredentials current = bridge.credentials();
        EditText id = input(app, "App API ID", false);
        id.setInputType(InputType.TYPE_CLASS_NUMBER);
        if (current.configured()) id.setText(Integer.toString(current.apiId));
        EditText hash = input(app, "App API hash (secret)", true);
        if (current.configured()) hash.setText(current.apiHash);
        LinearLayout toggle = new LinearLayout(this);
        toggle.setGravity(Gravity.END);
        app.addView(toggle);
        TextView show = style.text(Strings.t("Show hash"), 13, style.foreground, style.semibold);
        show.setPadding(style.dp(10), style.dp(10), 0, style.dp(10));
        hashVisibility = show;
        show.setOnClickListener(
                v -> {
                    boolean hidden = hash.getTransformationMethod() != null;
                    hash.setTransformationMethod(
                            hidden ? null : PasswordTransformationMethod.getInstance());
                    hash.setSelection(hash.length());
                    show.setText(Strings.t(hidden ? "Hide hash" : "Show hash"));
                });
        toggle.addView(show);
        action(
                app,
                "Save and continue",
                true,
                () -> {
                    String number = id.getText().toString(), secret = hash.getText().toString();
                    try {
                        ApplicationCredentials.parse(number, secret);
                    } catch (IllegalArgumentException e) {
                        bridge.fail(e);
                        updateStatus();
                        return;
                    }
                    Runnable save =
                            () ->
                                    run(
                                            () -> {
                                                bridge.saveCredentials(number, secret);
                                                runOnUiThread(
                                                        () -> {
                                                            if (!isFinishing() && !isDestroyed()) {
                                                                hash.setText("");
                                                                editCredentials = false;
                                                                screen = "";
                                                                render();
                                                            }
                                                        });
                                            });
                    if (bridge.ready()
                            && !current.sameAs(ApplicationCredentials.parse(number, secret)))
                        confirm(
                                "Change application?",
                                "Telegram will reconnect using the new application configuration."
                                        + " Your music selection and local session files are kept.",
                                "Reconnect",
                                save);
                    else save.run();
                });
        paragraph(
                app,
                "Create your own application with a generic, descriptive name, such as My Client"
                        + " (short name: myclient). Telegram may show that name in sign-in"
                        + " alerts.");
        TextView help =
                style.text(
                        Strings.t("Create your Telegram API credentials ↗"),
                        14,
                        style.secondary,
                        style.regular);
        help.setPadding(style.dp(4), style.dp(16), 0, 0);
        help.setOnClickListener(
                v ->
                        startActivity(
                                new Intent(
                                        Intent.ACTION_VIEW,
                                        android.net.Uri.parse("https://my.telegram.org/apps"))));
        app.addView(help);
    }

    void account() {
        LinearLayout account = card("Account");
        TdApi.AuthorizationState auth = bridge.auth;
        if (!bridge.credentials().configured()) {
            paragraph(account, "Add your application credentials before signing in.");
            action(
                    account,
                    "Set up application",
                    true,
                    () -> {
                        editCredentials = true;
                        screen = "";
                        render();
                    });
            return;
        }
        if (bridge.ready()) {
            row(
                    account,
                    "Connected to Telegram",
                    "Your account is ready to stream music.",
                    null,
                    null);
            return;
        }
        if (auth instanceof TdApi.AuthorizationStateWaitPhoneNumber
                || auth instanceof TdApi.AuthorizationStateWaitCode
                || auth instanceof TdApi.AuthorizationStateWaitPassword
                || auth instanceof TdApi.AuthorizationStateWaitEmailAddress
                || auth instanceof TdApi.AuthorizationStateWaitEmailCode) {
            boolean phone = auth instanceof TdApi.AuthorizationStateWaitPhoneNumber,
                    password = auth instanceof TdApi.AuthorizationStateWaitPassword,
                    email = auth instanceof TdApi.AuthorizationStateWaitEmailAddress;
            String title =
                    phone
                            ? "Phone number"
                            : password
                                    ? "Two-step verification"
                                    : email ? "Email address" : "Verification code";
            paragraph(
                    account,
                    phone
                            ? "Sign in with your own Telegram account. Include your country code."
                            : password
                                    ? "Enter the password for your Telegram account."
                                    : email
                                            ? "Telegram requires an email address for this login."
                                            : "Enter the code delivered by Telegram. Check your"
                                                    + " existing Telegram app.");
            EditText field = input(account, title, password || !phone && !email);
            if (phone) field.setInputType(InputType.TYPE_CLASS_PHONE);
            if (email)
                field.setInputType(
                        InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_EMAIL_ADDRESS);
            action(
                    account,
                    phone ? "Continue" : "Verify and continue",
                    true,
                    () -> {
                        String value = field.getText().toString();
                        if (value.trim().isEmpty()) return;
                        field.setText("");
                        run(() -> bridge.submit(value));
                    });
        } else if (auth instanceof TdApi.AuthorizationStateWaitOtherDeviceConfirmation) {
            paragraph(account, "Confirm this sign-in from another Telegram device.");
            String link = ((TdApi.AuthorizationStateWaitOtherDeviceConfirmation) auth).link;
            action(
                    account,
                    "Open Telegram",
                    true,
                    () ->
                            startActivity(
                                    new Intent(Intent.ACTION_VIEW, android.net.Uri.parse(link))));
        } else if (auth instanceof TdApi.AuthorizationStateWaitRegistration)
            paragraph(
                    account,
                    "Sign in with an existing Telegram account. New accounts can't be created"
                            + " here.");
        else if (auth instanceof TdApi.AuthorizationStateWaitPremiumPurchase)
            paragraph(
                    account,
                    "Telegram is asking for a purchase to finish this login, which isn't"
                            + " supported here. Sign in with the official Telegram app first, then"
                            + " try again.");
        else {
            paragraph(
                    account,
                    auth instanceof TdApi.AuthorizationStateClosed
                            ? "Telegram is disconnected. Reopen the app, or save your application"
                                    + " configuration to reconnect."
                            : "Connecting to Telegram…");
            action(account, "Retry connection", false, () -> run(() -> bridge.configure()));
        }
    }

    void library() {
        LinearLayout music = card("Music library");
        row(
                music,
                "Music chats",
                Strings.f("{0} selected · Live Telegram search", bridge.selected.size()),
                "Choose",
                this::chooseChats);
        divider(music);
        row(
                music,
                "Channel View",
                "Read selected channels and official sponsored messages.",
                "Browse",
                this::chooseChannel);
        divider(music);
        row(
                music,
                "Playlists and downloads",
                "Save a chat’s music as a BitChord playlist, or download all of it.",
                "Choose",
                this::chooseCollection);
        divider(music);
        EditText chat = input(music, "@channel or numeric chat ID", false);
        action(
                music,
                "Add chat",
                false,
                () -> {
                    String value = chat.getText().toString();
                    run(() -> bridge.addChat(value));
                });
        paragraph(
                music,
                "Search your selected chats from BitChord’s Addons tab. Telegram searches the"
                        + " channel history. Audio is downloaded when played.");
        paragraph(
                music,
                "Each query shows up to 200 results across audio and music documents. Refine the"
                        + " title or artist for more specific matches.");
        divider(music);
        indexLine =
                toggle(
                        music,
                        "Saved index",
                        bridge.indexStatus(),
                        "Only Telegram’s own search is used",
                        bridge.searchIndex(),
                        bridge::setSearchIndex);
        paragraph(
                music,
                "Keeps a list of the music in your selected chats on this phone, built slowly in"
                        + " the background and topped up every few hours. It answers when"
                        + " Telegram’s search is rate limited or busy, and the format legend uses"
                        + " it instead of searching Telegram. Turning it off deletes it.");
        divider(music);
        toggle(
                music,
                "Index only on Wi-Fi",
                "The index waits for Wi-Fi to read your chats",
                "The index also uses mobile data",
                bridge.indexOption("wifi"),
                on -> bridge.setIndexOption("wifi", on),
                null,
                "Search and playback still use mobile data; only the background indexing waits.");
        divider(music);
        toggle(
                music,
                "Index only while charging",
                "The index waits for a charger",
                "The index also runs on battery",
                bridge.indexOption("charging"),
                on -> bridge.setIndexOption("charging", on));
    }

    /** The Advanced tab: copying into a main channel, track details, playback, storage, backups. */
    void advancedPage() {
        mainChannel();
        trackDetails();
        LinearLayout playback = card("Playback");
        row(
                playback,
                "Telegram source",
                "Added automatically to BitChord.",
                "Repair",
                () -> run(() -> bridge.registerSource()));
        divider(playback);
        toggle(
                playback,
                "Smooth quality switch",
                "A better copy fades in without a gap",
                "BitChord switches copies with a short pause",
                bridge.smoothUpgrades(),
                bridge::setSmoothUpgrades,
                null,
                "When BitChord finds a better copy of the playing song, such as your Telegram FLAC"
                    + " after it started from YouTube, it’s loaded in the background and faded in"
                    + " at the same point. If that can’t happen, the switch happens the usual"
                    + " way.");
        divider(playback);
        toggle(
                playback,
                "Play surround as stereo",
                "5.1 and 7.1 files are mixed to stereo in BitChord",
                "Android mixes surround files itself",
                bridge.surroundAsStereo(),
                bridge::setSurroundAsStereo,
                null,
                "Works for every song BitChord plays and doesn’t change the file. Centre and"
                        + " surround channels are mixed in lower and the bass channel is left out,"
                        + " as ffmpeg does. Starts with the next song.");
        divider(playback);
        toggle(
                playback,
                "Check matches by sound",
                "Telegram files with another length are compared with the song",
                "Files with another length aren’t used",
                bridge.soundCheck(),
                bridge::setSoundCheck,
                "When your Telegram file has a song’s title but a different length, it’s usually"
                        + " another recording, so BitChord plays the song from elsewhere. With"
                        + " this on, the patch listens to the first 15 seconds of the song as it"
                        + " plays and compares them with the start of the Telegram file. If"
                        + " they’re the same recording, the file is used the next time the song"
                        + " plays.\n\nEach check downloads up to the first 45 seconds of the"
                        + " Telegram file, about 5 to 15 MB for a lossless file, and uses some"
                        + " battery for a few seconds. Nothing is uploaded or sent anywhere"
                        + " else.",
                "A file that’s the same recording is used the next time the song plays. Each"
                        + " check downloads up to 15 MB of the Telegram file.");
        LinearLayout storage = card("Storage");
        paragraph(storage, "Telegram audio cache target");
        TextView cacheValue =
                style.text(
                        CachePolicy.label(bridge.cacheLimitBytes()),
                        18,
                        style.foreground,
                        style.semibold);
        storage.addView(cacheValue);
        SeekBar cacheSlider = new SeekBar(this);
        cacheSlider.setMax(CachePolicy.count() - 1);
        cacheSlider.setProgress(CachePolicy.indexOf(bridge.cacheLimitBytes()));
        cacheSlider.setContentDescription(Strings.t("Telegram audio cache target"));
        cacheSlider.setProgressTintList(
                android.content.res.ColorStateList.valueOf(style.foreground));
        cacheSlider.setThumbTintList(android.content.res.ColorStateList.valueOf(style.foreground));
        cacheSlider.setProgressBackgroundTintList(
                android.content.res.ColorStateList.valueOf(style.outline));
        storage.addView(cacheSlider, new LinearLayout.LayoutParams(-1, style.dp(48)));
        actions.add(cacheSlider);
        cacheSlider.setOnSeekBarChangeListener(
                new SeekBar.OnSeekBarChangeListener() {
                    public void onStartTrackingTouch(SeekBar bar) {}

                    public void onStopTrackingTouch(SeekBar bar) {}

                    public void onProgressChanged(SeekBar bar, int value, boolean fromUser) {
                        cacheValue.setText(CachePolicy.label(CachePolicy.bytesAt(value)));
                    }
                });
        paragraph(
                storage,
                "64 MiB to 16 GiB · A soft target, not reserved space. Active audio may exceed it."
                        + " BitChord’s separate song cache and downloads use additional storage.");
        action(
                storage,
                "Apply cache size",
                false,
                () ->
                        run(
                                false,
                                () ->
                                        bridge.setCacheLimitBytes(
                                                CachePolicy.bytesAt(cacheSlider.getProgress()))));
        action(storage, "Clear Telegram audio cache", false, () -> run(() -> bridge.clearCache()));
        backupAndSharing();
    }

    void session() {
        LinearLayout session = card("Session");
        action(session, "Sign out", false, this::askSignOut);
    }

    /**
     * Signing out removes this phone's music chats, saved index and the rest, so it offers a backup
     * first, which can be restored in one tap after signing in again.
     */
    void askSignOut() {
        bridge.work.execute(
                () -> {
                    int files = bridge.indexedFiles();
                    runOnUiThread(
                            () -> {
                                if (isFinishing() || isDestroyed()) return;
                                String message =
                                        Strings.t(
                                                        "Signing out removes your music chats,"
                                                            + " saved index, corrected names and"
                                                            + " main channel setup from this"
                                                            + " phone.")
                                                + "\n\n"
                                                + (files > 0
                                                        ? Strings.f(
                                                                "Back up first and they come back"
                                                                    + " in a minute when you sign"
                                                                    + " in again, without indexing"
                                                                    + " {0} files again.",
                                                                Strings.number(files))
                                                        : Strings.t(
                                                                "Back up first and they come back"
                                                                    + " in a minute when you sign"
                                                                    + " in again."));
                                AlertDialog dialog =
                                        new AlertDialog.Builder(this)
                                                .setTitle(Strings.t("Sign out?"))
                                                .setMessage(message)
                                                .setPositiveButton(
                                                        Strings.t("Back up and sign out"),
                                                        (d, w) -> {
                                                            backupWithIndex = true;
                                                            signOutAfterBackup = true;
                                                            startActivityForResult(
                                                                    backupFile(true), BACKUP);
                                                        })
                                                .setNeutralButton(
                                                        Strings.t("Sign out"),
                                                        (d, w) -> run(() -> bridge.logout()))
                                                .setNegativeButton(Strings.t("Cancel"), null)
                                                .create();
                                secureWindow(dialog.getWindow());
                                dialog.show();
                                style.tuneDialog(dialog);
                            });
                });
    }

    /** Asks where to save a backup; one made at sign-out stays readable for restoring later. */
    Intent backupFile(boolean keep) {
        Intent save = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        save.addCategory(Intent.CATEGORY_OPENABLE);
        save.setType("application/gzip");
        save.putExtra(
                Intent.EXTRA_TITLE, "bitchord-telegram-backup-" + TelegramBridge.today() + ".gz");
        if (keep)
            save.addFlags(
                    Intent.FLAG_GRANT_READ_URI_PERMISSION
                            | Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                            | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);
        return save;
    }

    /** After signing in again: the backup made at sign-out, to restore in one tap. */
    void comeBack() {
        JSONObject last = bridge.lastBackup();
        if (last == null) return;
        LinearLayout card = card("Welcome back");
        String when =
                java.text.DateFormat.getDateTimeInstance(
                                java.text.DateFormat.MEDIUM, java.text.DateFormat.SHORT)
                        .format(new java.util.Date(last.optLong("at")));
        row(
                card,
                "Restore what you had before signing out",
                Strings.f("Backup from {0}", when),
                "Restore",
                () ->
                        run(
                                () -> {
                                    android.net.Uri uri =
                                            android.net.Uri.parse(last.optString("uri"));
                                    java.io.InputStream in;
                                    try {
                                        in = getContentResolver().openInputStream(uri);
                                    } catch (Exception e) {
                                        in = null;
                                    }
                                    if (in == null)
                                        throw new java.io.IOException(
                                                "That backup can’t be opened any more. Pick it"
                                                        + " under Backup and sharing → Restore.");
                                    try (java.io.InputStream file = in) {
                                        bridge.restore(file);
                                    }
                                    bridge.forgetBackup();
                                }));
        divider(card);
        row(
                card,
                "Start fresh",
                "The backup file stays where you saved it",
                "Forget",
                () -> run(() -> bridge.forgetBackup()));
    }

    static final int BACKUP = 41, RESTORE = 42, EXPORT_INDEX = 43;
    boolean backupWithIndex = true, signOutAfterBackup;
    long exportChat;

    /** Backing up and restoring settings, and sharing a chat's saved index. */
    void backupAndSharing() {
        LinearLayout card = card("Backup and sharing");
        row(
                card,
                "Back up",
                "Settings, corrected names and main channel, and the saved index if you like",
                "Back up",
                this::startBackup);
        divider(card);
        row(
                card,
                "Restore",
                "From a backup, or add an index file someone shared",
                "Choose",
                () -> {
                    Intent pick = new Intent(Intent.ACTION_OPEN_DOCUMENT);
                    pick.addCategory(Intent.CATEGORY_OPENABLE);
                    pick.setType("*/*");
                    startActivityForResult(pick, RESTORE);
                });
        divider(card);
        row(
                card,
                "Share a chat’s index",
                "Post it in Telegram, or save it as a file",
                "Choose",
                () -> pickChat("Share a chat’s index", this::chooseShareTarget));
        divider(card);
        toggle(
                card,
                "Use shared indexes",
                "A chat’s index comes from a shared index file when there is one",
                "Every chat is read from Telegram",
                bridge.useSharedIndexes(),
                bridge::setUseSharedIndexes,
                null,
                "Before reading a chat from Telegram, the patch looks for an index file of it"
                    + " posted in the chat itself (in a channel, only its admins can post), in your"
                    + " Saved Messages or in your main channel, and then only reads what’s been"
                    + " posted since. Each song is checked against its post when it plays.");
        paragraph(
                card,
                "Backups and index files never hold your API details or your Telegram session. An"
                        + " index file lists the music in a chat, so anyone you share it with sees"
                        + " that list.");
    }

    void startBackup() {
        boolean[] withIndex = {true};
        AlertDialog dialog =
                new AlertDialog.Builder(this)
                        .setTitle(Strings.t("Back up"))
                        .setMultiChoiceItems(
                                new String[] {Strings.t("Include the saved index (larger file)")},
                                withIndex,
                                (d, i, on) -> withIndex[0] = on)
                        .setNegativeButton(Strings.t("Cancel"), null)
                        .setPositiveButton(
                                Strings.t("Back up"),
                                (d, w) -> {
                                    backupWithIndex = withIndex[0];
                                    signOutAfterBackup = false;
                                    startActivityForResult(backupFile(false), BACKUP);
                                })
                        .create();
        secureWindow(dialog.getWindow());
        dialog.show();
        style.tuneDialog(dialog);
    }

    void chooseShareTarget(TdApi.Chat chat) {
        bridge.work.execute(
                () -> {
                    List<Object[]> targets;
                    try {
                        targets = bridge.shareTargets(chat.id);
                    } catch (Exception e) {
                        bridge.fail(e);
                        runOnUiThread(this::updateStatus);
                        return;
                    }
                    runOnUiThread(
                            () -> {
                                if (isFinishing() || isDestroyed()) return;
                                String[] labels = new String[targets.size() + 1];
                                for (int i = 0; i < targets.size(); i++)
                                    labels[i] =
                                            Strings.f("Post in {0}", (String) targets.get(i)[0]);
                                labels[targets.size()] = Strings.t("Save as a file");
                                AlertDialog dialog =
                                        new AlertDialog.Builder(this)
                                                .setTitle(chat.title)
                                                .setItems(
                                                        labels,
                                                        (d, i) -> {
                                                            if (i == targets.size()) {
                                                                exportChat = chat.id;
                                                                Intent save =
                                                                        new Intent(
                                                                                Intent
                                                                                        .ACTION_CREATE_DOCUMENT);
                                                                save.addCategory(
                                                                        Intent.CATEGORY_OPENABLE);
                                                                save.setType("application/gzip");
                                                                save.putExtra(
                                                                        Intent.EXTRA_TITLE,
                                                                        IndexTransfer.fileName(
                                                                                chat.id,
                                                                                TelegramBridge
                                                                                        .today()));
                                                                startActivityForResult(
                                                                        save, EXPORT_INDEX);
                                                                return;
                                                            }
                                                            String where =
                                                                    (String) targets.get(i)[0];
                                                            long target = (Long) targets.get(i)[1];
                                                            confirm(
                                                                    Strings.f(
                                                                            "Post in {0}?", where),
                                                                    Strings.f(
                                                                            "Everyone who can see"
                                                                                + " {0} can see the"
                                                                                + " list of music"
                                                                                + " in {1}.",
                                                                            where, chat.title),
                                                                    "Post",
                                                                    () ->
                                                                            run(
                                                                                    false,
                                                                                    () ->
                                                                                            bridge
                                                                                                    .shareIndex(
                                                                                                            chat.id,
                                                                                                            target)));
                                                        })
                                                .setNegativeButton(Strings.t("Cancel"), null)
                                                .create();
                                secureWindow(dialog.getWindow());
                                dialog.show();
                            });
                });
    }

    @Override
    protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        boolean signOut = request == BACKUP && signOutAfterBackup;
        if (request == BACKUP) signOutAfterBackup = false;
        if (result != RESULT_OK || data == null || data.getData() == null || bridge == null) return;
        android.net.Uri uri = data.getData();
        if (request == BACKUP)
            run(
                    signOut,
                    () -> {
                        try (java.io.OutputStream out =
                                getContentResolver().openOutputStream(uri, "wt")) {
                            bridge.backup(out, backupWithIndex);
                        }
                        // Only once the backup is safely written.
                        if (signOut) {
                            try {
                                getContentResolver()
                                        .takePersistableUriPermission(
                                                uri, Intent.FLAG_GRANT_READ_URI_PERMISSION);
                            } catch (RuntimeException e) {
                                // Still offered while this page can read it.
                            }
                            bridge.logout();
                            bridge.rememberBackup(uri.toString());
                        }
                    });
        else if (request == EXPORT_INDEX)
            run(
                    false,
                    () -> {
                        try (java.io.OutputStream out =
                                getContentResolver().openOutputStream(uri, "wt")) {
                            bridge.exportIndex(exportChat, out);
                        }
                    });
        else if (request == RESTORE)
            run(
                    () -> {
                        try (java.io.InputStream in = getContentResolver().openInputStream(uri)) {
                            bridge.restore(in);
                        }
                    });
    }

    void trackDetails() {
        LinearLayout details = card("Track details");
        toggle(
                details,
                "Report audio quality",
                "FLAC, WAV and ALAC count as lossless; others by bitrate",
                "BitChord guesses from the file type",
                bridge.reportQuality(),
                bridge::setReportQuality,
                null,
                "BitChord uses this to choose between your file and other sources, so a"
                        + " low-bitrate MP3 may lose to a better copy elsewhere.");
        divider(details);
        toggle(
                details,
                "Check lossless files",
                "FLAC and WAV files that play are checked for a lossy source",
                "Files are taken at their word",
                bridge.checkOption("checkLossless"),
                on -> bridge.setCheckOption("checkLossless", on),
                null,
                "A file made from an MP3 keeps the MP3’s cut-off, somewhere between 16 and 20"
                        + " kHz. A minute after a song starts, a few stretches of it are looked"
                        + " at. A fake shows as “FLAC 16bit · from ≈128 kbps” and is ranked as"
                        + " that MP3, and a hi-res file made from a CD as “FLAC 24bit · from 44.1"
                        + " kHz”. A check can show a file looks lossy; it can’t prove a file is"
                        + " genuine.");
        divider(details);
        toggle(
                details,
                "Check in the background",
                "Every lossless file in your music chats, up to 1 GB a day",
                "Only songs that play are checked",
                bridge.checkOption("checkInBackground"),
                on -> bridge.setCheckOption("checkInBackground", on),
                null,
                "About 4 MB of each file is downloaded, keeping to the Wi-Fi and charging switches"
                        + " under Saved index. What’s found is kept in the saved index and goes"
                        + " with it when you share it.");
        checkLine = style.text(bridge.checkStatus(), 13, style.secondary, style.regular);
        checkLine.setPadding(0, style.dp(8), 0, 0);
        checkLine.setVisibility(bridge.checkStatus().isEmpty() ? View.GONE : View.VISIBLE);
        details.addView(checkLine);
        divider(details);
        toggle(
                details,
                "Album covers",
                "Uses the cover Telegram has for each file",
                "No covers are downloaded",
                bridge.showArtwork(),
                bridge::setShowArtwork,
                null,
                "Covers are saved on this phone.");
        divider(details);
        toggle(
                details,
                "Names from file names",
                "Untagged files like “01 - Artist - Title.flac” get a proper name",
                "Untagged files show their file name",
                bridge.namesFromFiles(),
                bridge::setNamesFromFiles);
        divider(details);
        toggle(
                details,
                "Format legend",
                "Shows the format next to song titles, like FLAC 24bit, Dolby Atmos or MP3"
                        + " 320kbps",
                "Titles only",
                bridge.formatLegend(),
                bridge::setFormatLegend,
                null,
                "Your searches also check the selected chats for a match. To tell 16-bit from"
                        + " 24-bit, or Dolby Atmos from other Dolby files, the start of a few files"
                        + " per search is downloaded.");
        divider(details);
        toggle(
                details,
                "Hide duplicate songs",
                "The same song shows once, as its best copy",
                "Every copy of a song shows",
                bridge.hideDuplicates(),
                bridge::setHideDuplicates,
                null,
                "Copies with the same title and artist, and lengths within two seconds, count as"
                    + " the same song, such as one posted twice or found in two zips. The best is"
                    + " kept: lossless over lossy, then the higher bit depth, sample rate and"
                    + " bitrate.");
        divider(details);
        toggle(
                details,
                "Hide Dolby files this phone can’t play",
                "Dolby AC-4 files show only if this phone has a decoder",
                "Every Dolby file shows",
                bridge.hideUnplayableDolby(),
                bridge::setHideUnplayableDolby,
                null,
                "BitChord plays Dolby Digital, Dolby Digital Plus and Dolby TrueHD on any phone."
                        + " Dolby Atmos plays as 5.1 or 7.1, or with its height sound on a phone"
                        + " or speaker that supports it. Dolby AC-4 needs a decoder in the phone.");
        paragraph(
                details,
                "BitChord keeps search results for a few minutes, so changes here show up in new"
                        + " searches.");
        details.getChildAt(details.getChildCount() - 1).setPadding(0, style.dp(12), 0, style.dp(6));
    }

    /** Copying music from community channels into a private channel you own. */
    void mainChannel() {
        LinearLayout card = card("Main channel");
        String main = bridge.mainChannel.mainTitle();
        row(
                card,
                "Main channel",
                main.isEmpty() ? "A private channel you own" : main,
                "Choose",
                this::chooseMainChannel);
        divider(card);
        int community = bridge.mainChannel.community().size();
        row(
                card,
                "Community channels",
                community == 0
                        ? "Where music is copied from"
                        : Strings.f(community == 1 ? "{0} channel" : "{0} channels", community),
                "Choose",
                this::chooseCommunity);
        divider(card);
        importLine =
                toggle(
                        card,
                        "Copy into main channel",
                        bridge.importStatus().isEmpty() ? "Starting…" : bridge.importStatus(),
                        "Nothing is copied",
                        bridge.importOption("import"),
                        on -> bridge.setImportOption("import", on),
                        "Music from your community channels is copied into your main channel, a few"
                            + " files at a time. Copies show as your own posts, without “Forwarded"
                            + " from”, and stay even if the community channel deletes them.\n\n"
                            + "Telegram watches for accounts that copy many messages. Going faster"
                            + " than it likes can get your account limited for a while, or banned."
                            + " The pace below never goes above 500 files an hour, and copying"
                            + " pauses whenever Telegram asks.\n\n"
                            + "You’re responsible for what you copy. Only copy music you’re allowed"
                            + " to keep.",
                        "The files come from the saved index, so it has to be on. Your main channel"
                                + " has to stay private.");
        divider(card);
        toggle(
                card,
                "Keep in sync",
                "New posts are copied as they’re found",
                "Copies what the channels have when copying starts",
                bridge.importOption("sync"),
                on -> bridge.setImportOption("sync", on),
                "Your community channels are checked for new posts every few hours while"
                        + " BitChord is open, and new files are copied too. They count toward the"
                        + " same hourly limit.");
        divider(card);
        toggle(
                card,
                "Newest first",
                "Starts with each channel’s newest post, while it’s still being indexed",
                "Oldest post first, once each channel has been indexed",
                bridge.importOption("newestFirst"),
                on -> bridge.setImportOption("newestFirst", on),
                null,
                "Your main channel then lists the music in the opposite order to the community"
                        + " channel. Applies to channels copying hasn’t started from yet.");
        divider(card);
        toggle(
                card,
                "Lossless only",
                "Only FLAC, ALAC, WAV and AIFF files are copied",
                "All music files are copied",
                bridge.importOption("losslessOnly"),
                on -> bridge.setImportOption("losslessOnly", on),
                "MP3, AAC, Opus and other lossy files in the community channels are skipped. A"
                        + " file counts as lossless from its format, or for M4A files, from its"
                        + " bitrate.");
        divider(card);
        toggle(
                card,
                "Skip duplicates",
                "Songs your main channel already has aren’t copied again",
                "Every file is copied, even if it’s already there",
                bridge.importOption("skipDuplicates"),
                on -> bridge.setImportOption("skipDuplicates", on),
                "A file counts as already there when it’s the same Telegram file, or has the same"
                        + " title, artist, length and format. Nothing in your main channel is"
                        + " deleted. Copying waits until your main channel has been indexed.");
        divider(card);
        TextView pace =
                style.text(
                        Strings.f("Up to {0} files an hour", bridge.importPerHour()),
                        16,
                        style.foreground,
                        style.medium);
        pace.setPadding(0, style.dp(8), 0, 0);
        card.addView(pace);
        SeekBar slider = new SeekBar(this);
        slider.setMax(MainChannel.MAX_PER_HOUR - 1);
        slider.setProgress(bridge.importPerHour() - 1);
        slider.setContentDescription(Strings.t("Files copied an hour"));
        slider.setProgressTintList(android.content.res.ColorStateList.valueOf(style.foreground));
        slider.setThumbTintList(android.content.res.ColorStateList.valueOf(style.foreground));
        slider.setProgressBackgroundTintList(
                android.content.res.ColorStateList.valueOf(style.outline));
        card.addView(slider, new LinearLayout.LayoutParams(-1, style.dp(48)));
        slider.setOnSeekBarChangeListener(
                new SeekBar.OnSeekBarChangeListener() {
                    public void onStartTrackingTouch(SeekBar bar) {}

                    public void onStopTrackingTouch(SeekBar bar) {
                        int files = bar.getProgress() + 1;
                        bridge.work.execute(
                                () -> {
                                    try {
                                        bridge.setImportPerHour(files);
                                    } catch (Exception e) {
                                        bridge.fail(e);
                                    }
                                });
                    }

                    public void onProgressChanged(SeekBar bar, int value, boolean fromUser) {
                        pace.setText(Strings.f("Up to {0} files an hour", value + 1));
                    }
                });
        paragraph(card, "1 to 500 an hour. Slower is safer for your account.");
    }

    void chooseMainChannel() {
        run(
                () -> {
                    List<TdApi.Chat> owned = bridge.ownedPrivateChannels();
                    runOnUiThread(
                            () -> {
                                if (isFinishing() || isDestroyed()) return;
                                if (owned.isEmpty()) {
                                    confirm(
                                            "Main channel",
                                            "You don’t own a private channel yet. Create one in"
                                                    + " Telegram, without a public link, and"
                                                    + " come back.",
                                            "Done",
                                            () -> {});
                                    return;
                                }
                                String[] names = new String[owned.size()];
                                for (int i = 0; i < names.length; i++)
                                    names[i] = owned.get(i).title;
                                AlertDialog dialog =
                                        new AlertDialog.Builder(this)
                                                .setTitle(Strings.t("Main channel"))
                                                .setItems(
                                                        names,
                                                        (d, i) ->
                                                                run(
                                                                        () ->
                                                                                bridge
                                                                                        .setMainChannel(
                                                                                                owned
                                                                                                        .get(
                                                                                                                i))))
                                                .setNegativeButton(Strings.t("Cancel"), null)
                                                .create();
                                secureWindow(dialog.getWindow());
                                dialog.show();
                                style.tuneDialog(dialog);
                            });
                });
    }

    void chooseCommunity() {
        run(
                () -> {
                    List<TdApi.Chat> chats = bridge.communityChoices();
                    List<Long> chosen = bridge.mainChannel.community();
                    runOnUiThread(
                            () -> {
                                if (isFinishing() || isDestroyed()) return;
                                String[] names = new String[chats.size()];
                                boolean[] checked = new boolean[chats.size()];
                                for (int i = 0; i < names.length; i++) {
                                    names[i] = chats.get(i).title;
                                    checked[i] = chosen.contains(chats.get(i).id);
                                }
                                AlertDialog dialog =
                                        new AlertDialog.Builder(this)
                                                .setTitle(Strings.t("Community channels"))
                                                .setMultiChoiceItems(
                                                        names,
                                                        checked,
                                                        (d, i, value) -> checked[i] = value)
                                                .setNegativeButton(Strings.t("Cancel"), null)
                                                .setPositiveButton(
                                                        Strings.t("Save"),
                                                        (d, w) ->
                                                                run(
                                                                        () ->
                                                                                bridge.setCommunity(
                                                                                        chats,
                                                                                        checked)))
                                                .create();
                                secureWindow(dialog.getWindow());
                                dialog.show();
                                style.tuneDialog(dialog);
                            });
                });
    }

    void trackNames() {
        LinearLayout names = card("Track names");
        namesList = new LinearLayout(this);
        namesList.setOrientation(LinearLayout.VERTICAL);
        names.addView(namesList);
        fillTrackNames();
        EditText find = input(names, "Search your music chats", false);
        action(names, "Fix a track name", false, () -> pickTrack(find.getText().toString()));
        divider(names);
        toggle(
                names,
                "Name untagged files by sound",
                "Files without tags are looked up in AcoustID",
                "Untagged files keep the name from the file",
                bridge.checkOption("recognizeUntagged"),
                on -> bridge.setCheckOption("recognizeUntagged", on),
                "A fingerprint of the first two minutes of each untagged file, its length and your"
                        + " AcoustID key are sent to AcoustID (acoustid.org), a free service run"
                        + " by the MusicBrainz community. No audio is sent.",
                "Songs that play are looked up a minute later. Your other untagged files are"
                        + " gone through in the background, up to 500 a day, keeping to the Wi-Fi"
                        + " and charging switches under Saved index.");
        divider(names);
        boolean hasKey = !bridge.acoustIdKey().isEmpty();
        row(
                names,
                "AcoustID key",
                hasKey ? "Saved on this phone only" : "Needed to name files by sound",
                hasKey ? "Change" : "Enter",
                this::editAcoustIdKey);
    }

    /** The user's own AcoustID application key, from acoustid.org. */
    void editAcoustIdKey() {
        LinearLayout form = new LinearLayout(this);
        form.setOrientation(LinearLayout.VERTICAL);
        form.setPadding(style.dp(24), style.dp(8), style.dp(24), 0);
        form.addView(
                style.text(
                        Strings.t(
                                "Sign in at acoustid.org, register an application (any name), and"
                                        + " paste its API key here. It’s free."),
                        14,
                        style.secondary,
                        style.regular));
        EditText key = dialogField(form, "AcoustID application key", bridge.acoustIdKey());
        key.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        TextView help =
                style.text(Strings.t("Get an AcoustID key ↗"), 14, style.secondary, style.regular);
        help.setPadding(0, style.dp(14), 0, style.dp(6));
        help.setOnClickListener(
                v ->
                        startActivity(
                                new Intent(
                                        Intent.ACTION_VIEW,
                                        android.net.Uri.parse(
                                                "https://acoustid.org/new-application"))));
        form.addView(help);
        AlertDialog d =
                new AlertDialog.Builder(this)
                        .setTitle(Strings.t("AcoustID key"))
                        .setView(form)
                        .setPositiveButton(
                                Strings.t("Save"),
                                (x, y) -> {
                                    String value = key.getText().toString();
                                    run(() -> bridge.setAcoustIdKey(value));
                                })
                        .setNegativeButton(Strings.t("Cancel"), null)
                        .create();
        secureWindow(d.getWindow());
        d.show();
        style.tuneDialog(d);
    }

    /** The part of the Track names card that changes; refreshed in place as names change. */
    void fillTrackNames() {
        LinearLayout names = namesList;
        names.removeAllViews();
        namesRevision = bridge.names.revision();
        List<JSONObject> suggestions = Collections.emptyList(), corrections = suggestions;
        try {
            suggestions = bridge.names.suggestions();
            corrections = bridge.names.corrections();
        } catch (Exception ignored) {
        }
        paragraph(
                names,
                "Fix a Telegram file’s title or artist on this phone, without uploading it again."
                        + " BitChord then finds and matches the file under the corrected name.");
        for (JSONObject suggestion : suggestions) {
            row(
                    names,
                    "“"
                            + suggestion.optString("fileTitle")
                            + "” → “"
                            + suggestion.optString("title")
                            + "”",
                    Strings.f(
                            "{0} · {1} · Looks like a song that played from another source",
                            suggestion.optString("artist"), length(suggestion.optInt("duration"))),
                    "Review",
                    () -> reviewSuggestion(suggestion));
            divider(names);
        }
        final List<JSONObject> fixed = corrections;
        row(
                names,
                "Corrected names",
                fixed.isEmpty()
                        ? "None yet"
                        : Strings.f(fixed.size() == 1 ? "{0} track" : "{0} tracks", fixed.size()),
                fixed.isEmpty() ? null : "Edit",
                fixed.isEmpty() ? null : () -> listCorrections(fixed));
        divider(names);
        toggle(
                names,
                "Use corrected names",
                "BitChord sees the corrected names",
                "Files keep their Telegram names; corrections are kept",
                bridge.useTrackNames(),
                bridge::setUseTrackNames);
        divider(names);
        toggle(
                names,
                "Suggest fixes",
                "Checks songs that play from other sources",
                "No background searches",
                bridge.suggestTrackNames(),
                bridge::setSuggestTrackNames);
        paragraph(
                names,
                "With suggestions on, when a song plays from another source the patch searches"
                        + " your selected chats for that artist and suggests a file whose title is"
                        + " a few letters off. Nothing is renamed until you accept. Saving a name"
                        + " also removes BitChord’s saved copy of that song, so its next play"
                        + " uses your Telegram file.");
        names.getChildAt(names.getChildCount() - 1).setPadding(0, style.dp(12), 0, style.dp(6));
    }

    static String length(int seconds) {
        return seconds <= 0
                ? Strings.t("unknown length")
                : String.format(Locale.ROOT, "%d:%02d", seconds / 60, seconds % 60);
    }

    void reviewSuggestion(JSONObject suggestion) {
        String id = suggestion.optString("id");
        AlertDialog d =
                new AlertDialog.Builder(this)
                        .setTitle(Strings.t("Use this name?"))
                        .setMessage(
                                Strings.f(
                                        "On Telegram: “{0}” by {1} ({2})\n\nNew name: “{3}” by"
                                                + " {4}\n\nThe file on Telegram isn’t changed.",
                                        suggestion.optString("fileTitle"),
                                        suggestion.optString("fileArtist"),
                                        length(suggestion.optInt("duration")),
                                        suggestion.optString("title"),
                                        suggestion.optString("artist")))
                        .setPositiveButton(
                                Strings.t("Use name"),
                                (x, y) -> run(() -> bridge.acceptSuggestion(id)))
                        .setNeutralButton(
                                Strings.t("Dismiss"), (x, y) -> run(() -> bridge.names.dismiss(id)))
                        .setNegativeButton(Strings.t("Cancel"), null)
                        .create();
        secureWindow(d.getWindow());
        d.show();
        style.tuneDialog(d);
    }

    void listCorrections(List<JSONObject> corrections) {
        String[] labels = new String[corrections.size()];
        for (int i = 0; i < labels.length; i++)
            labels[i] =
                    "“"
                            + corrections.get(i).optString("fileTitle")
                            + "” → “"
                            + corrections.get(i).optString("title")
                            + "”";
        AlertDialog d =
                new AlertDialog.Builder(this)
                        .setTitle(Strings.t("Corrected names"))
                        .setItems(labels, (x, index) -> editName(corrections.get(index)))
                        .setNegativeButton(Strings.t("Close"), null)
                        .create();
        secureWindow(d.getWindow());
        d.show();
    }

    void pickTrack(String query) {
        if (query.trim().isEmpty()) {
            confirm(
                    "Search first",
                    "Enter part of the title, artist or file name.",
                    "OK",
                    () -> {});
            return;
        }
        run(
                false,
                () -> {
                    List<JSONObject> rows = bridge.searchTracks(query);
                    runOnUiThread(
                            () -> {
                                if (isFinishing() || isDestroyed()) return;
                                if (rows.isEmpty()) {
                                    confirm(
                                            "No tracks found",
                                            Strings.f(
                                                    "Nothing in your selected chats matches “{0}”.",
                                                    query.trim()),
                                            "OK",
                                            () -> {});
                                    return;
                                }
                                String[] labels = new String[rows.size()];
                                for (int i = 0; i < labels.length; i++)
                                    labels[i] =
                                            rows.get(i).optString("title")
                                                    + " — "
                                                    + rows.get(i).optString("artist")
                                                    + " · "
                                                    + length(rows.get(i).optInt("duration"));
                                AlertDialog d =
                                        new AlertDialog.Builder(this)
                                                .setTitle(Strings.t("Choose a track"))
                                                .setItems(
                                                        labels,
                                                        (x, index) -> editName(rows.get(index)))
                                                .setNegativeButton(Strings.t("Cancel"), null)
                                                .create();
                                secureWindow(d.getWindow());
                                d.show();
                            });
                });
    }

    void editName(JSONObject row) {
        boolean corrected = row.has("fileTitle");
        LinearLayout form = new LinearLayout(this);
        form.setOrientation(LinearLayout.VERTICAL);
        form.setPadding(style.dp(24), style.dp(8), style.dp(24), 0);
        TextView file =
                style.text(
                        Strings.f(
                                "On Telegram: “{0}” by {1}",
                                row.optString(corrected ? "fileTitle" : "title"),
                                row.optString(corrected ? "fileArtist" : "artist")),
                        14,
                        style.secondary,
                        style.regular);
        form.addView(file);
        EditText title = dialogField(form, "Title", row.optString("title"));
        EditText artist = dialogField(form, "Artist", row.optString("artist"));
        AlertDialog.Builder builder =
                new AlertDialog.Builder(this)
                        .setTitle(Strings.t("Track name"))
                        .setView(form)
                        .setPositiveButton(
                                Strings.t("Save"),
                                (x, y) -> {
                                    String newTitle = title.getText().toString(),
                                            newArtist = artist.getText().toString();
                                    run(() -> bridge.rename(row, newTitle, newArtist));
                                })
                        .setNegativeButton(Strings.t("Cancel"), null);
        if (corrected)
            builder.setNeutralButton(
                    Strings.t("Use original"),
                    (x, y) -> run(() -> bridge.names.remove(row.optString("id"))));
        AlertDialog d = builder.create();
        secureWindow(d.getWindow());
        d.show();
        style.tuneDialog(d);
    }

    EditText dialogField(LinearLayout form, String label, String value) {
        TextView caption = style.text(Strings.t(label), 12, style.secondary, style.semibold);
        caption.setPadding(0, style.dp(14), 0, style.dp(6));
        form.addView(caption);
        EditText field = new EditText(this);
        field.setFilterTouchesWhenObscured(true);
        field.setSingleLine(true);
        field.setText(value);
        field.setTextColor(style.foreground);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_WORDS);
        field.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO);
        form.addView(field, new LinearLayout.LayoutParams(-1, -2));
        return field;
    }

    void reopenChannel(long id) {
        channelId = id;
        screen = "";
        render();
    }

    void chooseChannel() {
        pickChat("Channel View", chat -> reopenChannel(chat.id));
    }

    /** A playlist or a download of a chat's newest music. */
    void chooseCollection() {
        pickChat(
                "Playlists and downloads",
                chat ->
                        bridge.work.execute(
                                () -> {
                                    String[] labels;
                                    try {
                                        labels = bridge.collectionSummary(chat.id);
                                    } catch (Exception e) {
                                        bridge.fail(e);
                                        runOnUiThread(this::updateStatus);
                                        return;
                                    }
                                    runOnUiThread(() -> collectionActions(chat, labels));
                                }));
    }

    /** The menu for one chat; {@code summary} is its song count and download size. */
    void collectionActions(TdApi.Chat chat, String[] summary) {
        if (isFinishing() || isDestroyed()) return;
        String songs = summary[0], size = summary[1];
        String[] labels = {
            Strings.f("Save as playlist ({0})", songs),
            Strings.f("Download all ({0}, {1})", songs, size),
            Strings.t("Albums")
        };
        AlertDialog dialog =
                new AlertDialog.Builder(this)
                        .setTitle(chat.title)
                        .setItems(
                                labels,
                                (d, which) -> {
                                    if (which == 0)
                                        run(() -> bridge.saveChannelPlaylist(chat.id, chat.title));
                                    else if (which == 2) chooseAlbum(chat);
                                    else
                                        confirm(
                                                "Download all",
                                                Strings.f(
                                                        "{0} from {1}, {2}. They’re saved at"
                                                                + " BitChord’s download quality, so"
                                                                + " set it to Lossless to keep FLAC"
                                                                + " files.",
                                                        Character.toUpperCase(songs.charAt(0))
                                                                + songs.substring(1),
                                                        chat.title,
                                                        size),
                                                "Download",
                                                () ->
                                                        run(
                                                                () ->
                                                                        bridge.downloadChannel(
                                                                                chat.id,
                                                                                chat.title)));
                                })
                        .setNegativeButton(Strings.t("Cancel"), null)
                        .create();
        secureWindow(dialog.getWindow());
        dialog.show();
    }

    /** A chat's albums, then what to do with the one picked. */
    void chooseAlbum(TdApi.Chat chat) {
        bridge.work.execute(
                () -> {
                    List<JSONObject> albums;
                    try {
                        albums = bridge.albums(chat.id);
                    } catch (Exception e) {
                        bridge.fail(e);
                        runOnUiThread(this::updateStatus);
                        return;
                    }
                    runOnUiThread(
                            () -> {
                                if (isFinishing() || isDestroyed()) return;
                                String[] labels = new String[albums.size()];
                                for (int i = 0; i < labels.length; i++) {
                                    int count = albums.get(i).optJSONArray("songs").length();
                                    labels[i] =
                                            albums.get(i).optString("title")
                                                    + " · "
                                                    + Strings.f("{0} songs", count);
                                }
                                AlertDialog dialog =
                                        new AlertDialog.Builder(this)
                                                .setTitle(Strings.t("Albums"))
                                                .setItems(
                                                        labels,
                                                        (d, i) -> albumActions(chat, albums.get(i)))
                                                .setNegativeButton(Strings.t("Cancel"), null)
                                                .create();
                                secureWindow(dialog.getWindow());
                                dialog.show();
                            });
                });
    }

    void albumActions(TdApi.Chat chat, JSONObject album) {
        String[] labels = {Strings.t("Save as playlist"), Strings.t("Download")};
        AlertDialog dialog =
                new AlertDialog.Builder(this)
                        .setTitle(album.optString("title"))
                        .setItems(
                                labels,
                                (d, which) -> {
                                    if (which == 0)
                                        run(() -> bridge.saveAlbumPlaylist(chat.id, album));
                                    else run(() -> bridge.downloadAlbum(album));
                                })
                        .setNegativeButton(Strings.t("Cancel"), null)
                        .create();
        secureWindow(dialog.getWindow());
        dialog.show();
    }

    /** Asks which selected chat to use, then hands it on. */
    void pickChat(String title, java.util.function.Consumer<TdApi.Chat> chosen) {
        run(
                () -> {
                    List<TdApi.Chat> chats = new ArrayList<>();
                    for (long id : bridge.selected)
                        try {
                            chats.add(bridge.channel(id));
                        } catch (Exception ignored) {
                        }
                    runOnUiThread(
                            () -> {
                                if (isFinishing() || isDestroyed()) return;
                                if (chats.isEmpty()) {
                                    confirm(
                                            "Choose music chats",
                                            "Select an accessible, unprotected music chat first.",
                                            "Done",
                                            () -> {});
                                    return;
                                }
                                String[] labels = new String[chats.size()];
                                for (int i = 0; i < labels.length; i++)
                                    labels[i] = chats.get(i).title;
                                AlertDialog dialog =
                                        new AlertDialog.Builder(this)
                                                .setTitle(Strings.t(title))
                                                .setItems(
                                                        labels,
                                                        (d, index) ->
                                                                chosen.accept(chats.get(index)))
                                                .setNegativeButton(Strings.t("Cancel"), null)
                                                .create();
                                secureWindow(dialog.getWindow());
                                dialog.show();
                            });
                });
    }

    void about() {
        LinearLayout info = card("About");
        paragraph(
                info,
                "An unofficial add-on that uses the Telegram API with your own account. It isn’t"
                        + " made by or affiliated with Telegram or BitChord. Channel View can show"
                        + " Telegram’s own sponsored messages.");
        row(
                info,
                "Privacy and your account",
                "Storage, sessions and signing out",
                "Read",
                () ->
                        confirm(
                                "Privacy and your account",
                                "Your phone talks to Telegram directly. Your API details are"
                                        + " encrypted on this phone and your Telegram session is"
                                        + " stored privately. The session is a normal Telegram"
                                        + " login, so it can reach your whole account, not just"
                                        + " music. Audio BitChord has saved stays until you clear"
                                        + " it, even after you sign out. You can end the session"
                                        + " anytime in the official Telegram app under Settings →"
                                        + " Devices.",
                                "Done",
                                () -> {}));
        divider(info);
        row(
                info,
                "Your audio",
                "Only use recordings you’re allowed to share",
                "Read",
                () ->
                        confirm(
                                "Your audio",
                                "You’re responsible for the audio you upload, share and play."
                                        + " This add-on doesn’t provide any music. Only use"
                                        + " recordings you own or have permission to use, and"
                                        + " follow Telegram’s terms. Protected or self-destructing"
                                        + " media can’t be played here.",
                                "Done",
                                () -> {}));
        divider(info);
        row(
                info,
                "Telegram API terms",
                "Telegram’s rules for apps using its API",
                "Open",
                () ->
                        startActivity(
                                new Intent(
                                        Intent.ACTION_VIEW,
                                        android.net.Uri.parse(
                                                "https://core.telegram.org/api/terms"))));
        paragraph(
                info,
                "Free and provided as-is. Use it responsibly: you’re responsible for your Telegram"
                        + " account and channels.");
    }

    /** Asks where to pick from first: all chats, a folder, or archived chats. */
    void chooseChats() {
        List<Object[]> lists = bridge.chatLists();
        String[] names = new String[lists.size()];
        for (int i = 0; i < names.length; i++) names[i] = (String) lists.get(i)[0];
        AlertDialog dialog =
                new AlertDialog.Builder(this)
                        .setTitle(Strings.t("Music chats"))
                        .setItems(names, (d, i) -> chooseChats((TdApi.ChatList) lists.get(i)[1]))
                        .setNegativeButton(Strings.t("Cancel"), null)
                        .create();
        secureWindow(dialog.getWindow());
        dialog.show();
    }

    /** Picks music chats from one list; chats outside it keep their choice. */
    void chooseChats(TdApi.ChatList list) {
        run(
                () -> {
                    List<TdApi.Chat> chats = list == null ? bridge.chats() : bridge.chats(list);
                    runOnUiThread(
                            () -> {
                                String[] names = new String[chats.size()];
                                boolean[] selected = new boolean[chats.size()];
                                for (int i = 0; i < names.length; i++) {
                                    names[i] = chats.get(i).title;
                                    selected[i] = bridge.selected.contains(chats.get(i).id);
                                }
                                AlertDialog dialog =
                                        new AlertDialog.Builder(this)
                                                .setTitle(Strings.t("Music chats"))
                                                .setMultiChoiceItems(
                                                        names,
                                                        selected,
                                                        (d, index, value) ->
                                                                selected[index] = value)
                                                .setNegativeButton(Strings.t("Cancel"), null)
                                                .setPositiveButton(
                                                        Strings.t("Save"),
                                                        (d, w) ->
                                                                run(
                                                                        () ->
                                                                                bridge.selectChats(
                                                                                        chats,
                                                                                        selected)))
                                                .create();
                                secureWindow(dialog.getWindow());
                                dialog.show();
                                style.tuneDialog(dialog);
                            });
                });
    }

    LinearLayout card(String title) {
        title = Strings.t(title);
        if (title != null) {
            TextView label =
                    style.text(
                            title.toUpperCase(Locale.getDefault()),
                            11,
                            style.secondary,
                            style.semibold);
            LinearLayout.LayoutParams ll = new LinearLayout.LayoutParams(-1, -2);
            ll.setMargins(style.dp(20), style.dp(24), style.dp(20), style.dp(8));
            body.addView(label, ll);
        }
        LinearLayout c = new LinearLayout(this);
        c.setOrientation(LinearLayout.VERTICAL);
        c.setPadding(style.dp(16), style.dp(16), style.dp(16), style.dp(16));
        c.setBackground(style.shape(style.card, 14, false));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, -2);
        lp.setMargins(style.dp(16), title == null ? style.dp(16) : 0, style.dp(16), 0);
        body.addView(c, lp);
        return c;
    }

    void paragraph(LinearLayout p, String value) {
        TextView t = style.text(Strings.t(value), 14, style.secondary, style.regular);
        t.setLineSpacing(style.dp(3), 1);
        t.setPadding(0, 0, 0, style.dp(6));
        p.addView(t);
    }

    void divider(LinearLayout p) {
        View line = new View(this);
        line.setBackgroundColor(style.outline);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, style.dp(1));
        lp.setMargins(0, style.dp(14), 0, style.dp(14));
        p.addView(line, lp);
    }

    /** Fixed text is translated here; a chat's own name passed in is left as it is. */
    void row(LinearLayout p, String title, String subtitle, String more, Runnable click) {
        title = Strings.t(title);
        subtitle = Strings.t(subtitle);
        more = Strings.t(more);
        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(style.dp(40));
        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.addView(style.text(title, 16, style.foreground, style.medium));
        TextView sub = style.text(subtitle, 14, style.secondary, style.regular);
        sub.setPadding(0, style.dp(4), 0, 0);
        labels.addView(sub);
        row.addView(labels, new LinearLayout.LayoutParams(0, -2, 1));
        if (more != null) {
            TextView m = style.text(more + "  ›", 14, style.secondary, style.medium);
            m.setPadding(style.dp(16), style.dp(8), 0, style.dp(8));
            row.addView(m);
        }
        if (click != null) {
            row.setOnClickListener(
                    v -> {
                        if (!busy) click.run();
                    });
            row.setClickable(true);
            row.setFocusable(true);
        }
        p.addView(row);
    }

    interface Setting {
        void set(boolean on) throws Exception;
    }

    /**
     * A setting with a switch. Flipping it saves in the background without rebuilding the page, so
     * the screen stays where it is; if saving fails the switch flips back.
     */
    TextView toggle(
            LinearLayout p, String title, String on, String off, boolean value, Setting setting) {
        return toggle(p, title, on, off, value, setting, null, null);
    }

    /**
     * As above; turning it on first shows {@code warning} and only goes ahead when the user agrees.
     */
    TextView toggle(
            LinearLayout p,
            String title,
            String on,
            String off,
            boolean value,
            Setting setting,
            String warning) {
        return toggle(p, title, on, off, value, setting, warning, null);
    }

    /**
     * As above, with {@code details} under the setting's own text, so an explanation lines up with
     * the setting it's about.
     */
    TextView toggle(
            LinearLayout p,
            String title,
            String on,
            String off,
            boolean value,
            Setting setting,
            String warning,
            String details) {
        String name = Strings.t(title), yes = Strings.t(on), no = Strings.t(off);
        return toggleRow(p, name, yes, no, value, setting, Strings.t(warning), Strings.t(details));
    }

    private TextView toggleRow(
            LinearLayout p,
            String title,
            String on,
            String off,
            boolean value,
            Setting setting,
            String warning,
            String details) {
        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(style.dp(40));
        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.addView(style.text(title, 16, style.foreground, style.medium));
        TextView sub = style.text(value ? on : off, 14, style.secondary, style.regular);
        sub.setPadding(0, style.dp(4), 0, 0);
        labels.addView(sub);
        if (details != null) {
            TextView more = style.text(details, 13, style.secondary, style.regular);
            more.setPadding(0, style.dp(6), 0, style.dp(4));
            labels.addView(more);
        }
        row.addView(labels, new LinearLayout.LayoutParams(0, -2, 1));
        TelegramSwitch toggle = new TelegramSwitch(this, style);
        toggle.setChecked(value);
        toggle.setContentDescription(title);
        Runnable[] apply = new Runnable[1];
        toggle.setListener(
                (button, checked) -> {
                    if (checked && warning != null) {
                        AlertDialog dialog =
                                new AlertDialog.Builder(this)
                                        .setTitle(title)
                                        .setMessage(warning)
                                        .setNegativeButton(
                                                Strings.t("Cancel"),
                                                (d, w) -> toggle.setChecked(false))
                                        .setPositiveButton(
                                                Strings.t("Turn on"), (d, w) -> apply[0].run())
                                        .setOnCancelListener(d -> toggle.setChecked(false))
                                        .create();
                        secureWindow(dialog.getWindow());
                        dialog.show();
                        style.tuneDialog(dialog);
                        return;
                    }
                    apply[0].run();
                });
        apply[0] =
                () -> {
                    boolean checked = toggle.isChecked();
                    sub.setText(checked ? on : off);
                    bridge.work.execute(
                            () -> {
                                try {
                                    setting.set(checked);
                                } catch (Exception e) {
                                    bridge.fail(e);
                                    runOnUiThread(
                                            () -> {
                                                toggle.setChecked(!checked);
                                                sub.setText(!checked ? on : off);
                                                updateStatus();
                                            });
                                }
                            });
                };
        LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(-2, -2);
        gap.leftMargin = style.dp(16);
        row.addView(toggle, gap);
        row.setOnClickListener(v -> toggle.toggle());
        row.setClickable(true);
        row.setFocusable(true);
        p.addView(row);
        return sub;
    }

    EditText input(LinearLayout p, String label, boolean secret) {
        label = Strings.t(label);
        TextView title = style.text(label, 12, style.secondary, style.semibold);
        title.setPadding(0, style.dp(14), 0, style.dp(7));
        p.addView(title);
        EditText field = new EditText(this);
        field.setFilterTouchesWhenObscured(true);
        field.setSingleLine(true);
        field.setTextSize(16);
        field.setTextColor(style.foreground);
        field.setHintTextColor(style.secondary);
        field.setHint(label);
        field.setInputType(
                InputType.TYPE_CLASS_TEXT
                        | (secret
                                ? InputType.TYPE_TEXT_VARIATION_PASSWORD
                                : InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS));
        field.setImeOptions(
                android.view.inputmethod.EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING
                        | android.view.inputmethod.EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        if (secret) secrets.add(field);
        field.setTypeface(style.regular);
        field.setPadding(style.dp(14), style.dp(12), style.dp(14), style.dp(12));
        field.setBackground(style.shape(style.field, 10, false));
        field.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO);
        field.setSaveEnabled(false);
        p.addView(field, new LinearLayout.LayoutParams(-1, style.dp(50)));
        actions.add(field);
        return field;
    }

    void action(LinearLayout p, String title, boolean primary, Runnable click) {
        TextView b =
                style.button(
                        Strings.t(title),
                        primary,
                        () -> {
                            if (!busy) click.run();
                        });
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, -2);
        lp.topMargin = style.dp(12);
        p.addView(b, lp);
        actions.add(b);
    }

    void confirm(String title, String message, String positive, Runnable action) {
        AlertDialog d =
                new AlertDialog.Builder(this)
                        .setTitle(Strings.t(title))
                        .setMessage(Strings.t(message))
                        .setNegativeButton(Strings.t("Cancel"), null)
                        .setPositiveButton(Strings.t(positive), (dialog, which) -> action.run())
                        .create();
        secureWindow(d.getWindow());
        d.show();
        style.tuneDialog(d);
    }

    void updateStatus() {
        if (bridge == null || status == null) return;
        if (namesList != null && !busy && bridge.names.revision() != namesRevision)
            fillTrackNames();
        status.setText((busy ? Strings.t("Working…") + "\n" : "") + Strings.t(bridge.status));
        error.setText(Strings.t(bridge.error));
        error.setVisibility(bridge.error.isEmpty() ? View.GONE : View.VISIBLE);
        for (View v : actions) {
            v.setEnabled(!busy);
            v.setAlpha(busy ? 0.45f : 1f);
        }
    }

    interface Job {
        void run() throws Exception;
    }

    void run(Job job) {
        run(true, job);
    }

    void run(boolean rebuild, Job job) {
        if (busy) return;
        busy = true;
        updateStatus();
        bridge.work.execute(
                () -> {
                    try {
                        bridge.error = "";
                        job.run();
                    } catch (Exception e) {
                        bridge.fail(e);
                    } finally {
                        busy = false;
                        runOnUiThread(
                                () -> {
                                    if (!isFinishing() && !isDestroyed()) {
                                        if (rebuild && bridge.ready() && !editCredentials)
                                            screen = "";
                                        render();
                                    }
                                });
                    }
                });
    }
}
