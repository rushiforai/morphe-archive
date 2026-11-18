// SPDX-License-Identifier: AGPL-3.0-or-later
package okhttp3;

/** Compile-only stand-in for the OkHttp call bundled in the app. */
public interface Call {
    void cancel();
}
