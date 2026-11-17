package e.e.a;

import java.util.Locale;

/**
 * Stable reordering of only two existing playback choices. The labels and
 * stored values always move together; all other choices keep their indices.
 * No preference keys, categories, defaults or selected values are changed.
 */
public final class PlaybackChoiceOrder270 {
 private PlaybackChoiceOrder270(){}

 private static int kind(CharSequence value,CharSequence title){
  String v=value==null?"":value.toString().toLowerCase(Locale.ROOT);
  String t=title==null?"":title.toString().toLowerCase(Locale.ROOT);
  if("popup".equals(v)||"popout".equals(v)||"floating".equals(v)||
     t.contains("ポップアップ")||t.contains("popup")||
     t.contains("懸浮")||t.contains("悬浮")||t.contains("浮動"))return 1;
  if("background".equals(v)||"bg".equals(v)||
     t.contains("バックグラウンド")||t.contains("background")||
     t.contains("背景播放")||t.contains("背景"))return 2;
  return 0;
 }

 public static boolean reorder(CharSequence[] labels,CharSequence[] values){
  if(labels==null||values==null||labels.length!=values.length)return false;
  int popup=-1,background=-1;
  for(int i=0;i<values.length;i++){
   int type=kind(values[i],labels[i]);
   if(type==1){if(popup>=0)return false;popup=i;}
   if(type==2){if(background>=0)return false;background=i;}
  }
  if(popup<0||background<0||popup<background)return false;
  CharSequence temp=labels[popup];
  labels[popup]=labels[background];labels[background]=temp;
  temp=values[popup];
  values[popup]=values[background];values[background]=temp;
  return true;
 }

 /** Validate the target order without modifying anything. */
 public static boolean ordered(CharSequence[] labels,CharSequence[] values){
  if(labels==null||values==null||labels.length!=values.length)return false;
  int popup=-1,background=-1;
  for(int i=0;i<values.length;i++){
   int kind=kind(values[i],labels[i]);
   if(kind==1){if(popup>=0)return false;popup=i;}
   if(kind==2){if(background>=0)return false;background=i;}
  }
  return popup<0||background<0||popup<background;
 }
}
