package app.linkedin.extension;

/** One plain-words line for each patch, shown on its Patch status card. */
final class PatchBlurbs {
    private PatchBlurbs() {}

    static String of(String name) {
        switch (name) {
            case "Remove ads and trackers":
                return "Stops the ad and tracking add-ons built into the app.";
            case "Block advertising ID":
                return "Stops the app reading your phone's advertising ID.";
            case "Remove analytics and crash reporting":
                return "Turns off the usage and crash reports the app sends out.";
            case "Change package name":
                return "Installs the patched app next to the original instead of replacing it.";
            case "Hide ads":
                return "Removes sponsored posts from your feed.";
            case "Hide promoted jobs":
                return "Removes promoted job listings.";
            case "Hide suggested posts":
                return "Removes posts LinkedIn suggests from people you don't follow.";
            case "Hide Premium upsells":
                return "Hides the Try Premium prompts and banners.";
            case "Feed filters":
                return "Lets you hide kinds of posts, such as celebrations, polls and reposts.";
            case "Disable double-tap like":
                return "Stops a double tap from liking a post by accident.";
            case "Disable screenshot share sheet":
                return "Taking a screenshot no longer pops up LinkedIn's share sheet.";
            case "Expand posts":
                return "Opens long posts in full, without the See more tap.";
            case "Copy text":
                return "Lets you copy the text of any post or comment.";
            case "Keep feed on reopen":
                return "Keeps your place in the feed when you come back to the app.";
            case "Post menu items":
                return "Adds extra options, such as download, to the post menu.";
            case "Tap to hide in viewers":
                return "Tap a photo or video to hide or show its buttons.";
            case "Swipe between feeds":
                return "Swipe left or right to move between your feeds.";
            case "Hide the My Network tab":
                return "Removes My Network from the bottom bar.";
            case "Hide the Jobs tab":
                return "Removes Jobs from the bottom bar.";
            case "Hide the More tab":
                return "Removes More from the bottom bar.";
            case "Anonymous profile viewing":
                return "Lets you look at profiles without showing up in their viewers.";
            case "Download media":
                return "Adds a download button for photos, videos and documents.";
            case "Messaging":
                return "Extra messaging options and cleanups.";
            case "Open links directly":
                return "Skips LinkedIn's leaving-the-app warning page.";
            case "Sanitize share links":
                return "Removes tracking from the links you share.";
            case "Block tracking":
                return "Stops LinkedIn's tracking requests.";
            case "Remove gaps and dividers":
                return "Tightens the feed by removing the grey gaps and lines between posts.";
            case "Material You":
                return "Uses your wallpaper colours instead of LinkedIn blue.";
            case "GmsCore support":
                return "Lets the app sign in and work without Google Play services.";
            case "Enable premium features (Splitwise)":
                return "Unlocks Splitwise Pro features.";
            case "Hide Pro ads and upsells":
                return "Hides the Pro offers and banners.";
            case "AMOLED black (Splitwise)":
                return "Pure black background in dark mode.";
            case "GmsCore support (Splitwise)":
                return "Lets the app sign in and work without Google Play services.";
            case "Enable premium features (Truecaller)":
                return "Unlocks Truecaller Premium features.";
            case "Hide ads (Truecaller)":
                return "Removes ads from the app.";
            case "Hide after-call screen":
                return "Stops the screen that pops up after a call.";
            case "Anonymous search":
                return "Search numbers without leaving a trace.";
            case "GmsCore support (Truecaller)":
                return "Lets the app sign in and work without Google Play services.";
            case "Unlimited backup (Pixel XL)":
                return "Backs up photos at original quality, as a Pixel XL would.";
            case "Only real camera photos count as Camera":
                return "Keeps downloads and screenshots out of your Camera folder.";
            case "GmsCore support (Google Photos)":
                return "Lets the app sign in and work without Google Play services.";
            case "All codecs":
                return "Plays every video and audio format.";
            case "Skip license check":
                return "Skips the check that the Pro app was bought.";
            case "GmsCore support (MX Player Pro)":
                return "Lets the app sign in and work without Google Play services.";
            case "Remove ads (1DM)":
                return "Removes ads from 1DM.";
            case "Remove 1DM+ promotions":
                return "Hides the 1DM+ upgrade offers.";
            case "Rename to IDM+":
                return "Shows the app name as IDM+.";
            case "Remove ads (TrackChecker)":
                return "Removes ads from TrackChecker.";
            case "Remove ads (IMO)":
                return "Removes IMO's ads in chats, stories and after calls, and the pay-to-go-ad-free offer.";
            case "Allow screenshots (IMO)":
                return "Lets you take screenshots and record the screen everywhere in IMO, including protected chat media and profile photos.";
            case "Allow story recording during calls (IMO)":
                return "Lets you record and post a story while on a call.";
            case "Allow sending apps (IMO)":
                return "Shows the Apps option in the chat attachment menu.";
            case "Disappearing messages (IMO)":
                return "Turns on IMO's own disappearing-message option when you send.";
            case "Hide Premium on Me page (IMO)":
                return "Removes the paid Premium Member entry from the Me page.";
            case "Hide emoji suggestions (IMO)":
                return "Removes the row of emojis above the chat box, where one tap sends the emoji straight away.";
            case "Hide voice rooms tab (IMO)":
                return "Removes the voice rooms tab from IMO's top bar, leaving Chats and Contacts.";
            case "Spoof signature (IMO)":
                return "Makes IMO accept the patched app, so sign-in and notifications keep working.";
            case "Remove ads (ADM)":
                return "Removes ADM's ads and banners, and the Disable Ads and Telegram bars.";
            case "Unlock Tasker":
                return "Unlocks every paid feature, with no trial timer.";
            case "Enable premium features (Doc Scanner)":
                return "Unlocks Doc Scanner premium features.";
            case "Hide ads (Doc Scanner)":
                return "Removes ads from the app.";
            case "Declutter":
                return "Removes extra buttons and prompts to keep the screens clean.";
            case "GmsCore support (Doc Scanner)":
                return "Lets the app sign in and work without Google Play services.";
            case "Allow clone":
                return "Lets you install a second copy of the app.";
            default:
                return "";
        }
    }
}
