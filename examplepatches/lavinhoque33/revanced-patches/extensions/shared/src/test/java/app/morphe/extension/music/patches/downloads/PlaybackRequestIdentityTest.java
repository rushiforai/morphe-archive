/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public final class PlaybackRequestIdentityTest {
    private static final class Request implements PlaybackRequestIdentity.Request {
        private Object origin;

        @Override
        public Object rvxRequestOrigin() {
            return origin;
        }

        @Override
        public void rvxRequestOrigin(Object request) {
            origin = request;
        }
    }

    @Test
    public void olderUnwrappedRequestsRetainObjectIdentity() {
        Object request = new Object();
        assertTrue(PlaybackRequestIdentity.same(request, request));
        assertFalse(PlaybackRequestIdentity.same(request, new Object()));
    }

    @Test
    public void nativeCopyRetainsItsOriginalRequest() {
        Request original = new Request();
        Request copy = new Request();
        assertSame(copy, PlaybackRequestIdentity.inherit(copy, original));
        assertTrue(PlaybackRequestIdentity.same(original, copy));
        assertTrue(PlaybackRequestIdentity.same(copy, original));
    }

    @Test
    public void copyOfCopyUsesOneCanonicalOrigin() {
        Request original = new Request();
        Request first = new Request();
        Request second = new Request();
        PlaybackRequestIdentity.inherit(first, original);
        PlaybackRequestIdentity.inherit(second, first);
        assertSame(original, second.origin);
        assertTrue(PlaybackRequestIdentity.same(first, second));
    }

    @Test
    public void unrelatedOccurrencesAreNeverMerged() {
        Request first = new Request();
        Request second = new Request();
        Request copy = new Request();
        PlaybackRequestIdentity.inherit(copy, first);
        assertFalse(PlaybackRequestIdentity.same(first, second));
        assertFalse(PlaybackRequestIdentity.same(copy, second));
    }

    @Test
    public void unchangedFactoryResultDoesNotCreateSelfLink() {
        Request original = new Request();
        assertSame(original, PlaybackRequestIdentity.inherit(original, original));
        assertNull(original.origin);
    }
}
