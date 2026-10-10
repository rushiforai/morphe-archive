package app.noam.extension.blockblast;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.ProxySelector;
import java.net.SocketAddress;
import java.net.URI;
import java.util.Collections;
import java.util.List;

/**
 * "Block online access": with the INTERNET permission removed, a DNS lookup throws SecurityException, which
 * the SDKs' network threads do not expect. This provider runs before Application.onCreate and routes every
 * Java connection to a closed loopback port, so they fail as in airplane mode: IOException, no lookup.
 */
public final class OfflineProvider extends ContentProvider {
    @Override
    public boolean onCreate() {
        final List<Proxy> nowhere = Collections.singletonList(
                new Proxy(Proxy.Type.HTTP, new InetSocketAddress(InetAddress.getLoopbackAddress(), 9)));
        ProxySelector.setDefault(new ProxySelector() {
            @Override
            public List<Proxy> select(URI uri) {
                return nowhere;
            }

            @Override
            public void connectFailed(URI uri, SocketAddress address, IOException e) {
            }
        });
        return true;
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        return null;
    }

    @Override
    public String getType(Uri uri) {
        return null;
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        return null;
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        return 0;
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        return 0;
    }
}
