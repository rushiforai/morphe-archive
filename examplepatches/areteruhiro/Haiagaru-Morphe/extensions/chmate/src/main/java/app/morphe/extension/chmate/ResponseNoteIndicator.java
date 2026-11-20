package app.morphe.extension.chmate;

import android.app.Activity;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.view.*;
import android.widget.*;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.*;
import java.util.concurrent.Executors;

/** Clickable note controls float over row corners without changing response text or row height. */
final class ResponseNoteIndicator {
    static final String KEY="responseNoteIndicator";
    private static final Map<View,Session> SESSIONS=new WeakHashMap<>();
    private static volatile Map<String,String> urls=Collections.emptyMap();
    private static final java.util.concurrent.Executor IO=Executors.newSingleThreadExecutor();
    static String key(String url){return url==null?"":url.replaceFirst("(?i)^https?://","").replaceFirst("/+$","");}
    static void changed(android.content.Context context){
        android.content.Context app=context.getApplicationContext();
        IO.execute(()->{try{Map<String,String> next=ResponseNotesStore.get(app).responseUrls();urls=next;new android.os.Handler(android.os.Looper.getMainLooper()).post(()->{for(Session session:new ArrayList<>(SESSIONS.values()))session.list.invalidate();});}catch(Exception error){android.util.Log.w("Haiagaru","Note indicators unavailable",error);}});
    }
    static void register(Object fragment,View list){
        if(!(list instanceof ViewGroup)||SESSIONS.containsKey(list))return;
        Session session=new Session(fragment,(ViewGroup)list);SESSIONS.put(list,session);
        list.getViewTreeObserver().addOnPreDrawListener(session);list.addOnAttachStateChangeListener(session);changed(list.getContext());
    }
    private static final class Icon extends Drawable {
        final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);int color;
        Icon(int color){this.color=color;}
        public void draw(Canvas canvas){Rect b=getBounds();float s=b.width(),x=b.left,y=b.top;paint.setColor(color);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(Math.max(1,s/12));
            Path p=new Path();p.moveTo(x+s*.15f,y+s*.1f);p.lineTo(x+s*.65f,y+s*.1f);p.lineTo(x+s*.88f,y+s*.32f);p.lineTo(x+s*.88f,y+s*.9f);p.lineTo(x+s*.15f,y+s*.9f);p.close();canvas.drawPath(p,paint);
            canvas.drawLine(x+s*.65f,y+s*.1f,x+s*.65f,y+s*.32f,paint);canvas.drawLine(x+s*.65f,y+s*.32f,x+s*.88f,y+s*.32f,paint);
            for(float line:new float[]{.48f,.65f})canvas.drawLine(x+s*.3f,y+s*line,x+s*.7f,y+s*line,paint);
        }
        public void setAlpha(int a){paint.setAlpha(a);}public void setColorFilter(ColorFilter f){paint.setColorFilter(f);}public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
    private static TextView idText(View view){
        if(view instanceof TextView){String text=((TextView)view).getText().toString();if(text.contains("ID:")||text.contains("ID："))return (TextView)view;}
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){TextView found=idText(((ViewGroup)view).getChildAt(i));if(found!=null)return found;}return null;
    }
    private static final class Session implements ViewTreeObserver.OnPreDrawListener,View.OnAttachStateChangeListener,android.content.SharedPreferences.OnSharedPreferenceChangeListener {
        final WeakReference<Object> fragment;final ViewGroup list;final FrameLayout layer;final Activity activity;final android.content.SharedPreferences prefs;final Map<View,View> icons=new IdentityHashMap<>();
        Object adapter;Method item,position;String version;
        Session(Object fragment,ViewGroup list){this.fragment=new WeakReference<>(fragment);this.list=list;
            prefs=SettingsProfiles.prefs(list.getContext());prefs.registerOnSharedPreferenceChangeListener(this);
            activity=Haiagaru.toolbarActivity(fragment);layer=new FrameLayout(list.getContext());layer.setClipChildren(true);layer.setTag("haiagaru.noteIndicators");
            View host=activity==null?null:activity.findViewById(android.R.id.content);if(host instanceof FrameLayout)((FrameLayout)host).addView(layer,new FrameLayout.LayoutParams(-1,-1));
        }
        public boolean onPreDraw(){
            try{
                Object owner=fragment.get();if(owner==null)return true;
                if(version==null)version=list.getContext().getPackageManager().getPackageInfo(list.getContext().getPackageName(),0).versionName;
                Set<View> alive=Collections.newSetFromMap(new IdentityHashMap<>());
                boolean enabled=FeatureSwitches.enabled(KEY,true)&&list.isShown();layer.setVisibility(enabled?View.VISIBLE:View.GONE);
                if(enabled&&!urls.isEmpty()){
                    Object a=list.getClass().getMethod("getAdapter").invoke(list);if(a==null)return true;
                    if(adapter!=a){adapter=a;item=list instanceof ListView?a.getClass().getMethod("getItem",int.class):FilterPosition.findItem(a);item.setAccessible(true);}
                    if(!(list instanceof ListView)&&position==null){position=list.getClass().getMethod("getChildAdapterPosition",View.class);position.setAccessible(true);}
                    Object board=NativeThreadContext.board(owner,version);
                    for(int i=0;i<list.getChildCount();i++){
                        View child=list.getChildAt(i);int index=list instanceof ListView?((ListView)list).getPositionForView(child):(Integer)position.invoke(list,child);if(index<0)continue;
                        Object post=ReadingPosition.response(item.invoke(adapter,index));int no=ReadingPosition.number(post);if(no<1||!urls.containsKey(key(SiteNativeBoards.copiedText(NativeThreadContext.url(board,version,no)))))continue;
                        alive.add(child);TextView id=idText(child);float font=id==null?12*list.getResources().getDisplayMetrics().scaledDensity:id.getTextSize();int size=Math.max(1,Math.round(font));
                        String url=NativeThreadContext.url(board,version,no);View button=icons.get(child);
                        if(button==null){button=new View(list.getContext());button.setContentDescription("レスのメモを表示・編集");button.setTag("haiagaru.noteIndicator");button.setFocusable(true);icons.put(child,button);layer.addView(button,new FrameLayout.LayoutParams(1,1));}
                        final String noteUrl=urls.get(key(SiteNativeBoards.copiedText(url)));
                        if(!noteUrl.equals(button.getTag(0x48690d01))){button.setTag(0x48690d01,noteUrl);button.setOnClickListener(v->{if(activity!=null)activity.startActivity(new android.content.Intent(activity,ResponseNotesActivity.class).putExtra("sourceUrl",noteUrl));});}
                        int hit=Math.max(size,Math.round(32*list.getResources().getDisplayMetrics().density));FrameLayout.LayoutParams lp=(FrameLayout.LayoutParams)button.getLayoutParams();if(lp.width!=hit||lp.height!=hit){lp.width=hit;lp.height=hit;button.setLayoutParams(lp);}
                        int[] childAt=new int[2],hostAt=new int[2];child.getLocationOnScreen(childAt);layer.getLocationOnScreen(hostAt);
                        int right=childAt[0]-hostAt[0]+child.getWidth()-child.getPaddingRight()-Math.round(3*list.getResources().getDisplayMetrics().density),bottom=childAt[1]-hostAt[1]+child.getHeight()-child.getPaddingBottom();
                        button.setX(right-hit);button.setY(bottom-hit);android.graphics.Rect visible=new android.graphics.Rect();boolean shown=child.getGlobalVisibleRect(visible)&&visible.contains(childAt[0]+child.getWidth()-child.getPaddingRight()-size/2,childAt[1]+child.getHeight()-child.getPaddingBottom()-size/2);button.setVisibility(shown?View.VISIBLE:View.GONE);
                        int color=id==null?0xff888888:id.getCurrentTextColor();String style=size+":"+hit+":"+color;
                        if(!style.equals(button.getTag(0x48690d02))){button.setTag(0x48690d02,style);Icon icon=new Icon(color);button.setBackground(new android.graphics.drawable.InsetDrawable(icon,hit-size,hit-size,0,0));}

                    }
                }
                for(View child:new ArrayList<>(icons.keySet()))if(!alive.contains(child)){layer.removeView(icons.remove(child));}
            }catch(Exception unavailable){for(View child:new ArrayList<>(icons.keySet()))layer.removeView(icons.remove(child));}
            return true;
        }
        public void onSharedPreferenceChanged(android.content.SharedPreferences p,String key){if(KEY.equals(key))list.postInvalidate();}
        public void onViewAttachedToWindow(View view){}
        public void onViewDetachedFromWindow(View view){prefs.unregisterOnSharedPreferenceChangeListener(this);if(list.getViewTreeObserver().isAlive())list.getViewTreeObserver().removeOnPreDrawListener(this);list.removeOnAttachStateChangeListener(this);for(View child:new ArrayList<>(icons.keySet()))layer.removeView(icons.remove(child));if(layer.getParent() instanceof ViewGroup)((ViewGroup)layer.getParent()).removeView(layer);SESSIONS.remove(list);}
    }
    private ResponseNoteIndicator(){}
}
