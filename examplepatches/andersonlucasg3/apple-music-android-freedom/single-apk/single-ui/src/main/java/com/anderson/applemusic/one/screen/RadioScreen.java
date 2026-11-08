package com.anderson.applemusic.one.screen;

import android.content.Context;

import com.anderson.applemusic.one.media.ArtworkLoader;
import com.anderson.applemusic.one.media.CatalogSearch;
import com.anderson.applemusic.one.widget.Icons;

/** Rádio: grid of stations/categories with the same breadcrumb + back drill-down. */
public final class RadioScreen extends CollectionScreen {

    public RadioScreen(Context context, ScreenHost host, ArtworkLoader artwork,
                        CatalogSearch catalog) {
        super(context, host, artwork, catalog, GRID, Icons.RADIO);
    }
}
