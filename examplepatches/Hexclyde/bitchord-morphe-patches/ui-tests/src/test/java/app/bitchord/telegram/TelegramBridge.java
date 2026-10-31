package app.bitchord.telegram;

import android.content.Context;

import org.drinkless.tdlib.TdApi;
import org.json.JSONObject;

import java.util.*;
import java.util.concurrent.*;

/** In-memory bridge for UI tests. */
public final class TelegramBridge {
    public static TelegramBridge instance;
    public static String startupError = "";
    public final ExecutorService work = Executors.newSingleThreadExecutor();
    public final Set<Long> selected = new HashSet<>();
    long generation = 1, mediaRevision;
    String sessionTag = "framework-session";
    final ChannelSponsorship sponsorship =
            new ChannelSponsorship(request -> this.backend.call(request));
    final NativeAudio audio = new NativeAudio(this);

    interface NativeBackend {
        TdApi.Object call(TdApi.Function<?> request) throws Exception;
    }

    NativeBackend backend;

    @SuppressWarnings("unchecked")
    <T extends TdApi.Object> T call(TdApi.Function<T> request) throws Exception {
        if (backend == null) throw new java.io.IOException("No native fixture");
        return (T) backend.call(request);
    }

    <T extends TdApi.Object> T call(TdApi.Function<T> request, long timeout) throws Exception {
        return call(request);
    }

    void requireReady() throws java.io.IOException {
        if (!ready()) throw new java.io.IOException("Sign in first");
    }

    void optimize(long bytes) {}

    void cancelDownload(int id) {}

    String url() {
        return InternalAddon.ORIGIN + sessionTag;
    }

    final List<JSONObject> searchResults = new ArrayList<>();

    boolean useTrackNames = true;
    final FormatProbe formats = new FormatProbe(null);

    void probeLater(JSONObject row) {}

    final List<String> collections = new ArrayList<>();

    String[] collectionSummary(long chat) {
        return new String[] {"newest 1,000 of 223,776 songs", "31.4 GB"};
    }

    void saveChannelPlaylist(long chat, String title) {
        collections.add("playlist " + title);
    }

    void downloadChannel(long chat, String title) {
        collections.add("download " + title);
    }

    final MainChannel mainChannel = new MainChannel(null, (to, from, ids) -> {}, () -> 0L);
    final List<TdApi.Chat> owned = new ArrayList<>();

    List<TdApi.Chat> ownedPrivateChannels() {
        return owned;
    }

    List<TdApi.Chat> communityChoices() throws Exception {
        return chats();
    }

    void setMainChannel(TdApi.Chat chat) throws Exception {
        mainChannel.setMain(chat.id, chat.title);
    }

    void setCommunity(List<TdApi.Chat> chats, boolean[] checked) throws Exception {
        List<Long> ids = new ArrayList<>();
        for (int i = 0; i < chats.size(); i++) if (checked[i]) ids.add(chats.get(i).id);
        mainChannel.setCommunity(ids);
    }

    boolean importOption(String name) {
        return mainChannel.option(name);
    }

    void setImportOption(String name, boolean on) throws Exception {
        if (name.equals("import") && on && mainChannel.main() == 0)
            throw new java.io.IOException("Choose your main channel first.");
        mainChannel.setOption(name, on);
    }

    int importPerHour() {
        return mainChannel.perHour();
    }

    void setImportPerHour(int files) throws Exception {
        mainChannel.setPerHour(files);
    }

    String importStatus() {
        return mainChannel.status;
    }

    boolean hideDuplicates = true, hideUnplayableDolby = true;

    boolean hideUnplayableDolby() {
        return hideUnplayableDolby;
    }

    void setHideUnplayableDolby(boolean on) {
        hideUnplayableDolby = on;
    }

    boolean hideDuplicates() {
        return hideDuplicates;
    }

    void setHideDuplicates(boolean on) {
        hideDuplicates = on;
    }

    boolean soundCheck;

    boolean soundCheck() {
        return soundCheck;
    }

    void setSoundCheck(boolean on) {
        soundCheck = on;
    }

    boolean searchIndex = true;

    boolean searchIndex() {
        return searchIndex;
    }

    String indexStatus() {
        return "12 files indexed from 1 chat";
    }

    void setSearchIndex(boolean on) {
        searchIndex = on;
    }

    boolean formatLegend = true;

    boolean formatLegend() {
        return formatLegend;
    }

    void setFormatLegend(boolean on) {
        formatLegend = on;
    }

    boolean reportQuality = true, showArtwork = true, namesFromFiles = true;

    boolean reportQuality() {
        return reportQuality;
    }

    void setReportQuality(boolean on) {
        reportQuality = on;
    }

    boolean showArtwork() {
        return showArtwork;
    }

    void setShowArtwork(boolean on) {
        showArtwork = on;
    }

    boolean namesFromFiles() {
        return namesFromFiles;
    }

    void setNamesFromFiles(boolean on) {
        namesFromFiles = on;
    }

    void decorate(List<JSONObject> rows) {}

    boolean surroundAsStereo = false, smoothUpgrades = true;

    boolean smoothUpgrades() {
        return smoothUpgrades;
    }

    void setSmoothUpgrades(boolean on) {
        smoothUpgrades = on;
    }

    boolean surroundAsStereo() {
        return surroundAsStereo;
    }

    void setSurroundAsStereo(boolean on) {
        surroundAsStereo = on;
    }

    boolean useTrackNames() {
        return useTrackNames;
    }

    void setUseTrackNames(boolean on) {
        useTrackNames = on;
    }

    List<JSONObject> searchTracks(String query) throws Exception {
        List<JSONObject> found = new ArrayList<>();
        for (JSONObject row : searchResults)
            if (TrackNames.words(row.optString("title") + " " + row.optString("artist"))
                    .containsAll(TrackNames.words(query))) found.add(row);
        if (!useTrackNames) return found;
        return names.merge(
                found,
                query,
                id -> {
                    for (JSONObject row : searchResults)
                        if (id.equals(row.optString("id"))) return row;
                    return null;
                });
    }

    JSONObject resolveTrack(String id) throws Exception {
        return TrackMetadata.resolve(
                id, selected, (chat, message) -> call(new TdApi.GetMessage(chat, message)));
    }

    int played;
    String playedId;
    final TrackNames names = new TrackNames(null);
    boolean suggestTrackNames = true;
    final List<String> heard = new ArrayList<>();

    boolean suggestTrackNames() {
        return suggestTrackNames;
    }

    void setSuggestTrackNames(boolean on) {
        suggestTrackNames = on;
    }

    final List<String> forgotten = new ArrayList<>();

    void heard(String title, String artist, long durationMs, String mediaId) {
        heard.add(title + "|" + artist + "|" + durationMs + "|" + mediaId);
        try {
            names.played(mediaId, title, artist, (int) (durationMs / 1000));
        } catch (java.io.IOException e) {
            throw new IllegalStateException(e);
        }
    }

    void rename(JSONObject row, String title, String artist) throws Exception {
        names.correct(row, title, artist);
        if (useTrackNames) forgotten.addAll(names.playedAs(title, artist));
    }

    void acceptSuggestion(String id) throws Exception {
        for (JSONObject suggestion : names.suggestions())
            if (id.equals(suggestion.optString("id"))) {
                names.accept(id);
                if (useTrackNames)
                    forgotten.addAll(
                            names.playedAs(
                                    suggestion.optString("title"), suggestion.optString("artist")));
            }
    }

    void played(String id) {
        played++;
        playedId = id;
    }

    void verifyMedia(long chat, long message, int file) throws Exception {
        if (resolveTrack(chat + "_" + message) == null)
            throw new java.io.IOException("Unavailable");
    }

    public TdApi.Chat channel(long id) throws Exception {
        if (backend == null) {
            TdApi.Chat chat = new TdApi.Chat();
            chat.id = id;
            chat.title = "Lossless";
            return chat;
        }
        return call(new TdApi.GetChat(id));
    }

    public boolean hasSponsoredMessages(TdApi.Chat chat) {
        return chat.type instanceof TdApi.ChatTypeSupergroup
                && ((TdApi.ChatTypeSupergroup) chat.type).isChannel;
    }

    public void openChannel(long id) throws Exception {
        call(new TdApi.OpenChat(id));
    }

    public void closeChannel(long id) {
        try {
            call(new TdApi.CloseChat(id));
        } catch (Exception ignored) {
        }
    }

    public List<TdApi.Message> channelHistory(long chat, long before) throws Exception {
        return Arrays.asList(call(new TdApi.GetChatHistory(chat, before, 0, 30, false)).messages);
    }

    public void viewedMessages(long chat, long[] ids, long session) throws Exception {
        if (session != generation) throw new java.io.IOException("Account changed");
        call(new TdApi.ViewMessages(chat, ids, new TdApi.MessageSourceChatHistory(), false));
    }

    public String messageLink(long chat, long message) throws Exception {
        TdApi.GetMessageLink request = new TdApi.GetMessageLink();
        request.chatId = chat;
        request.messageId = message;
        request.pollOptionId = "";
        return call(request).link;
    }

    public String downloadSponsorFile(int file) throws Exception {
        return call(new TdApi.DownloadFile(file, 16, 0, 0, true)).local.path;
    }

    void releaseSponsorFile(int file) {}

    int sponsorColor(int id, boolean dark) {
        return 0xff438d59;
    }

    public TdApi.AuthorizationState auth = new TdApi.AuthorizationStateWaitTdlibParameters();
    public String status = "Add your application credentials to connect.", error = "";
    ApplicationCredentials credentials = ApplicationCredentials.empty();

    public static void init(Context context) {
        if (instance == null) instance = new TelegramBridge();
    }

    public ApplicationCredentials credentials() {
        return credentials;
    }

    public boolean ready() {
        return auth instanceof TdApi.AuthorizationStateReady;
    }

    public void saveCredentials(String id, String hash) {
        credentials = ApplicationCredentials.parse(id, hash);
        auth = new TdApi.AuthorizationStateWaitPhoneNumber();
        status = "Enter your phone number.";
    }

    public void configure() {}

    public void submit(String text) {
        if (auth instanceof TdApi.AuthorizationStateWaitPhoneNumber)
            auth = new TdApi.AuthorizationStateWaitCode();
        else {
            auth = new TdApi.AuthorizationStateReady();
            status = "Telegram connected.";
        }
    }

    public List<TdApi.Chat> chats() {
        return new ArrayList<>();
    }

    List<TdApi.Chat> chats(TdApi.ChatList list) {
        return chats();
    }

    List<Object[]> chatLists() {
        List<Object[]> lists = new ArrayList<>();
        lists.add(new Object[] {"All chats", null});
        lists.add(new Object[] {"Music", new TdApi.ChatListFolder(1)});
        lists.add(new Object[] {"Archived chats", new TdApi.ChatListArchive()});
        return lists;
    }

    boolean wifiOnly, chargingOnly, sharedIndexes = true;

    boolean indexOption(String name) {
        return name.equals("wifi") ? wifiOnly : chargingOnly;
    }

    void setIndexOption(String name, boolean on) {
        if (name.equals("wifi")) wifiOnly = on;
        else chargingOnly = on;
    }

    final Map<String, Boolean> checkOptions = new HashMap<>();
    String acoustIdKey = "", checkStatus = "Checked 12 files · 2 not really lossless";

    boolean checkOption(String name) {
        return checkOptions.getOrDefault(name, name.equals("checkLossless"));
    }

    void setCheckOption(String name, boolean on) throws Exception {
        if (name.equals("recognizeUntagged") && on && acoustIdKey.isEmpty())
            throw new java.io.IOException("Enter your AcoustID application key first.");
        checkOptions.put(name, on);
    }

    String acoustIdKey() {
        return acoustIdKey;
    }

    void setAcoustIdKey(String key) throws Exception {
        if (!key.isEmpty() && !FileChecks.validKey(key))
            throw new java.io.IOException("That doesn’t look like an AcoustID application key.");
        acoustIdKey = key;
    }

    String checkStatus() {
        return checkStatus;
    }

    boolean useSharedIndexes() {
        return sharedIndexes;
    }

    void setUseSharedIndexes(boolean on) {
        sharedIndexes = on;
    }

    List<JSONObject> albums(long chat) throws Exception {
        List<JSONObject> albums = new ArrayList<>();
        albums.add(
                new JSONObject()
                        .put("key", "zip:5")
                        .put("title", "Night Sessions")
                        .put("songs", new org.json.JSONArray().put(1).put(2)));
        return albums;
    }

    void saveAlbumPlaylist(long chat, JSONObject album) {
        collections.add("album playlist " + album.optString("title"));
    }

    void downloadAlbum(JSONObject album) {
        collections.add("album download " + album.optString("title"));
    }

    final List<String> backups = new ArrayList<>();

    void backup(java.io.OutputStream out, boolean withIndex) throws Exception {
        out.write(new byte[] {1});
        backups.add("backup " + withIndex);
    }

    void restore(java.io.InputStream in) {
        backups.add("restore");
    }

    void exportIndex(long chat, java.io.OutputStream out) {
        backups.add("export " + chat);
    }

    List<Object[]> shareTargets(long chat) {
        List<Object[]> targets = new ArrayList<>();
        targets.add(new Object[] {"Saved Messages", 1L});
        return targets;
    }

    void shareIndex(long chat, long target) {
        backups.add("share " + chat + " to " + target);
    }

    static String today() {
        return "20261029";
    }

    public void selectChats(List<TdApi.Chat> chats, boolean[] values) {}

    public void addChat(String text) {}

    public void registerSource() {}

    public long cacheBytes = 256L * 1024 * 1024;

    public long cacheLimitBytes() {
        return cacheBytes;
    }

    public void setCacheLimitBytes(long bytes) {
        CachePolicy.requireValid(bytes);
        cacheBytes = bytes;
    }

    public void clearCache() {}

    public void logout() {
        auth = new TdApi.AuthorizationStateWaitPhoneNumber();
        lastBackup = null;
        backups.add("logout");
    }

    JSONObject lastBackup;

    int indexedFiles() {
        return 223776;
    }

    void rememberBackup(String uri) throws Exception {
        lastBackup = new JSONObject().put("uri", uri).put("at", 1_761_700_000_000L);
    }

    JSONObject lastBackup() {
        return lastBackup;
    }

    void forgetBackup() {
        lastBackup = null;
    }

    public void fail(Exception e) {
        error = e.getMessage();
    }
}
