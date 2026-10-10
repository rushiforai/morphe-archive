package dev.twitchpatches.extension.emotes;

final class Emote {
    final String code;
    final String url;
    final boolean animated;
    final boolean overlay;

    Emote(String code, String url, boolean animated, boolean overlay) {
        this.code = code;
        this.url = url;
        this.animated = animated;
        this.overlay = overlay;
    }

    String providerLabel() {
        if (url.startsWith("https://cdn.betterttv.net/")) return "BTTV";
        if (url.startsWith("https://cdn.frankerfacez.com/")) return "FrankerFaceZ";
        return "7TV";
    }
}
