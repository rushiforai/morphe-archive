package app.bitchord.telegram;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import android.util.AtomicFile;
import android.util.Base64;

import org.drinkless.tdlib.Client;
import org.drinkless.tdlib.TdApi;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.*;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.security.KeyStore;
import java.security.SecureRandom;
import java.util.*;
import java.util.concurrent.*;

import javax.crypto.*;
import javax.crypto.spec.GCMParameterSpec;

/** Owns the TDLib client, authorization state and selected chats. */
public final class TelegramBridge {
    public static volatile TelegramBridge instance;
    public static volatile String startupError = "";
    private static volatile Context appContext;
    public final Context context;
    final ExecutorService work = Executors.newSingleThreadExecutor();
    final TrackNames names;
    private volatile boolean useTrackNames, suggestTrackNames, hideDuplicates, hideUnplayable;
    private volatile boolean indexWifiOnly, indexChargingOnly;
    private volatile boolean reportQuality, showArtwork, namesFromFiles;
    final Artwork artwork;
    final FormatProbe formats;
    final LegendMemory legends;
    private volatile long lastSuggestionSearch;
    private final Map<String, Boolean> heard = new LinkedHashMap<>();
    private final ExecutorService recordWork =
            Executors.newSingleThreadExecutor(
                    r -> {
                        Thread thread = new Thread(r, "Telegram track names");
                        thread.setDaemon(true);
                        return thread;
                    });
    // At most one pending check; newer songs replace older ones while one runs.
    private final ThreadPoolExecutor suggestionWork =
            new ThreadPoolExecutor(
                    1,
                    1,
                    0,
                    TimeUnit.SECONDS,
                    new ArrayBlockingQueue<Runnable>(1),
                    r -> {
                        Thread thread = new Thread(r, "Telegram name suggestions");
                        thread.setDaemon(true);
                        thread.setPriority(Thread.MIN_PRIORITY);
                        return thread;
                    },
                    new ThreadPoolExecutor.DiscardOldestPolicy());
    final Set<Long> selected = ConcurrentHashMap.newKeySet();
    final File home;
    JSONObject config;
    private volatile long cacheLimitBytes = CachePolicy.DEFAULT_BYTES;
    private volatile ApplicationCredentials credentials = ApplicationCredentials.empty();
    private volatile ApplicationCredentials appliedCredentials = ApplicationCredentials.empty();
    final CredentialStore credentialStore;
    volatile Client client;
    volatile long generation;
    volatile CompletableFuture<Void> clientClosed;
    volatile boolean restarting;
    final NativeAudio audio = new NativeAudio(this);
    volatile String sessionTag;
    public volatile TdApi.AuthorizationState auth;
    public volatile String status = "Starting Telegram…";
    public volatile String error = "";
    volatile boolean paramsSent;
    volatile long mediaRevision;
    final ChannelSponsorship sponsorship = new ChannelSponsorship(request -> callAny(request));
    private volatile boolean foreground;
    private final LinkedHashMap<String, Boolean> playbackRead = new LinkedHashMap<>();
    final Map<Integer, TdApi.AccentColor> accentColors = new ConcurrentHashMap<>();
    final TelegramIndex index;
    final FileChecks checks;
    final SoundCheck soundCheck;
    final MainChannel mainChannel;
    private final ExecutorService soundWork =
            Executors.newSingleThreadExecutor(
                    r -> {
                        Thread thread = new Thread(r, "Telegram sound check");
                        thread.setDaemon(true);
                        thread.setPriority(Thread.MIN_PRIORITY);
                        return thread;
                    });
    final LiveSearch remoteSearch =
            new LiveSearch(
                    (request, timeout) -> {
                        try {
                            return call(request, timeout);
                        } catch (TelegramFailure e) {
                            throw rateLimitOr(e);
                        }
                    });

    /** Telegram's "wait N seconds" as a RateLimited; any other failure as it is. */
    static Exception rateLimitOr(TelegramFailure e) {
        if (e.code != 429) return e;
        java.util.regex.Matcher wait =
                java.util.regex.Pattern.compile(
                                "(?:retry after |FLOOD_WAIT_)([0-9]+)",
                                java.util.regex.Pattern.CASE_INSENSITIVE)
                        .matcher(e.getMessage());
        int seconds = 60;
        if (wait.find())
            try {
                seconds = Integer.parseInt(wait.group(1));
            } catch (NumberFormatException ignored) {
            }
        return new LiveSearch.RateLimited(seconds);
    }

    private void showRateLimit(int seconds) {
        toast(LiveSearch.rateLimitNotice(seconds));
    }

    private void toast(String notice) {
        new Handler(Looper.getMainLooper())
                .post(
                        () -> {
                            try {
                                android.widget.Toast.makeText(
                                                context, notice, android.widget.Toast.LENGTH_LONG)
                                        .show();
                            } catch (RuntimeException ignored) {
                                // No toast, e.g. while the app is being closed.
                            }
                        });
    }

    public static synchronized void init(Context context) {
        appContext = context.getApplicationContext();
        if (instance != null || !startupError.isEmpty()) return;
        try {
            // Explicit ordering also resolves the dynamic OpenSSL and C++ dependencies.
            System.loadLibrary("c++_shared");
            System.loadLibrary("cryptox");
            System.loadLibrary("sslx");
            System.loadLibrary("tdjni");
            instance = new TelegramBridge(context.getApplicationContext());
        } catch (Throwable t) {
            startupError = Strings.f("Native extension could not start: {0}", t);
        }
    }

    public static void openSetup() {
        Context context = appContext;
        if (context != null)
            context.startActivity(
                    new Intent(context, TelegramActivity.class)
                            .addFlags(
                                    Intent.FLAG_ACTIVITY_NEW_TASK
                                            | Intent.FLAG_ACTIVITY_SINGLE_TOP));
    }

    public static int resourceId(String name, String type) {
        Context context = appContext;
        return context == null
                ? 0
                : context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    private TelegramBridge(Context context) throws Exception {
        this.context = context;
        home = new File(context.getNoBackupFilesDir(), "telegram-native");
        if (!home.isDirectory() && !home.mkdirs())
            throw new IOException("Cannot create private directory");
        credentialStore = new CredentialStore(context, home);
        remoteSearch.onRateLimited = this::showRateLimit;
        index =
                new TelegramIndex(
                        openIndex(),
                        new TelegramIndex.Pages() {
                            @Override
                            public TdApi.FoundChatMessages page(long chat, int kind, long from)
                                    throws Exception {
                                return remoteSearch.page(chat, kind, from);
                            }

                            @Override
                            public int count(long chat, int kind) throws Exception {
                                return call(
                                                new TdApi.GetChatMessageCount(
                                                        chat, null, LiveSearch.filter(kind), false),
                                                15000)
                                        .count;
                            }

                            @Override
                            public byte[] range(int file, long offset, int length)
                                    throws Exception {
                                return readRange(file, offset, length);
                            }

                            @Override
                            public int position(long chat, int kind, long message)
                                    throws Exception {
                                return call(
                                                new TdApi.GetChatMessagePosition(
                                                        chat,
                                                        null,
                                                        LiveSearch.filter(kind),
                                                        message),
                                                15000)
                                        .count;
                            }
                        },
                        System::currentTimeMillis);
        mainChannel =
                new MainChannel(
                        new File(home, "main-channel.json"),
                        (to, from, messages) -> {
                            try {
                                call(
                                        new TdApi.ForwardMessages(
                                                to, null, from, messages, null, true, false),
                                        30000);
                            } catch (TelegramFailure e) {
                                throw rateLimitOr(e);
                            }
                        },
                        System::currentTimeMillis);
        checks =
                new FileChecks(
                        new File(home, "file-checks.json"),
                        new File(home, "acoustid.json"),
                        new FileChecks.Host() {
                            @Override
                            public boolean ready() {
                                return TelegramBridge.this.ready();
                            }

                            @Override
                            public String pause() {
                                return indexPause();
                            }

                            @Override
                            public Collection<Long> chats() {
                                return indexedChats();
                            }

                            @Override
                            public TelegramIndex index() {
                                return index;
                            }

                            @Override
                            public byte[] range(int file, long offset, int length)
                                    throws Exception {
                                return readRange(file, offset, length);
                            }

                            @Override
                            public FileChecks.Audio decode(String id, int seconds)
                                    throws Exception {
                                SoundCheck.Pcm pcm =
                                        AudioDecode.start(TelegramBridge.this, id, seconds, 30);
                                return new FileChecks.Audio(pcm.samples, pcm.length, pcm.rate);
                            }

                            @Override
                            public String lookup(String key, int seconds, String fingerprint)
                                    throws Exception {
                                return AcoustId.lookup(key, seconds, fingerprint);
                            }

                            @Override
                            public void changed(JSONObject row) {
                                String id = row.optString("id");
                                if (legends.put(
                                        FormatLegend.TELEGRAM + id,
                                        LegendMatch.row(row, formats.get(id)))) {
                                    legends.save();
                                    FormatLegend.changed();
                                }
                            }
                        },
                        System::currentTimeMillis);
        FileChecks.active = checks;
        VersionAlign.decoder =
                (id, fromMs, seconds) ->
                        AudioDecode.decode(this, id, fromMs, seconds, 5, VersionAlign.BUDGET_MS);
        soundCheck =
                new SoundCheck(
                        new File(home, "sound-checks.json"),
                        (id, seconds) -> AudioDecode.start(this, id, seconds),
                        title ->
                                toast(
                                        Strings.f(
                                                "Telegram has the same recording of “{0}”. It’ll"
                                                        + " play from Telegram next time.",
                                                title)),
                        soundWork,
                        System::currentTimeMillis);
        names = new TrackNames(new File(home, "track-names.json"));
        artwork = new Artwork(new File(home, "artwork"));
        formats = new FormatProbe(new File(home, "formats.json"));
        formats.onChange = FormatLegend::changed;
        legends = new LegendMemory(new File(home, "legends.json"));
        try {
            if (credentialStore.exists()) credentials = credentialStore.load();
            else
                try (InputStream input =
                        context.getAssets().open("telegram-native/application.json")) {
                    ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                    byte[] block = new byte[1024];
                    int n;
                    while ((n = input.read(block)) != -1) bytes.write(block, 0, n);
                    JSONObject seed =
                            new JSONObject(new String(bytes.toByteArray(), StandardCharsets.UTF_8));
                    if (seed.optInt("apiId") > 0 && !seed.optString("apiHash").isEmpty()) {
                        credentials =
                                ApplicationCredentials.parse(
                                        Integer.toString(seed.getInt("apiId")),
                                        seed.getString("apiHash"));
                        credentialStore.save(credentials);
                    }
                }
        } catch (Exception e) {
            error =
                    "Application configuration could not be loaded. Enter it again in Telegram"
                            + " settings.";
        }
        config = readJson(new File(home, "config.json"));
        applyConfig();
        // Legacy catalogue files are left on disk for rollback, but are no longer loaded or
        // required.
        saveConfig();
        // No logs of phone numbers, codes, passwords or session data.
        Client.execute(new TdApi.SetLogVerbosityLevel(0));
        startClient();
        Thread indexing = new Thread(this::runIndex, "Telegram index");
        indexing.setDaemon(true);
        indexing.setPriority(Thread.MIN_PRIORITY);
        indexing.start();
        Thread importing = new Thread(this::runImport, "Telegram import");
        importing.setDaemon(true);
        importing.setPriority(Thread.MIN_PRIORITY);
        importing.start();
        Thread checking = new Thread(this::runChecks, "Telegram file checks");
        checking.setDaemon(true);
        checking.setPriority(Thread.MIN_PRIORITY);
        checking.start();
        if (context instanceof Application) TelegramLifecycle.install((Application) context, this);
    }

    /** Takes the settings from {@link #config}: at start, and after a restore. */
    private void applyConfig() throws Exception {
        cacheLimitBytes =
                CachePolicy.validOrDefault(
                        config.optLong("audioCacheBytes", CachePolicy.DEFAULT_BYTES));
        config.remove("apiId");
        config.remove("apiHash");
        // Migrate old HTTP state; the new session marker is not an access credential.
        config.remove("token");
        config.remove("port");
        useTrackNames = config.optBoolean("useTrackNames", true);
        suggestTrackNames = config.optBoolean("suggestTrackNames", true);
        reportQuality = config.optBoolean("reportQuality", true);
        showArtwork = config.optBoolean("showArtwork", true);
        namesFromFiles = config.optBoolean("namesFromFiles", true);
        Downmix.enabled = config.optBoolean("surroundAsStereo", Downmix.enabled);
        SmoothUpgrade.enabled = config.optBoolean("smoothUpgrades", SmoothUpgrade.enabled);
        FormatLegend.enabled = config.optBoolean("formatLegend", FormatLegend.enabled);
        index.enabled = !savedIndexBroken && config.optBoolean("searchIndex", true);
        hideDuplicates = config.optBoolean("hideDuplicates", true);
        hideUnplayable = config.optBoolean("hideUnplayableDolby", true);
        indexWifiOnly = config.optBoolean("indexWifiOnly", false);
        indexChargingOnly = config.optBoolean("indexChargingOnly", false);
        SoundCheck.active = config.optBoolean("soundCheck", false) ? soundCheck : null;
        useSharedIndexes = config.optBoolean("useSharedIndexes", true);
        checks.checkLossless = config.optBoolean("checkLossless", true);
        LosslessCheck.enabled = checks.checkLossless;
        checks.checkInBackground = config.optBoolean("checkInBackground", false);
        checks.recognize = config.optBoolean("recognizeUntagged", false);
        JSONArray ids = config.optJSONArray("chats");
        selected.clear();
        if (ids != null) for (int i = 0; i < ids.length(); i++) selected.add(ids.getLong(i));
    }

    // ── Backup, restore and sharing the saved index ─────────────────────────

    private volatile boolean useSharedIndexes;

    public boolean useSharedIndexes() {
        return useSharedIndexes;
    }

    public void setUseSharedIndexes(boolean on) throws Exception {
        useSharedIndexes = on;
        config.put("useSharedIndexes", on);
        saveConfig();
    }

    static String today() {
        return new java.text.SimpleDateFormat("yyyyMMdd", Locale.ROOT).format(new Date());
    }

    /**
     * Writes a backup: the settings, corrected names and main channel setup, and with {@code
     * withIndex}, the saved index of every chat it covers. The app's API details and the Telegram
     * session are never in it.
     */
    public void backup(OutputStream out, boolean withIndex) throws Exception {
        JSONObject settings =
                new JSONObject()
                        .put("config", new JSONObject(config.toString()))
                        .put("trackNames", readJson(new File(home, "track-names.json")))
                        .put("mainChannel", readJson(new File(home, "main-channel.json")));
        JSONObject header =
                new JSONObject()
                        .put("format", IndexTransfer.BACKUP)
                        .put("version", IndexTransfer.VERSION)
                        .put("created", today())
                        .put("settings", settings);
        List<IndexTransfer.Section> sections = new ArrayList<>();
        if (withIndex && index.enabled)
            for (long chat : indexedChats()) sections.add(index.section(chat, title(chat)));
        IndexTransfer.write(out, header, sections, index::exportRows);
        status = Strings.t("Backup saved.");
    }

    /**
     * Restores a backup, or adds an index file someone shared: its settings replace these, and its
     * index is added to this one.
     */
    public void restore(InputStream in) throws Exception {
        IndexTransfer.Contents contents = IndexTransfer.read(in);
        JSONObject settings = contents.header.optJSONObject("settings");
        if (settings != null) {
            JSONObject restored = settings.optJSONObject("config");
            if (restored != null) {
                config = restored;
                applyConfig();
                saveConfig();
                remoteSearch.clear();
            }
            JSONObject trackNames = settings.optJSONObject("trackNames");
            if (trackNames != null) {
                writeJson(new File(home, "track-names.json"), trackNames);
                names.reload();
            }
            JSONObject main = settings.optJSONObject("mainChannel");
            if (main != null) {
                writeJson(new File(home, "main-channel.json"), main);
                mainChannel.reload();
            }
        }
        int files = 0;
        for (IndexTransfer.Section section : contents.sections)
            files += index.importSection(section);
        status =
                settings != null
                        ? Strings.f(
                                "Restored. {0} files added to the saved index.",
                                Strings.number(files))
                        : Strings.f("{0} files added to the saved index.", Strings.number(files));
    }

    /** A chat's saved index as a file in the app's cache, named for the chat. */
    File indexFile(long chat) throws Exception {
        if (!index.enabled)
            throw new IOException("Turn on Saved index first. The songs come from it.");
        if (index.count(chat) == 0) throw new IOException("There's no music in this chat yet.");
        File folder = new File(context.getCacheDir(), "shared-index");
        folder.mkdirs();
        File file = new File(folder, IndexTransfer.fileName(chat, today()));
        try (OutputStream out = new FileOutputStream(file)) {
            IndexTransfer.write(
                    out,
                    new JSONObject()
                            .put("format", IndexTransfer.INDEX)
                            .put("version", IndexTransfer.VERSION),
                    Collections.singletonList(index.section(chat, title(chat))),
                    index::exportRows);
        }
        return file;
    }

    /** Writes a chat's saved index to a file the user picked. */
    public void exportIndex(long chat, OutputStream out) throws Exception {
        File file = indexFile(chat);
        try (InputStream in = new FileInputStream(file)) {
            byte[] buffer = new byte[64 * 1024];
            int n;
            while ((n = in.read(buffer)) > 0) out.write(buffer, 0, n);
        }
        file.delete();
        status = Strings.t("Index file saved.");
    }

    /** Where a chat's index can be posted: {name, chat id}. */
    public List<Object[]> shareTargets(long chat) throws Exception {
        List<Object[]> targets = new ArrayList<>();
        long me = call(new TdApi.GetMe()).id;
        targets.add(
                new Object[] {
                    Strings.t("Saved Messages"), call(new TdApi.CreatePrivateChat(me, true)).id
                });
        if (mainChannel.main() != 0)
            targets.add(new Object[] {mainChannel.mainTitle(), mainChannel.main()});
        if (canPost(chat) && chat != mainChannel.main())
            targets.add(new Object[] {title(chat), chat});
        return targets;
    }

    /** Whether this account can post in a channel: its creator, or an admin allowed to post. */
    private boolean canPost(long chat) {
        try {
            TdApi.Chat c = call(new TdApi.GetChat(chat));
            if (!(c.type instanceof TdApi.ChatTypeSupergroup)) return false;
            TdApi.Supergroup group =
                    call(new TdApi.GetSupergroup(((TdApi.ChatTypeSupergroup) c.type).supergroupId));
            if (group.status instanceof TdApi.ChatMemberStatusCreator) return true;
            return group.status instanceof TdApi.ChatMemberStatusAdministrator
                    && ((TdApi.ChatMemberStatusAdministrator) group.status).rights.canPostMessages;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Posts a chat's saved index as a file. Anyone with the patch who can see it there, in that
     * chat itself, gets the index from it instead of reading the chat from Telegram.
     */
    public void shareIndex(long chat, long target) throws Exception {
        File file = indexFile(chat);
        TdApi.FormattedText caption =
                new TdApi.FormattedText(
                        Strings.f("BitChord saved index of {0}", title(chat)),
                        new TdApi.TextEntity[0]);
        call(
                new TdApi.SendMessage(
                        target,
                        null,
                        null,
                        null,
                        null,
                        new TdApi.InputMessageDocument(
                                new TdApi.InputDocument(
                                        new TdApi.InputFileLocal(file.getAbsolutePath()),
                                        null,
                                        true),
                                caption)),
                30000);
        status = Strings.f("Posted the index of {0}.", title(chat));
    }

    private String title(long chat) {
        try {
            return call(new TdApi.GetChat(chat)).title;
        } catch (Exception e) {
            return Long.toString(chat);
        }
    }

    /** Chats already looked in for a shared index this session, so each is looked in once. */
    private final Set<Long> sharedChecked = ConcurrentHashMap.newKeySet();

    /** No index file bigger than this is downloaded. */
    static final long MAX_SHARED_BYTES = 512L * 1024 * 1024;

    /**
     * Before a chat is read from Telegram the first time, looks for an index file of it: posted in
     * the chat itself (only its admins can post in a channel), in Saved Messages, or in the main
     * channel. The newest is added, and the chat is then only topped up.
     */
    private boolean importShared() {
        if (!useSharedIndexes || !index.enabled) return false;
        for (long chat : indexedChats()) {
            try {
                if (index.built(chat) || index.count(chat) > 0 || !sharedChecked.add(chat))
                    continue;
                List<Long> places = new ArrayList<>();
                places.add(chat);
                places.add(call(new TdApi.CreatePrivateChat(call(new TdApi.GetMe()).id, true)).id);
                if (mainChannel.main() != 0) places.add(mainChannel.main());
                TdApi.Document newest = null;
                long newestDate = 0;
                for (long place : places) {
                    TdApi.FoundChatMessages found =
                            call(
                                    new TdApi.SearchChatMessages(
                                            place,
                                            null,
                                            "bitchord-index",
                                            null,
                                            0,
                                            0,
                                            20,
                                            new TdApi.SearchMessagesFilterDocument()),
                                    15000);
                    if (found == null || found.messages == null) continue;
                    for (TdApi.Message m : found.messages) {
                        if (!(m.content instanceof TdApi.MessageDocument)) continue;
                        TdApi.Document d = ((TdApi.MessageDocument) m.content).document;
                        if (d == null
                                || !IndexTransfer.forChat(d.fileName, chat)
                                || d.document.size > MAX_SHARED_BYTES) continue;
                        if (m.date > newestDate) {
                            newest = d;
                            newestDate = m.date;
                        }
                    }
                }
                if (newest == null) continue;
                TdApi.File file =
                        call(new TdApi.DownloadFile(newest.document.id, 1, 0, 0, true), 600000);
                if (file.local == null || !file.local.isDownloadingCompleted) continue;
                int added = 0;
                try (InputStream in = new FileInputStream(file.local.path)) {
                    for (IndexTransfer.Section section : IndexTransfer.read(in).sections)
                        if (section.chat == chat) added += index.importSection(section);
                }
                HostLog.d(
                        "Unofficial Telegram used a shared index for chat "
                                + chat
                                + ": "
                                + added
                                + " files");
                return true;
            } catch (LiveSearch.RateLimited e) {
                sharedChecked.remove(chat);
                return false;
            } catch (Exception e) {
                HostLog.d("Unofficial Telegram couldn't use a shared index: " + e.getMessage());
            }
        }
        return false;
    }

    private void startClient() throws Exception {
        final long current = ++generation;
        remoteSearch.clear();
        sponsorship.clear(current);
        mediaRevision++;
        final CompletableFuture<Void> closed = new CompletableFuture<>();
        clientClosed = closed;
        auth = null;
        paramsSent = false;
        appliedCredentials = ApplicationCredentials.empty();
        restarting = false;
        sessionTag = UUID.randomUUID().toString();
        registerSource();
        client =
                Client.create(
                        object -> {
                            if (object instanceof TdApi.UpdateAuthorizationState
                                    && ((TdApi.UpdateAuthorizationState) object).authorizationState
                                            instanceof TdApi.AuthorizationStateClosed)
                                closed.complete(null);
                            if (current == generation) update(object);
                        },
                        e -> error = "Telegram update failed",
                        e -> error = "Telegram callback failed");
        work.execute(
                () -> {
                    if (current == generation) configure();
                });
    }

    public ApplicationCredentials credentials() {
        return credentials;
    }

    public void saveCredentials(String id, String hash) throws Exception {
        ApplicationCredentials next = ApplicationCredentials.parse(id, hash);
        if (audio.active())
            throw new IOException("Stop playback before changing the application configuration.");
        boolean reconnect = paramsSent && !appliedCredentials.sameAs(next);
        credentialStore.save(next);
        credentials = next;
        error = "";
        if (reconnect) {
            restarting = true;
            status = "Reconnecting Telegram…";
            try {
                CompletableFuture<Void> closed = clientClosed;
                call(new TdApi.Close());
                closed.get(40, TimeUnit.SECONDS);
                startClient();
            } finally {
                restarting = false;
            }
        } else if (auth instanceof TdApi.AuthorizationStateClosed) startClient();
        else configure();
    }

    private void update(TdApi.Object obj) {
        if (obj instanceof TdApi.UpdateAuthorizationState) {
            auth = ((TdApi.UpdateAuthorizationState) obj).authorizationState;
            if (auth instanceof TdApi.AuthorizationStateWaitTdlibParameters) {
                status =
                        credentials.configured()
                                ? "Connecting to Telegram…"
                                : "Add your application credentials to connect.";
                work.execute(this::configure);
            } else if (auth instanceof TdApi.AuthorizationStateReady) {
                status = "Telegram connected. Select music chats, then search in BitChord.";
                setForeground(foreground);
            } else if (auth instanceof TdApi.AuthorizationStateClosed) {
                status = "Telegram session closed. Restart BitChord to connect again.";
            } else status = auth.getClass().getSimpleName().replace("AuthorizationState", "");
        } else if (obj instanceof TdApi.UpdateChatHasProtectedContent
                || obj instanceof TdApi.UpdateMessageContent
                || obj instanceof TdApi.UpdateDeleteMessages) {
            mediaRevision++;
            remoteSearch.clear();
        } else if (obj instanceof TdApi.UpdateChatFolders) {
            TdApi.ChatFolderInfo[] list = ((TdApi.UpdateChatFolders) obj).chatFolders;
            folders = list == null ? new TdApi.ChatFolderInfo[0] : list;
        } else if (obj instanceof TdApi.UpdateAccentColors) {
            accentColors.clear();
            TdApi.AccentColor[] colors = ((TdApi.UpdateAccentColors) obj).colors;
            if (colors != null)
                for (TdApi.AccentColor color : colors) accentColors.put(color.id, color);
        }
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private TdApi.Object callAny(TdApi.Function<?> request) throws Exception {
        return call((TdApi.Function) request);
    }

    void setForeground(boolean value) {
        foreground = value;
        Client target = client;
        if (target != null && ready())
            target.send(new TdApi.SetOption("online", new TdApi.OptionValueBoolean(value)), null);
    }

    public String url() {
        return InternalAddon.ORIGIN + sessionTag;
    }

    public boolean ready() {
        return !restarting && auth instanceof TdApi.AuthorizationStateReady;
    }

    public void configure() {
        if (client == null) return;
        if (!(auth instanceof TdApi.AuthorizationStateWaitTdlibParameters) || paramsSent) return;
        if (!credentials.configured()) {
            status = "Add your application credentials to connect.";
            return;
        }
        try {
            ApplicationCredentials applying = credentials;
            paramsSent = true;
            File db = new File(home, "db"), files = new File(home, "files");
            call(
                    new TdApi.SetTdlibParameters(
                            false,
                            db.getAbsolutePath(),
                            files.getAbsolutePath(),
                            databaseKey(),
                            true,
                            true,
                            true,
                            false,
                            applying.apiId,
                            applying.apiHash,
                            Locale.getDefault().toLanguageTag(),
                            Build.MODEL,
                            Build.VERSION.RELEASE,
                            "1.0.20"));
            appliedCredentials = applying;
            error = "";
        } catch (Exception e) {
            paramsSent = false;
            fail(e);
        }
    }

    static final class TelegramFailure extends IOException {
        final int code;

        TelegramFailure(TdApi.Error error) {
            super("Telegram " + error.code + ": " + error.message);
            code = error.code;
        }
    }

    public <T extends TdApi.Object> T call(TdApi.Function<T> fn) throws Exception {
        return call(fn, 40000);
    }

    <T extends TdApi.Object> T call(TdApi.Function<T> fn, long timeoutMillis) throws Exception {
        Client target = client;
        if (target == null) throw new IOException("Telegram is starting. Try again shortly.");
        CompletableFuture<T> future = new CompletableFuture<>();
        target.send(
                fn,
                obj -> {
                    if (obj instanceof TdApi.Error)
                        future.completeExceptionally(new TelegramFailure((TdApi.Error) obj));
                    else {
                        @SuppressWarnings("unchecked")
                        T result = (T) obj;
                        future.complete(result);
                    }
                });
        try {
            return future.get(Math.max(1, timeoutMillis), TimeUnit.MILLISECONDS);
        } catch (ExecutionException e) {
            Throwable cause = e.getCause();
            if (cause instanceof Exception) throw (Exception) cause;
            throw new IOException("Telegram request failed.");
        }
    }

    public void submit(String text) throws Exception {
        error = "";
        if (auth instanceof TdApi.AuthorizationStateWaitPhoneNumber)
            call(new TdApi.SetAuthenticationPhoneNumber(text.trim(), null));
        else if (auth instanceof TdApi.AuthorizationStateWaitCode)
            call(new TdApi.CheckAuthenticationCode(text.trim()));
        else if (auth instanceof TdApi.AuthorizationStateWaitPassword)
            call(new TdApi.CheckAuthenticationPassword(text));
        else if (auth instanceof TdApi.AuthorizationStateWaitEmailAddress)
            call(new TdApi.SetAuthenticationEmailAddress(text.trim()));
        else if (auth instanceof TdApi.AuthorizationStateWaitEmailCode)
            call(
                    new TdApi.CheckAuthenticationEmailCode(
                            new TdApi.EmailAddressAuthenticationCode(text.trim())));
        else
            throw new IOException(
                    "This login step isn't supported here. Sign in with an existing Telegram"
                            + " account.");
    }

    /** The account's chat folders, as Telegram last sent them. */
    private volatile TdApi.ChatFolderInfo[] folders = new TdApi.ChatFolderInfo[0];

    /** At most this many chats are read from one list. */
    static final int MAX_CHATS = 2000;

    /** Every chat: the main list, then archived chats. Folders only hold chats from these two. */
    public List<TdApi.Chat> chats() throws Exception {
        requireReady();
        Map<Long, TdApi.Chat> chats = new LinkedHashMap<>();
        for (TdApi.ChatList list :
                new TdApi.ChatList[] {new TdApi.ChatListMain(), new TdApi.ChatListArchive()})
            for (TdApi.Chat chat : chats(list)) chats.putIfAbsent(chat.id, chat);
        return new ArrayList<>(chats.values());
    }

    /** The chats of one list, all of them rather than the first page. */
    List<TdApi.Chat> chats(TdApi.ChatList list) throws Exception {
        requireReady();
        // Telegram sends a list a page at a time; it answers 404 once there's no more.
        for (int page = 0; page < MAX_CHATS / 100; page++)
            try {
                call(new TdApi.LoadChats(list, 100));
            } catch (IOException e) {
                if (!e.getMessage().contains("404")) throw e;
                break;
            }
        long[] ids = call(new TdApi.GetChats(list, MAX_CHATS)).chatIds;
        List<TdApi.Chat> chats = new ArrayList<>();
        for (long id : ids) {
            TdApi.Chat chat = call(new TdApi.GetChat(id));
            if (MediaPolicy.chatAllowed(chat)) chats.add(chat);
        }
        return chats;
    }

    /**
     * Where music chats can be picked from: all chats, each of the account's folders, and archived
     * chats. Each is {name, list}.
     */
    public List<Object[]> chatLists() {
        List<Object[]> lists = new ArrayList<>();
        lists.add(new Object[] {Strings.t("All chats"), null});
        for (TdApi.ChatFolderInfo folder : folders) {
            String name =
                    folder.name != null && folder.name.text != null ? folder.name.text.text : "";
            lists.add(
                    new Object[] {
                        name.isEmpty() ? Strings.t("Folder") : name,
                        new TdApi.ChatListFolder(folder.id)
                    });
        }
        lists.add(new Object[] {Strings.t("Archived chats"), new TdApi.ChatListArchive()});
        return lists;
    }

    public void addChat(String text) throws Exception {
        requireReady();
        TdApi.Chat chat;
        if (text.trim().matches("-?[0-9]+"))
            chat = call(new TdApi.GetChat(Long.parseLong(text.trim())));
        else chat = call(new TdApi.SearchPublicChat(text.trim().replaceFirst("^@", "")));
        if (!MediaPolicy.chatAllowed(chat))
            throw new IOException(
                    "Protected content and secret chats are not supported by this cached audio"
                            + " player.");
        selected.add(chat.id);
        remoteSearch.clear();
        saveConfig();
        status = Strings.f("Selected {0}. Search in BitChord → Addons.", chat.title);
    }

    public void toggle(long id, boolean checked) throws Exception {
        if (checked) selected.add(id);
        else selected.remove(id);
        remoteSearch.clear();
        saveConfig();
    }

    public void selectChats(List<TdApi.Chat> chats, boolean[] checked) throws Exception {
        for (int i = 0; i < chats.size(); i++) {
            long id = chats.get(i).id;
            if (checked[i]) selected.add(id);
            else selected.remove(id);
        }
        remoteSearch.clear();
        saveConfig();
        status =
                Strings.f(
                        "Selected {0} music chats. Search in BitChord → Addons.", selected.size());
    }

    public List<JSONObject> searchTracks(String query) throws Exception {
        return searchTracks(query, false);
    }

    /** As above; a background search gives way to BitChord's own lookups. */
    public List<JSONObject> searchTracks(String query, boolean background) throws Exception {
        requireReady();
        long session = generation;
        LiveSearch.Result found = search(query, session, background);
        requireReady();
        if (session != generation) throw new IOException("Telegram session changed. Search again.");
        List<JSONObject> rows = present(found.tracks);
        if (useTrackNames)
            rows =
                    names.merge(
                            rows,
                            query,
                            id -> {
                                try {
                                    return resolveTrack(id);
                                } catch (Exception e) {
                                    return null;
                                }
                            });
        if (session != generation) throw new IOException("Telegram session changed. Search again.");
        if (hideUnplayable) rows = DolbySupport.playable(rows, formats::get);
        if (hideDuplicates) rows = Duplicates.best(rows, formats::get);
        error = found.warning;
        status =
                Strings.f(rows.size() == 1 ? "Found {0} track." : "Found {0} tracks.", rows.size());
        return rows;
    }

    /**
     * Searches the index first and Telegram second, and falls back to the index when Telegram can't
     * answer: rate limited, busy or timed out.
     */
    private LiveSearch.Result search(String query, long session, boolean background)
            throws Exception {
        Set<Long> chats = new HashSet<>(selected);
        // Once every selected chat is indexed, the index answers without asking Telegram. A
        // background search takes its answer even when it's empty; anything else asks Telegram
        // when the index has nothing, in case the file was posted since the last top-up.
        List<JSONObject> indexed = index.search(chats, query, true);
        if (indexed != null && (background || !indexed.isEmpty()))
            return new LiveSearch.Result(indexed, "");
        LiveSearch.Result found;
        try {
            found = remoteSearch.search(chats, query, session, background);
        } catch (Exception e) {
            if (background) throw e;
            List<JSONObject> saved = index.search(chats, query, false);
            if (saved == null) throw e;
            HostLog.d(
                    "Unofficial Telegram search '"
                            + query
                            + "' failed ("
                            + e.getMessage()
                            + "); answered from the saved index with "
                            + saved.size()
                            + (saved.size() == 1 ? " file" : " files"));
            return new LiveSearch.Result(saved, "");
        }
        if (background || !found.tracks.isEmpty()) return found;
        // Nothing found. Telegram matches whole words, so a file it has can still be missed, as
        // "You're" is for BitChord's "youre": try the saved index, then Telegram without those
        // words.
        List<JSONObject> saved = index.search(chats, query, false);
        if (saved != null && !saved.isEmpty()) {
            HostLog.d(
                    "Unofficial Telegram search '"
                            + query
                            + "' found nothing on Telegram; the saved index has "
                            + saved.size()
                            + (saved.size() == 1 ? " file" : " files"));
            return new LiveSearch.Result(saved, "");
        }
        String relaxed = TelegramIndex.withoutContractions(query);
        if (relaxed == null) return found;
        List<String> wanted = TrackNames.words(query);
        List<JSONObject> kept = new ArrayList<>();
        LiveSearch.Result again = remoteSearch.search(chats, relaxed, session, false);
        for (JSONObject row : again.tracks) if (TelegramIndex.matches(row, wanted)) kept.add(row);
        HostLog.d(
                "Unofficial Telegram search '"
                        + query
                        + "' found nothing; searched again as '"
                        + relaxed
                        + "' and kept "
                        + kept.size()
                        + (kept.size() == 1 ? " file" : " files"));
        return new LiveSearch.Result(kept, again.warning);
    }

    /** At most this many of a chat's newest files go into a playlist or a download. */
    static final int COLLECTION_LIMIT = 1000;

    /**
     * A selected chat's newest music files, up to {@link #COLLECTION_LIMIT}, oldest post first,
     * from the saved index and named the way search shows them.
     */
    public List<JSONObject> channelTracks(long chat) throws Exception {
        if (!index.enabled)
            throw new IOException("Turn on Saved index first. The songs come from it.");
        List<JSONObject> rows = index.newest(chat, COLLECTION_LIMIT);
        if (rows == null)
            throw new IOException(
                    "This chat is still being indexed. Try again when Saved index says it's done.");
        List<JSONObject> named = new ArrayList<>();
        for (JSONObject row : present(rows)) named.add(useTrackNames ? names.apply(row) : row);
        if (named.isEmpty()) throw new IOException("There's no music in this chat yet.");
        return named;
    }

    /**
     * What a playlist or download of a chat would hold, for the menu: "newest 1,000 of 223,776
     * songs" and the download size.
     */
    public String[] collectionSummary(long chat) throws Exception {
        List<JSONObject> rows = channelTracks(chat);
        int all = index.count(chat);
        long bytes = 0;
        for (JSONObject row : rows) bytes += Math.max(0, row.optLong("size"));
        String songs =
                rows.size() < all
                        ? Strings.f(
                                "newest {0} of {1} songs",
                                Strings.number(rows.size()), Strings.number(all))
                        : Strings.f(
                                rows.size() == 1 ? "{0} song" : "{0} songs",
                                Strings.number(rows.size()));
        return new String[] {songs, TrackDetails.size(bytes)};
    }

    /**
     * Saves a chat's music as a playlist in BitChord's Library, named after the chat. Saving again
     * replaces the playlist with the chat's current files.
     */
    public void saveChannelPlaylist(long chat, String title) throws Exception {
        savePlaylist(Long.toString(chat), title, channelTracks(chat));
    }

    /**
     * Saves songs as a playlist in BitChord's Library. Saving under the same key again replaces
     * that playlist.
     */
    private void savePlaylist(String key, String title, List<JSONObject> tracks) throws Exception {
        List<Object> songs = HostLibrary.songs(tracks, showArtwork ? artwork : null);
        JSONObject saved = config.optJSONObject("playlists");
        if (saved == null) saved = new JSONObject();
        String id = HostLibrary.savePlaylist(title, songs, saved.optString(key, null));
        saved.put(key, id);
        config.put("playlists", saved);
        saveConfig();
        status =
                Strings.f(
                        songs.size() == 1
                                ? "Saved {0} song as the playlist “{1}” in BitChord’s Library."
                                : "Saved {0} songs as the playlist “{1}” in BitChord’s Library.",
                        Strings.number(songs.size()),
                        title);
    }

    /** Queues a chat's newest music files in BitChord's downloads. */
    public void downloadChannel(long chat, String title) throws Exception {
        download(title, channelTracks(chat));
    }

    /** A chat's albums, newest first, from its newest files in the saved index. */
    public List<JSONObject> albums(long chat) throws Exception {
        if (!index.enabled)
            throw new IOException("Turn on Saved index first. The songs come from it.");
        List<JSONObject> albums =
                AlbumList.albums(index.before(chat, Long.MAX_VALUE, AlbumList.LOOK_AT));
        if (albums.isEmpty()) throw new IOException("No albums found in this chat yet.");
        return albums;
    }

    /** An album's songs as search shows them. */
    private List<JSONObject> albumTracks(JSONObject album) throws Exception {
        List<JSONObject> rows = new ArrayList<>();
        org.json.JSONArray songs = album.getJSONArray("songs");
        for (int i = 0; i < songs.length(); i++) rows.add(songs.getJSONObject(i));
        List<JSONObject> named = new ArrayList<>();
        for (JSONObject row : present(rows)) named.add(useTrackNames ? names.apply(row) : row);
        if (named.isEmpty()) throw new IOException("There's no music in this chat yet.");
        return named;
    }

    public void saveAlbumPlaylist(long chat, JSONObject album) throws Exception {
        savePlaylist(
                chat + ":" + album.getString("key"), album.getString("title"), albumTracks(album));
    }

    public void downloadAlbum(JSONObject album) throws Exception {
        download(album.getString("title"), albumTracks(album));
    }

    private void download(String title, List<JSONObject> tracks) throws Exception {
        List<Object> songs = HostLibrary.songs(tracks, showArtwork ? artwork : null);
        HostLibrary.download(context, songs, title);
        status =
                Strings.f(
                        songs.size() == 1
                                ? "Queued {0} song from {1} in BitChord’s downloads."
                                : "Queued {0} songs from {1} in BitChord’s downloads.",
                        Strings.number(songs.size()),
                        title);
    }

    /**
     * The saved index's database. 1.0.6 and 1.0.7 kept it as JSON files in "index", which a large
     * channel outgrows; those are deleted and the chats are indexed again.
     */
    private IndexStore openIndex() {
        File[] old = new File(home, "index").listFiles();
        if (old != null) for (File f : old) f.delete();
        new File(home, "index").delete();
        try {
            return new SqliteIndexStore(new File(home, "index.db"));
        } catch (RuntimeException e) {
            HostLog.d("Unofficial Telegram index couldn't be opened: " + e.getMessage());
            savedIndexBroken = true;
            return new IndexStore.Memory();
        }
    }

    private boolean savedIndexBroken;

    /**
     * The pause between index pages. It shortens while Telegram answers without asking for a pause,
     * down to {@link #FASTEST_PACE}, and doubles when Telegram asks for one.
     */
    private long pace = TelegramIndex.PACE_MILLIS;

    static final long FASTEST_PACE = 700, SLOWEST_PACE = 8000;

    /** Builds and tops up the index a page at a time while nothing else is searching. */
    private void runIndex() {
        while (true) {
            long wait = pace;
            try {
                if (!ready() || !index.enabled) wait = 5000;
                else if (!indexPause().isEmpty()) wait = 30000;
                else if (!remoteSearch.idle()) wait = 1000;
                else if (importShared()) wait = 1000;
                else if (!index.step(indexedChats(), mainChannel.main())) wait = 60000;
                else pace = Math.max(FASTEST_PACE, pace * 9 / 10);
            } catch (LiveSearch.RateLimited e) {
                pace = Math.min(SLOWEST_PACE, pace * 2);
                wait = 1000L * e.retrySeconds + 1000;
            } catch (Exception e) {
                wait = 30000;
            }
            try {
                Thread.sleep(wait);
            } catch (InterruptedException e) {
                return;
            }
        }
    }

    /**
     * Bytes of a Telegram file, downloading only that part: how zips are looked into without
     * downloading them.
     */
    byte[] readRange(int file, long offset, int length) throws Exception {
        TdApi.File info = call(new TdApi.GetFile(file), 15000);
        if (offset < 0 || offset >= info.size) return new byte[0];
        int wanted = (int) Math.min(length, info.size - offset);
        long deadline = System.currentTimeMillis() + 60000;
        long have = call(new TdApi.GetFileDownloadedPrefixSize(file, offset), 15000).size;
        if (have < wanted) {
            call(new TdApi.DownloadFile(file, 1, offset, wanted, false), 15000);
            while ((have = call(new TdApi.GetFileDownloadedPrefixSize(file, offset), 15000).size)
                    < wanted) {
                if (System.currentTimeMillis() > deadline)
                    throw new IOException("Telegram download timed out");
                Thread.sleep(100);
            }
        }
        String path = call(new TdApi.GetFile(file), 15000).local.path;
        byte[] out = new byte[wanted];
        try (RandomAccessFile input = new RandomAccessFile(path, "r")) {
            input.seek(offset);
            input.readFully(out);
        }
        return out;
    }

    /**
     * The music chats and your main channel, once you've chosen one, and while copying, the
     * community channels too.
     */
    Set<Long> indexedChats() {
        Set<Long> chats = new HashSet<>(selected);
        if (mainChannel.main() != 0) chats.add(mainChannel.main());
        if (mainChannel.option("import")) chats.addAll(mainChannel.indexed());
        return chats;
    }

    /** Copies into the main channel at its own pace while the import is on. */
    private void runImport() {
        while (true) {
            long wait = 60000;
            try {
                if (ready()) wait = mainChannel.step(index);
            } catch (LiveSearch.RateLimited e) {
                showRateLimit(e.retrySeconds);
                wait = 1000L * e.retrySeconds + 5000;
            } catch (Exception e) {
                HostLog.d("Unofficial Telegram import stopped for a while: " + e.getMessage());
                wait = 120000;
            }
            try {
                Thread.sleep(Math.max(1000, wait));
            } catch (InterruptedException e) {
                return;
            }
        }
    }

    /** Checks lossless files and names untagged ones, one file at a time. */
    private void runChecks() {
        while (true) {
            long wait;
            try {
                wait = checks.step();
            } catch (RuntimeException e) {
                wait = 60000;
            }
            try {
                Thread.sleep(Math.max(1000, wait));
            } catch (InterruptedException e) {
                return;
            }
        }
    }

    /**
     * "checkLossless" (songs that play), "checkInBackground" (every lossless file in the chats) or
     * "recognizeUntagged" (files without tags, by sound, with AcoustID).
     */
    public boolean checkOption(String name) {
        switch (name) {
            case "checkLossless":
                return checks.checkLossless;
            case "checkInBackground":
                return checks.checkInBackground;
            default:
                return checks.recognize;
        }
    }

    public void setCheckOption(String name, boolean on) throws Exception {
        if (name.equals("recognizeUntagged") && on && !FileChecks.validKey(checks.key()))
            throw new IOException("Enter your AcoustID application key first.");
        switch (name) {
            case "checkLossless":
                checks.checkLossless = on;
                LosslessCheck.enabled = on;
                break;
            case "checkInBackground":
                checks.checkInBackground = on;
                break;
            default:
                checks.recognize = on;
        }
        config.put(name, on);
        saveConfig();
    }

    public String acoustIdKey() {
        return checks.key();
    }

    public void setAcoustIdKey(String key) throws Exception {
        checks.setKey(key);
        if (key == null || key.trim().isEmpty()) setCheckOption("recognizeUntagged", false);
    }

    /** "Checked 1,234 files · 56 not really lossless · 12 named by sound", or "". */
    public String checkStatus() {
        return checks.status();
    }

    /**
     * Private channels this account created: the only ones that can be the main channel. Telegram
     * says who created a channel in the account's own membership of it: "creator" is only ever the
     * person who made it (or was handed ownership), not an admin. A channel with a public
     *
     * @username isn't private.
     */
    public List<TdApi.Chat> ownedPrivateChannels() throws Exception {
        List<TdApi.Chat> owned = new ArrayList<>();
        for (TdApi.Chat chat : chats()) if (ownChannel(chat) == Boolean.FALSE) owned.add(chat);
        return owned;
    }

    /** Null when the chat isn't a channel this account created; otherwise whether it's public. */
    private Boolean ownChannel(TdApi.Chat chat) throws Exception {
        if (!(chat.type instanceof TdApi.ChatTypeSupergroup)) return null;
        TdApi.ChatTypeSupergroup type = (TdApi.ChatTypeSupergroup) chat.type;
        if (!type.isChannel) return null;
        TdApi.Supergroup group = call(new TdApi.GetSupergroup(type.supergroupId));
        if (!(group.status instanceof TdApi.ChatMemberStatusCreator)) return null;
        return group.usernames != null
                && group.usernames.activeUsernames != null
                && group.usernames.activeUsernames.length > 0;
    }

    /**
     * Chats that can be imported from: channels, groups and bots that aren't protected, other than
     * a private channel of your own, which is where copies go rather than where they come from.
     * Chats with a person aren't offered.
     */
    public List<TdApi.Chat> communityChoices() throws Exception {
        List<TdApi.Chat> chats = new ArrayList<>();
        for (TdApi.Chat chat : chats())
            if (chat.id != mainChannel.main()
                    && MediaPolicy.communityAllowed(chat, isBot(chat))
                    && ownChannel(chat) != Boolean.FALSE) chats.add(chat);
        return chats;
    }

    /** Whether a chat is one with a bot. */
    private boolean isBot(TdApi.Chat chat) throws Exception {
        if (!(chat.type instanceof TdApi.ChatTypePrivate)) return false;
        TdApi.User user = call(new TdApi.GetUser(((TdApi.ChatTypePrivate) chat.type).userId));
        return user.type instanceof TdApi.UserTypeBot;
    }

    public void setMainChannel(TdApi.Chat chat) throws Exception {
        mainChannel.setMain(chat.id, chat.title);
        List<Long> community = mainChannel.community();
        community.remove(chat.id);
        mainChannel.setCommunity(community);
    }

    public void setCommunity(List<TdApi.Chat> chats, boolean[] checked) throws Exception {
        List<Long> ids = new ArrayList<>();
        for (int i = 0; i < chats.size(); i++) if (checked[i]) ids.add(chats.get(i).id);
        mainChannel.setCommunity(ids);
    }

    public boolean importOption(String name) {
        return mainChannel.option(name);
    }

    public void setImportOption(String name, boolean on) throws Exception {
        if (name.equals("import") && on) {
            if (mainChannel.main() == 0) throw new IOException("Choose your main channel first.");
            if (mainChannel.community().isEmpty())
                throw new IOException("Choose at least one community channel first.");
            if (!index.enabled)
                throw new IOException("Turn on Saved index first. The files to copy come from it.");
        }
        mainChannel.setOption(name, on);
    }

    public int importPerHour() {
        return mainChannel.perHour();
    }

    public void setImportPerHour(int files) throws Exception {
        mainChannel.setPerHour(files);
    }

    public String importStatus() {
        return mainChannel.status;
    }

    public boolean hideUnplayableDolby() {
        return hideUnplayable;
    }

    public void setHideUnplayableDolby(boolean on) throws Exception {
        hideUnplayable = on;
        config.put("hideUnplayableDolby", on);
        saveConfig();
    }

    public boolean hideDuplicates() {
        return hideDuplicates;
    }

    public void setHideDuplicates(boolean on) throws Exception {
        hideDuplicates = on;
        config.put("hideDuplicates", on);
        saveConfig();
    }

    public boolean soundCheck() {
        return SoundCheck.active != null;
    }

    public void setSoundCheck(boolean on) throws Exception {
        SoundCheck.active = on ? soundCheck : null;
        config.put("soundCheck", on);
        saveConfig();
    }

    public boolean searchIndex() {
        return index.enabled;
    }

    /** Why indexing is paused for now ("Waiting for Wi-Fi"), or "" when it can go on. */
    String indexPause() {
        try {
            if (indexWifiOnly) {
                android.net.ConnectivityManager connectivity =
                        (android.net.ConnectivityManager)
                                context.getSystemService(Context.CONNECTIVITY_SERVICE);
                android.net.NetworkCapabilities network =
                        connectivity.getNetworkCapabilities(connectivity.getActiveNetwork());
                if (network == null
                        || !network.hasCapability(
                                android.net.NetworkCapabilities.NET_CAPABILITY_NOT_METERED))
                    return Strings.t("Paused until this phone is on Wi-Fi");
            }
            if (indexChargingOnly) {
                Intent battery =
                        context.registerReceiver(
                                null,
                                new android.content.IntentFilter(Intent.ACTION_BATTERY_CHANGED));
                if (battery == null
                        || battery.getIntExtra(android.os.BatteryManager.EXTRA_PLUGGED, 0) == 0)
                    return Strings.t("Paused until this phone is charging");
            }
        } catch (RuntimeException e) {
            // Can't tell: go on indexing.
        }
        return "";
    }

    public boolean indexOption(String name) {
        return name.equals("wifi") ? indexWifiOnly : indexChargingOnly;
    }

    public void setIndexOption(String name, boolean on) throws Exception {
        if (name.equals("wifi")) indexWifiOnly = on;
        else indexChargingOnly = on;
        config.put(name.equals("wifi") ? "indexWifiOnly" : "indexChargingOnly", on);
        saveConfig();
    }

    public String indexStatus() {
        try {
            String paused = indexPause();
            if (!paused.isEmpty() && !index.allBuilt(indexedChats()))
                return paused + " · " + index.status(indexedChats());
            return index.status(indexedChats());
        } catch (Exception e) {
            return "The index can't be read right now";
        }
    }

    public void setSearchIndex(boolean on) throws Exception {
        if (on && savedIndexBroken)
            throw new IOException("The index's database couldn't be opened on this phone.");
        index.enabled = on;
        if (!on) index.clear();
        config.put("searchIndex", on);
        saveConfig();
    }

    /** Rows from the selected chats, as copies, with names from file names if that's on. */
    private List<JSONObject> present(List<JSONObject> found) throws Exception {
        List<JSONObject> rows = new ArrayList<>();
        for (JSONObject row : found)
            if (selected.contains(row.getLong("chat"))) {
                // What a check or a recognition found, for files Telegram's own search returned.
                JSONObject known = index.withFound(new JSONObject(row.toString()));
                rows.add(namesFromFiles ? TrackDetails.withFileName(known) : known);
            }
        return rows;
    }

    /**
     * Adds album covers and lossless format details to search results, waiting up to a second for
     * ones that aren't known yet. The rest arrive in the background for later searches.
     */
    void decorate(List<JSONObject> rows) {
        Client target = client;
        if (target == null) return;
        long started = System.currentTimeMillis();
        java.util.concurrent.CountDownLatch probes =
                formatLegend() || reportQuality
                        ? formats.probe(rows, (file, done) -> probe(target, file, done), 8)
                        : new java.util.concurrent.CountDownLatch(0);
        if (showArtwork)
            try {
                artwork.fill(
                        rows,
                        (file, done) ->
                                target.send(
                                        new TdApi.DownloadFile(file, 4, 0, 0, true),
                                        result -> {
                                            TdApi.File local =
                                                    result instanceof TdApi.File
                                                            ? (TdApi.File) result
                                                            : null;
                                            done.finished(
                                                    local != null
                                                                    && local.local != null
                                                                    && local.local
                                                                            .isDownloadingCompleted
                                                            ? local.local.path
                                                            : null);
                                        }),
                        1000);
            } catch (Exception ignored) {
                // Covers are optional; a search without them is still a good search.
            }
        FormatProbe.await(probes, 1000 - (System.currentTimeMillis() - started));
        try {
            formats.annotate(rows);
            boolean changed = false;
            for (JSONObject row : rows)
                changed |=
                        legends.put(
                                FormatLegend.TELEGRAM + row.optString("id"),
                                LegendMatch.row(row, formats.get(row.optString("id"))));
            if (changed) {
                legends.save();
                FormatLegend.changed();
            }
        } catch (Exception ignored) {
            // Details are optional.
        }
    }

    /** Downloads just the start of an audio file and hands over its path for header reading. */
    private static void probe(Client target, int file, Artwork.Done done) {
        target.send(
                new TdApi.DownloadFile(file, 2, 0, FormatProbe.HEAD_BYTES, true),
                result -> {
                    TdApi.File local = result instanceof TdApi.File ? (TdApi.File) result : null;
                    done.finished(
                            local != null
                                            && local.local != null
                                            && local.local.path != null
                                            && !local.local.path.isEmpty()
                                            && local.local.downloadedPrefixSize >= 64
                                    ? local.local.path
                                    : null);
                });
    }

    /** Reads a track's header in the background if it isn't known yet. */
    void probeLater(JSONObject row) {
        Client target = client;
        if (target != null && (formatLegend() || reportQuality))
            formats.probe(
                    java.util.Collections.singletonList(row),
                    (file, done) -> probe(target, file, done),
                    1);
    }

    public boolean formatLegend() {
        return FormatLegend.enabled;
    }

    public void setFormatLegend(boolean on) throws Exception {
        FormatLegend.enabled = on;
        config.put("formatLegend", on);
        saveConfig();
    }

    public boolean reportQuality() {
        return reportQuality;
    }

    public void setReportQuality(boolean on) throws Exception {
        reportQuality = on;
        config.put("reportQuality", on);
        saveConfig();
    }

    public boolean showArtwork() {
        return showArtwork;
    }

    public void setShowArtwork(boolean on) throws Exception {
        showArtwork = on;
        config.put("showArtwork", on);
        saveConfig();
        if (!on) artwork.clear();
    }

    public boolean surroundAsStereo() {
        return Downmix.enabled;
    }

    public void setSurroundAsStereo(boolean on) throws Exception {
        Downmix.enabled = on;
        config.put("surroundAsStereo", on);
        saveConfig();
    }

    public boolean smoothUpgrades() {
        return SmoothUpgrade.enabled;
    }

    public void setSmoothUpgrades(boolean on) throws Exception {
        SmoothUpgrade.enabled = on;
        config.put("smoothUpgrades", on);
        saveConfig();
    }

    public boolean namesFromFiles() {
        return namesFromFiles;
    }

    public void setNamesFromFiles(boolean on) throws Exception {
        namesFromFiles = on;
        config.put("namesFromFiles", on);
        saveConfig();
    }

    public boolean useTrackNames() {
        return useTrackNames;
    }

    public void setUseTrackNames(boolean on) throws Exception {
        useTrackNames = on;
        config.put("useTrackNames", on);
        saveConfig();
    }

    public boolean suggestTrackNames() {
        return suggestTrackNames;
    }

    public void setSuggestTrackNames(boolean on) throws Exception {
        suggestTrackNames = on;
        config.put("suggestTrackNames", on);
        saveConfig();
    }

    /**
     * A song started playing from a source other than Telegram. Looks in the selected chats for a
     * file by the same artist whose title is a near miss, and records it as a suggestion. Runs in
     * the background, once per song per session, at most every 20 seconds.
     */
    void heard(String title, String artist, long durationMs, String mediaId) {
        if (useTrackNames || suggestTrackNames)
            recordWork.execute(
                    () -> {
                        try {
                            names.played(mediaId, title, artist, (int) (durationMs / 1000));
                        } catch (Exception ignored) {
                            // Only used to find a saved copy later; losing one entry is harmless.
                        }
                    });
        String key = TrackNames.clean(title) + "|" + TrackNames.clean(artist);
        if (!suggestTrackNames
                || !ready()
                || selected.isEmpty()
                || key.startsWith("|")
                || key.endsWith("|")) return;
        synchronized (heard) {
            if (heard.put(key, true) != null) return;
            while (heard.size() > 256) heard.remove(heard.keySet().iterator().next());
        }
        final long session = generation;
        suggestionWork.execute(
                () -> {
                    try {
                        long wait = lastSuggestionSearch + 20000 - System.currentTimeMillis();
                        if (wait > 0) Thread.sleep(wait);
                        if (session != generation || !ready() || !suggestTrackNames) return;
                        lastSuggestionSearch = System.currentTimeMillis();
                        LiveSearch.Result found =
                                search(TrackNames.primaryArtist(artist), session, true);
                        if (session != generation) return;
                        List<JSONObject> rows = present(found.tracks);
                        int added = names.consider(title, artist, (int) (durationMs / 1000), rows);
                        if (added > 0)
                            status =
                                    "A Telegram file may be misnamed. Review it under Track"
                                            + " names.";
                    } catch (Exception ignored) {
                        // A suggestion is optional; a failed or rate-limited search just skips it.
                    }
                });
    }

    /** Saves a corrected name and removes BitChord's saved copy of that song, if any. */
    public void rename(JSONObject row, String title, String artist) throws Exception {
        names.correct(row, title, artist);
        forgetSavedCopies(title, artist);
    }

    public void acceptSuggestion(String id) throws Exception {
        for (JSONObject suggestion : names.suggestions())
            if (id.equals(suggestion.optString("id"))) {
                names.accept(id);
                forgetSavedCopies(suggestion.optString("title"), suggestion.optString("artist"));
                return;
            }
    }

    private void forgetSavedCopies(String title, String artist) {
        if (!useTrackNames) return;
        int removed = SavedCopies.forget(names.playedAs(title, artist));
        status =
                Strings.f(
                        removed > 0
                                ? "Saved “{0}”. Removed BitChord’s saved copy; play it again to use"
                                        + " your Telegram file."
                                : "Saved “{0}”.",
                        TrackNames.clean(title));
    }

    public JSONObject resolveTrack(String id) throws Exception {
        requireReady();
        long session = generation;
        JSONObject row =
                ZipAlbums.validId(id)
                        ? zipSong(id)
                        : TrackMetadata.resolve(id, selected, this::message);
        if (row != null && !ZipAlbums.validId(id)) {
            // A song from a shared index must be the file actually in that post.
            JSONObject indexed = index.row(row.getLong("chat"), row.getLong("message"), 0);
            if (indexed != null && indexed.optInt("file") == 0) {
                if (!indexed.optString("unique").equals(row.optString("unique"))) return null;
                index.fileFound(indexed, row.getInt("file"));
            }
        }
        requireReady();
        if (session != generation) throw new IOException("Telegram session changed. Try again.");
        return row == null ? null : index.withFound(row);
    }

    /** A message the player may read: from an allowed chat, and allowed to be saved. */
    TdApi.Message message(long chat, long message) throws Exception {
        TdApi.Chat source = call(new TdApi.GetChat(chat), 15000);
        if (!MediaPolicy.chatAllowed(source))
            throw new IOException(
                    "Telegram does not allow this channel's content to be saved by this player.");
        TdApi.Message found = call(new TdApi.GetMessage(chat, message), 15000);
        if (!MediaPolicy.savable(found)) return null;
        TdApi.MessageProperties properties =
                call(new TdApi.GetMessageProperties(chat, message), 15000);
        if (properties == null
                || !properties.canBeSaved
                || properties.hasProtectedContentByCurrentUser
                || properties.hasProtectedContentByOtherUser)
            throw new IOException(
                    "Telegram does not allow this message to be saved by this player.");
        return found;
    }

    /**
     * A song inside a zip post: what the saved index found in it, once the post is checked the same
     * way any track is.
     */
    private JSONObject zipSong(String id) throws Exception {
        long[] key = ZipAlbums.parse(id);
        if (!selected.contains(key[0])) return null;
        TdApi.Message found = message(key[0], key[1]);
        // The post's file as it is now: a zip, or the album file a cue sheet's track is part of.
        JSONObject post =
                CueAlbums.isTrack(key[2]) && CueAlbums.albumEntry(key[2]) == 0
                        ? TrackMetadata.from(found)
                        : ZipAlbums.descriptor(found);
        JSONObject row = index.row(key[0], key[1], (int) key[2]);
        if (post == null || row == null) return null;
        int file = post.getInt("file");
        if (row.optInt("file") != file) {
            // An index shared by someone else has their phone's file numbers, or none: the post's
            // own is used once it's known to be the same file.
            String unique = post.optString("unique");
            String own = row.optString("unique");
            if (unique.isEmpty() || !(own.startsWith(unique + "/") || own.startsWith(unique + "#")))
                return null;
            row.put("file", file);
            index.fileFound(new JSONObject(row.toString()), file);
        }
        return row;
    }

    void verifyMedia(long chat, long message, int file) throws Exception {
        TdApi.Message found = message(chat, message);
        JSONObject row = found == null ? null : TrackMetadata.from(found);
        if (row == null) row = ZipAlbums.descriptor(found);
        if (row == null || row.getInt("file") != file)
            throw new IOException("Telegram media changed or is no longer accessible.");
    }

    void played(String id) {
        final long session = generation;
        work.submit(
                () -> {
                    try {
                        if (session != generation) return;
                        String key = session + "/" + id;
                        if (playbackRead.containsKey(key)) return;
                        JSONObject row = resolveTrack(id);
                        if (row == null || session != generation) return;
                        call(
                                new TdApi.ViewMessages(
                                        row.getLong("chat"),
                                        new long[] {row.getLong("message")},
                                        new TdApi.MessageSourceOther(),
                                        true));
                        if (session != generation) return;
                        playbackRead.put(key, true);
                        while (playbackRead.size() > 256)
                            playbackRead.remove(playbackRead.keySet().iterator().next());
                    } catch (Exception e) {
                        if (session == generation)
                            error =
                                    "Telegram could not acknowledge played audio. Reopen the track"
                                            + " to retry.";
                    }
                });
    }

    public TdApi.Chat channel(long id) throws Exception {
        requireReady();
        if (!selected.contains(id)) throw new IOException("Choose this music chat first.");
        TdApi.Chat chat = call(new TdApi.GetChat(id));
        if (!MediaPolicy.chatAllowed(chat))
            throw new IOException("Protected content and secret chats are not supported here.");
        if (!(chat.type instanceof TdApi.ChatTypeSupergroup)
                || !((TdApi.ChatTypeSupergroup) chat.type).isChannel)
            throw new IOException(
                    "Channel View supports Telegram channels. Open other chats in Telegram.");
        return chat;
    }

    public boolean hasSponsoredMessages(TdApi.Chat chat) throws Exception {
        if (chat.type instanceof TdApi.ChatTypeSupergroup)
            return ((TdApi.ChatTypeSupergroup) chat.type).isChannel;
        return isBot(chat);
    }

    public void openChannel(long chat) throws Exception {
        channel(chat);
        call(new TdApi.OpenChat(chat));
    }

    public void closeChannel(long chat) {
        Client current = client;
        if (current != null) current.send(new TdApi.CloseChat(chat), null);
    }

    public List<TdApi.Message> channelHistory(long chat, long before) throws Exception {
        channel(chat);
        TdApi.Messages messages = call(new TdApi.GetChatHistory(chat, before, 0, 30, false), 15000);
        List<TdApi.Message> result = new ArrayList<>();
        if (messages.messages != null)
            for (TdApi.Message message : messages.messages)
                if (message != null && message.chatId == chat) result.add(message);
        result.sort(Comparator.comparingLong(message -> message.id));
        return result;
    }

    public void viewedMessages(long chat, long[] ids, long session) throws Exception {
        if (session != generation) throw new IOException("Telegram account changed");
        channel(chat);
        call(new TdApi.ViewMessages(chat, ids, new TdApi.MessageSourceChatHistory(), false));
    }

    public String messageLink(long chat, long message) throws Exception {
        channel(chat);
        TdApi.GetMessageLink request = new TdApi.GetMessageLink();
        request.chatId = chat;
        request.messageId = message;
        request.pollOptionId = "";
        return call(request).link;
    }

    public String downloadSponsorFile(int file) throws Exception {
        requireReady();
        long session = generation;
        TdApi.File result = call(new TdApi.DownloadFile(file, 16, 0, 0, true), 40000);
        if (session != generation
                || result.local == null
                || !result.local.isDownloadingCompleted
                || result.local.path == null
                || !new File(result.local.path).isFile())
            throw new IOException("Sponsored media could not be fully downloaded");
        return result.local.path;
    }

    void releaseSponsorFile(int file) {
        Client target = client;
        if (target != null) {
            target.send(new TdApi.CancelDownloadFile(file, false), null);
            target.send(new TdApi.DeleteFile(file), null);
        }
    }

    int sponsorColor(int id, boolean dark) {
        TdApi.AccentColor color = accentColors.get(id);
        int[] colors = color == null ? null : dark ? color.darkThemeColors : color.lightThemeColors;
        if (colors != null && colors.length > 0) return 0xff000000 | colors[0];
        int[] defaults = {
            0xffcf4d55, 0xffcb7532, 0xff8969c2, 0xff438d59, 0xff258ca0, 0xff3b7bd2, 0xffc7619b
        };
        return defaults[Math.floorMod(id, 7)];
    }

    public void registerSource() throws Exception {
        if (Looper.myLooper() == Looper.getMainLooper()) NativeSource.register(url());
        else {
            FutureTask<Boolean> registration = new FutureTask<>(() -> NativeSource.register(url()));
            new Handler(Looper.getMainLooper()).post(registration);
            registration.get(15, TimeUnit.SECONDS);
        }
        config.put("registered", true);
        saveConfig();
        status =
                ready()
                        ? "Telegram source ready. Open BitChord → Search → Addons."
                        : "Telegram source added. Sign in to choose music chats.";
    }

    public long cacheLimitBytes() {
        return cacheLimitBytes;
    }

    public void setCacheLimitBytes(long bytes) throws Exception {
        CachePolicy.requireValid(bytes);
        requireReady();
        synchronized (this) {
            long previous = cacheLimitBytes;
            config.put("audioCacheBytes", bytes);
            try {
                saveConfig();
            } catch (Exception e) {
                config.put("audioCacheBytes", previous);
                throw e;
            }
            cacheLimitBytes = bytes;
        }
        boolean applied = audio.applyCacheLimit();
        status =
                Strings.f(
                        applied
                                ? "Telegram cache target saved: {0}."
                                : "Telegram cache target saved: {0}. Cleanup will apply before the"
                                        + " next playback session.",
                        CachePolicy.label(bytes));
    }

    public void clearCache() throws Exception {
        audio.clearCache();
        status = "Telegram audio cache cleared.";
    }

    void cancelDownload(int id) {
        client.send(new TdApi.CancelDownloadFile(id, false), null);
    }

    void optimize(long bytes) throws Exception {
        call(
                new TdApi.OptimizeStorage(
                        bytes,
                        Integer.MAX_VALUE,
                        Integer.MAX_VALUE,
                        0,
                        new TdApi.FileType[] {
                            new TdApi.FileTypeAudio(), new TdApi.FileTypeDocument()
                        },
                        new long[0],
                        new long[0],
                        false,
                        0));
    }

    // ── Signing out with a backup ───────────────────────────────────────────

    private File lastBackupFile() {
        return new File(home, "last-backup.json");
    }

    /** Files in the saved index of the chats a backup would include. */
    public int indexedFiles() {
        int files = 0;
        if (!index.enabled) return 0;
        for (long chat : indexedChats())
            try {
                files += index.count(chat);
            } catch (Exception ignored) {
                // Counted without it.
            }
        return files;
    }

    /** The backup made when signing out, offered for restoring after signing in again. */
    public void rememberBackup(String uri) throws Exception {
        writeJson(
                lastBackupFile(),
                new JSONObject().put("uri", uri).put("at", System.currentTimeMillis()));
    }

    /** {uri, at}, or null. */
    public JSONObject lastBackup() {
        try {
            File file = lastBackupFile();
            return file.isFile() ? readJson(file) : null;
        } catch (Exception e) {
            return null;
        }
    }

    public void forgetBackup() {
        lastBackupFile().delete();
    }

    public void logout() throws Exception {
        if (audio.active()) throw new IOException("Stop playback before signing out");
        call(new TdApi.LogOut());
        auth = null;
        selected.clear();
        remoteSearch.clear();
        index.clear();
        soundCheck.clear();
        checks.clear();
        // An older backup isn't offered after a sign-out without one.
        forgetBackup();
        mainChannel.clear();
        names.clear();
        artwork.clear();
        formats.clear();
        legends.clear();
        synchronized (heard) {
            heard.clear();
        }
        sponsorship.clear(++generation);
        mediaRevision++;
        saveConfig();
    }

    void requireReady() throws IOException {
        if (!ready()) throw new IOException("Sign in to Telegram first");
    }

    public void fail(Exception e) {
        String message = e.getMessage() == null ? e.getClass().getSimpleName() : e.getMessage();
        String secret = credentials.apiHash;
        error = secret.isEmpty() ? message : message.replace(secret, "[hidden]");
    }

    synchronized void saveConfig() throws Exception {
        config.put("chats", new JSONArray(selected));
        writeJson(new File(home, "config.json"), config);
    }

    static JSONObject readJson(File file) throws Exception {
        if (!file.exists()) return new JSONObject();
        return new JSONObject(new String(new AtomicFile(file).readFully(), StandardCharsets.UTF_8));
    }

    static void writeJson(File file, JSONObject json) throws Exception {
        AtomicFile atomic = new AtomicFile(file);
        FileOutputStream out = atomic.startWrite();
        try {
            out.write(json.toString().getBytes(StandardCharsets.UTF_8));
            atomic.finishWrite(out);
        } catch (Exception e) {
            atomic.failWrite(out);
            throw e;
        }
    }

    byte[] databaseKey() throws Exception {
        KeyStore store = KeyStore.getInstance("AndroidKeyStore");
        store.load(null);
        String alias = context.getPackageName() + ".telegram.database";
        if (!store.containsAlias(alias)) {
            KeyGenerator generator = KeyGenerator.getInstance("AES", "AndroidKeyStore");
            generator.init(
                    new KeyGenParameterSpec.Builder(
                                    alias,
                                    KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                            .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                            .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                            .build());
            generator.generateKey();
        }
        javax.crypto.SecretKey key = (javax.crypto.SecretKey) store.getKey(alias, null);
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        if (config.has("wrappedKey")) {
            cipher.init(
                    Cipher.DECRYPT_MODE,
                    key,
                    new GCMParameterSpec(
                            128, Base64.decode(config.getString("keyIv"), Base64.NO_WRAP)));
            return cipher.doFinal(Base64.decode(config.getString("wrappedKey"), Base64.NO_WRAP));
        }
        if (new File(home, "db").exists())
            throw new IOException(
                    "Session key missing; sign out/reset app data before creating a new session");
        byte[] raw = new byte[32];
        new SecureRandom().nextBytes(raw);
        cipher.init(Cipher.ENCRYPT_MODE, key);
        config.put("wrappedKey", Base64.encodeToString(cipher.doFinal(raw), Base64.NO_WRAP));
        config.put("keyIv", Base64.encodeToString(cipher.getIV(), Base64.NO_WRAP));
        saveConfig();
        return raw;
    }
}
