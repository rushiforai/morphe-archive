/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Activity;
import android.content.Context;
import android.view.Menu;

import java.util.Locale;

import app.fakh.extension.shared.Features;
import app.fakh.extension.shared.I18n;

/** The items the patches add to the menu of an open file. */
@SuppressWarnings("unused")
public final class FileMenu {
    private FileMenu() {
    }

    /**
     * Adds Download, and Preview for an HTML file, each while its switch is on.
     *
     * @param menu    The file screen's menu, just inflated.
     * @param context The screen's context.
     * @param address The address of the file's page on the web.
     */
    public static void add(Menu menu, Context context, String address) {
        RepoFile file = RepoFile.of(address);
        if (file == null) return;
        String name = file.name().toLowerCase(Locale.ROOT);
        if (Features.on("fakh_html_preview") && (name.endsWith(".html") || name.endsWith(".htm"))) {
            menu.add(I18n.tr("Preview")).setOnMenuItemClickListener(item -> {
                Activity activity = MaterialYou.activity(context);
                if (activity != null) HtmlPreview.open(activity, file);
                return true;
            });
        }
        if (Features.on("fakh_download_files")) {
            menu.add(I18n.tr("Download")).setOnMenuItemClickListener(item -> {
                NativeAssetDownload.file(context.getApplicationContext(), file.api(file.path), file.name(), file.page);
                return true;
            });
        }
    }
}
