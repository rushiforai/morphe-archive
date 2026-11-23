package nl.johninnl.eclipse.auto.tree;

import android.os.Bundle;
import nl.johninnl.eclipse.auto.data.Model;

/**
 * One child of a classic-tree parent, as plain data: the app-facing bridge turns it into the
 * app's media item (through the app's own item builders) and adds the extras {@link #extras()} names.
 */
public final class Node {
    /** The extra hosts group consecutive children by (Android's content-style API). */
    public static final String EXTRA_GROUP_TITLE = "android.media.browse.CONTENT_STYLE_GROUP_TITLE_HINT";

    public static final int TYPE_MUSIC = 1;
    public static final int TYPE_ALBUM = 10;
    public static final int TYPE_ARTIST = 11;
    public static final int TYPE_PLAYLIST = 13;
    public static final int TYPE_FOLDER = 20;
    public static final int TYPE_FOLDER_ALBUMS = 21;
    public static final int TYPE_FOLDER_PLAYLISTS = 24;

    /** What the bridge builds: a browsable folder, a song, or a playable station. */
    public enum Kind { FOLDER, SONG, STATION }

    public final String id;
    public final Kind kind;
    public final String title;
    public final String subtitle;
    public final String artUrl;
    public final int mediaType;
    /** The group title shown above this item and the ones after it that share it; null for no group. */
    public final String group;
    /** The song a {@link Kind#SONG} node plays and shows. */
    public final Model.Track track;

    private Node(String id, Kind kind, String title, String subtitle, String artUrl, int mediaType, String group, Model.Track track) {
        this.id = id;
        this.kind = kind;
        this.title = title == null ? "" : title;
        this.subtitle = subtitle;
        this.artUrl = artUrl;
        this.mediaType = mediaType;
        this.group = group == null || group.isEmpty() ? null : group;
        this.track = track;
    }

    public static Node folder(String id, int mediaType, String title, String subtitle, String artUrl) {
        return new Node(id, Kind.FOLDER, title, subtitle, artUrl, mediaType, null, null);
    }

    public static Node song(String id, Model.Track track) {
        return new Node(id, Kind.SONG, track.title, track.artist.isEmpty() ? null : track.artist, track.artUrl, TYPE_MUSIC, null, track);
    }

    public static Node station(String id, String title, String subtitle, String artUrl) {
        return new Node(id, Kind.STATION, title, subtitle, artUrl, TYPE_MUSIC, null, null);
    }

    /** The same node under {@code groupTitle}. */
    public Node inGroup(String groupTitle) {
        return new Node(id, kind, title, subtitle, artUrl, mediaType, groupTitle, track);
    }

    /** The extras this node adds to the item's own: the group title, when it has one. */
    public Bundle extras() {
        Bundle extras = new Bundle();
        if (group != null) extras.putString(EXTRA_GROUP_TITLE, group);
        return extras;
    }

    /** True when the bridge has to rebuild the item to apply this node's extras or flags. */
    public boolean needsRebuild() { return group != null || kind == Kind.STATION; }
}
