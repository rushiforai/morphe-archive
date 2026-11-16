package app.morphe.extension.chmate;

public final class Ff5chAdRulesTest {
    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        check(Ff5chAdRules.searchPage("https://ff5ch.syoboi.jp/?q=%E3%83%86%E3%82%B9%E3%83%88"), "actual search URL");
        check(!Ff5chAdRules.searchPage("https://ff5ch.syoboi.jp.example.org/?q=test"), "only exact document host");
        check(!Ff5chAdRules.searchPage("https://ff5ch.syoboi.jp@example.org/"), "userinfo is not an origin");
        check(Ff5chAdRules.adResource("https://js.ad-stir.com/js/adstir.js"), "AdStir script");
        check(Ff5chAdRules.adResource("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"), "Google script");
        check(Ff5chAdRules.adResource("https://googleads.g.doubleclick.net/pagead/ads"), "Google ad frame");
        check(!Ff5chAdRules.adResource("https://ff5ch.syoboi.jp/?alt=tsv&q=test"), "first-party search");
        check(!Ff5chAdRules.adResource("https://egg.5ch.io/test/read.cgi/android/123/"), "thread link");
        check(!Ff5chAdRules.adResource("https://notad-stir.com/script"), "require domain boundary");
        check(!Ff5chAdRules.adResource("data:text/html,example"), "non-HTTP response");
        System.out.println("PASS 10 ff5ch ad scope checks");
    }
}
