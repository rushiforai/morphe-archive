/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.profile;

import android.util.SparseArray;

import java.util.Arrays;
import java.util.List;

/** Bloks nodes as the profile notes hook sees them, played by stand-ins with the same attribute field. */
public final class ProfileNotesForTests {
    private ProfileNotesForTests() {
    }

    /** Stands in for the Bloks node class: its attributes in a SparseArray, keyed the way Bloks keys them. */
    public static class Node {
        private final SparseArray<Object> attributes = new SparseArray<>();

        Node with(int key, Object value) {
            attributes.put(key, value);
            return this;
        }
    }

    /** A subclass of the node, the way the async-fetch node extends it on 584. */
    public static final class FetchNode extends Node {
    }

    /** The bubble on your own profile: its tap action names the self-note action. */
    static Node ownBubble() {
        return new Node().with(0x2d, "(bk.action.bloks.AsyncAction \"com.bloks.www.bloks.profile.note.self_note.tap_action.async\" "
                + "(bk.action.map.Make (bk.action.array.Make \"entrypoint\") (bk.action.array.Make \"profile_notes_bubble\")))");
    }

    /** The node that loads a bubble's content. */
    static Node bubbleFetch() {
        return new FetchNode().with(0x29, "(bk.action.bloks.AsyncAction \"com.bloks.www.bloks.profile.async.fetch.note_bubble\" "
                + "(bk.action.map.Make (bk.action.array.Make \"is_viewing_self\") (bk.action.array.Make true)))");
    }

    /** A profile picture, a node with no note action of its own. */
    static Node picture() {
        return new Node().with(0x23, "profile_picture").with(0x31, 42);
    }

    /**
     * The three nodes stacked over a profile picture, asked about the way the patched getter asks.
     * True when the bubble went, which is the switch changing what Facebook would have drawn.
     */
    public static boolean hidesANote() {
        Node bubble = ownBubble();
        List<?> kept = ProfileNotes.children(Arrays.asList(picture(), picture(), bubble));
        return kept.size() == 2 && !kept.contains(bubble);
    }
}
