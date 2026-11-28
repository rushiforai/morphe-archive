/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.net.Uri;

import java.util.List;

/** A file of a repository, read from the address of its page: {@code https://host/owner/repo/blob/ref/path}. */
final class RepoFile {
    /** The Accept header that makes the API answer with a file's bytes. */
    static final String RAW = "application/vnd.github.raw+json";

    final Uri page;
    final String owner;
    final String repository;
    final String ref;
    final String path;

    private RepoFile(Uri page, List<String> segments) {
        this.page = page;
        owner = segments.get(0);
        repository = segments.get(1);
        ref = segments.get(3);
        path = segments.get(4);
    }

    /**
     * Reads the address the app builds for a file, in which the ref and the path are one encoded segment each.
     *
     * @param address The address of the file's page.
     * @return The file, or null for any other address.
     */
    static RepoFile of(String address) {
        if (address == null) return null;
        Uri page = Uri.parse(address);
        List<String> segments = page.getPathSegments();
        return page.getHost() != null && segments.size() == 5 && "blob".equals(segments.get(2))
                && !segments.get(4).isEmpty() ? new RepoFile(page, segments) : null;
    }

    /** The file's name, without its folders. */
    String name() {
        return path.substring(path.lastIndexOf('/') + 1);
    }

    /** The API address of a file of the same repository and ref, which GitHub Enterprise serves under its own host. */
    Uri api(String filePath) {
        String host = page.getHost();
        String root = host.equals("github.com") || host.equals("www.github.com")
                ? "https://api.github.com" : "https://" + host + "/api/v3";
        return Uri.parse(root + "/repos/" + Uri.encode(owner) + "/" + Uri.encode(repository) + "/contents/"
                + Uri.encode(filePath, "/") + "?ref=" + Uri.encode(ref));
    }
}
