package com.amazonaws.ivs.net;

public interface ResponseCallback {
    void onError(Exception exception);

    void onResponse(Response response);
}
