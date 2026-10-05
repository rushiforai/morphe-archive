package e.e.a;
import android.content.res.ColorStateList;
import android.graphics.*;
import android.graphics.drawable.*;
import android.util.TypedValue;
import android.view.*;
/** Resolution-independent player symbols, with resource-driven state preserved. */
public final class PlayerIcons {
 private static boolean supported(String n){return java.util.Arrays.asList("play","pause","prev","next","popup","repeaton","repeatoff","commenton","commentoff","commentpost","info","fullscreen","fullscreenoff","fullscreenon","exitfullscreen").contains(n);}
 public static void background(View v,int resource){String name="";try{name=v.getResources().getResourceEntryName(resource);}catch(Exception ignored){}if(!supported(name)){v.setBackgroundResource(resource);return;}apply(v,name);}
 public static Drawable gestureIcon(int target){return new Icon(target==1?"volume":"brightness",false);}
 public static void symbol(View v,String name){apply(v,name);}
 private static void apply(View v,String name){TypedValue a=new TypedValue();v.getContext().getTheme().resolveAttribute(0x7f03005e,a,true);int accent=a.resourceId==0?a.data:v.getResources().getColor(a.resourceId);Icon icon=new Icon(name,!(v.getParent() instanceof android.widget.RelativeLayout));GradientDrawable mask=new GradientDrawable();mask.setColor(Color.WHITE);mask.setShape(GradientDrawable.OVAL);v.setBackgroundTintList(null);v.setBackground(new RippleDrawable(ColorStateList.valueOf((accent&0xffffff)|0x55000000),icon,mask));}
 public static void attach(View root){if(root==null)return;String pkg=root.getContext().getPackageName();String[][] icons={{"viewbutton","play"},{"prevbutton","prev"},{"nextbutton","next"},{"popupbutton","popup"},{"repeatbutton","repeaton"},{"commentbutton","commentoff"},{"fullscbutton","fullscreen"},{"commentpostbutton","commentpost"},{"infobutton","info"}};for(String[] entry:icons){View v=root.findViewById(root.getResources().getIdentifier(entry[0],"id",pkg));if(v!=null&&!(v.getBackground() instanceof RippleDrawable))apply(v,entry[1]);}if(!(root instanceof PopupPinchLayout)){View container=find(root,"viewctrllay");if(container!=null&&!"centered-play-control".equals(container.getTag())){container.setTag("centered-play-control");root.addOnLayoutChangeListener((v,l,t,r,b,ol,ot,or,ob)->normalCenter(root));}root.post(()->normalCenter(root));}}
 private static View find(View root,String name){return root.findViewById(root.getResources().getIdentifier(name,"id",root.getContext().getPackageName()));}
 private static void normalCenter(View root){View video=find(root,"videoLayout"),play=find(root,"viewbutton");if(video==null||play==null)return;float density=root.getResources().getDisplayMetrics().density;boolean full=root.getResources().getConfiguration().orientation==android.content.res.Configuration.ORIENTATION_LANDSCAPE||video.getHeight()>300*density;int side=Math.round((full?72:56)*density);ViewGroup.LayoutParams p=play.getLayoutParams();if(p.width!=side||p.height!=side){p.width=side;p.height=side;play.setLayoutParams(p);}center(root);}
 public static void center(View root){View video=find(root,"videoLayout"),container=find(root,"viewctrllay");if(video==null||container==null||video.getHeight()==0||container.getHeight()==0)return;int[] target=new int[2],position=new int[2];video.getLocationOnScreen(target);container.getLocationOnScreen(position);float delta=target[1]+video.getHeight()/2f-position[1]-container.getHeight()/2f;if(Math.abs(delta)>.5f)container.setTranslationY(container.getTranslationY()+delta);}
 static final class Icon extends Drawable {
  final String name;final boolean surface;final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);int alpha=255;
  Icon(String n,boolean s){name=n;surface=s;}
  private void line(Canvas c,float... xy){Path p=new Path();p.moveTo(xy[0],xy[1]);for(int i=2;i<xy.length;i+=2)p.lineTo(xy[i],xy[i+1]);c.drawPath(p,paint);}
  public void draw(Canvas c){Rect b=getBounds();if(surface&&(name.equals("info")||name.equals("commentpost"))){paint.setColor(0x77000000);paint.setStyle(Paint.Style.FILL);float radius=Math.min(b.width(),b.height())*.16f;c.drawRoundRect(b.left,b.top,b.right,b.bottom,radius,radius,paint);}boolean central=name.equals("play")||name.equals("pause");float side=Math.min(b.width(),b.height())*(central?.82f:.82f);int saved=c.save();c.translate(b.exactCenterX()-side/2,b.exactCenterY()-side/2);c.scale(side/24,side/24);paint.setColor(Color.WHITE);paint.setAlpha(alpha);paint.setStrokeWidth(1.8f);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);paint.setStyle(Paint.Style.STROKE);
   switch(name){
    case "volume":line(c,3,9,7,9,12,5,12,19,7,15,3,15,3,9);c.drawArc(9,6,21,18,-55,110,false,paint);c.drawArc(12,9,18,15,-55,110,false,paint);break;
    case "brightness":c.drawCircle(12,12,4,paint);for(int i=0;i<8;i++){double angle=i*Math.PI/4;line(c,12+(float)Math.cos(angle)*7,12+(float)Math.sin(angle)*7,12+(float)Math.cos(angle)*10,12+(float)Math.sin(angle)*10);}break;
    case "play":Path p=new Path();p.moveTo(6,3);p.lineTo(20,12);p.lineTo(6,21);p.close();paint.setColor(0xaa000000);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(1.0f);c.drawPath(p,paint);paint.setColor(Color.WHITE);paint.setAlpha(alpha);paint.setStyle(Paint.Style.FILL);c.drawPath(p,paint);break;
    case "pause":paint.setColor(0xaa000000);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(1.0f);c.drawRoundRect(6,3,10,21,1,1,paint);c.drawRoundRect(14,3,18,21,1,1,paint);paint.setColor(Color.WHITE);paint.setAlpha(alpha);paint.setStyle(Paint.Style.FILL);c.drawRoundRect(6,3,10,21,1,1,paint);c.drawRoundRect(14,3,18,21,1,1,paint);break;
    case "prev":case "next":boolean next=name.equals("next");paint.setStyle(Paint.Style.FILL);Path skip=new Path();skip.moveTo(next?5:19,5);skip.lineTo(next?16:8,12);skip.lineTo(next?5:19,19);skip.close();c.drawPath(skip,paint);c.drawRoundRect(next?17:4,5,next?20:7,19,1,1,paint);break;
    case "popup":c.drawRoundRect(3,4,21,20,2,2,paint);paint.setStyle(Paint.Style.FILL);c.drawRoundRect(12,12,19,18,1,1,paint);break;
    case "repeaton":case "repeatoff":line(c,4,9,4,6,20,6,17,3);line(c,20,15,20,18,4,18,7,21);if(name.endsWith("off"))line(c,3,3,21,21);break;
    case "commenton":case "commentoff":line(c,4,4,20,4,20,17,11,17,6,21,6,17,4,17,4,4);if(name.endsWith("off"))line(c,3,2,22,21);else{line(c,8,9,16,9);line(c,8,13,14,13);}break;
    case "commentpost":line(c,4,5,20,5,20,16,11,16,6,21,6,16,4,16,4,5);line(c,8,10,16,10);line(c,12,7,12,13);break;
    case "info":c.drawCircle(12,12,9,paint);line(c,12,11,12,17);paint.setStyle(Paint.Style.FILL);c.drawCircle(12,7,1.1f,paint);break;
    default:line(c,9,3,3,3,3,9);line(c,15,3,21,3,21,9);line(c,3,15,3,21,9,21);line(c,21,15,21,21,15,21);break;
   }c.restoreToCount(saved);
  }
  public void setAlpha(int a){alpha=a;invalidateSelf();}public void setColorFilter(ColorFilter f){paint.setColorFilter(f);invalidateSelf();}public int getOpacity(){return PixelFormat.TRANSLUCENT;}
 }
}
