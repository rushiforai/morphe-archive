// SPDX-License-Identifier: AGPL-3.0-or-later
package okhttp3;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

/** Compile-only stand-in for the OkHttp DNS bundled in the app. */
public interface Dns {
    List<InetAddress> lookup(String hostname) throws UnknownHostException;
}
