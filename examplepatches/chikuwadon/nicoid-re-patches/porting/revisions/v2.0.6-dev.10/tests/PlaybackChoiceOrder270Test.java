package e.e.a;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/** Three-language, five-preference regression: neither keys nor values vanish. */
public final class PlaybackChoiceOrder270Test {
 private static void check(boolean ok,String why){
  if(!ok)throw new AssertionError(why);
 }
 private static String[] codes={
   "videolist_tap","intent_type","nicoid_external_link_back",
   "app_switch_playback","back_playback"
 };
 private static String[][] labels={
   {"ポップアップ再生","バックグラウンド再生","動画情報","全画面再生"},
   {"Popup playback","Background playback","Video info","Fullscreen playback"},
   {"懸浮播放","背景播放","影片資訊","全螢幕播放"}
 };
 private static void exercise(String key,String popup,String background,String info,
                              String fullscreen){
  CharSequence[] values={"normal","background","info","nicoid_fullscreen262",
                         "popup","stop"};
  CharSequence[] entries={"動画再生",background,info,fullscreen,popup,"停止"};
  if("nicoid_external_link_back".equals(key)){
   values=new CharSequence[]{"inherit","stop","background","popup","nicoid"};
   entries=new CharSequence[]{"毎回選択する","停止",background,popup,"戻る"};
  }
  if("app_switch_playback".equals(key)){
   values=new CharSequence[]{"none","background","popup"};
   entries=new CharSequence[]{"何もしない",background,popup};
  }
  if("back_playback".equals(key)){
   values=new CharSequence[]{"normal","background","popup","nicoid"};
   entries=new CharSequence[]{"通常",background,popup,"戻る"};
  }
  Map<String,String> original=new HashMap<>();
  Set<String> originalCodes=new HashSet<>();
  for(int i=0;i<values.length;i++){
   String k=values[i].toString();
   check(originalCodes.add(k),"Duplicate original value: "+key);
   original.put(k,entries[i].toString());
  }
  String selected=values[Math.min(1,values.length-1)].toString();
  boolean changed=PlaybackChoiceOrder270.reorder(entries,values);
  check(changed,"Expected background/pop-up order swap: "+key);
  check(PlaybackChoiceOrder270.ordered(entries,values),"Popup must be before background: "+key);
  check(!PlaybackChoiceOrder270.reorder(entries,values),"Reordering must be idempotent: "+key);
  check(entries.length==original.size()&&values.length==original.size(),
        "One or more options deleted/duplicated: "+key);
  Set<String> after=new HashSet<>();
  for(int i=0;i<values.length;i++){
   String value=values[i].toString();
   check(after.add(value),"Duplicate after reordering: "+key);
   check(original.get(value).equals(entries[i].toString()),
         "Label and storage value separated: "+key+" "+value);
  }
  check(after.equals(originalCodes),"Option set changed: "+key);
  check(after.contains(selected),"Saved selection lost: "+key);
  if(originalCodes.contains("nicoid_fullscreen262"))
   check(after.contains("nicoid_fullscreen262"),"Fullscreen option deleted");
 }
 public static void main(String[] args){
  for(String key:codes){
   for(String[] language:labels){
    exercise(key,language[0],language[1],language[2],language[3]);
   }
  }
  CharSequence[] labels={"動画再生","ポップアップ再生","バックグラウンド再生"};
  CharSequence[] values={"normal","popup","background"};
  check(!PlaybackChoiceOrder270.reorder(labels,values),"Existing correct order moved");
  CharSequence[] noPair={"none","popup"};
  check(!PlaybackChoiceOrder270.reorder(noPair.clone(),noPair.clone()),
        "Missing background must not move anything");
  // Native preference IDs can be integers; labels identify their semantics.
  CharSequence[] numericLabels={"背景播放","懸浮播放"};
  CharSequence[] numericValues={"2","3"};
  check(PlaybackChoiceOrder270.reorder(numericLabels,numericValues),
        "Chinese translations with numeric native entry values");
  check("3".equals(numericValues[0].toString()),"Native numeric code corrupted");
  System.out.println("PASS: 5 settings, 3 languages, no deleted, duplicated or reordered non-target values");
 }
}
