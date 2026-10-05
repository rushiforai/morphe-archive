package com.amazonaws.ivs.net;

public interface ReadCallback { int getTimeout(); void onData(java.nio.ByteBuffer data, boolean ended); void onData(byte[] data, int length, boolean ended); void onError(Exception error); }
