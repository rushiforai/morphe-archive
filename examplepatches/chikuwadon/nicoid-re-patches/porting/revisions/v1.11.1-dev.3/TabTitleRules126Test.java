package e.e.a;
public final class TabTitleRules126Test {
    private static int n;
    private static void eq(String expected,String actual,String description) {
        n++;
        if(!expected.equals(actual)) throw new AssertionError(description+": "+actual);
    }
    public static void main(String[] args) {
        String saved="https://www.nicovideo.jp/mylist/45354006";
        String canonical="https://nvapi.nicovideo.jp/v2/mylists/45354006?pageSize=500";
        String full="ハメタルギアライジングッ！戦闘くサイボーグと化した先輩";
        eq("45354006",TabTitleRules126.id(saved),"public mylist");
        eq("45354006",TabTitleRules126.id(canonical),"nvapi list");
        eq("",TabTitleRules126.id("https://evil.com/mylist/45354006"),"foreign host rejected");
        eq(full,TabTitleRules126.chosen(saved,canonical,"nicoid Re",full),"late title");
        eq(full,TabTitleRules126.chosen(saved,canonical,"",full),"blank title");
        eq("お気に入り",TabTitleRules126.chosen(saved,canonical,"お気に入り",full),"custom name preserved");
        eq("nicoid Re",TabTitleRules126.chosen(saved,canonical,"nicoid Re","動画"),"placeholder rejected");
        eq("nicoid Re",TabTitleRules126.chosen(saved,
            "https://nvapi.nicovideo.jp/v2/mylists/12345?pageSize=500","nicoid Re",full),
            "stale response rejected");
        eq("nicoid Re",TabTitleRules126.chosen("https://www.nicovideo.jp/search/video?keyword=x",canonical,"nicoid Re",full),
            "unrelated tab");
        eq(full,TabTitleRules126.chosen(saved,canonical,"nicoid Re","  "+full+"  "),"trim title");
        System.out.println("PASS: "+n+" public mylist title / custom labels / stale result tests");
    }
}
