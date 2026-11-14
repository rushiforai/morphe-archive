package app.template.extension.settings;

final class FeatureGuide {
    private FeatureGuide() {}

    static void populate(ModSettingsView view) {
        view.header("Appearance");
        view.guideEntry("Custom artwork",
                "With Custom artwork installed, open a film’s More menu and tap Change poster and backdrop. "
                + "Pick from TMDB with a v3 API key, or paste a direct HTTPS image URL. On your own profile, use "
                + "Change backdrop. In Artwork & appearance, choose Automatic to use Letterboxd’s picker when "
                + "available, Always use local artwork to use the Mods picker, or Off to turn off local overrides.");
        view.guideEntry("Appearance and Material You",
                "With Appearance installed on Android 12+, pick Pure black (OLED) or change the Accent colour in Mods. "
                + "The separate Material You theme patch follows your wallpaper and disables OLED and the nav bar match.");
        view.guideEntry("Denser poster grid",
                "Choose the density in Morphe when you apply Denser poster grid. Tighter spacing makes the posters larger.");

        view.header("Navigation");
        view.guideEntry("Bottom navigation",
                "Under Navigation, pick Shown items, arrange them, and choose a Launch tab. "
                + "Use Bottom nav selected style to change the pill or icon. Match bottom nav to top bar to use the same surface.");

        view.header("Home Screen");
        view.guideEntry("Home tabs and Video Store",
                "Use Home tabs to choose and reorder the sections on Home. Turn on Hide Video Store to remove its promo row.");
        view.guideEntry("Sponsored Spotlight and ads",
                "Apply Hide sponsored content to hide the sponsored trailer on Films. The Spotlight switch lets you show it again. "
                + "Apply Hide ads in Morphe to stop AdMob banners in the app.");

        view.header("Film Pages");
        view.guideEntry("IMDb trivia",
                "With IMDb trivia (personal) installed on Letterboxd 3.6.7, swipe the film tabs past Releases. "
                + "Tap Trivia, use the category filters or Load more, and tap a spoiler to reveal it. "
                + "The film needs an IMDb link and a connection. The first entries can load while you browse the film page.");
        view.guideEntry("Runtime and Where to Watch",
                "Use Runtime as 1h 47m to show hours and minutes. Turn on Hide Where to Watch to remove the film’s streaming list.");
        view.guideEntry("Open in player",
                "Enable Open in player and choose Stremio or Nuvio. Install that player, then tap the icon next to Trailer on a film page.");
        view.guideEntry("Smoother credits",
                "Apply Smooth film credits tabs in Morphe. Cast and Crew show immediately once Letterboxd has loaded the credits.");

        view.header("Ratings & Spoilers");
        view.guideEntry("Hide ratings until watched",
                "Cover the community rating on unwatched film pages. Tap the cover to reveal it for that visit. "
                + "Choose the cover, animation, confetti colour, and vibration in Ratings & Spoilers.");
        view.guideEntry("Brighter Watched-by stars",
                "Apply Brighter Watched-by stars in Morphe to make ratings in the film page’s Watched by row easier to read.");

        view.header("Backup & Reset");
        view.guideEntry("Export and import",
                "Export Mods backup saves your preferences and local artwork links. Import Mods backup merges preferences "
                + "and fills empty artwork slots. Re-enter your TMDB API key to browse TMDB on another device.");
        view.guideEntry("Reset",
                "Reset settings restores your Mods preferences and keeps your artwork and TMDB key. "
                + "Reset all Morphe data also removes local artwork, the key, and temporary Mods caches.");

        view.header("FAQ");
        view.guideEntry("Why is a setting missing?",
                "Some controls need a separate patch or a specific Android version. Check your Morphe patch selection.");
        view.guideEntry("Can other people see my artwork?",
                "Local overrides show on your patched app. The native artwork picker uses your Letterboxd account.");
        view.guideEntry("Why didn’t my change show up?",
                "Follow the restart prompt when it appears. For artwork, check Artwork mode and confirm the image URL still loads.");
    }
}
