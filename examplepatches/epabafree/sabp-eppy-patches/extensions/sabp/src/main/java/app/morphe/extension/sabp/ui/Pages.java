package app.morphe.extension.sabp.ui;

/** Creates pages from their key so the activity can rebuild its back stack. */
public final class Pages {
    private Pages() {
    }

    public static Page create(Host host, String key, String arg) {
        switch (key) {
            case DiagnosticsPage.KEY:
                return new DiagnosticsPage(host);
            case PlayerSettingsPage.KEY:
                return new PlayerSettingsPage(host);
            case BookmarksPage.KEY:
                return new BookmarksPage(host);
            case HistoryPage.KEY:
                return new HistoryPage(host);
            case StatisticsPage.KEY:
                return new StatisticsPage(host);
            case CharactersPage.KEY:
                return new CharactersPage(host);
            default:
                return null;
        }
    }
}
