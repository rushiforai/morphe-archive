package app.bitchord.telegram;

import androidx.compose.runtime.ComposerImpl;
import androidx.compose.runtime.internal.ComposableLambdaImpl;
import androidx.compose.ui.graphics.painter.Painter;

import com.music.bitchord.ui.screens.SettingsSheetKt;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/** Uses the host's themed settings row. Called inside existing Column content. */
public final class TelegramUi {
    private static final Function0<Unit> OPEN =
            () -> {
                TelegramBridge.openSetup();
                return Unit.INSTANCE;
            };
    private static final Function2<ComposerImpl, Integer, Unit> CONTENT =
            (composer, flags) -> {
                row("Unofficial Telegram", composer);
                return Unit.INSTANCE;
            };
    private static final ComposableLambdaImpl GROUP_CONTENT =
            new ComposableLambdaImpl(CONTENT, false, 0x741503);

    private TelegramUi() {}

    public static void accountSection(ComposerImpl composer) {
        hostGroup(
                "Unofficial Telegram",
                Strings.t("An unofficial client using the Telegram API."),
                26f,
                GROUP_CONTENT,
                composer,
                0,
                0);
    }

    private static void row(String title, ComposerImpl composer) {
        Painter icon =
                hostPainter(TelegramBridge.resourceId("telegram_native", "drawable"), composer);
        SettingsSheetKt.SettingsRow(
                null,
                title,
                Strings.t("Sign in, search music chats and manage cache"),
                null,
                null,
                null,
                true,
                icon,
                OPEN,
                null,
                composer,
                0,
                0);
    }

    /**
     * Filled with exact host calls by Morphe; mangled Kotlin names cannot be called from Java
     * source.
     */
    public static void hostGroup(
            String header,
            String footer,
            float spacing,
            ComposableLambdaImpl content,
            ComposerImpl composer,
            int flags,
            int defaults) {
        try {
            for (java.lang.reflect.Method method : SettingsSheetKt.class.getDeclaredMethods())
                if (method.getName().startsWith("SettingsGroup")
                        && method.getParameterTypes().length == 7) {
                    method.invoke(
                            null, header, footer, spacing, content, composer, flags, defaults);
                    return;
                }
        } catch (Exception e) {
            throw new IllegalStateException("Telegram settings group unavailable", e);
        }
        throw new IllegalStateException("Telegram settings group unavailable");
    }

    public static Painter hostPainter(int resource, ComposerImpl composer) {
        return null; // Replaced with a validated host painterResource call in the distributed MPP.
    }
}
