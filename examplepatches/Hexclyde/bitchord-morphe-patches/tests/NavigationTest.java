package app.bitchord.telegram;

import androidx.compose.runtime.ComposerImpl;

import com.music.bitchord.data.sources.*;
import com.music.bitchord.ui.screens.SettingsSheetKt;

import java.util.*;

public final class NavigationTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    static SourceConfig nativeConfig() {
        return SourceRegistry.configs.getValue().stream()
                .filter(c -> c.id.equals("telegram-native"))
                .findFirst()
                .orElseThrow();
    }

    public static void main(String[] args) throws Exception {
        ComposerImpl composer = new ComposerImpl();
        TelegramUi.accountSection(composer);
        check(
                "Unofficial Telegram".equals(SettingsSheetKt.groupHeader),
                "Independent Telegram section");
        check(
                SettingsSheetKt.rows.equals(Arrays.asList("Unofficial Telegram")),
                "Account page entry");
        check(SettingsSheetKt.lastComposer == composer, "Existing composer is forwarded");
        check(SettingsSheetKt.dividers == 0, "Telegram stays outside the account card");
        SettingsSheetKt.click.invoke();
        check(TelegramBridge.setupOpens == 1, "Account entry opens native setup");
        SourceConfig youtube =
                new SourceConfig("youtube", SourceKind.YOUTUBE, "YouTube", "", true, true, false);
        SourceRegistry.configs.setValue(new ArrayList<>(Arrays.asList(youtube)));
        check(
                NativeSource.register("https://telegram.bitchord.invalid/old-session"),
                "First startup registers source");
        check(SourceRegistry.configs.getValue().size() == 2, "Existing source preserved");
        check(SourceRegistry.configs.getValue().get(0) == youtube, "Unrelated config unchanged");
        check(nativeConfig().enabled, "New source enabled");
        int writes = SourceRegistry.publications;
        check(
                !NativeSource.register("https://telegram.bitchord.invalid/old-session"),
                "Idempotent restart");
        check(SourceRegistry.publications == writes, "No redundant preference write");
        SourceConfig previous = nativeConfig();
        SourceRegistry.configs.setValue(
                new ArrayList<>(
                        Arrays.asList(
                                youtube,
                                new SourceConfig(
                                        previous.id,
                                        previous.kind,
                                        previous.label,
                                        "http://127.0.0.1:1234/legacy-token",
                                        false,
                                        true,
                                        false))));
        check(
                NativeSource.register("https://telegram.bitchord.invalid/new-session"),
                "Session changes refresh internal identifier");
        check(!nativeConfig().enabled, "Disabled source stays disabled");
        check(
                nativeConfig().baseUrl.equals("https://telegram.bitchord.invalid/new-session"),
                "Refreshed URL");
        check(SourceRegistry.configs.getValue().size() == 2, "No duplicate Telegram source");

        List<Object> edited = new ArrayList<>();
        kotlin.jvm.functions.Function1<Object, Object> editor =
                config -> {
                    edited.add(config);
                    return kotlin.Unit.INSTANCE;
                };
        kotlin.jvm.functions.Function1<Object, Object> route = SourceEditorRoute.wrap(editor);
        int opens = TelegramBridge.setupOpens;
        route.invoke(nativeConfig());
        check(
                TelegramBridge.setupOpens == opens + 1 && edited.isEmpty(),
                "Telegram source row opens Telegram settings instead of the address editor");
        route.invoke(youtube);
        check(
                edited.size() == 1
                        && edited.get(0) == youtube
                        && TelegramBridge.setupOpens == opens + 1,
                "Other sources still open the editor");
        check(
                route.equals(SourceEditorRoute.wrap(editor))
                        && route.hashCode() == SourceEditorRoute.wrap(editor).hashCode(),
                "Wrapping the same callback twice counts as unchanged for Compose");
        check(SourceEditorRoute.wrap(route) == route, "Wrapper is not wrapped twice");
        check(SourceEditorRoute.wrap(null) == null, "Missing callback stays missing");
        System.out.println(
                "PASS: "
                        + checks
                        + " setup-navigation and source-registration checks (host API fixtures).");
    }
}
