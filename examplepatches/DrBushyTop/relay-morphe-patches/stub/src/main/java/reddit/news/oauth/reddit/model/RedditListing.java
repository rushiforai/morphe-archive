package reddit.news.oauth.reddit.model;

import java.util.List;

import reddit.news.oauth.reddit.model.base.RedditObject;

public class RedditListing extends RedditObject {
    public List children;

    public String getAfter() {
        throw new UnsupportedOperationException();
    }
}
