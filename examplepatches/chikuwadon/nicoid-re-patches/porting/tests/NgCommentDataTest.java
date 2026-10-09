package e.e.a;
import java.net.URLDecoder;import java.util.*;import org.json.*;
public final class NgCommentDataTest {
 static JSONObject row(String type,String source)throws Exception{return new JSONObject().put("type",type).put("source",source).put("serverField",42);}
 static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
 public static void main(String[] args)throws Exception{
 JSONObject word=row("word","a+b & 日本語"),user=row("id","a+b & 日本語"),command=row("command","red");JSONArray rows=new JSONArray().put(word).put(user).put(command);
 String form=NgCommentData.form("word",word.getString("source"));String[] fields=form.split("&");check(fields.length==2,"escape delimiters");check(URLDecoder.decode(fields[1].substring(7),"UTF-8").equals(word.getString("source")),"UTF-8 form round trip");
 check(NgCommentData.add(rows,word).length()==3,"duplicates stay unique");check(!NgCommentData.key(word).equals(NgCommentData.key(user)),"type belongs to identity");
 JSONArray partial=NgCommentData.remove(rows,Collections.singleton(NgCommentData.key(word)));check(partial.length()==2&&partial.getJSONObject(0).getInt("serverField")==42,"only acknowledged deletion applied; retain metadata");
 Set<String> keys=new HashSet<>(Arrays.asList(NgCommentData.key(word),NgCommentData.key(command)));JSONArray deleted=NgCommentData.remove(rows,keys);check(deleted.length()==1&&deleted.getJSONObject(0).getString("type").equals("id"),"batch delete exact identities");check(NgCommentData.items(NgCommentData.stored(deleted)).length()==1,"same native cache shape");check(NgCommentData.items("bad JSON").length()==0,"invalid cache safe");
 try{NgCommentData.form("user","x");throw new AssertionError("wrong API type accepted");}catch(IllegalArgumentException expected){}
 try{NgCommentData.form("word","  ");throw new AssertionError("empty rule accepted");}catch(IllegalArgumentException expected){}
 System.out.println("NG identity, form encoding, cache and batch deletion checks passed");
 }
}
