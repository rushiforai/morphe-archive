/* Compile-only exact native contracts, originals 9.42.52 / 9.43.51. Not injected. */
package com.google.android.libraries.youtube.media.interfaces;
public abstract class NetFetch { public abstract NetFetchTask startFetchTask(HttpRequest request,NetFetchCallbacks callbacks); public abstract void onDefaultNetworkAvailable(); public abstract void onDefaultNetworkChange(int type); public abstract void onDefaultNetworkUnavailable(); public abstract void onProxySettingsChange(String host,int port); }
