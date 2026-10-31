package com.amazonaws.ivs.net;

import java.util.concurrent.ExecutorService;

public class Response {
    public Response(int status, String url) {
        throw new UnsupportedOperationException("Stub");
    }

    public String getHeader(String name) {
        throw new UnsupportedOperationException("Stub");
    }

    public int getStatus() {
        throw new UnsupportedOperationException("Stub");
    }

    public String getUrl() {
        throw new UnsupportedOperationException("Stub");
    }

    public void readContent(ReadCallback readCallback) {
        throw new UnsupportedOperationException("Stub");
    }

    public void setConsumer(ExecutorService executorService, StreamConsumer streamConsumer) {
        throw new UnsupportedOperationException("Stub");
    }

    public void setHeader(String name, String value) {
        throw new UnsupportedOperationException("Stub");
    }
}
