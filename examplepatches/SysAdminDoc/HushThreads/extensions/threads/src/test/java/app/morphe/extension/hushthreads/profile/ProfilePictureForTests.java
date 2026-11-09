/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.profile;

import android.app.Activity;
import android.content.Context;

import org.robolectric.Robolectric;
import org.robolectric.shadows.ShadowLooper;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.BooleanSupplier;

/** Stands in for Threads' model, the screen and the network around {@link ProfilePicture}. */
public final class ProfilePictureForTests {
    /** The largest size of a profile picture, on Meta's media host. */
    static final String HD = "https://scontent-iad3-1.cdninstagram.com/v/t51.2885-19/hd_n.jpg?stp=dst-jpg";
    /** The picture Threads draws in its circle. */
    static final String SMALL = "https://scontent-iad3-1.cdninstagram.com/v/t51.2885-19/s150x150_n.jpg";

    private ProfilePictureForTests() {
    }

    /** A Threads that has loaded user "1", with a screen in front. */
    static final class FakeThreads implements ProfilePicture.Source {
        ProfilePicture.Profile profile = new ProfilePicture.Profile(HD, SMALL, "someone");
        Activity front;
        byte[] bytes;
        RuntimeException dismissFails;
        RuntimeException profileFails;
        final List<Object> dismissed = Collections.synchronizedList(new ArrayList<>());
        final List<String> fetched = Collections.synchronizedList(new ArrayList<>());

        FakeThreads(Activity front) {
            this.front = front;
        }

        @Override
        public ProfilePicture.Profile profile(Object composer, String userId) {
            if (profileFails != null) throw profileFails;
            return "1".equals(userId) ? profile : null;
        }

        @Override
        public Activity front() {
            return front;
        }

        @Override
        public byte[] fetch(Context context, String url, BooleanSupplier cancelled) {
            fetched.add(url);
            return bytes;
        }

        @Override
        public void dismiss(Object callback) {
            if (dismissFails != null) throw dismissFails;
            dismissed.add(callback);
        }
    }

    static FakeThreads install() {
        FakeThreads threads = new FakeThreads(Robolectric.buildActivity(Activity.class).setup().get());
        ProfilePicture.source = threads;
        return threads;
    }

    /** Takes the viewer down, as Close does, and puts Threads' own model back. */
    public static void reset() {
        // A viewer on its way goes up first, then down.
        ShadowLooper.idleMainLooper();
        PictureViewer up = ProfilePicture.current;
        if (up != null && up.dialog != null) up.dialog.dismiss();
        ShadowLooper.idleMainLooper();
        ProfilePicture.current = null;
        ProfilePicture.handBack = false;
        ProfilePicture.source = ProfilePicture.THREADS;
    }

    /** For the pause promise: whether opening a loaded user's picture over a screen took it from Threads. */
    public static boolean opensFullSize() {
        install();
        try {
            return ProfilePicture.open(new Object(), "1", new Object());
        } finally {
            reset();
        }
    }
}
