package app.bitchord.telegram;

import org.drinkless.tdlib.TdApi;

import java.io.IOException;
import java.net.URI;
import java.util.*;

/** TDLib sponsored-message lifecycle. Loading alone does not count as a view or click. */
public final class ChannelSponsorship {
    public interface Gateway {
        TdApi.Object call(TdApi.Function<?> request) throws Exception;
    }

    public interface Clock {
        long millis();
    }

    public static final long CACHE_MILLIS = 5 * 60 * 1000L;
    private final Gateway gateway;
    private final Clock clock;
    private long generation = Long.MIN_VALUE;
    private final LinkedHashMap<Long, Snapshot> cache = new LinkedHashMap<>(16, .75f, true);

    public static final class Snapshot {
        public final long chatId, generation, fetchedAt;
        public final int messagesBetween;
        private final Map<Long, TdApi.SponsoredMessage> messages =
                Collections.synchronizedMap(new LinkedHashMap<>());
        private final Set<Long> viewed = new HashSet<>();

        private Snapshot(long chat, long generation, long time, TdApi.SponsoredMessages result)
                throws IOException {
            chatId = chat;
            this.generation = generation;
            fetchedAt = time;
            messagesBetween = result.messagesBetween;
            if (result.messages == null)
                throw new IOException("Invalid sponsored-message response");
            for (TdApi.SponsoredMessage message : result.messages) {
                if (message == null || message.content == null || message.sponsor == null)
                    throw new IOException("Incomplete sponsored-message response");
                messages.put(message.messageId, message);
            }
        }

        public List<TdApi.SponsoredMessage> messages() {
            synchronized (messages) {
                return new ArrayList<>(messages.values());
            }
        }
    }

    public ChannelSponsorship(Gateway gateway) {
        this(gateway, () -> System.nanoTime() / 1000000L);
    }

    ChannelSponsorship(Gateway gateway, Clock clock) {
        this.gateway = gateway;
        this.clock = clock;
    }

    public synchronized void clear(long session) {
        generation = session;
        cache.clear();
    }

    public synchronized boolean expired(Snapshot snapshot, long session) {
        return snapshot == null
                || session != generation
                || snapshot.generation != session
                || cache.get(snapshot.chatId) != snapshot
                || clock.millis() - snapshot.fetchedAt >= CACHE_MILLIS;
    }

    public synchronized Snapshot load(long chat, long session) throws Exception {
        if (chat == 0) throw new IOException("Invalid channel");
        if (generation != session) clear(session);
        Snapshot previous = cache.get(chat);
        if (previous != null && clock.millis() - previous.fetchedAt < CACHE_MILLIS) return previous;
        cache.remove(chat);
        TdApi.Object response = gateway.call(new TdApi.GetChatSponsoredMessages(chat));
        if (!(response instanceof TdApi.SponsoredMessages))
            throw new IOException("Sponsored messages could not be loaded");
        Snapshot snapshot =
                new Snapshot(chat, session, clock.millis(), (TdApi.SponsoredMessages) response);
        cache.put(chat, snapshot);
        while (cache.size() > 32) cache.remove(cache.keySet().iterator().next());
        return snapshot;
    }

    private TdApi.SponsoredMessage current(Snapshot snapshot, long id) throws IOException {
        if (snapshot == null
                || snapshot.generation != generation
                || cache.get(snapshot.chatId) != snapshot
                || clock.millis() - snapshot.fetchedAt >= CACHE_MILLIS)
            throw new IOException("Refresh the channel's sponsored messages");
        TdApi.SponsoredMessage message = snapshot.messages.get(id);
        if (message == null) throw new IOException("Sponsored message is no longer available");
        return message;
    }

    /**
     * Called only by the foreground view after all its text has actually been drawn and is visible.
     */
    public synchronized void viewed(Snapshot snapshot, long id) throws Exception {
        current(snapshot, id);
        if (snapshot.viewed.contains(id)) return;
        TdApi.Object response =
                gateway.call(
                        new TdApi.ViewMessages(
                                snapshot.chatId,
                                new long[] {id},
                                new TdApi.MessageSourceChatHistory(),
                                false));
        if (!(response instanceof TdApi.Ok))
            throw new IOException("Sponsored-message view was not acknowledged");
        snapshot.viewed.add(id);
    }

    /** The UI calls this only after a link the user tapped has opened. */
    public synchronized void clicked(Snapshot snapshot, long id, boolean media, boolean fullscreen)
            throws Exception {
        current(snapshot, id);
        TdApi.Object response =
                gateway.call(
                        new TdApi.ClickChatSponsoredMessage(
                                snapshot.chatId, id, media, fullscreen));
        if (!(response instanceof TdApi.Ok))
            throw new IOException("Sponsored-message click was not acknowledged");
    }

    public synchronized TdApi.ReportSponsoredResult report(
            Snapshot snapshot, long id, byte[] option) throws Exception {
        TdApi.SponsoredMessage message = current(snapshot, id);
        if (!message.canBeReported)
            throw new IOException("Telegram does not offer reporting for this message");
        TdApi.Object response =
                gateway.call(
                        new TdApi.ReportChatSponsoredMessage(
                                snapshot.chatId,
                                id,
                                option == null ? new byte[0] : option.clone()));
        if (!(response instanceof TdApi.ReportSponsoredResult))
            throw new IOException("Unexpected reporting response");
        if (response instanceof TdApi.ReportSponsoredResultOk
                || response instanceof TdApi.ReportSponsoredResultFailed)
            snapshot.messages.remove(id);
        if (response instanceof TdApi.ReportSponsoredResultAdsHidden) cache.clear();
        return (TdApi.ReportSponsoredResult) response;
    }

    public static boolean telegramHost(String host) {
        if (host == null) return false;
        String h = host.toLowerCase(Locale.ROOT);
        return h.matches(
                "(^|.*\\.)(telegram\\.(org|me|dog)|t\\.me|te\\.?legra\\.ph|graph\\.org|fragment\\.com|telesco\\.pe)");
    }

    public static URI destination(String value) throws IOException {
        try {
            URI uri = new URI(value);
            String scheme = uri.getScheme();
            if (uri.getRawUserInfo() != null
                    || uri.getHost() == null
                    || !("https".equals(scheme) || "http".equals(scheme)))
                throw new IOException("Unsupported sponsored-message destination");
            return uri;
        } catch (java.net.URISyntaxException | NullPointerException e) {
            throw new IOException("Invalid sponsored-message destination", e);
        }
    }
}
