/* Copyright 2026 BDCrusher. GPL-3.0. Compile-only bridge; official classes are never bundled by the add-on. */
package app.bdcrusher.ytmusic.lyrics;
import app.morphe.extension.shared.patches.components.Filter;
import app.morphe.extension.music.patches.components.LyricsPanelFilter;
import app.morphe.extension.music.patches.lyrics.requests.LyricsProvider;
import app.morphe.extension.music.patches.lyrics.LyricsProviders;
public final class NativeLyricsBridge {
    private NativeLyricsBridge(){}
    public static java.util.List<LyricsProvider> providersInOrder(String ignored){return LyricsProviders.providersInOrder("YTMusic,Captions");}
    public static Filter[] withLyricsFilter(Filter[] original){
        for(Filter f:original)if(f instanceof LyricsPanelFilter)return original;
        Filter[] copy=java.util.Arrays.copyOf(original,original.length+1);copy[original.length]=new LyricsPanelFilter();return copy;
    }
}


