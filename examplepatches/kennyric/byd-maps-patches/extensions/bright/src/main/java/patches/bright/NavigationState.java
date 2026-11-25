package patches.bright;

import android.webkit.WebView;

import java.util.WeakHashMap;

/**
 * Per-WebView navigation generations. Each main-frame navigation advances the
 * generation; in-flight article work bound to an older generation must not
 * inject its result into the newer page. No static strong references.
 */
final class NavigationState {

    private static final class Page {
        long generation;
        String url;
    }

    private static final WeakHashMap<WebView, Page> GENERATIONS = new WeakHashMap<WebView, Page>();

    private NavigationState() {
    }

    /** Returns the generation in effect after advancing. */
    static long advance(WebView view) {
        synchronized (GENERATIONS) {
            Page page = GENERATIONS.get(view);
            // A delegate can consume a navigation without replacing the document.
            // Invalidate old article work while retaining that document's policy.
            return advance(view, page == null ? null : page.url);
        }
    }

    static long advance(WebView view, String url) {
        synchronized (GENERATIONS) {
            Page slot = GENERATIONS.get(view);
            if (slot == null) {
                slot = new Page();
                GENERATIONS.put(view, slot);
            }
            slot.url = url;
            slot.generation += 1;
            return slot.generation;
        }
    }

    static long current(WebView view) {
        synchronized (GENERATIONS) {
            Page slot = GENERATIONS.get(view);
            return slot == null ? 0 : slot.generation;
        }
    }

    /** Read the UI-thread navigation snapshot without calling WebView.getUrl on an intercept worker. */
    static String currentUrl(WebView view) {
        synchronized (GENERATIONS) {
            Page slot = GENERATIONS.get(view);
            return slot == null ? null : slot.url;
        }
    }

    /** A cancellation bound to one WebView navigation generation. */
    static final class NavigationCancel implements CancelToken {

        private final WebView view;
        private final long generation;

        NavigationCancel(WebView view, long generation) {
            this.view = view;
            this.generation = generation;
        }

        public boolean isCancelled() {
            return view == null || current(view) != generation;
        }

        public void throwIfCancelled() throws InterruptedException {
            if (isCancelled()) {
                throw new InterruptedException("navigation-generation-changed");
            }
        }
    }
}
