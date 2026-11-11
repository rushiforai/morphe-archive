package e.e.a;
public final class RankingTabIdentity133Test {
    private static int count;
    private static void check(boolean expected,String name){
        count++;
        if(!expected)throw new AssertionError(name);
    }
    public static void main(String[] args){
        String a="https://sp.nicovideo.jp/api/ranking/genre/all?term=hour";
        String b="https://www.nicovideo.jp/ranking/genre/all?term=hour";
        check(RankingTabIdentity133.same(6,"list",a,6,"list",b),"startup vs ranking-menu URL");
        check(RankingTabIdentity133.same(6,"list",b,6,"list",b),"identical URL");
        check(RankingTabIdentity133.same(6,"list",b+"#section",6,"list",a),"fragment ignored");
        check(RankingTabIdentity133.same(6,"list",b+"&sort=popular",6,"list",
              "https://sp.nicovideo.jp/api/ranking/genre/all?sort=popular&term=hour"),"query order");
        check(!RankingTabIdentity133.same(6,"list",a,6,"list",
              "https://www.nicovideo.jp/ranking/genre/all?term=24h"),"different periods");
        check(!RankingTabIdentity133.same(6,"list",a,6,"list",
              "https://www.nicovideo.jp/ranking/genre/music?term=hour"),"different genres");
        check(!RankingTabIdentity133.same(6,"list",b+"&sort=popular",6,"list",b),"different filters");
        check(!RankingTabIdentity133.same(0,"list",a,6,"list",b),"type guard");
        check(!RankingTabIdentity133.same(6,"cache",a,6,"list",b),"screen guard");
        check(!RankingTabIdentity133.same(6,"list","https://elsewhere.test/ranking/genre/all?term=hour",6,"list",b),"host guard");
        check(!RankingTabIdentity133.same(6,"list","not a URL",6,"list",b),"malformed URL");
        check(!RankingTabIdentity133.same(6,"list","https://sp.nicovideo.jp/api/ranking/genre/",6,"list",b),"empty genre");
        check(!RankingTabIdentity133.same(6,"list","https://www.nicovideo.jp/search/video?term=hour",6,"list",b),"non ranking");
        System.out.println("PASS: "+count+" ranking identity assertions");
    }
}
