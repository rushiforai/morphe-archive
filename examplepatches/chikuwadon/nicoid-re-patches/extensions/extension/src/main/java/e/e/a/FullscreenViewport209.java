package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Rect;
import android.view.*;
import android.widget.*;
import java.util.*;

/** Keep the picture, comment renderer and timeline in the same fullscreen coordinate space. */
public final class FullscreenViewport209 {
 private static final Map<View,Session> sessions=new WeakHashMap<View,Session>();
 private static final Map<View,Session> sideSessions=new WeakHashMap<View,Session>();
 private static final Map<View,Session> normalSessions=new WeakHashMap<View,Session>();
 private static final Map<View,Session> viewportSessions=new WeakHashMap<View,Session>();
 private static View find(View root,String name){return root.findViewById(root.getResources().getIdentifier(name,"id",root.getContext().getPackageName()));}
 private static Activity owner(Context c){for(int i=0;i<16;i++){if(c instanceof Activity)return (Activity)c;if(!(c instanceof ContextWrapper))break;Context next=((ContextWrapper)c).getBaseContext();if(next==c)break;c=next;}return null;}
 public static void update(View root,ViewGroup decor,View bar){
  if(root==null||decor==null)return;
  ViewGroup layer=bar!=null&&bar.getParent() instanceof FrameLayout?(ViewGroup)bar.getParent():decor;
  if(!(layer instanceof FrameLayout))return;
  Session s=sessions.get(root);if(s==null){s=new Session();sessions.put(root,s);s.activity=owner(root.getContext());s.decor=decor;s.flags=decor.getSystemUiVisibility();if(s.activity!=null)s.windowFlags=s.activity.getWindow().getAttributes().flags;s.attachRoot=root;final java.lang.ref.WeakReference<View> target=new java.lang.ref.WeakReference<View>(root);s.detach=new View.OnAttachStateChangeListener(){public void onViewAttachedToWindow(View v){}public void onViewDetachedFromWindow(View v){View r=target.get();if(r!=null)restore(r);}};root.addOnAttachStateChangeListener(s.detach);}
  if(s.activity!=null){Window w=s.activity.getWindow();if((w.getAttributes().flags&WindowManager.LayoutParams.FLAG_FULLSCREEN)==0)w.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);int flags=s.flags|0x1706;if(decor.getSystemUiVisibility()!=flags)decor.setSystemUiVisibility(flags);
   if(android.os.Build.VERSION.SDK_INT>=28)try{WindowManager.LayoutParams p=w.getAttributes();java.lang.reflect.Field f=p.getClass().getField("layoutInDisplayCutoutMode");if(s.cutout<0)s.cutout=f.getInt(p);int mode=android.os.Build.VERSION.SDK_INT>=30?3:1;if(f.getInt(p)!=mode){f.setInt(p,mode);w.setAttributes(p);}}catch(Exception ignored){}
  }
  View frame=find(root,"videoLayout"),comments=find(root,"commentlay"),video=find(root,"video");
  s.controller=s.control(root,s.controller,"controller",layer);
  s.bottom=s.control(root,s.bottom,"bottommenulay",layer);
  View controller=s.controller;

  s.capture(controller);s.capture(s.bottom);s.bottomIcons();
  s.overlay(controller,layer,0);
  s.overlay(s.bottom,layer,controller==null?0:controller.getHeight());
  s.actionsFollowController();
  // Previous portrait/docked dimensions must not survive entry into fullscreen.
  s.fit(root,-1,-1,0,0,false);if(frame!=root)s.fit(frame,-1,-1,0,0,false);

  if(controller!=null)s.timeline(controller);
  String mode=android.preference.PreferenceManager.getDefaultSharedPreferences(root.getContext()).getString("player_controls_visibility_mode","off");
  boolean held="normal".equals(mode)||"both".equals(mode);
  int upper=held&&bar!=null&&bar.getLayoutParams()!=null?bar.getLayoutParams().height:0;
  int lower=held&&controller!=null?controller.getHeight():0;
  s.fit(video,-1,-1,Math.max(0,upper),Math.max(0,lower),false);
  s.fit(comments,-1,-1,Math.max(0,upper),Math.max(0,lower),false);
  s.commentBounds(comments);s.fit(find(root,"video_view"),-1,-1,0,0,false);
 }
 public static void restore(View root){restoreSession(sessions.remove(root));restoreSession(sideSessions.remove(root));restoreSession(normalSessions.remove(root));restoreSession(viewportSessions.remove(root));}
 private static void restoreSession(Session s){if(s==null)return;if(s.attachRoot!=null)s.attachRoot.removeOnAttachStateChangeListener(s.detach);s.removeListeners();s.restoreParents();for(Map.Entry<View,Saved> e:s.saved.entrySet())e.getValue().restore(e.getKey());if(s.decor!=null)s.decor.setSystemUiVisibility(s.flags);if(s.activity!=null){Window w=s.activity.getWindow();w.setFlags(s.windowFlags,WindowManager.LayoutParams.FLAG_FULLSCREEN);if(s.cutout>=0)try{WindowManager.LayoutParams p=w.getAttributes();p.getClass().getField("layoutInDisplayCutoutMode").setInt(p,s.cutout);w.setAttributes(p);}catch(Exception ignored){}}}
 /** Keep the native information pane's reserved width; controls stay inside the picture column. */
 public static boolean side(View root){
  if(root==null)return false;normalStatus(root);View frame=find(root,"videoLayout"),info=find(root,"info");
  if(frame==null||info==null||info.getVisibility()!=View.VISIBLE||!(info.getLayoutParams() instanceof RelativeLayout.LayoutParams))return false;
  RelativeLayout.LayoutParams ip=(RelativeLayout.LayoutParams)info.getLayoutParams();
  if(ip.getRules()[RelativeLayout.RIGHT_OF]!=frame.getId()&&ip.getRules()[RelativeLayout.END_OF]!=frame.getId())return false;
  Session state=sideSessions.get(root);if(state==null){state=new Session();state.bottom=find(root,"bottommenulay");state.attachRoot=root;final View target=root;state.detach=new View.OnAttachStateChangeListener(){public void onViewAttachedToWindow(View v){}public void onViewDetachedFromWindow(View v){restore(target);}};root.addOnAttachStateChangeListener(state.detach);sideSessions.put(root,state);}
  if(state.bottom!=null){state.save(state.bottom);state.bottomIcons();}
  for(String name:new String[]{"titlebar","controller","bottommenulay"}){
   View v=find(root,name);if(v==null||v.getLayoutParams()==null)continue;state.save(v);ViewGroup.LayoutParams p=copy(v.getLayoutParams());boolean changed=p.width!=-1;p.width=-1;
   if(p instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams m=(ViewGroup.MarginLayoutParams)p;changed|=m.leftMargin!=0||m.rightMargin!=0||m.getMarginStart()!=0||m.getMarginEnd()!=0;m.leftMargin=0;m.rightMargin=0;m.setMarginStart(0);m.setMarginEnd(0);}
   if(changed)v.setLayoutParams(p);
  }
  View titlebar=find(root,"titlebar"),tools=find(root,"topmenulay");int status=statusTop(root);
  state.toolbar(titlebar,tools);
  state.belowStatus(titlebar,status);
  if(tools!=null&&!within(tools,titlebar))state.belowStatus(tools,status);
  return true;
 }
 /** Restore the entire video viewport after fullscreen, not only its toolbar.
  * Base each calculation on the original margin to avoid duplicate insets. */
 public static void restoreNormalViewport(final View root){
  if(root==null||root.getParent()==null)return;
  ViewGroup.LayoutParams params=root.getLayoutParams();
  if(!(params instanceof ViewGroup.MarginLayoutParams))return;
  int status=statusTop(root);int[] pos=new int[2];root.getLocationInWindow(pos);
  Session state=viewportSessions.get(root);
  if(state==null&&(status<=0||pos[1]>=status))return;
  if(state==null){
   state=new Session();state.attachRoot=root;
   final java.lang.ref.WeakReference<View> target=new java.lang.ref.WeakReference<View>(root);
   state.detach=new View.OnAttachStateChangeListener(){public void onViewAttachedToWindow(View v){}public void onViewDetachedFromWindow(View v){View r=target.get();if(r!=null)restore(r);}};
   root.addOnAttachStateChangeListener(state.detach);viewportSessions.put(root,state);
  }
  state.save(root);Saved saved=state.saved.get(root);if(saved==null)return;
  ViewGroup.MarginLayoutParams current=(ViewGroup.MarginLayoutParams)root.getLayoutParams();
  int original=((ViewGroup.MarginLayoutParams)saved.params).topMargin;
  int origin=pos[1]-(current.topMargin-original);
  int desired=original+Math.max(0,status-origin);
  if(current.topMargin!=desired){
   ViewGroup.MarginLayoutParams next=(ViewGroup.MarginLayoutParams)copy(current);
   next.topMargin=desired;root.setLayoutParams(next);
  }
  if(!state.listeners.containsKey(root)){
   View.OnLayoutChangeListener listener=new View.OnLayoutChangeListener(){
    public void onLayoutChange(View v,int l,int t,int r,int b,int ol,int ot,int or,int ob){restoreNormalViewport(root);}
   };state.listeners.put(root,listener);root.addOnLayoutChangeListener(listener);
  }
 }
 private static void normalStatus(final View root){
  final View bar=find(root,"titlebar");if(bar==null||!(bar.getLayoutParams() instanceof ViewGroup.MarginLayoutParams))return;
  Session state=normalSessions.get(root);int status=statusTop(root);int[] position=new int[2];bar.getLocationInWindow(position);
  if(state==null&&position[1]>=status)return;
  if(state==null){state=new Session();state.attachRoot=root;final java.lang.ref.WeakReference<View> target=new java.lang.ref.WeakReference<View>(root);state.detach=new View.OnAttachStateChangeListener(){public void onViewAttachedToWindow(View v){}public void onViewDetachedFromWindow(View v){View r=target.get();if(r!=null)restore(r);}};root.addOnAttachStateChangeListener(state.detach);normalSessions.put(root,state);}
  state.save(bar);Saved saved=state.saved.get(bar);if(saved==null)return;ViewGroup.MarginLayoutParams current=(ViewGroup.MarginLayoutParams)bar.getLayoutParams();int original=((ViewGroup.MarginLayoutParams)saved.params).topMargin;int origin=position[1]-(current.topMargin-original);int wanted=original+Math.max(0,status-origin);
  if(current.topMargin!=wanted){ViewGroup.MarginLayoutParams next=(ViewGroup.MarginLayoutParams)copy(current);next.topMargin=wanted;bar.setLayoutParams(next);}
  if(!state.listeners.containsKey(bar)){View.OnLayoutChangeListener listener=new View.OnLayoutChangeListener(){public void onLayoutChange(View v,int l,int t,int r,int b,int ol,int ot,int or,int ob){normalStatus(root);}};state.listeners.put(bar,listener);bar.addOnLayoutChangeListener(listener);}
 }
 private static boolean within(View child,View ancestor){if(ancestor==null)return false;View current=child;while(current!=null){if(current==ancestor)return true;ViewParent parent=current.getParent();current=parent instanceof View?(View)parent:null;}return false;}
 private static int statusTop(View root){
  WindowInsets insets=root.getRootWindowInsets();int top=insets==null?0:insets.getSystemWindowInsetTop();
  if(insets!=null&&android.os.Build.VERSION.SDK_INT>=30)try{int type=(Integer)Class.forName("android.view.WindowInsets$Type").getMethod("statusBars").invoke(null);Object visible=WindowInsets.class.getMethod("getInsets",int.class).invoke(insets,type);top=visible.getClass().getField("top").getInt(visible);}catch(Exception ignored){}
  Rect visible=new Rect();root.getWindowVisibleDisplayFrame(visible);int[] screen=new int[2],window=new int[2];root.getLocationOnScreen(screen);root.getLocationInWindow(window);int windowOrigin=screen[1]-window[1];return Math.max(top,Math.max(0,visible.top-windowOrigin));
 }
 public static void top(View root,View bar,View host,View tools,View title){
  // One continuous band, while text alone has an internal reading inset.
  bar.setBackgroundColor(0x77000000);if(host!=null)host.setBackgroundColor(0);
  if(title!=null){int inset=Math.round(12*root.getResources().getDisplayMetrics().density);if(title.getPaddingLeft()!=inset||title.getPaddingTop()!=0||title.getPaddingRight()!=inset||title.getPaddingBottom()!=0)title.setPadding(inset,0,inset,0);}
 }
 private static android.graphics.drawable.Drawable flatIcon(View button,android.graphics.drawable.Drawable previous){
  try{
   Class<?> type=Class.forName("e.e.a.PlayerIcons$Icon");java.lang.reflect.Constructor<?> ctor=type.getDeclaredConstructor(String.class,boolean.class);ctor.setAccessible(true);
   boolean info=button.getId()==button.getResources().getIdentifier("infobutton","id",button.getContext().getPackageName());
   android.graphics.drawable.Drawable symbol=(android.graphics.drawable.Drawable)ctor.newInstance(info?"info":"commentpost",false);
   android.content.res.ColorStateList color;
   {android.util.TypedValue value=new android.util.TypedValue();if(!button.getContext().getTheme().resolveAttribute(0x7f03005e,value,true))button.getContext().getTheme().resolveAttribute(android.R.attr.colorAccent,value,true);int accent=value.resourceId==0?value.data:button.getResources().getColor(value.resourceId);color=android.content.res.ColorStateList.valueOf((accent&0xffffff)|0x55000000);}
   return new android.graphics.drawable.RippleDrawable(color,symbol,new android.graphics.drawable.ColorDrawable(0xffffffff));
  }catch(Exception e){android.util.Log.w("nicoid-layout","Cannot flatten player action icon",e);return previous;}
 }
 /** Paint one rectangular strip only behind visible right-aligned action buttons. */
 public static final class Band extends android.graphics.drawable.Drawable{
  private final ViewGroup row;private final android.graphics.Paint paint=new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
  private final android.graphics.Path path=new android.graphics.Path();private final android.graphics.RectF area=new android.graphics.RectF();private final float[] corners=new float[8];private final int post;
  public Band(ViewGroup row){this.row=row;post=row.getResources().getIdentifier("commentpostbutton","id",row.getContext().getPackageName());paint.setColor(0x77000000);}
  @Override public void draw(android.graphics.Canvas c){
   Rect b=getBounds();int width=0;for(int i=0;i<row.getChildCount();i++){View child=row.getChildAt(i);if(child.getVisibility()!=View.GONE)width+=Math.max(0,child.getLayoutParams().width);}
   int left=Math.max(b.left,b.right-width);
   float radius=Math.min(6*row.getResources().getDisplayMetrics().density,b.height()/2f);
   for(int i=0;i<row.getChildCount();i++){View child=row.getChildAt(i);if(child.getVisibility()==View.GONE)continue;int right=Math.min(b.right,left+Math.max(0,child.getLayoutParams().width));
    if(child.getId()==post){path.rewind();area.set(left,b.top,right,b.bottom);corners[0]=corners[1]=radius;path.addRoundRect(area,corners,android.graphics.Path.Direction.CW);c.drawPath(path,paint);}else c.drawRect(left,b.top,right,b.bottom,paint);left=right;
   }
  }
  @Override public void setAlpha(int alpha){paint.setAlpha(alpha);invalidateSelf();}
  @Override public void setColorFilter(android.graphics.ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
  @Override public int getOpacity(){return android.graphics.PixelFormat.TRANSLUCENT;}
 }
 /** Same drawing transform as the upper fullscreen toolbar, independent of touch slot width. */
 public static final class Glyph extends android.graphics.drawable.Drawable implements android.graphics.drawable.Drawable.Callback {
  private final android.graphics.drawable.Drawable original;
  public Glyph(android.graphics.drawable.Drawable d){original=d;d.setCallback(this);}
  @Override public void draw(android.graphics.Canvas canvas){Rect bounds=getBounds();original.setBounds(bounds);int save=canvas.save();canvas.scale(1.344f,1.344f,bounds.exactCenterX(),bounds.exactCenterY());original.draw(canvas);canvas.restoreToCount(save);}
  @Override public void setAlpha(int alpha){original.setAlpha(alpha);}
  @Override public void setColorFilter(android.graphics.ColorFilter filter){original.setColorFilter(filter);}
  @Override public int getOpacity(){return original.getOpacity();}
  @Override public boolean isStateful(){return original.isStateful();}
  @Override protected boolean onStateChange(int[] state){return original.setState(state);}
  @Override public void invalidateDrawable(android.graphics.drawable.Drawable who){invalidateSelf();}
  @Override public void scheduleDrawable(android.graphics.drawable.Drawable who,Runnable what,long when){scheduleSelf(what,when);}
  @Override public void unscheduleDrawable(android.graphics.drawable.Drawable who,Runnable what){unscheduleSelf(what);}
 }
 private static final class Moved{
  final View view;final ViewGroup parent;final int index;
  Moved(View v){view=v;parent=(ViewGroup)v.getParent();index=parent.indexOfChild(v);}
 }
 private static final class Saved {
  final ViewGroup.LayoutParams params;final int[] padding;final Rect clip;final android.graphics.drawable.Drawable background;final int minWidth,minHeight,textMinWidth,textMinHeight;final float translationX,translationY;
  Saved(View v){translationX=v.getTranslationX();translationY=v.getTranslationY();ViewGroup.LayoutParams p=v.getLayoutParams();params=copy(p);padding=new int[]{v.getPaddingLeft(),v.getPaddingTop(),v.getPaddingRight(),v.getPaddingBottom()};clip=v.getClipBounds();background=v.getBackground();minWidth=v.getMinimumWidth();minHeight=v.getMinimumHeight();textMinWidth=v instanceof TextView?((TextView)v).getMinWidth():0;textMinHeight=v instanceof TextView?((TextView)v).getMinHeight():0;}
  void restore(View v){v.setTranslationX(translationX);v.setTranslationY(translationY);v.setLayoutParams(params);v.setPadding(padding[0],padding[1],padding[2],padding[3]);v.setClipBounds(clip);v.setBackground(background);v.setMinimumWidth(minWidth);v.setMinimumHeight(minHeight);if(v instanceof TextView){((TextView)v).setMinWidth(textMinWidth);((TextView)v).setMinHeight(textMinHeight);}}
 }
 private static ViewGroup.LayoutParams copy(ViewGroup.LayoutParams p){if(p instanceof RelativeLayout.LayoutParams)return new RelativeLayout.LayoutParams((RelativeLayout.LayoutParams)p);if(p instanceof LinearLayout.LayoutParams)return new LinearLayout.LayoutParams((LinearLayout.LayoutParams)p);if(p instanceof FrameLayout.LayoutParams)return new FrameLayout.LayoutParams((FrameLayout.LayoutParams)p);if(p instanceof ViewGroup.MarginLayoutParams)return new ViewGroup.MarginLayoutParams((ViewGroup.MarginLayoutParams)p);return new ViewGroup.LayoutParams(p);}
 private static final class Session {
  final Map<View,Saved> saved=new LinkedHashMap<View,Saved>();final Map<View,Long> sizes=new WeakHashMap<View,Long>();final Map<View,View.OnLayoutChangeListener> listeners=new HashMap<View,View.OnLayoutChangeListener>();final List<Moved> moved=new ArrayList<Moved>();Activity activity;View decor,controller,bottom,attachRoot;View.OnAttachStateChangeListener detach;int flags,windowFlags,cutout=-1;
  void save(View v){if(v!=null&&v.getLayoutParams()!=null&&!saved.containsKey(v))saved.put(v,new Saved(v));}
  View control(View root,View old,String name,ViewGroup layer){View found=find(root,name);if(found==null&&old!=null&&old.getParent()==layer)return old;if(old!=null&&old!=found){if(old.getParent()==layer)layer.removeView(old);for(Iterator<Moved> i=moved.iterator();i.hasNext();)if(i.next().view==old)i.remove();for(Iterator<Map.Entry<View,Saved>> i=saved.entrySet().iterator();i.hasNext();)if(within(i.next().getKey(),old))i.remove();}return found;}
  void fit(View v,int width,int height,int top,int bottom,boolean bottomAligned){
   if(v==null||v.getLayoutParams()==null)return;save(v);ViewGroup.LayoutParams old=v.getLayoutParams(),p=copy(old);p.width=width;p.height=height;
   boolean changed=old.width!=width||old.height!=height;
   if(p instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams m=(ViewGroup.MarginLayoutParams)p;changed|=m.leftMargin!=0||m.rightMargin!=0||m.topMargin!=top||m.bottomMargin!=bottom;m.setMargins(0,top,0,bottom);if(android.os.Build.VERSION.SDK_INT>=17){changed|=m.getMarginStart()!=0||m.getMarginEnd()!=0;m.setMarginStart(0);m.setMarginEnd(0);}}
   if(p instanceof RelativeLayout.LayoutParams){RelativeLayout.LayoutParams r=(RelativeLayout.LayoutParams)p;int[] before=r.getRules().clone();for(int rule:new int[]{RelativeLayout.BELOW,RelativeLayout.ABOVE,RelativeLayout.RIGHT_OF,RelativeLayout.LEFT_OF,RelativeLayout.ALIGN_TOP,RelativeLayout.ALIGN_BOTTOM,RelativeLayout.ALIGN_LEFT,RelativeLayout.ALIGN_RIGHT,RelativeLayout.CENTER_IN_PARENT,RelativeLayout.CENTER_VERTICAL,RelativeLayout.CENTER_HORIZONTAL,RelativeLayout.ALIGN_PARENT_TOP,RelativeLayout.ALIGN_PARENT_BOTTOM})r.removeRule(rule);r.addRule(bottomAligned?RelativeLayout.ALIGN_PARENT_BOTTOM:RelativeLayout.ALIGN_PARENT_TOP);r.addRule(RelativeLayout.ALIGN_PARENT_LEFT);r.addRule(RelativeLayout.ALIGN_PARENT_RIGHT);changed|=!Arrays.equals(before,r.getRules());}
   if(changed)v.setLayoutParams(p);
   if(v.getPaddingLeft()!=0||v.getPaddingTop()!=0||v.getPaddingRight()!=0||v.getPaddingBottom()!=0)v.setPadding(0,0,0,0);
  }
  void bottomIcons(){
   if(!(bottom instanceof ViewGroup))return;ViewGroup row=(ViewGroup)bottom;save(row);if(!(row.getBackground() instanceof Band))row.setBackground(new Band(row));
   int height=Math.round(40*bottom.getResources().getDisplayMetrics().density),width=Math.round(44*bottom.getResources().getDisplayMetrics().density);
   for(int i=0;i<row.getChildCount();i++){
    View button=row.getChildAt(i);if(button.getLayoutParams()==null)continue;save(button);ViewGroup.LayoutParams old=button.getLayoutParams(),p=copy(old);boolean changed=p.width!=width||p.height!=height;p.width=width;p.height=height;
    if(p instanceof LinearLayout.LayoutParams){LinearLayout.LayoutParams lp=(LinearLayout.LayoutParams)p;changed|=lp.weight!=0||lp.leftMargin!=0||lp.topMargin!=0||lp.rightMargin!=0||lp.bottomMargin!=0;lp.weight=0;lp.setMargins(0,0,0,0);}
    if(changed)button.setLayoutParams(p);
    if(button.getPaddingLeft()!=0||button.getPaddingTop()!=0||button.getPaddingRight()!=0||button.getPaddingBottom()!=0)button.setPadding(0,0,0,0);
    button.setMinimumWidth(0);button.setMinimumHeight(0);if(button instanceof TextView){((TextView)button).setMinWidth(0);((TextView)button).setMinHeight(0);}
    android.graphics.drawable.Drawable d=button.getBackground();if(d!=null&&!(d instanceof Glyph))button.setBackground(new Glyph(flatIcon(button,d)));
   }
  }
  // Native dock mode hides the action row. Reparenting alone retains that state
  // when returning from the information pane; use the timeline as visibility owner.
  void actionsFollowController(){
   if(bottom==null||controller==null)return;
   bottom.clearAnimation();bottom.animate().cancel();
   if(bottom.getVisibility()!=controller.getVisibility())bottom.setVisibility(controller.getVisibility());
   float alpha=controller.getAlpha();android.view.animation.Animation animation=controller.getAnimation();
   if(animation!=null){android.view.animation.Transformation transform=new android.view.animation.Transformation();animation.getTransformation(android.view.animation.AnimationUtils.currentAnimationTimeMillis(),transform);alpha*=transform.getAlpha();}
   if(bottom.getAlpha()!=alpha)bottom.setAlpha(alpha);
  }
  void toolbar(View bar,View tools){
   if(bar==null||tools==null||bar.getLayoutParams()==null)return;
   // Native transition snapshots can retain a collapsed or translated title strip.
   // Only repair geometry; the native visibility/alpha still controls showing it.
   save(bar);
   if(bar.getTranslationY()!=0)bar.setTranslationY(0);
   int required=tools.getMinimumHeight();
   ViewGroup.LayoutParams tp=tools.getLayoutParams();if(tp!=null&&tp.height>0)required=Math.max(required,tp.height);
   required=Math.max(required,tools.getMeasuredHeight());
   ViewGroup.LayoutParams bp=bar.getLayoutParams();
   if(required>0&&bp.height>=0&&bp.height<required){ViewGroup.LayoutParams next=copy(bp);next.height=ViewGroup.LayoutParams.WRAP_CONTENT;bar.setLayoutParams(next);}
  }
  void belowStatus(View v,int status){
   if(v==null||!(v.getParent() instanceof View)||!(v.getLayoutParams() instanceof ViewGroup.MarginLayoutParams))return;
   View parent=(View)v.getParent();int[] origin=new int[2];parent.getLocationInWindow(origin);int wanted=Math.max(0,status-origin[1]-parent.getPaddingTop());
   save(v);ViewGroup.MarginLayoutParams p=(ViewGroup.MarginLayoutParams)copy(v.getLayoutParams());boolean changed=p.topMargin!=wanted;p.topMargin=wanted;
   if(p instanceof RelativeLayout.LayoutParams){RelativeLayout.LayoutParams rp=(RelativeLayout.LayoutParams)p;int[] before=rp.getRules().clone();for(int rule:new int[]{RelativeLayout.BELOW,RelativeLayout.ABOVE,RelativeLayout.ALIGN_TOP,RelativeLayout.ALIGN_BOTTOM,RelativeLayout.CENTER_IN_PARENT,RelativeLayout.CENTER_VERTICAL,RelativeLayout.ALIGN_PARENT_BOTTOM})rp.removeRule(rule);rp.addRule(RelativeLayout.ALIGN_PARENT_TOP);changed|=!Arrays.equals(before,rp.getRules());}
   if(changed)v.setLayoutParams(p);
  }
  void capture(View v){if(v==null)return;for(Moved m:moved)if(m.view==v)return;if(!(v.getParent() instanceof ViewGroup))return;save(v);moved.add(new Moved(v));}
  void overlay(View v,ViewGroup layer,int bottomMargin){
   if(v==null||!(layer instanceof FrameLayout)||!(v.getParent() instanceof ViewGroup))return;
   // Revision201's picture-column placement translates the row in window space.
   // Once moved to the screen overlay, that old offset would move both actions offscreen.
   if(v.getTranslationX()!=0)v.setTranslationX(0);
   if(v.getTranslationY()!=0)v.setTranslationY(0);
   if(v.getParent()!=layer){((ViewGroup)v.getParent()).removeView(v);layer.addView(v,new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM|Gravity.LEFT));}
   FrameLayout.LayoutParams p=v.getLayoutParams() instanceof FrameLayout.LayoutParams?(FrameLayout.LayoutParams)v.getLayoutParams():new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM|Gravity.LEFT);
   if(p.width!=-1||p.height!=-2||p.gravity!=(Gravity.BOTTOM|Gravity.LEFT)||p.leftMargin!=0||p.topMargin!=0||p.rightMargin!=0||p.bottomMargin!=bottomMargin){p.width=-1;p.height=-2;p.gravity=Gravity.BOTTOM|Gravity.LEFT;p.setMargins(0,0,0,bottomMargin);p.setMarginStart(0);p.setMarginEnd(0);v.setLayoutParams(p);}
   if(v.getPaddingLeft()!=0||v.getPaddingTop()!=0||v.getPaddingRight()!=0||v.getPaddingBottom()!=0)v.setPadding(0,0,0,0);
  }
  void restoreParents(){
   Collections.sort(moved,new Comparator<Moved>(){public int compare(Moved a,Moved b){return a.index-b.index;}});
   for(Moved m:moved){if(m.view.getParent() instanceof ViewGroup)((ViewGroup)m.view.getParent()).removeView(m.view);m.parent.addView(m.view,Math.min(m.index,m.parent.getChildCount()),copy(saved.get(m.view).params));}
  }
  void timeline(View v){if(v instanceof SeekBar){save(v);int inset=Math.round(12*v.getResources().getDisplayMetrics().density);if(v.getPaddingLeft()!=inset||v.getPaddingRight()!=inset)v.setPadding(inset,v.getPaddingTop(),inset,v.getPaddingBottom());View child=v;ViewParent parent=child.getParent();while(parent instanceof ViewGroup){View group=(View)parent;if(group instanceof LinearLayout&&((LinearLayout)group).getOrientation()==LinearLayout.HORIZONTAL){save(child);ViewGroup.LayoutParams p=copy(child.getLayoutParams());if(p instanceof LinearLayout.LayoutParams){LinearLayout.LayoutParams l=(LinearLayout.LayoutParams)p;if(l.width!=0||l.weight!=1){l.width=0;l.weight=1;child.setLayoutParams(l);}}break;}if(group.getId()==v.getResources().getIdentifier("controller","id",v.getContext().getPackageName()))break;fit(group,-1,group.getLayoutParams().height,0,0,false);child=group;parent=group.getParent();}return;}if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=0;i<g.getChildCount();i++)timeline(g.getChildAt(i));}}
  void sync(View v){int width=v.getWidth(),height=v.getHeight();long size=((long)width<<32)|(height&0xffffffffL);Long previous=sizes.get(v);if(width>0&&height>0&&(previous==null||previous.longValue()!=size)){try{v.getClass().getMethod("a",float.class,float.class).invoke(v,(float)width,(float)height);sizes.put(v,size);}catch(Exception e){android.util.Log.w("nicoid-layout","Cannot update comment viewport",e);}}}
  void removeListeners(){for(Map.Entry<View,View.OnLayoutChangeListener> e:listeners.entrySet())e.getKey().removeOnLayoutChangeListener(e.getValue());}
  void commentBounds(View v){
   if(v==null)return;String n=v.getClass().getName();
   if("e.e.a.t".equals(n)||"e.e.a.u".equals(n)){
    save(v);if(v.getClipBounds()!=null)v.setClipBounds(null);fit(v,-1,-1,0,0,false);
    if(!listeners.containsKey(v)){View.OnLayoutChangeListener listener=new View.OnLayoutChangeListener(){public void onLayoutChange(View view,int l,int t,int r,int b,int ol,int ot,int or,int ob){sync(view);}};listeners.put(v,listener);v.addOnLayoutChangeListener(listener);}
    sync(v);
   }
   if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=0;i<g.getChildCount();i++)commentBounds(g.getChildAt(i));}
  }
 }
}
