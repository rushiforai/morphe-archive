/* Compile-only exact native contracts, originals 9.42.52 / 9.43.51. Not injected. */
package com.google.android.libraries.youtube.media.interfaces;
public abstract class NetFetchCallbacks { public abstract void onBodyData(java.nio.ByteBuffer buffer); public abstract void onDone(QoeError error,boolean cancelled); public abstract void onHttpResponse(HttpResponse response); public abstract void onRedirect(String url); }
