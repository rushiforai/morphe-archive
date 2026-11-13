package app.morphe.extension.chmate;
import java.util.regex.*;
public final class SettingsSearchTermsTest {
    static int checks;
    static void check(boolean value,String reason){if(!value)throw new AssertionError(reason);checks++;}
    public static void main(String[] args){
        String[][] pairs={{"Cookieを板ごとに管理する","クッキー"},{"クッキーを削除","COOKIE"},
            {"動画サムネイルを生成","ｻﾑﾈ"},{"ワッチョイを検索","わっちょい"},
            {"User Agentの設定","ユーザーエージェント"},{"閲覧UA","user agent"},
            {"画像ビューアの設定","ビュワー"},{"フォルダーを選択","フォルダ"},
            {"Wi-Fiで取得","wifi"},{"検索履歴を保存","Search History"},
            {"GIFの自動再生","ジフ"},{"正規表現で置換","REGEX"},
            {"エッヂの記者ID","エッジ"},{"Twitterの投稿表示","ツイッター"},
            {"ユーザーエージェントを変更","User-Agent"},
            {"オルグ板の閲覧・板一覧","kenmo.org"},{"kenmo.orgの記者ID","オルグ板"},
            {"オルグ板の閲覧・板一覧","オル"},{"オルグ板の閲覧・板一覧","kenmo"},
            {"動画サムネイル","サム"},{"Cookieを削除","cook"}};
        for(String[] pair:pairs){
            check(SettingsSearchTerms.matches(pair[0],pair[1]),"Haiagaru alias "+pair[1]);
            check(SettingsSearchTerms.reset(Pattern.compile(Pattern.quote(pair[1]),2).matcher(""),pair[0]).find(),"native alias "+pair[1]);
        }
        check(!SettingsSearchTerms.matches("Cookieを削除","クッキー 動画"),"all search terms required");
        check(!SettingsSearchTerms.matches("画像の自動保存","クッキー"),"unrelated option stays excluded");
        Pattern query=Pattern.compile(Pattern.quote("クッキー"),2);Matcher reused=query.matcher("");
        check(SettingsSearchTerms.reset(reused,"Cookieを削除").find(),"first row");
        check(!SettingsSearchTerms.reset(reused,"動画を保存").find(),"no row-state leak");
        check(SettingsSearchTerms.reset(Pattern.compile("a.*b").matcher(""),"axxb").find(),"regex fallback preserved");
        String escaped="Cookie\\E文字";
        check(SettingsSearchTerms.reset(Pattern.compile(Pattern.quote(escaped)).matcher(""),escaped).find(),"embedded quote boundary");
        check(SettingsSearchTerms.matches("Cookieを削除","　ＣＯＯＫＩＥ　"),"NFKC and trim");
        System.out.println("Settings aliases: "+checks+" checks passed");
    }
}
