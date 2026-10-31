/* Copyright 2026 BDCrusher. GPL-3.0. Drag interaction adapted from Morphe LyricsOrderedListPreference. */
package app.bdcrusher.ytmusic.lyrics;
import android.content.*;
import android.preference.Preference;
import android.view.*;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.*;
import android.graphics.drawable.Drawable;
import android.util.Xml;
import org.json.*;
import app.morphe.extension.shared.theme.ThemeUtils;
@SuppressWarnings("deprecation")
public final class LyricsSourceOrderPreference extends Preference {
    private final java.util.List<JSONObject> items=new java.util.ArrayList<>();
    private final java.util.Set<String> disabled=new java.util.HashSet<>();
    private LinearLayout rows;
    private int dragging=-1;
    private long lastScroll;
    public LyricsSourceOrderPreference(Context c){super(c);setKey("bdcrusher_source_order");setSelectable(false);setPersistent(false);
        JSONObject catalog=LyricsConfig.catalog(c);JSONArray all=catalog.optJSONArray("providers"),order=LyricsConfig.order(c);
        for(int i=0;i<order.length();i++)for(int j=0;j<all.length();j++)if(order.optString(i).equals(all.optJSONObject(j).optString("key")))items.add(all.optJSONObject(j));
        try{JSONArray d=new JSONArray(LyricsConfig.preferences(c).getString("disabled","[]"));for(int i=0;i<d.length();i++)disabled.add(d.optString(i));}catch(Exception ignored){}
    }
    private int dp(int n){return Math.round(n*getContext().getResources().getDisplayMetrics().density);}
    // This preference owns its entire row; stock Preference layout/widget inflation is unused.
    @android.annotation.SuppressLint("MissingSuperCall")
    @Override protected View onCreateView(ViewGroup parent){
        LinearLayout box=new LinearLayout(getContext());box.setOrientation(LinearLayout.VERTICAL);box.setPadding(dp(16),dp(6),dp(16),dp(6));
        TextView hint=new TextView(getContext());hint.setText("Source priority\nDrag the handle to reorder. Top is most preferred.");hint.setTextColor(ThemeUtils.getAppForegroundColor());hint.setPadding(0,dp(8),0,dp(12));box.addView(hint);
        rows=new LinearLayout(getContext());rows.setOrientation(LinearLayout.VERTICAL);box.addView(rows);rebuild();
        Button reset=new Button(getContext());reset.setText("Reset Better Lyrics defaults");reset.setOnClickListener(v->{items.clear();JSONArray all=LyricsConfig.catalog(getContext()).optJSONArray("providers");for(int i=0;i<all.length();i++)items.add(all.optJSONObject(i));disabled.clear();save();rebuild();});box.addView(reset);
        app.bdcrusher.ytmusic.common.FeaturePreferences.card(box,false);return box;
    }
    private Drawable icon(String type){try(var in=getContext().getAssets().open("bdcrusher-lyrics/bd_lyrics_"+type+".xml")){org.xmlpull.v1.XmlPullParser p=Xml.newPullParser();p.setInput(in,"UTF-8");return Drawable.createFromXml(getContext().getResources(),p,getContext().getTheme());}catch(Exception ex){return null;}}
    private void rebuild(){if(rows==null)return;rows.removeAllViews();
        for(int i=0;i<items.size();i++){final int index=i;JSONObject p=items.get(i);String id=p.optString("key"),name=p.optString("name"),type=p.optString("type");
            LinearLayout row=new LinearLayout(getContext());row.setGravity(Gravity.CENTER_VERTICAL);row.setMinimumHeight(dp(64));row.setPadding(0,dp(4),0,dp(4));
            TextView handle=new TextView(getContext());handle.setText("☰");handle.setTextColor(ThemeUtils.getAppForegroundColor());handle.setGravity(Gravity.CENTER);handle.setContentDescription("Drag "+name+" "+type);
            row.addView(handle,new LinearLayout.LayoutParams(dp(40),dp(48)));
            handle.setOnLongClickListener(v->{dragging=index;v.startDragAndDrop(ClipData.newPlainText("lyrics-provider",id),new View.DragShadowBuilder(row),LyricsSourceOrderPreference.this,0);return true;});
            row.setOnDragListener((v,event)->{if(event.getLocalState()!=this)return false;if(event.getAction()==DragEvent.ACTION_DRAG_LOCATION){
                android.view.ViewParent parent=row.getParent();while(parent!=null&&!(parent instanceof android.widget.ListView))parent=parent.getParent();
                if(parent instanceof android.widget.ListView list){int[] a=new int[2],b=new int[2];row.getLocationOnScreen(a);list.getLocationOnScreen(b);float y=a[1]+event.getY()-b[1];long now=android.os.SystemClock.uptimeMillis();
                    if(now-lastScroll>100&&(y<dp(48)||y>list.getHeight()-dp(48))){list.smoothScrollBy(y<dp(48)?-dp(48):dp(48),100);lastScroll=now;}}
            }if(event.getAction()==DragEvent.ACTION_DROP){move(dragging,index);dragging=-1;}return true;});
            ImageView image=new ImageView(getContext());image.setImageDrawable(icon(type));image.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);row.addView(image,new LinearLayout.LayoutParams(dp(24),dp(24)));
            TextView label=new TextView(getContext());label.setText(name+"\n"+type);label.setTextSize(14);label.setTextColor(ThemeUtils.getAppForegroundColor());label.setPadding(dp(10),0,dp(8),0);row.addView(label,new LinearLayout.LayoutParams(0,-2,1));
            Switch toggle=new Switch(getContext());toggle.setChecked(!disabled.contains(id));toggle.setContentDescription(name+" "+type+" enabled");
            toggle.setOnCheckedChangeListener((v,on)->{if(on)disabled.remove(id);else disabled.add(id);save();});row.addView(toggle);
            row.setAccessibilityDelegate(new View.AccessibilityDelegate(){
                @Override public void onInitializeAccessibilityNodeInfo(View host,AccessibilityNodeInfo info){super.onInitializeAccessibilityNodeInfo(host,info);info.addAction(new AccessibilityNodeInfo.AccessibilityAction(0x02000001,"Move up"));info.addAction(new AccessibilityNodeInfo.AccessibilityAction(0x02000002,"Move down"));}
                @Override public boolean performAccessibilityAction(View host,int action,android.os.Bundle args){if(action==0x02000001){move(index,index-1);return true;}if(action==0x02000002){move(index,index+1);return true;}return super.performAccessibilityAction(host,action,args);}
            });rows.addView(row);
        }
    }
    private void move(int from,int to){if(from<0||to<0||from>=items.size()||to>=items.size()||from==to)return;items.add(to,items.remove(from));save();rebuild();rows.announceForAccessibility("Source moved to position "+(to+1));}
    private void save(){JSONArray order=new JSONArray(),off=new JSONArray();for(JSONObject item:items)order.put(item.optString("key"));for(String id:disabled)off.put(id);LyricsConfig.preferences(getContext()).edit().putInt("catalogSchema",2).putString("priority",LyricsSettingsPage.join(order)).putString("disabled",off.toString()).apply();}
}

