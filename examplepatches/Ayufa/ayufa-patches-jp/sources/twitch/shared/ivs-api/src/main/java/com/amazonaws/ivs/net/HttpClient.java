package com.amazonaws.ivs.net;

public interface HttpClient { String description(); void execute(Request request, ResponseCallback callback); void release(); }
