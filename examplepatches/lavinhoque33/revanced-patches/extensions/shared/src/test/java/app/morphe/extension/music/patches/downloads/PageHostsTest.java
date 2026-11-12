/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import org.junit.Test;

public class PageHostsTest {
    private final Object controller = new Object();
    private final Object downloads = new Object();
    private final Object playlist = new Object();

    @Test public void theStartedPageThatLoadedTheDownloadsPageIsTheDownloadsPage() {
        PageHosts hosts = new PageHosts();
        hosts.started(controller, downloads);

        hosts.downloadsLoaded();

        assertSame(downloads, hosts.startedDownloadsPage());
    }

    @Test public void aPageThatNeverLoadedTheDownloadsPageIsNotOne() {
        PageHosts hosts = new PageHosts();
        hosts.started(controller, playlist);

        assertNull(hosts.startedDownloadsPage());
    }

    @Test public void aStoppedPageIsNotOnScreenAndIsTheDownloadsPageAgainWhenItStarts() {
        PageHosts hosts = new PageHosts();
        hosts.started(controller, downloads);
        hosts.downloadsLoaded();

        hosts.stopped(controller);
        assertNull(hosts.startedDownloadsPage());

        hosts.started(controller, playlist);
        assertNull(hosts.startedDownloadsPage());

        hosts.stopped(controller);
        hosts.started(controller, downloads);
        assertSame(downloads, hosts.startedDownloadsPage());
    }

    @Test public void aStopOfAnotherControllerChangesNothing() {
        PageHosts hosts = new PageHosts();
        hosts.started(controller, downloads);
        hosts.downloadsLoaded();

        hosts.stopped(new Object());

        assertSame(downloads, hosts.startedDownloadsPage());
    }

    @Test public void aLoadBeforeAnyStartMarksTheNextPageToStart() {
        PageHosts hosts = new PageHosts();
        hosts.downloadsLoaded();

        hosts.started(controller, downloads);

        assertSame(downloads, hosts.startedDownloadsPage());
        hosts.stopped(controller);
        hosts.started(controller, playlist);
        assertNull(hosts.startedDownloadsPage());
    }
}
