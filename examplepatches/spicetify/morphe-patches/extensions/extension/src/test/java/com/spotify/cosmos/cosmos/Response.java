package com.spotify.cosmos.cosmos;

/** Stands in for Spotify's kept {@code Response}: CosmosRouter reads only its status and body. */
public class Response {
    private final int status;
    private final byte[] body;

    public Response(int status, byte[] body) {
        this.status = status;
        this.body = body;
    }

    public int getStatus() {
        return status;
    }

    public byte[] getBody() {
        return body;
    }
}
