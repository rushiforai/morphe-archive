import android.util.JsonReader;
import java.io.StringReader;
import java.lang.reflect.*;
import java.util.*;

/** Real Android streaming parser fixtures; no provider network or app session. */
public final class ProvidersAndroidProbe {
 static Object parse(String type,String method,String json)throws Exception {
  Method m=Class.forName("io.github.jordanwoodson.extension.shared.twitch."+type).getDeclaredMethod(method,JsonReader.class);m.setAccessible(true);
  try(JsonReader reader=new JsonReader(new StringReader(json))){reader.setLenient(true);return m.invoke(null,reader);}
 }
 static Object field(Object o,String name)throws Exception{Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(o);}
 static Object call(String type,String method,Class<?>[] types,Object...args)throws Exception{Method m=Class.forName("io.github.jordanwoodson.extension.shared.twitch."+type).getDeclaredMethod(method,types);m.setAccessible(true);return m.invoke(null,args);}
 static void check(boolean b,String why){if(!b)throw new AssertionError(why);}
 static int length(Object array){return Array.getLength(array);}
 public static void main(String[]args){try{run();}catch(Throwable t){t.printStackTrace(System.out);System.exit(1);}}
 static void run()throws Exception {
  for(String method:new String[]{"parse7tvUser","parse7tvSet","parseBttvUser","parseFfz"}){
   for(String json:new String[]{"{}","[]","null","{\"unknown\":[null,{},[1]]}"})check(length(parse("TwitchEmotes",method,json))==0,method+" empty/wrong root");
  }
  String mixed="{\"emotes\":[null,7,{}, {\"id\":\"../bad\",\"name\":\"No\"},{\"id\":\"ok\",\"name\":\"two words\"},{\"id\":\"abc123\",\"name\":\"Good\",\"data\":{\"animated\":false,\"host\":{\"files\":[{\"width\":40,\"height\":20}]}}}]}";
  check(length(parse("TwitchEmotes","parse7tvSet",mixed))==1,"7TV malformed entries skipped");
  check(length(parse("TwitchEmotes","parseBttvList","[null,{}, {\"id\":\"abc123\",\"code\":\"Good\",\"imageType\":\"png\"}]"))==1,"BTTV malformed entries skipped");
  check(length(parse("TwitchEmotes","parseFfz","{\"sets\":{\"1\":{\"emoticons\":[null,{\"id\":123,\"name\":\"Good\"},{\"id\":124,\"name\":\"Overlay\",\"modifier\":true}]}}}"))==1,"FFZ modifier exclusion");
  for(String json:new String[]{"{}","null","[]","{\"id\":1,\"name\":\"Bad\",\"urls\":{\"4\":\"http://unsafe.invalid/badge\"}}"})
   check(parse("TwitchBadges","parseFfzBadge",json)==null,"invalid badge metadata");
  check(((String[])parse("TwitchBadges","parseFfzBadge","{\"id\":1,\"name\":\"Good\",\"urls\":{\"2\":\"https://cdn.frankerfacez.com/badge/1/2\"}}"))[3].endsWith("/2"),"badge 2x fallback");
  String[] user=(String[])parse("TwitchPronouns","parseUser","{\"pronoun_id\":\"hehim\",\"alt_pronoun_id\":null,\"unknown\":{\"a\":[]}}");
  check(user[0].equals("hehim")&&user[1]==null,"pronoun nullable alternate");
  Map names=(Map)parse("TwitchPronouns","parseNames","{\"bad\":null,\"empty\":{},\"hehim\":{\"subject\":\"He\",\"object\":\"Him\",\"singular\":false}}");
  check(names.size()==1&&names.containsKey("hehim"),"malformed pronoun names");
  try{parse("TwitchEmotes","parse7tvSet","{\"emotes\":[");throw new AssertionError("truncated JSON accepted");}catch(InvocationTargetException e){check(e.getCause() instanceof java.io.IOException,"truncated JSON IOException");}
  Object unicode=parse("TwitchEmotes","parse7tvSet","{\"emotes\":[{\"id\":\"wide123\",\"name\":\"😀Kappa\",\"data\":{\"animated\":true,\"host\":{\"files\":[{\"width\":40,\"height\":20}]}}}]}");
  Object wide=Array.get(unicode,0);String id=(String)field(wide,"id");
  check(field(wide,"code").equals("😀Kappa")&&id.equals("lurk7a_wide123"),"7TV Unicode name and animation metadata");
  Class<?>[] cdnTypes={String.class,boolean.class,float.class};
  check(call("TwitchEmotes","cdnUrl",cdnTypes,id,true,4f).equals("https://cdn.7tv.app/emote/wide123/2x.gif"),"animated scale capped at2");
  check(call("TwitchEmotes","cdnUrl",cdnTypes,id,false,4f).equals("https://cdn.7tv.app/emote/wide123/4x_static.png"),"animation off selects static image");
  Object bttv=parse("TwitchEmotes","parseBttvUser","{\"channelEmotes\":[{\"id\":\"one\",\"code\":\"Channel\"}],\"sharedEmotes\":[{\"id\":\"two\",\"code\":\"Shared\"}]}");
  check(length(bttv)==2&&field(Array.get(bttv,1),"code").equals("Shared"),"BTTV channel and shared lists");
  // Emote and badge info: who made or added an emote, as each service's list names them.
  Object owned=parse("TwitchEmotes","parse7tvSet","{\"emotes\":[{\"id\":\"abc1\",\"name\":\"Alias\",\"data\":{\"name\":\"Original\",\"owner\":{\"username\":\"maker\",\"display_name\":\"Maker\"}}},{\"id\":\"abc2\",\"name\":\"NoOwner\",\"data\":{\"owner\":null}}]}");
  check(field(Array.get(owned,0),"owner").equals("Maker")&&field(Array.get(owned,1),"owner")==null,"7TV owner display name");
  owned=parse("TwitchEmotes","parseBttvUser","{\"channelEmotes\":[{\"id\":\"one\",\"code\":\"Channel\"}],\"sharedEmotes\":[{\"id\":\"two\",\"code\":\"Shared\",\"user\":{\"name\":\"sharer\",\"displayName\":\"Sharer\"}}]}");
  check(field(Array.get(owned,0),"owner")==null&&field(Array.get(owned,1),"owner").equals("Sharer"),"BTTV shared emote's user");
  owned=parse("TwitchEmotes","parseFfz","{\"sets\":{\"1\":{\"emoticons\":[{\"id\":123,\"name\":\"Good\",\"owner\":{\"_id\":1,\"name\":\"potato\",\"display_name\":\"Potato\"}}]}}}");
  check(field(Array.get(owned,0),"owner").equals("Potato"),"FFZ owner display name");
  String[] badge=(String[])parse("TwitchBadges","parseFfzBadge","{\"id\":12,\"name\":\"Badge\",\"title\":\"Badge Title\",\"color\":\"#123456\",\"urls\":{\"2\":\"https://cdn.frankerfacez.com/2\",\"4\":\"https://cdn.frankerfacez.com/4\"}}");
  check(badge[0].equals("12")&&badge[2].equals("#123456")&&badge[3].endsWith("/4")&&badge[4].equals("Badge Title"),"FFZ ID color title and4x preference");
  // Badge holders are Twitch user IDs, which pass 2^31: numbers or strings, kept as 64-bit and sorted.
  long[] ids=(long[])parse("TwitchBadges","parseIds","[\"3000000000\",12,\"x\",2147483648,\"99\"]");
  check(Arrays.equals(ids,new long[]{12L,99L,2147483648L,3000000000L}),"badge holder IDs above 2^31: "+Arrays.toString(ids));
  Map<String,String[]> labels=new HashMap<>();labels.put("he",new String[]{"He","Him",""});labels.put("they",new String[]{"They","Them",""});labels.put("any",new String[]{"Any",null,"singular"});
  Class<?>[] labelTypes={Map.class,String.class,String.class};
  check(call("TwitchPronouns","label",labelTypes,labels,"he","they").equals("he/they"),"alternate pronoun label");
  check(call("TwitchPronouns","label",labelTypes,labels,"any",null).equals("any"),"singular pronoun label");
  check(call("TwitchPronouns","label",labelTypes,labels,"unknown",null)==null,"unknown pronoun remains absent");
  System.out.println("PASS actual Android provider parsers: empty/malformed/truncated payloads, Unicode-safe metadata, modifiers, badge URL/fallback and pronoun nulls");
 }
}
