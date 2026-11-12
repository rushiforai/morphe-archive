package com.spotify.cosmos.cosmos;

/** Stands in for Spotify's kept {@code Request}, with the constructor and getters CosmosRouter uses. */
public class Request {
    private final String action;
    private final String uri;
    private final byte[] body;

    public Request(String action, String uri, byte[] body) {
        this.action = action;
        this.uri = uri;
        this.body = body;
    }

    public String getAction() {
        return action;
    }

    public String getUri() {
        return uri;
    }

    public byte[] getBody() {
        return body;
    }
}
