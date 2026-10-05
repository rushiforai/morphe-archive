package e.e.a;
import android.view.*;import android.widget.*;import android.util.TypedValue;
public final class PopupOverlay {
 private static final String STRIP="popup-controls-surface";
 private static View find(View root,String name){return root.findViewById(root.getResources().getIdentifier(name,"id",root.getContext().getPackageName()));}
 public static void attach(View root){View menu=find(root,"topmenulay");if(!(menu instanceof RelativeLayout))return;
  if(root.findViewWithTag(STRIP)==null){View strip=new View(root.getContext());strip.setTag(STRIP);strip.setBackgroundColor(0xaa000000);RelativeLayout.LayoutParams p=new RelativeLayout.LayoutParams(-1,1);p.addRule(RelativeLayout.ALIGN_PARENT_TOP);((RelativeLayout)menu).addView(strip,0,p);root.addOnLayoutChangeListener((v,l,t,r,b,ol,ot,or,ob)->update(root));}
  root.post(()->update(root));
 }
 private static void size(View v,int w,int h){if(v==null)return;ViewGroup.LayoutParams p=v.getLayoutParams();if(p.width!=w||p.height!=h){p.width=w;p.height=h;v.setLayoutParams(p);}v.setPadding(0,0,0,0);v.setMinimumHeight(0);v.setMinimumWidth(0);if(v instanceof TextView){TextView text=(TextView)v;text.setGravity(Gravity.CENTER);text.setIncludeFontPadding(false);text.setMinHeight(0);text.setMinWidth(0);text.setShadowLayer(0,0,0,0);text.setTextSize(TypedValue.COMPLEX_UNIT_PX,h*.34f);}}
 private static void update(View root){View video=find(root,"videoLayout"),menu=find(root,"topmenulay");if(video==null||menu==null||video.getWidth()==0||video.getHeight()==0)return;float density=root.getResources().getDisplayMetrics().density;int h=OverlayRules.toolbar(video.getWidth(),video.getHeight(),density);int slot=OverlayRules.slot(h);menu.setPadding(0,0,0,0);
  View strip=root.findViewWithTag(STRIP);if(strip!=null){ViewGroup.LayoutParams p=strip.getLayoutParams();if(p.height!=h){p.height=h;strip.setLayoutParams(p);}}
  for(String name:new String[]{"infobutton","commentbutton","fullscbutton"})size(find(root,name),slot,h);
  View row=root.findViewWithTag("popup-modern-controls");if(row instanceof LinearLayout){ViewGroup.LayoutParams p=row.getLayoutParams();if(p.height!=h){p.height=h;row.setLayoutParams(p);}LinearLayout group=(LinearLayout)row;for(int i=0;i<group.getChildCount();i++)size(group.getChildAt(i),slot,h);}
  View play=find(root,"viewbutton");int central=OverlayRules.central(video.getHeight(),density);size(play,central,central);PlayerIcons.center(root);
 }
}
