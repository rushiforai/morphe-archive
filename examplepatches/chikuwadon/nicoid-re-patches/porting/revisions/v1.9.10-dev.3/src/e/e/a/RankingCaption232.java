package e.e.a;
import android.app.Activity;import android.content.*;import android.net.Uri;
/** The ranking URI owns its period; never inherit a caption from the previous list. */
public final class RankingCaption232 {
 static final String[] TERMS={"hour","24h","week","month","total"};
 static final String[] RES={"rankingSorthourly","rankingSortdaily","rankingSortweekly","rankingSortmonthly","rankingSorttotal"};
 static final String[] JA={"毎時","24時間","週間","月間","全期間"};
 static final String[] EN={"Hourly","24-hour","Weekly","Monthly","All-time"};
 static final String[] ZH={"每小時","24小時","每週","每月","歷來"};
 static String caption(Context c,Uri uri,int type){if(c==null||uri==null||type!=6)return null;String path=uri.getPath();if(path==null||!path.contains("/ranking/"))return null;String term=uri.getQueryParameter("term");int at=-1;for(int n=0;n<TERMS.length;n++)if(TERMS[n].equals(term)){at=n;break;}if(at<0)return null;String label=null;int id=c.getResources().getIdentifier(RES[at],"string",c.getPackageName());if(id!=0)label=UiStrings.translate(c.getString(id));if(label==null||label.isEmpty())label=PanelUi.tr(c,JA[at],EN[at],ZH[at]);return label+" "+PanelUi.tr(c,"ランキング","ranking","排行榜");}
 public static CharSequence subtitle(Object owner,CharSequence fallback){try{Activity a=(Activity)MultiTabs227.get(owner,"o0");String text=caption(a,Uri.parse(String.valueOf(MultiTabs227.get(owner,"d0"))),((Number)MultiTabs227.get(owner,"g0")).intValue());return text==null?fallback:text;}catch(Exception e){return fallback;}}
 public static void refresh(Object owner){try{Activity a=(Activity)MultiTabs227.get(owner,"o0");String text=caption(a,Uri.parse(String.valueOf(MultiTabs227.get(owner,"d0"))),((Number)MultiTabs227.get(owner,"g0")).intValue());if(text==null)return;MultiTabs227.set(owner,"f0",text);TabChrome228.subtitle(MultiTabs227.get(a,"t"),text,owner);}catch(Exception e){android.util.Log.w("nicoid-ranking","Cannot refresh period caption",e);}}
 public static void intent(Intent i,Activity a){if(i==null)return;String text=caption(a,i.getData(),i.getIntExtra("type",6));if(text!=null)i.putExtra("subtitle",text);}
}
