/**
 * The floating button and the overlay (Android views on top of Wordfeud's Flutter screen).
 *
 * <p>Wordfeud dependency: the look of the game screen. {@code ScreenShade}/{@code ScreenSampler} sample Wordfeud's
 * pixels to hide the button on other pages and under menus: the page background colours, the rack tile colour and
 * the board colours are constants in {@code ScreenShade} and {@code Theme}, measured on screenshots. If an update
 * changes these colours, the button disappears on the game screen (or shows on other pages): measure the new colours
 * on screenshots and update those constants (see docs/UPDATING.md).
 */
package app.wordfeudwordfinder.extension.ui;
