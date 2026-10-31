package com.amazonaws.ivs.net;

import java.nio.ByteBuffer;

// Package-private in the IVS SDK, which is why the wrapper lives in this package.
interface ReadCallback {
    int getTimeout();

    void onData(ByteBuffer byteBuffer, boolean isLast);

    void onData(byte[] bytes, int length, boolean isLast);

    void onError(Exception exception);
}
