package reddit.news.oauth.reddit;

import java.util.Map;

import rx.Observable;

/** Relay's Retrofit interface for oauth.reddit.com. */
public interface RedditApi {
    /** GET {path} with query parameters; emits a RedditResponse holding a RedditListing. */
    Observable getListing(String path, Map map);
}
