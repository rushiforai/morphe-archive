/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 *
 * Part of the Twitter Bookmarker overlay: see morphe/README.md.
 */

package app.morphe.extension.twitter.patches.bookmarker;

import android.app.AlertDialog;
import android.content.Context;
import android.text.InputType;
import android.widget.EditText;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.twitter.patches.nativeFeatures.shareMenu.BottomSheetAction;
import app.morphe.extension.twitter.patches.nativeFeatures.shareMenu.BottomSheetHelper;

/**
 * The collection picker: one native bottom sheet row per existing collection,
 * plus a row that creates one.
 *
 * <p>Creating matters because collections are made by saving into them — the
 * backend has no endpoint for it — so without this row a phone with an empty
 * database could never save anything at all.
 *
 * <p>The sheet is Piko's own ({@link BottomSheetHelper}), not a dialog of ours,
 * so it matches the app's share sheet and its dark/light theming for free.
 */
public final class BookmarkerSheets {

    /** X drawables that Piko's own sheets already use, so they are present. */
    private static final String COLLECTION_ICON = "ic_vector_book_stroke_on";
    private static final String NEW_COLLECTION_ICON = "ic_vector_compose_dm";

    /** Called on the main thread with the chosen collection. */
    public interface PickCallback {
        void onPick(String slug, String name);
    }

    private BookmarkerSheets() {}

    /**
     * @param draft the tweet being saved, bound to every row's callback.
     */
    public static void showCollectionPicker(Context context, BookmarkerApi.Draft draft,
                                            List<BookmarkerApi.Collection> collections,
                                            PickCallback onPick) {
        if (context == null) return;

        List<BottomSheetAction<BookmarkerApi.Draft>> actions = new ArrayList<>();
        for (BookmarkerApi.Collection collection : collections) {
            // Each row closes over its own collection: the helper hands every
            // callback the same bound item, so the choice has to be captured here.
            actions.add(new BottomSheetAction<BookmarkerApi.Draft>(
                    COLLECTION_ICON,
                    collection.toString(),
                    ignored -> onPick.onPick(collection.slug, collection.name)));
        }
        actions.add(new BottomSheetAction<BookmarkerApi.Draft>(
                NEW_COLLECTION_ICON,
                "New collection…",
                ignored -> promptForNewCollection(context, onPick)));

        BottomSheetHelper.show(context, draft, "Save to Twitter Bookmarker", actions, null);
    }

    /**
     * What a tap means once the tweet is already in the archive.
     *
     * <p>One row, and no collection rows: the tweet is in exactly one collection,
     * and offering to save it again would only produce a 409. Moving a tweet
     * between collections needs the backend's move endpoint, which does not exist
     * yet — see the Phase 4 row in {@code morphe/README.md}.
     */
    public static void showSavedInfo(Context context, String name, String slug) {
        if (context == null) return;
        String where = name == null || name.isEmpty() ? slug : name;
        if (where == null || where.isEmpty()) return;

        // The bound item is a String here rather than a Draft: this sheet only has
        // to say where the tweet lives, and its row needs no tweet data at all.
        List<BottomSheetAction<String>> actions = new ArrayList<>();
        actions.add(new BottomSheetAction<>(
                COLLECTION_ICON,
                "Already saved in " + where,
                ignored -> {}));

        BottomSheetHelper.show(context, where, "Twitter Bookmarker", actions, null);
    }

    /**
     * Asks for a name and turns it into a slug. A name that slugs down to nothing
     * is refused here rather than sent: the backend would answer 400, and the
     * user would be left wondering which character was the problem.
     */
    static void promptForNewCollection(Context context, PickCallback onPick) {
        EditText input = new EditText(context);
        input.setInputType(InputType.TYPE_CLASS_TEXT);
        input.setSingleLine(true);
        input.setHint("e.g. Read Later");

        new AlertDialog.Builder(context)
                .setTitle("New collection")
                .setView(input)
                .setPositiveButton("Create", (dialog, which) -> {
                    String name = input.getText().toString().trim();
                    String slug = Slug.from(name);
                    if (!Slug.isValid(slug)) {
                        Utils.showToastShort(
                                "Twitter Bookmarker: use at least one letter or digit in the name");
                        return;
                    }
                    onPick.onPick(slug, name);
                })
                .setNegativeButton("Cancel", null)
                .show();
    }
}
