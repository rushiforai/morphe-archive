package io.github.jordanwoodson.extension.shared.kick;

import java.io.IOException;
import java.util.regex.Pattern;

import io.github.jordanwoodson.extension.shared.Logger;
import okhttp3.HttpUrl;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

/**
 * Kick's own API requests, for three switches. 7TV emotes and 7TV badges read which channel a chat belongs to: 7TV
 * knows channels by their owner's Kick user ID, and Kick's chat page only knows the channel ID. Kick's own channel
 * responses give the channel's slug for its ID, which leads to the owner; they are only read, never changed. Anonymous chat refuses
 * the requests that post to chat (a message, a reply or a quick emote, and a celebration's action, which can post
 * one), so nothing is sent as you while the chat page reads chat as a guest. The only extension class that names
 * OkHttp, which Kick ships unrenamed; Twitch and Rumble never load it.
 */
@SuppressWarnings("unused")
public final class KickHttp implements Interceptor {
    static final String ANONYMOUS = "chat_anonymous";
    private static final long PEEK_LIMIT = 1024 * 1024;
    /** A channel by slug, and the channel info screen's lighter version of it. */
    private static final Pattern CHANNEL = Pattern.compile("/api/v[12]/channels/[^/]+(?:/info)?");
    /** What posts to a chat: messages/send/{chatroom} (messages, replies, quick emotes) and a celebration's action. */
    private static final Pattern SEND =
            Pattern.compile("/api/v2/(?:messages/send/[^/]+|chatrooms/[^/]+/celebrations/[^/]+/action)/?");

    private final boolean channels;
    private final boolean sends;

    private KickHttp(boolean channels, boolean sends) {
        this.channels = channels;
        this.sends = sends;
    }

    /**
     * Injection point: the end of React Native's OkHttpClientProvider.createClientBuilder(), which every client
     * Kick makes starts from. Clients built while those switches are off stay as they are; Kick builds its clients at
     * start, so a change applies after a restart, together with Anonymous chat's change to the chat page.
     */
    public static OkHttpClient.Builder withInterceptor(OkHttpClient.Builder builder) {
        boolean channels = KickChat.on(KickChat.SEVEN_TV) || KickChat.on(KickChat.SEVEN_TV_BADGES);
        boolean sends = KickChat.on(ANONYMOUS);
        if (channels || sends) builder.addInterceptor(new KickHttp(channels, sends));
        return builder;
    }

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        HttpUrl url = request.url();
        String host = url.host();
        boolean kick = "kick.com".equals(host) || host.endsWith(".kick.com");
        if (sends && kick && "POST".equals(request.method()) && SEND.matcher(url.encodedPath()).matches()) {
            // React Native's fetch rejects as on a network error, and Kick's send mutation runs its onError.
            Logger.blocked("chat message, Anonymous chat is on");
            throw new IOException("Lurk: sending is off while Anonymous chat is on");
        }
        Response response = chain.proceed(request);
        if (channels && response.isSuccessful() && kick && CHANNEL.matcher(url.encodedPath()).matches()) {
            try {
                KickChat.onChannel(response.peekBody(PEEK_LIMIT).string());
            } catch (IOException | RuntimeException e) {
                Logger.d("7tv: channel response: " + e);
            }
        }
        return response;
    }
}
