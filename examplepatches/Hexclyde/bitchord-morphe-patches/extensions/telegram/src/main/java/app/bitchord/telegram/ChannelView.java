package app.bitchord.telegram;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Intent;
import android.graphics.*;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.os.SystemClock;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.method.LinkMovementMethod;
import android.text.style.ClickableSpan;
import android.text.style.StyleSpan;
import android.view.*;
import android.widget.*;

import org.drinkless.tdlib.TdApi;

import java.io.*;
import java.net.URI;
import java.text.DateFormat;
import java.util.*;
import java.util.concurrent.Future;

/** Read-only channel page with Telegram's sponsored messages. */
final class ChannelView extends LinearLayout {
    final TelegramActivity owner;
    final TelegramBridge bridge;
    final TelegramStyle style;
    final long chatId, session;
    private final TreeMap<Long, TdApi.Message> posts = new TreeMap<>();
    private final Map<Integer, String> paths = new HashMap<>();
    private final Map<Integer, Boolean> videoSound = new HashMap<>();
    private final Set<Integer> requestedFiles = Collections.synchronizedSet(new HashSet<>());
    private final Set<Long> viewedPosts = new HashSet<>(),
            viewedSponsors = new HashSet<>(),
            pendingViews = new HashSet<>();
    private final Set<Long> brokenSponsors = new HashSet<>();
    private final List<Watched> watched = new ArrayList<>();
    private final List<VideoView> videos = new ArrayList<>();
    private final List<Future<?>> jobs = new ArrayList<>();
    private volatile boolean closed;
    volatile boolean foreground;
    boolean opened, drawn, olderBusy, atStart, sponsorBusy;
    long viewsRetryAt;
    TdApi.Chat chat;
    ChannelSponsorship.Snapshot snapshot;
    String sponsorError = "", historyError = "";
    long revision;
    final Runnable tick =
            new Runnable() {
                public void run() {
                    if (closed) return;
                    checkVisible();
                    owner.handler.postDelayed(this, 500);
                }
            };

    static final class Watched {
        final View view;
        final List<View> text;
        final long id;
        final boolean sponsor;

        Watched(View view, long id, boolean sponsor) {
            this.view = view;
            text = Collections.singletonList(view);
            this.id = id;
            this.sponsor = sponsor;
        }

        Watched(List<View> text, long id) {
            this.text = text;
            view = text.get(0);
            this.id = id;
            sponsor = true;
        }
    }

    ChannelView(TelegramActivity owner, long chat) {
        super(owner);
        this.owner = owner;
        bridge = owner.bridge;
        style = owner.style;
        chatId = chat;
        session = bridge.generation;
        revision = bridge.mediaRevision;
        setOrientation(VERTICAL);
        setPadding(style.dp(16), 0, style.dp(16), style.dp(20));
        addText(this, Strings.t("Loading channel…"), 14);
        getViewTreeObserver()
                .addOnDrawListener(
                        () -> {
                            drawn = true;
                        });
        jobs.add(
                bridge.work.submit(
                        () -> {
                            try {
                                TdApi.Chat value = bridge.channel(chatId);
                                bridge.openChannel(chatId);
                                List<TdApi.Message> history = bridge.channelHistory(chatId, 0);
                                if (closed || !foreground) bridge.closeChannel(chatId);
                                post(
                                        () -> {
                                            if (!valid()) return;
                                            this.chat = value;
                                            opened = foreground;
                                            if (!foreground) bridge.closeChannel(chatId);
                                            for (TdApi.Message message : history)
                                                posts.put(message.id, message);
                                            atStart = history.isEmpty();
                                            rebuild();
                                            loadSponsors();
                                        });
                            } catch (Exception e) {
                                post(
                                        () -> {
                                            if (valid()) {
                                                historyError = safeError(e);
                                                rebuild();
                                            }
                                        });
                            }
                        }));
        owner.handler.postDelayed(tick, 500);
    }

    boolean valid() {
        return !closed
                && !owner.isFinishing()
                && !owner.isDestroyed()
                && session == bridge.generation;
    }

    void resume() {
        foreground = true;
        if (chat != null && !opened) {
            jobs.add(
                    bridge.work.submit(
                            () -> {
                                try {
                                    bridge.openChannel(chatId);
                                    post(
                                            () -> {
                                                if (valid() && foreground) opened = true;
                                                else bridge.closeChannel(chatId);
                                            });
                                } catch (Exception e) {
                                    post(() -> showError(e));
                                }
                            }));
        }
    }

    void pause() {
        foreground = false;
        if (opened) {
            bridge.closeChannel(chatId);
            opened = false;
        }
        for (VideoView video : videos) video.pause();
    }

    void close() {
        if (closed) return;
        closed = true;
        pause();
        owner.handler.removeCallbacks(tick);
        for (Future<?> job : jobs) job.cancel(true);
        for (VideoView video : videos) video.stopPlayback();
        if (session == bridge.generation) {
            synchronized (requestedFiles) {
                for (int id : requestedFiles) bridge.releaseSponsorFile(id);
            }
        }
    }

    private TextView addText(LinearLayout parent, String text, int size) {
        TextView view = style.text(text, size, style.foreground, style.regular);
        view.setPadding(0, style.dp(7), 0, style.dp(7));
        parent.addView(view, new LayoutParams(-1, -2));
        return view;
    }

    private void button(LinearLayout parent, String text, boolean primary, Runnable action) {
        TextView view = style.button(text, primary, action);
        LayoutParams lp = new LayoutParams(-1, -2);
        lp.setMargins(0, style.dp(9), 0, style.dp(9));
        parent.addView(view, lp);
    }

    private LinearLayout card() {
        LinearLayout card = new LinearLayout(owner);
        card.setOrientation(VERTICAL);
        card.setPadding(style.dp(16), style.dp(12), style.dp(16), style.dp(14));
        card.setBackground(style.shape(style.card, 14, false));
        LayoutParams lp = new LayoutParams(-1, -2);
        lp.setMargins(0, 0, 0, style.dp(12));
        addView(card, lp);
        return card;
    }

    private String safeError(Exception e) {
        String text = e.getMessage();
        if (text == null) return Strings.t("Channel request failed");
        String hash = bridge.credentials().apiHash;
        return hash.isEmpty() ? text : text.replace(hash, "[hidden]");
    }

    void showError(Exception error) {
        if (valid()) {
            bridge.fail(error);
            owner.updateStatus();
        }
    }

    void rebuild() {
        if (!valid()) return;
        for (VideoView video : videos) video.stopPlayback();
        videos.clear();
        watched.clear();
        removeAllViews();
        drawn = false;
        if (chat != null) addText(this, chat.title, 24);
        addText(this, Strings.t("Read-only channel view · Your Telegram account"), 12)
                .setTextColor(style.secondary);
        if (!historyError.isEmpty()) {
            addText(this, historyError, 14);
            button(this, Strings.t("Retry channel"), false, () -> owner.reopenChannel(chatId));
            return;
        }
        if (chat == null) {
            addText(this, Strings.t("Loading channel…"), 14);
            return;
        }
        if (!atStart) {
            button(
                    this,
                    Strings.t(olderBusy ? "Loading older posts…" : "Load older posts"),
                    false,
                    () -> {
                        if (!olderBusy) loadOlder();
                    });
        }
        List<TdApi.SponsoredMessage> ads =
                snapshot == null ? Collections.emptyList() : snapshot.messages();
        int between = snapshot == null ? 0 : snapshot.messagesBetween, index = 0, count = 0;
        for (TdApi.Message message : posts.values()) {
            LinearLayout row = card();
            boolean allowed = MediaPolicy.savable(message);
            TextView text =
                    addText(
                            row,
                            allowed
                                    ? ChannelContent.description(message)
                                    : Strings.t(
                                            "Protected or unavailable message · open in Telegram"),
                            15);
            addText(
                            row,
                            DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT)
                                    .format(new Date(1000L * message.date)),
                            11)
                    .setTextColor(style.secondary);
            button(row, Strings.t("Open message in Telegram"), false, () -> openMessage(message));
            if (allowed) watched.add(new Watched(text, message.id, false));
            if (between > 0 && ++count >= between && index < ads.size()) {
                sponsorCardSafe(ads.get(index++));
                count = 0;
            }
        }
        if (posts.isEmpty())
            addText(
                    this,
                    Strings.t("No posts returned. Open this chat in Telegram to check access."),
                    14);
        if (between == 0 && !ads.isEmpty()) {
            addText(this, Strings.t("End of latest posts"), 11).setTextColor(style.secondary);
            sponsorCardSafe(ads.get(0));
        } else if (between > 0 && index == 0 && !ads.isEmpty() && posts.isEmpty())
            addText(this, Strings.t("Sponsored messages are available after channel posts."), 12);
        if (sponsorBusy) addText(this, Strings.t("Loading official sponsored messages…"), 12);
        if (!sponsorError.isEmpty()) {
            addText(this, sponsorError, 13);
            button(this, Strings.t("Retry sponsored messages"), false, this::loadSponsors);
        }
        if (snapshot != null && ads.isEmpty())
            addText(this, Strings.t("Telegram returned no sponsored messages for this view."), 12)
                    .setTextColor(style.secondary);
    }

    void loadOlder() {
        if (posts.size() >= 150) {
            addText(
                    this,
                    Strings.t(
                            "Use Telegram to browse further history. Live audio search remains"
                                    + " available in BitChord."),
                    13);
            return;
        }
        olderBusy = true;
        long before = posts.isEmpty() ? 0 : posts.firstKey();
        jobs.add(
                bridge.work.submit(
                        () -> {
                            try {
                                List<TdApi.Message> list = bridge.channelHistory(chatId, before);
                                post(
                                        () -> {
                                            if (!valid()) return;
                                            int old = posts.size();
                                            for (TdApi.Message message : list)
                                                posts.put(message.id, message);
                                            atStart = posts.size() == old;
                                            olderBusy = false;
                                            rebuild();
                                        });
                            } catch (Exception e) {
                                post(
                                        () -> {
                                            olderBusy = false;
                                            showError(e);
                                        });
                            }
                        }));
    }

    void loadSponsors() {
        if (sponsorBusy || chat == null || !valid()) return;
        sponsorBusy = true;
        sponsorError = "";
        jobs.add(
                bridge.work.submit(
                        () -> {
                            try {
                                if (!bridge.hasSponsoredMessages(chat)) {
                                    post(
                                            () -> {
                                                sponsorBusy = false;
                                                if (valid()) rebuild();
                                            });
                                    return;
                                }
                                ChannelSponsorship.Snapshot loaded =
                                        bridge.sponsorship.load(chatId, session);
                                Map<Integer, String> downloaded = new HashMap<>();
                                Map<Integer, Boolean> sound = new HashMap<>();
                                for (TdApi.SponsoredMessage message : loaded.messages())
                                    for (TdApi.File file : ChannelContent.files(message)) {
                                        if (closed || session != bridge.generation)
                                            throw new IOException("Channel view closed");
                                        requestedFiles.add(file.id);
                                        downloaded.put(
                                                file.id, bridge.downloadSponsorFile(file.id));
                                        if (closed || session != bridge.generation) {
                                            if (session == bridge.generation)
                                                bridge.releaseSponsorFile(file.id);
                                            throw new IOException("Channel view closed");
                                        }
                                    }
                                for (TdApi.SponsoredMessage message : loaded.messages()) {
                                    ChannelContent.Media media =
                                            ChannelContent.media(message.content);
                                    if (media != null && media.kind.equals("video")) {
                                        MediaMetadataRetriever metadata =
                                                new MediaMetadataRetriever();
                                        try {
                                            metadata.setDataSource(downloaded.get(media.file.id));
                                            String audio =
                                                    metadata.extractMetadata(
                                                            MediaMetadataRetriever
                                                                    .METADATA_KEY_HAS_AUDIO);
                                            sound.put(media.file.id, "yes".equals(audio));
                                        } finally {
                                            metadata.release();
                                        }
                                    }
                                }
                                post(
                                        () -> {
                                            if (valid()) {
                                                if (snapshot != loaded) {
                                                    viewedSponsors.clear();
                                                    brokenSponsors.clear();
                                                }
                                                snapshot = loaded;
                                                paths.putAll(downloaded);
                                                videoSound.putAll(sound);
                                                sponsorBusy = false;
                                                rebuild();
                                            }
                                        });
                            } catch (Exception e) {
                                post(
                                        () -> {
                                            if (valid()) {
                                                snapshot = null;
                                                sponsorBusy = false;
                                                sponsorError =
                                                        Strings.f(
                                                                "Official sponsored messages could"
                                                                        + " not be displayed: {0}",
                                                                safeError(e));
                                                rebuild();
                                            }
                                        });
                            }
                        }));
    }

    void sponsorCardSafe(TdApi.SponsoredMessage message) {
        int before = getChildCount();
        try {
            sponsorCard(message);
        } catch (Exception e) {
            while (getChildCount() > before) removeViewAt(before);
            brokenSponsors.add(message.messageId);
            LinearLayout row = card();
            addText(
                    row,
                    Strings.t("This official sponsored message could not be displayed completely."),
                    14);
            button(
                    row,
                    Strings.t("Retry sponsored messages"),
                    false,
                    () -> {
                        brokenSponsors.remove(message.messageId);
                        loadSponsors();
                    });
            showError(e);
        }
    }

    void sponsorCard(TdApi.SponsoredMessage message) {
        LinearLayout row = card();
        int accent = bridge.sponsorColor(message.accentColorId, style.dark);
        row.setBackground(style.shape(0x22000000 | (accent & 0xffffff), 14, false));
        LinearLayout label = new LinearLayout(owner);
        label.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(label);
        TextView tag =
                style.text(
                        Strings.t(message.isRecommended ? "Recommended" : "Sponsored"),
                        12,
                        style.secondary,
                        style.regular);
        label.addView(tag, new LayoutParams(0, -2, 1));
        TextView menu = style.button("•••", false, () -> sponsorMenu(message));
        label.addView(menu, new LayoutParams(style.dp(48), style.dp(44)));
        LinearLayout identity = new LinearLayout(owner);
        identity.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(identity);
        TdApi.File avatar = ChannelContent.photo(message.sponsor.photo);
        if (avatar != null && paths.containsKey(avatar.id)) {
            ImageView image = image(paths.get(avatar.id));
            identity.addView(image, new LayoutParams(style.dp(36), style.dp(36)));
            image.setOnClickListener(v -> destination(message, message.sponsor.url, false, false));
        }
        TextView title =
                style.text(
                        ChannelContent.value(message.title),
                        18,
                        bridge.sponsorColor(message.accentColorId, style.dark),
                        style.semibold);
        title.setPadding(style.dp(10), style.dp(6), 0, style.dp(6));
        identity.addView(title, new LayoutParams(0, -2, 1));
        title.setOnClickListener(v -> destination(message, message.sponsor.url, false, false));
        List<View> entireText = new ArrayList<>();
        entireText.add(title);
        TdApi.FormattedText formatted = ChannelContent.caption(message.content);
        TextView body = addText(row, ChannelContent.text(formatted), 15);
        format(body, formatted, message);
        entireText.add(body);
        try {
            ChannelContent.Media media = ChannelContent.media(message.content);
            if (media != null) renderMedia(row, message, media);
        } catch (Exception e) {
            throw new IllegalStateException("Sponsored media could not be rendered", e);
        }
        if (message.content instanceof TdApi.MessageText) {
            TdApi.LinkPreview preview = ((TdApi.MessageText) message.content).linkPreview;
            if (preview != null) {
                entireText.add(addText(row, ChannelContent.value(preview.title), 15));
                TextView description = addText(row, ChannelContent.text(preview.description), 13);
                entireText.add(description);
                description.setOnClickListener(
                        v -> destination(message, preview.url, false, false));
            }
        }
        if (!ChannelContent.value(message.additionalInfo).isEmpty())
            entireText.add(addText(row, message.additionalInfo, 12));
        button(
                row,
                ChannelContent.value(message.buttonText).isEmpty()
                        ? Strings.t("Open sponsor")
                        : message.buttonText,
                true,
                () -> destination(message, message.sponsor.url, false, false));
        TextView action = (TextView) row.getChildAt(row.getChildCount() - 1);
        action.setTextColor(accent);
        action.setBackground(style.shape(style.card, 10, false));
        watched.add(new Watched(entireText, message.messageId));
    }

    private ImageView image(String path) {
        ImageView image = new ImageView(owner);
        image.setAdjustViewBounds(true);
        image.setScaleType(ImageView.ScaleType.FIT_CENTER);
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(path, options);
        options.inSampleSize = 1;
        while (options.outWidth / options.inSampleSize > 1600
                || options.outHeight / options.inSampleSize > 1600) options.inSampleSize *= 2;
        options.inJustDecodeBounds = false;
        Bitmap bitmap = BitmapFactory.decodeFile(path, options);
        if (bitmap == null)
            throw new IllegalArgumentException("Sponsored image could not be decoded");
        image.setImageBitmap(bitmap);
        return image;
    }

    private void renderMedia(
            LinearLayout row, TdApi.SponsoredMessage message, ChannelContent.Media media)
            throws Exception {
        String path = paths.get(media.file.id);
        if (path == null) throw new IOException("Sponsored media was not fully loaded");
        if (media.kind.equals("photo")) {
            ImageView image = image(path);
            row.addView(image, new LayoutParams(-1, -2));
            image.setOnClickListener(v -> destination(message, message.sponsor.url, true, false));
        } else if (media.kind.equals("animation-image")) {
            Movie movie = Movie.decodeFile(path);
            if (movie == null)
                throw new IOException("This device could not decode the sponsored animation");
            View animation = new AnimatedImage(movie);
            row.addView(animation, new LayoutParams(-1, style.dp(220)));
            animation.setOnClickListener(
                    v -> destination(message, message.sponsor.url, true, false));
        } else {
            boolean sound = Boolean.TRUE.equals(videoSound.get(media.file.id));
            VideoView video = new VideoView(owner);
            videos.add(video);
            row.addView(video, new LayoutParams(-1, style.dp(210)));
            video.setVideoPath(path);
            video.setOnPreparedListener(
                    player -> {
                        player.setVolume(0, 0);
                        player.setLooping(media.kind.equals("animation-video"));
                    });
            video.setOnErrorListener(
                    (player, what, extra) -> {
                        brokenSponsors.add(message.messageId);
                        showError(
                                new IOException(
                                        "Sponsored video could not be decoded on this device"));
                        return true;
                    });
            video.setOnTouchListener(
                    (view, event) -> {
                        if (event.getAction() == MotionEvent.ACTION_UP) {
                            if (sound) {
                                fullscreen(message, path, true);
                                recordClick(message, true, false);
                            } else destination(message, message.sponsor.url, true, false);
                        }
                        return true;
                    });
            if (media.kind.equals("video"))
                button(
                        row,
                        Strings.t("View video fullscreen"),
                        false,
                        () -> fullscreen(message, path, sound));
        }
    }

    final class AnimatedImage extends View {
        final Movie movie;
        long start = SystemClock.uptimeMillis();

        AnimatedImage(Movie movie) {
            super(owner);
            this.movie = movie;
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            if (movie.width() <= 0 || movie.height() <= 0) return;
            float scale =
                    Math.min(
                            (float) getWidth() / movie.width(),
                            (float) getHeight() / movie.height());
            int saved = canvas.save();
            canvas.translate(
                    (getWidth() - movie.width() * scale) / 2,
                    (getHeight() - movie.height() * scale) / 2);
            canvas.scale(scale, scale);
            movie.setTime(
                    (int) ((SystemClock.uptimeMillis() - start) % Math.max(1, movie.duration())));
            movie.draw(canvas, 0, 0);
            canvas.restoreToCount(saved);
            if (foreground && isShown() && !closed) postInvalidateDelayed(40);
        }
    }

    void fullscreen(TdApi.SponsoredMessage message, String path, boolean sound) {
        Dialog dialog = new Dialog(owner, android.R.style.Theme_Material_NoActionBar_Fullscreen);
        LinearLayout layout = new LinearLayout(owner);
        layout.setOrientation(VERTICAL);
        layout.setBackgroundColor(style.background);
        layout.setPadding(style.dp(16), style.dp(16), style.dp(16), style.dp(16));
        VideoView video = new VideoView(owner);
        videos.add(video);
        layout.addView(video, new LayoutParams(-1, 0, 1));
        video.setVideoPath(path);
        MediaController controls = new MediaController(owner);
        controls.setAnchorView(video);
        video.setMediaController(controls);
        video.setOnPreparedListener(
                player -> {
                    player.setVolume(sound ? 1 : 0, sound ? 1 : 0);
                    video.start();
                });
        if (sound)
            video.setOnTouchListener(
                    (view, event) -> {
                        if (event.getAction() == MotionEvent.ACTION_UP)
                            destination(message, message.sponsor.url, true, true);
                        return true;
                    });
        button(
                layout,
                message.buttonText == null ? Strings.t("Open sponsor") : message.buttonText,
                true,
                () -> destination(message, message.sponsor.url, false, true));
        button(layout, Strings.t("Close video"), false, dialog::dismiss);
        dialog.setContentView(layout);
        owner.secureWindow(dialog.getWindow());
        dialog.setOnDismissListener(
                d -> {
                    video.stopPlayback();
                    videos.remove(video);
                });
        dialog.show();
    }

    void sponsorMenu(TdApi.SponsoredMessage message) {
        List<String> options = new ArrayList<>();
        options.add(Strings.t("Sponsor information"));
        if (message.canBeReported) options.add(Strings.t("Report sponsored message"));
        AlertDialog dialog =
                new AlertDialog.Builder(owner)
                        .setTitle(Strings.t(message.isRecommended ? "Recommended" : "Sponsored"))
                        .setItems(
                                options.toArray(new String[0]),
                                (d, index) -> {
                                    if (index == 0)
                                        owner.confirm(
                                                "Sponsor information",
                                                ChannelContent.value(message.sponsor.info)
                                                        + (ChannelContent.value(
                                                                                message.additionalInfo)
                                                                        .isEmpty()
                                                                ? ""
                                                                : "\n\n" + message.additionalInfo),
                                                "Done",
                                                () -> {});
                                    else report(message, new byte[0]);
                                })
                        .setNegativeButton(Strings.t("Close"), null)
                        .create();
        owner.secureWindow(dialog.getWindow());
        dialog.show();
    }

    void report(TdApi.SponsoredMessage message, byte[] option) {
        jobs.add(
                bridge.work.submit(
                        () -> {
                            try {
                                TdApi.ReportSponsoredResult result =
                                        bridge.sponsorship.report(
                                                snapshot, message.messageId, option);
                                post(
                                        () -> {
                                            if (!valid()) return;
                                            if (result
                                                    instanceof
                                                    TdApi.ReportSponsoredResultOptionRequired) {
                                                TdApi.ReportSponsoredResultOptionRequired choice =
                                                        (TdApi.ReportSponsoredResultOptionRequired)
                                                                result;
                                                String[] labels = new String[choice.options.length];
                                                for (int i = 0; i < labels.length; i++)
                                                    labels[i] = choice.options[i].text;
                                                AlertDialog dialog =
                                                        new AlertDialog.Builder(owner)
                                                                .setTitle(choice.title)
                                                                .setItems(
                                                                        labels,
                                                                        (d, index) ->
                                                                                report(
                                                                                        message,
                                                                                        choice.options[
                                                                                                index]
                                                                                                .id))
                                                                .setNegativeButton(
                                                                        Strings.t("Cancel"), null)
                                                                .create();
                                                owner.secureWindow(dialog.getWindow());
                                                dialog.show();
                                            } else if (result
                                                    instanceof
                                                    TdApi.ReportSponsoredResultPremiumRequired)
                                                owner.confirm(
                                                        "Telegram Premium required",
                                                        "Telegram requires Premium for this action."
                                                                + " No local ad-hiding setting was"
                                                                + " applied.",
                                                        "Done",
                                                        () -> {});
                                            else {
                                                if (result
                                                        instanceof
                                                        TdApi.ReportSponsoredResultAdsHidden)
                                                    snapshot = null;
                                                rebuild();
                                            }
                                        });
                            } catch (Exception e) {
                                post(() -> showError(e));
                            }
                        }));
    }

    void destination(
            TdApi.SponsoredMessage message, String value, boolean media, boolean fullscreen) {
        try {
            URI uri = ChannelSponsorship.destination(value);
            Runnable open =
                    () -> {
                        try {
                            launch(uri);
                            if (message != null) recordClick(message, media, fullscreen);
                        } catch (Exception e) {
                            showError(e);
                        }
                    };
            if (ChannelSponsorship.telegramHost(uri.getHost())) open.run();
            else owner.confirm("Open external link?", uri.getHost() + "\n\n" + value, "Open", open);
        } catch (Exception e) {
            showError(e);
        }
    }

    void recordClick(TdApi.SponsoredMessage message, boolean media, boolean fullscreen) {
        ChannelSponsorship.Snapshot clicked = snapshot;
        jobs.add(
                bridge.work.submit(
                        () -> {
                            try {
                                bridge.sponsorship.clicked(
                                        clicked, message.messageId, media, fullscreen);
                            } catch (Exception e) {
                                post(() -> showError(e));
                            }
                        }));
    }

    void launch(URI uri) throws Exception {
        String host = uri.getHost().toLowerCase(Locale.ROOT);
        Uri target = Uri.parse(uri.toString());
        if (host.equals("t.me") || host.equals("telegram.me") || host.equals("telegram.dog")) {
            String path = uri.getPath() == null ? "" : uri.getPath();
            String[] parts = path.replaceFirst("^/", "").split("/");
            if (parts.length > 0 && parts[0].matches("[A-Za-z][A-Za-z0-9_]{3,31}")) {
                Uri.Builder nativeLink =
                        new Uri.Builder()
                                .scheme("tg")
                                .authority("resolve")
                                .appendQueryParameter("domain", parts[0]);
                if (parts.length > 1 && parts[1].matches("[0-9]+"))
                    nativeLink.appendQueryParameter("post", parts[1]);
                for (String key :
                        new String[] {
                            "start", "startgroup", "startapp", "game", "comment", "thread"
                        }) {
                    String parameter = target.getQueryParameter(key);
                    if (parameter != null) nativeLink.appendQueryParameter(key, parameter);
                }
                target = nativeLink.build();
            } else if (parts.length >= 3
                    && parts[0].equals("c")
                    && parts[1].matches("[0-9]+")
                    && parts[2].matches("[0-9]+"))
                target =
                        new Uri.Builder()
                                .scheme("tg")
                                .authority("privatepost")
                                .appendQueryParameter("channel", parts[1])
                                .appendQueryParameter("post", parts[2])
                                .build();
            else
                throw new IOException(
                        Strings.f("Open this Telegram link in the official client: {0}", uri));
        }
        owner.startActivity(new Intent(Intent.ACTION_VIEW, target));
    }

    void openMessage(TdApi.Message message) {
        jobs.add(
                bridge.work.submit(
                        () -> {
                            try {
                                String link = bridge.messageLink(chatId, message.id);
                                post(
                                        () -> {
                                            if (valid()) destination(null, link, false, false);
                                        });
                            } catch (Exception e) {
                                post(() -> showError(e));
                            }
                        }));
    }

    void format(TextView view, TdApi.FormattedText text, TdApi.SponsoredMessage message) {
        if (text == null || text.text == null || text.entities == null) return;
        SpannableString styled = new SpannableString(text.text);
        for (TdApi.TextEntity entity : text.entities) {
            if (entity == null
                    || entity.offset < 0
                    || entity.length <= 0
                    || entity.offset > text.text.length() - entity.length) continue;
            int end = entity.offset + entity.length;
            if (entity.type instanceof TdApi.TextEntityTypeBold)
                styled.setSpan(
                        new StyleSpan(Typeface.BOLD),
                        entity.offset,
                        end,
                        Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            else if (entity.type instanceof TdApi.TextEntityTypeItalic)
                styled.setSpan(
                        new StyleSpan(Typeface.ITALIC),
                        entity.offset,
                        end,
                        Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            else {
                String link = null;
                if (entity.type instanceof TdApi.TextEntityTypeTextUrl)
                    link = ((TdApi.TextEntityTypeTextUrl) entity.type).url;
                else if (entity.type instanceof TdApi.TextEntityTypeUrl)
                    link = text.text.substring(entity.offset, end);
                else if (entity.type instanceof TdApi.TextEntityTypeMention)
                    link = "https://t.me/" + text.text.substring(entity.offset + 1, end);
                if (link != null) {
                    final String destination = link;
                    styled.setSpan(
                            new ClickableSpan() {
                                @Override
                                public void onClick(View widget) {
                                    ChannelView.this.destination(
                                            message, destination, false, false);
                                }
                            },
                            entity.offset,
                            end,
                            Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                }
            }
        }
        view.setText(styled);
        view.setMovementMethod(LinkMovementMethod.getInstance());
    }

    boolean fullyVisible(View view) {
        Rect visible = new Rect();
        boolean found = view.getGlobalVisibleRect(visible);
        return MediaPolicy.wholeView(
                foreground,
                owner.hasWindowFocus(),
                view.isShown(),
                drawn,
                view.getAlpha(),
                view.getWidth(),
                view.getHeight(),
                found ? visible.width() : 0,
                found ? visible.height() : 0);
    }

    void checkVisible() {
        if (!valid()) {
            if (session != bridge.generation) {
                sponsorError = Strings.t("Telegram account changed. Reopen the channel.");
                pause();
            }
            return;
        }
        if (revision != bridge.mediaRevision || !bridge.selected.contains(chatId)) {
            revision = bridge.mediaRevision;
            pause();
            posts.clear();
            snapshot = null;
            historyError =
                    Strings.t(
                            "Channel content or permissions changed. Reopen to refresh before"
                                    + " reading.");
            rebuild();
            return;
        }
        if (!foreground || !opened || !owner.hasWindowFocus() || !drawn) return;
        jobs.removeIf(Future::isDone);
        for (VideoView video : videos) {
            Rect bounds = new Rect();
            boolean visible =
                    video.isShown()
                            && video.getGlobalVisibleRect(bounds)
                            && bounds.width() > 0
                            && bounds.height() > 0;
            if (visible && !video.isPlaying()) video.start();
            else if (!visible && video.isPlaying()) video.pause();
        }
        if (snapshot != null && bridge.sponsorship.expired(snapshot, session) && !sponsorBusy) {
            snapshot = null;
            loadSponsors();
            rebuild();
            return;
        }
        if (SystemClock.uptimeMillis() < viewsRetryAt) return;
        for (Watched candidate : watched) {
            Rect visible = new Rect();
            boolean onScreen =
                    candidate.view.isShown()
                            && candidate.view.getGlobalVisibleRect(visible)
                            && visible.width() > 0
                            && visible.height() > 0;
            if (candidate.sponsor)
                for (View text : candidate.text)
                    if (!fullyVisible(text)) {
                        onScreen = false;
                        break;
                    }
            if (!onScreen
                    || pendingViews.contains(candidate.id)
                    || (candidate.sponsor ? viewedSponsors : viewedPosts).contains(candidate.id))
                continue;
            if (candidate.sponsor && (snapshot == null || brokenSponsors.contains(candidate.id)))
                continue;
            pendingViews.add(candidate.id);
            ChannelSponsorship.Snapshot shown = snapshot;
            jobs.add(
                    bridge.work.submit(
                            () -> {
                                try {
                                    if (session != bridge.generation) return;
                                    if (candidate.sponsor)
                                        bridge.sponsorship.viewed(shown, candidate.id);
                                    else
                                        bridge.viewedMessages(
                                                chatId, new long[] {candidate.id}, session);
                                    post(
                                            () -> {
                                                pendingViews.remove(candidate.id);
                                                (candidate.sponsor ? viewedSponsors : viewedPosts)
                                                        .add(candidate.id);
                                            });
                                } catch (Exception e) {
                                    post(
                                            () -> {
                                                pendingViews.remove(candidate.id);
                                                viewsRetryAt = SystemClock.uptimeMillis() + 10000;
                                                if (valid())
                                                    owner.bridge.error =
                                                            "Message view acknowledgement failed;"
                                                                + " it will retry when visible.";
                                            });
                                }
                            }));
        }
    }
}
