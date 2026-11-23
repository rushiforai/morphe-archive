package dev.materialtidal.extension.tidal.mediapages;

import android.view.View;

import androidx.recyclerview.widget.RecyclerView;

/**
 * Static hook bridge invoked from patched DynamicPage ({@code Album}, {@code Artist}),
 * {@code FadingToolbar}, {@code FavoriteTracksFragment}, {@code MyAlbumsView}, and
 * {@code MyArtistsView} bytecode.
 */
@SuppressWarnings("unused")
public final class ExpressiveMediaPagesBridge {

    private ExpressiveMediaPagesBridge() {
    }

    public static void onDynamicPageViewCreated(Object fragment, View rootView) {
        try {
            ExpressiveDynamicPageController.onViewCreated(fragment, rootView);
        } catch (Throwable ignored) {
        }
    }

    public static void onDynamicPageDestroyView(Object fragment) {
        try {
            ExpressiveDynamicPageController.onDestroyView(fragment);
        } catch (Throwable ignored) {
        }
    }

    public static void onFadingToolbarInit(View toolbar) {
        try {
            ExpressiveDynamicPageController.onFadingToolbarInit(toolbar);
        } catch (Throwable ignored) {
        }
    }

    public static void onFadingToolbarAlphaUpdated(View toolbar, float alphaFraction) {
        try {
            ExpressiveDynamicPageController.onFadingToolbarAlphaUpdated(toolbar, alphaFraction);
        } catch (Throwable ignored) {
        }
    }

    public static void onAlbumHeaderBound(RecyclerView.ViewHolder vh) {
        try {
            View itemView = vh != null ? vh.itemView : null;
            if (itemView != null) {
                ExpressiveAlbumHeaderController.onHeaderBound(
                        itemView,
                        ExpressiveDynamicPageController.findForDescendant(itemView)
                );
            }
        } catch (Throwable ignored) {
        }
    }

    public static void onArtistHeaderCreated(RecyclerView.ViewHolder vh) {
        try {
            View itemView = vh != null ? vh.itemView : null;
            if (itemView != null) {
                ExpressiveArtistHeaderController.onHeaderCreated(itemView);
            }
        } catch (Throwable ignored) {
        }
    }

    public static void onArtistHeaderBound(RecyclerView.ViewHolder vh) {
        try {
            View itemView = vh != null ? vh.itemView : null;
            if (itemView != null) {
                ExpressiveArtistHeaderController.onHeaderBound(
                        itemView,
                        ExpressiveDynamicPageController.findForDescendant(itemView)
                );
            }
        } catch (Throwable ignored) {
        }
    }

    public static void onMyTracksViewCreated(Object fragment, View rootView) {
        try {
            ExpressiveMyTracksController.onMyTracksViewCreated(fragment, rootView);
        } catch (Throwable ignored) {
        }
    }

    public static void onMyTracksDestroyView(Object fragment) {
        try {
            ExpressiveMyTracksController.onMyTracksDestroyView(fragment);
        } catch (Throwable ignored) {
        }
    }

    public static void onMyTracksStateUpdated(Object fragment) {
        try {
            ExpressiveMyTracksController.onMyTracksStateUpdated(fragment);
        } catch (Throwable ignored) {
        }
    }

    public static void onMyTracksMenuUpdated(Object fragment) {
        try {
            ExpressiveMyTracksController.onMyTracksMenuUpdated(fragment);
        } catch (Throwable ignored) {
        }
    }

    public static void onMyAlbumsViewCreated(View rootView) {
        try {
            ExpressiveMyTracksController.styleMyAlbums(rootView);
        } catch (Throwable ignored) {
        }
    }

    public static void onMyArtistsViewCreated(View rootView) {
        try {
            ExpressiveMyTracksController.styleMyArtists(rootView);
        } catch (Throwable ignored) {
        }
    }
}
