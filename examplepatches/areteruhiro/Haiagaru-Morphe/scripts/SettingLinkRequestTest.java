package app.morphe.extension.chmate;
public final class SettingLinkRequestTest {
 static int n;static void ok(boolean b,String s){if(!b)throw new AssertionError(s);n++;}
 static void bad(String text){try{SettingLinkRequest.parse(text);throw new AssertionError("accepted: "+text);}catch(IllegalArgumentException expected){n++;}}
 public static void main(String[] args){
  for(Boolean value:new Boolean[]{null,Boolean.TRUE,Boolean.FALSE}){
   SettingLinkRequest made=new SettingLinkRequest("スレ内検索にIDを含める","DISPLAY",value),url=SettingLinkRequest.parse(made.url()),command=SettingLinkRequest.parse(made.command());
   ok(url.name.equals(made.name)&&url.category.equals("DISPLAY")&&java.util.Objects.equals(url.value,value),"URI round trip "+value);
   ok(command.name.equals(made.name)&&command.category.equals("DISPLAY")&&java.util.Objects.equals(command.value,value),"qualified command round trip "+value);
  }
  for(String action:new String[]{"true","false","open"}){SettingLinkRequest example=SettingLinkRequest.parse("Haiagaru.設定.スレ内にIDを含める."+action);ok(SettingLinkRequest.alias(example.name).equals("スレ内検索にIDを含める"),"requested example alias "+action);}
  SettingLinkRequest spaced=new SettingLinkRequest("A & B + C.テスト (任意)","",Boolean.FALSE);ok(SettingLinkRequest.parse(spaced.url()).name.equals(spaced.name),"query separators encoded, not interpreted as extra arguments");
  ok(SettingLinkRequest.parse("haiagaru://settings?name=abc").value==null,"omitted action opens only");
  ok(SettingLinkRequest.parse("Haiagaru.設定.名前に.を含む.true").name.equals("名前に.を含む"),"setting name may contain dots");
  for(String value:new String[]{null,"","Haiagaru.設定.abc","Haiagaru.設定..true","Haiagaru.設定.abc.toggle","Haiagaru.設定.abc.true.extra",
   "https://settings?name=abc&value=true","haiagaru://settings.evil/?name=abc","haiagaru://user@settings?name=abc","haiagaru://settings:443?name=abc","haiagaru://settings/path?name=abc","haiagaru://settings?name=abc#fragment",
   "haiagaru://settings?name=abc&value=true&value=false","haiagaru://settings?name=abc&name=def","haiagaru://settings?name=abc&key=hideAd","haiagaru://settings?name=abc&component=evil","haiagaru://settings?name=abc&category=INVALID","haiagaru://settings?name=%0Aabc","haiagaru://settings?name=","haiagaru://settings?name=abc&value=1","haiagaru://settings?name=%xx","haiagaru://settings?name=abc&value=TRUE"})bad(value);
  bad("Haiagaru.設定."+"a".repeat(161)+".true");bad("haiagaru://settings?name="+"a".repeat(5000));
  for(String category:SettingLinkRequest.CATEGORIES){
   SettingLinkRequest j=new SettingLinkRequest("日本語の設定名",category,null);ok(j.command().contains(SettingLinkRequest.categoryTitle(category))&&j.command().endsWith(".開く"),"Japanese command: "+category);ok(SettingLinkRequest.parse(j.command()).category.equals(category),"Japanese category alias: "+category);
  }
  ok(Boolean.TRUE.equals(SettingLinkRequest.parse("Haiagaru.設定.スレ内検索にIDを含める.オン").value),"Japanese ON alias");
  ok(Boolean.FALSE.equals(SettingLinkRequest.parse("Haiagaru.設定.スレ内検索にIDを含める.オフ").value),"Japanese OFF alias");
  System.out.println("PASS "+n+" settings link parser/round-trip/invalid-input checks");
 }
}
