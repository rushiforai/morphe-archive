package app.morphe.extension.chmate;

import java.net.*;import java.text.Normalizer;import java.util.*;

/** Strict, side-effect-free settings link grammar. No preference names or arbitrary Intent extras. */
public final class SettingLinkRequest {
 public final String name,category;public final Boolean value;
 static final Set<String> CATEGORIES=Collections.unmodifiableSet(new HashSet<>(Arrays.asList("GENERAL","DISPLAY","POSTING","ADVANCED","CHECKER","MEDIA","SOCIAL","NG","ARCHIVE","HISTORY","BACKUP","UPLOAD","EXPERT")));
 private static final String[][] CATEGORY_NAMES={{"GENERAL","言語・基本設定"},{"DISPLAY","画面・文字の表示"},{"POSTING","書き込み"},{"ADVANCED","通信・詳しい設定"},{"CHECKER","同じID・ワッチョイの投稿を調べる"},{"MEDIA","画像・動画を見る"},{"SOCIAL","X（Twitter）の投稿表示"},{"NG","見たくない投稿を隠す（NG）"},{"ARCHIVE","保存したレス・過去のスレ"},{"HISTORY","履歴・コピーした文章"},{"BACKUP","バックアップ・機種変更"},{"UPLOAD","画像・動画を投稿する"},{"EXPERT","エキスパート設定"}};
 public SettingLinkRequest(String name,String category,Boolean value){
  if(name==null||name.matches("(?s).*[\\p{Cc}].*"))throw new IllegalArgumentException("設定名が不正です");
  this.name=normalize(name);this.category=categoryId(category);
  if(this.name.isEmpty()||this.name.length()>160||this.name.matches("(?s).*[\\p{Cc}].*")||(!this.category.isEmpty()&&!CATEGORIES.contains(this.category)))throw new IllegalArgumentException("設定名・カテゴリが不正です");
  this.value=value;
 }
 static String normalize(String text){return text==null?"":Normalizer.normalize(text,Normalizer.Form.NFKC).trim();}
 private static String categoryId(String text){if(text==null||text.isEmpty())return "";for(String[] row:CATEGORY_NAMES)if(row[0].equals(text)||normalize(row[1]).equals(normalize(text)))return row[0];return text;}
 public static String categoryTitle(String id){for(String[] row:CATEGORY_NAMES)if(row[0].equals(id))return row[1];return id;}
 public static SettingLinkRequest parse(String input){
  if(input==null||input.length()>4096)throw new IllegalArgumentException("対応していない設定リンクです");
  if(input.startsWith("Haiagaru.設定.")){
   String rest=input.substring("Haiagaru.設定.".length());int end=rest.lastIndexOf('.');if(end<=0)throw new IllegalArgumentException("設定リンクの操作がありません");
   String name=rest.substring(0,end),category="";int first=name.indexOf('.');
   if(first>0&&CATEGORIES.contains(categoryId(name.substring(0,first)))){category=categoryId(name.substring(0,first));name=name.substring(first+1);}
   return new SettingLinkRequest(name,category,action(rest.substring(end+1)));
  }
  try{
   URI u=new URI(input);if(!"haiagaru".equalsIgnoreCase(u.getScheme())||!"settings".equalsIgnoreCase(u.getHost())||u.getPort()!=-1||u.getRawUserInfo()!=null||u.getRawFragment()!=null||!(u.getRawPath()==null||u.getRawPath().isEmpty()||u.getRawPath().equals("/")))throw new IllegalArgumentException();
   Map<String,String> values=new HashMap<>();String query=u.getRawQuery();if(query==null)throw new IllegalArgumentException();
   for(String part:query.split("&",-1)){int split=part.indexOf('=');if(split<=0)throw new IllegalArgumentException();String key=URLDecoder.decode(part.substring(0,split),"UTF-8"),value=URLDecoder.decode(part.substring(split+1),"UTF-8");if(!Arrays.asList("name","category","value").contains(key)||values.put(key,value)!=null)throw new IllegalArgumentException();}
   return new SettingLinkRequest(values.get("name"),values.get("category"),action(values.getOrDefault("value","open")));
  }catch(Exception invalid){throw new IllegalArgumentException("対応していない設定リンクです");}
 }
 private static Boolean action(String text){if("true".equals(text)||"オン".equals(text))return Boolean.TRUE;if("false".equals(text)||"オフ".equals(text))return Boolean.FALSE;if("open".equals(text)||"開く".equals(text))return null;throw new IllegalArgumentException("操作は開く・true・falseで指定してください");}
 public String url(){return "haiagaru://settings?name="+encode(name)+(category.isEmpty()?"":"&category="+encode(categoryTitle(category)))+(value==null?"":"&value="+value);}
 public String command(){return "Haiagaru.設定."+(category.isEmpty()?"":categoryTitle(category)+".")+name+"."+(value==null?"開く":value.toString());}
 private static String encode(String text){try{return URLEncoder.encode(text,"UTF-8").replace("+","%20");}catch(java.io.UnsupportedEncodingException impossible){throw new AssertionError(impossible);}}
 static String alias(String text){String name=normalize(text);if(name.equals("スレ内にIDを含める"))return normalize("スレ内検索にIDを含める");if(name.equals(normalize("エッヂ記者ID：長押し/NG Threads時に追加")))return normalize("エッヂ・kenmo.org記者ID：長押し/NG Threads時に追加");if(name.equals(normalize("エッヂ記者ID：板のスレ一覧に追加")))return normalize("エッヂ・kenmo.org記者ID：板のスレ一覧に追加");return name;}
}
