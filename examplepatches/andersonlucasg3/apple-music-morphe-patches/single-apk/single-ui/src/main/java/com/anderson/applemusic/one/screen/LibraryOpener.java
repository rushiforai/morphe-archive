package com.anderson.applemusic.one.screen;

import com.anderson.applemusic.one.media.CatalogResolver;
import com.anderson.applemusic.one.media.CatalogSearch;
import com.anderson.applemusic.one.media.MediaClient;

import java.util.Locale;

/**
 * Opens one item of the engine's library tree. Library rows only carry the persistent id
 * (no catalogue id), so the rich screen is reached by resolving the name
 * ({@link CatalogResolver}); a miss keeps the previous browse behaviour instead of
 * dead-ending the tap.
 *
 * <p>Shared by the Biblioteca sections/filter and the local scope of the search.
 */
public final class LibraryOpener {

    private LibraryOpener() {
    }

    public static void open(ScreenHost host, CatalogSearch catalog, MediaClient.Item item) {
        if (item == null) return;
        CatalogResolver resolver = new CatalogResolver(catalog);
        String last = CatalogResolver.lastSegment(item.id).toLowerCase(Locale.ROOT);
        if (last.startsWith("6-")) {
            resolveArtist(host, resolver, item);
            return;
        }
        if (last.startsWith("3-")) {
            resolveAlbum(host, resolver, item);
            return;
        }
        if (last.startsWith("4-")) {
            resolvePlaylist(host, resolver, item);
            return;
        }
        if (item.playable) {
            host.play(item);
            return;
        }
        host.status("Item não reproduzível");
    }

    private static void resolveArtist(final ScreenHost host, CatalogResolver resolver,
                                      final MediaClient.Item item) {
        host.status("Abrindo " + item.title + "…");
        resolver.artist(item.title, item.artworkUri, new CatalogResolver.Match() {
            @Override
            public void onMatch(String id, String artworkUrl) {
                host.openArtist(id, item.title, artworkUrl);
            }

            @Override
            public void onMiss(String message) {
                host.status("Artista sem catálogo · abrindo os álbuns da biblioteca");
                host.openCollection(item.title, item.id, false);
            }
        });
    }

    private static void resolveAlbum(final ScreenHost host, CatalogResolver resolver,
                                     final MediaClient.Item item) {
        host.status("Abrindo " + item.title + "…");
        resolver.album(item.title, item.subtitle, item.artworkUri, new CatalogResolver.Match() {
            @Override
            public void onMatch(String id, String artworkUrl) {
                host.openAlbum(id, item.title, item.subtitle, artworkUrl);
            }

            @Override
            public void onMiss(String message) {
                host.status("Álbum sem catálogo · abrindo a lista de faixas");
                host.openLibraryCollection(CollectionScreen.ALBUM, item.title, item.subtitle,
                        item.id);
            }
        });
    }

    private static void resolvePlaylist(final ScreenHost host, CatalogResolver resolver,
                                        final MediaClient.Item item) {
        host.status("Abrindo " + item.title + "…");
        resolver.playlist(item.title, item.subtitle, item.artworkUri,
                new CatalogResolver.Match() {
                    @Override
                    public void onMatch(String id, String artworkUrl) {
                        host.openPlaylist(id, item.title, item.subtitle, artworkUrl);
                    }

                    @Override
                    public void onMiss(String message) {
                        host.status("Playlist sem catálogo · abrindo a lista de faixas");
                        host.openLibraryCollection(CollectionScreen.PLAYLIST, item.title,
                                item.subtitle, item.id);
                    }
                });
    }
}
