package app.spicetify.extension.spotify.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

/** Snippets shaped like the Marketplace themes the rule was checked against. */
public class ThemeImagesTest {
    private static final String CSS_URL = "https://raw.githubusercontent.com/VikrantRuhela/Spicetify-Sakura-Theme/main/user.css";

    @Test
    public void readsTheGalaxyFamilysDefaultImage() {
        // Galaxy writes it with backticks, Hazy with double quotes.
        assertEquals("https://github.com/harbassan/spicetify-galaxy/blob/main/assets/default_bg.jpg?raw=true", ThemeImages.fromJs(
                "  const defImage = `https://github.com/harbassan/spicetify-galaxy/blob/main/assets/default_bg.jpg?raw=true`;\n"));
        assertEquals("https://i.imgur.com/Wl2D0h0.png",
                ThemeImages.fromJs("  const defImage = \"https://i.imgur.com/Wl2D0h0.png\";\n"));
        assertNull(ThemeImages.fromJs("const image = \"https://i.imgur.com/Wl2D0h0.png\";"));
        assertNull(ThemeImages.fromJs("const defImage = \"https://example.com/background.svg\";")); // not a raster image
    }

    @Test
    public void followsARootVariable() {
        // CyberNight
        assertEquals("https://raw.githubusercontent.com/me974974/CyberNight/main/assets/nightcity.png?v=1", ThemeImages.fromCss(
                ":root {\n    --cyan: #00F0FF;\n"
                        + "    --image_url: url(\"https://raw.githubusercontent.com/me974974/CyberNight/main/assets/nightcity.png?v=1\");\n}\n"
                        + ".Root__top-container::before {\n    content: \"\";\n    background-image: var(--image_url);\n}\n", CSS_URL));
    }

    @Test
    public void resolvesARelativeImageAfterAGradient() {
        // Sakura
        assertEquals("https://raw.githubusercontent.com/VikrantRuhela/Spicetify-Sakura-Theme/main/images/sakura-bg.jpg",
                ThemeImages.fromCss("/* Main Background */\n.Root__main-view {\n    background:\n        linear-gradient(\n"
                        + "            rgba(10,8,10,.92),\n            rgba(10,8,10,.95)\n        ),\n"
                        + "        url(\"images/sakura-bg.jpg\")\n        !important;\n    background-size: cover !important;\n}\n", CSS_URL));
    }

    @Test
    public void keepsADataUriWhoseSemicolonIsInsideTheUrl() {
        // Cyrene HSR
        String image = "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8U";
        assertEquals(image, ThemeImages.fromCss(".Root__top-container {\n  background-image: url(\"" + image
                + "\") !important;\n  background-size: cover !important;\n}\n", CSS_URL));
        // Unquoted, the semicolon is still inside the parentheses.
        assertEquals(image, ThemeImages.fromCss("body { background: url(" + image + ") center / cover; }", CSS_URL));
    }

    @Test
    public void ignoresAnOptionalSnippetsSelector() {
        // Comfy's kitty snippet only applies when the user turns it on.
        assertNull(ThemeImages.fromCss(":root #main.Comfy-kitty-Snippet .Root__main-view{background-image:url("
                + "https://raw.githubusercontent.com/Comfy-Themes/Spicetify/main/Comfy/images/kitty.png)}", CSS_URL));
    }

    @Test
    public void ignoresAnSvgNoiseOverlay() {
        assertNull(ThemeImages.fromCss("body::after {\n  content: '';\n  background-image: url(\"data:image/svg+xml,%3Csvg "
                + "viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence "
                + "type='fractalNoise'/%3E%3C/filter%3E%3Crect filter='url(%23n)'/%3E%3C/svg%3E\");\n}\n", CSS_URL));
    }

    @Test
    public void ignoresAnImageInAComment() {
        assertNull(ThemeImages.fromCss(
                "/* .Root__top-container { background-image: url(\"images/old-bg.jpg\"); } */\n", CSS_URL));
        assertNull(ThemeImages.fromCss(
                ".Root__top-container {\n  background: transparent /* url(\"images/old-bg.jpg\") */;\n}\n", CSS_URL));
    }

    @Test
    public void ignoresAnImageOnAnElementThatIsntTheWindow() {
        // CyberNight's progress bar handle
        assertNull(ThemeImages.fromCss(".progress-bar__slider,\n.x-progressBar-handle {\n    background-image: url("
                + "\"https://raw.githubusercontent.com/me974974/CyberNight/main/assets/david.png?v=1\");\n}\n", CSS_URL));
    }
}
