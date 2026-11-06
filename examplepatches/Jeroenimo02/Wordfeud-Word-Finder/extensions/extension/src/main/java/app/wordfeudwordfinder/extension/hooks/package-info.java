/**
 * Entry points called from the code the patches inject into Wordfeud (see patches/src/main/kotlin):
 * {@code NetworkTap} receives Cronet responses (game data), {@code RouteTap} receives Flutter platform messages
 * (current route, theme, ad banner) and remembers the FlutterJNI instance, {@code UserAgentTap} the app's User-Agent.
 * Hooks never throw and never change what the app does.
 *
 * <p>Wordfeud dependency: the hooked Java methods (checked by tools/check-apk/check_apk.py) and the message formats:
 * the game route {@code /game/<id>}, {@code SystemChrome.setSystemUIOverlayStyle} for the theme and
 * {@code dev.flutter.pigeon.wordfeud.AdApi.setBannerVisible}. When a Wordfeud update breaks the button, start here
 * (the {@code route=} line of "Copy details" shows the route that was seen).
 */
package app.wordfeudwordfinder.extension.hooks;
