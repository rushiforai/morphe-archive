package com.amazonaws.ivs.net;

public interface ResponseCallback { void onError(Exception error); void onResponse(Response response); }
