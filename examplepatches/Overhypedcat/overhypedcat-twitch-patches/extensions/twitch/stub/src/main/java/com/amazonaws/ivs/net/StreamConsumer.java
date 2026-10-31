package com.amazonaws.ivs.net;

// Package-private in the IVS SDK, which is why the wrapper lives in this package.
interface StreamConsumer {
    void consume(ReadCallback readCallback);
}
