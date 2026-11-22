package app.morphe.extension.chmate;

import android.app.Activity;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
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
    private static final java.util.concurrent.ThreadPoolExecutor ACTIONS =
            new java.util.concurrent.ThreadPoolExecutor(1,1,30,java.util.concurrent.TimeUnit.SECONDS,
                    new java.util.concurrent.ArrayBlockingQueue<>(4));
    private static TextView firstText(View view){
        if(view instanceof TextView)return (TextView)view;
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){
            TextView found=firstText(((ViewGroup)view).getChildAt(i));
            if(found!=null)return found;
        }
        return null;
    }
    private static final class Session implements ViewTreeObserver.OnPreDrawListener,View.OnAttachStateChangeListener,android.content.SharedPreferences.OnSharedPreferenceChangeListener {
        final WeakReference<Object> fragment;final ViewGroup list;final FrameLayout layer;final Activity activity;final android.content.SharedPreferences prefs;final Map<View,View> icons=new IdentityHashMap<>();
        final Map<View,TextView> hearts=new IdentityHashMap<>(),deletes=new IdentityHashMap<>();
        Object adapter;Method item,position;String version, animanchThread;
        SiteBoardGateway gateway;
        boolean siteResolved;
        Session(Object fragment,ViewGroup list){this.fragment=new WeakReference<>(fragment);this.list=list;
            prefs=SettingsProfiles.prefs(list.getContext());prefs.registerOnSharedPreferenceChangeListener(this);
            activity=Haiagaru.toolbarActivity(fragment);layer=new FrameLayout(list.getContext());layer.setClipChildren(true);layer.setTag("haiagaru.noteIndicators");
            View host=activity==null?null:activity.findViewById(android.R.id.content);if(host instanceof FrameLayout)((FrameLayout)host).addView(layer,new FrameLayout.LayoutParams(-1,-1));
        }
        public boolean onPreDraw(){
            try{
                Object owner=fragment.get();if(owner==null)return true;
                if(version==null)version=list.getContext().getPackageManager().getPackageInfo(list.getContext().getPackageName(),0).versionName;
                if (!siteResolved) {
                    Object board = NativeThreadContext.board(owner,version);
                    String url = NativeThreadContext.url(board,version,1);
                    if (url != null) {
                        animanchThread = AnimanchProtocol.threadId(SiteNativeBoards.copiedText(url));
                        if (animanchThread != null) gateway = SiteBoardGateway.get(list.getContext());
                        siteResolved = true;
                    }
                }
                boolean enabled=FeatureSwitches.enabled(KEY,true)&&list.isShown();
                Map<Integer,SiteBoardGateway.AnimanchAction> actions = gateway == null || !list.isShown()
                        || !gateway.siteEnabled("animanch") ? null : gateway.animanchActions(animanchThread);
                boolean heartEnabled = actions != null && prefs.getBoolean("animanchHeart",true);
                boolean showing = enabled && !urls.isEmpty() || actions != null && !actions.isEmpty();
                layer.setVisibility(showing ? View.VISIBLE : View.GONE);
                if (!showing && icons.isEmpty() && hearts.isEmpty() && deletes.isEmpty()) return true;
                Set<View> alive=Collections.newSetFromMap(new IdentityHashMap<>());
                Set<View> heartRows=actions==null?Collections.emptySet():Collections.newSetFromMap(new IdentityHashMap<>());
                Set<View> deleteRows=actions==null?Collections.emptySet():Collections.newSetFromMap(new IdentityHashMap<>());
                if(showing){
                    Object a=list.getClass().getMethod("getAdapter").invoke(list);if(a==null)return true;
                    if(adapter!=a){adapter=a;item=list instanceof ListView?a.getClass().getMethod("getItem",int.class):FilterPosition.findItem(a);item.setAccessible(true);}
                    if(!(list instanceof ListView)&&position==null){position=list.getClass().getMethod("getChildAdapterPosition",View.class);position.setAccessible(true);}
                    Object board=NativeThreadContext.board(owner,version);
                    for(int i=0;i<list.getChildCount();i++){
                        View child=list.getChildAt(i);int index=list instanceof ListView?((ListView)list).getPositionForView(child):(Integer)position.invoke(list,child);if(index<0)continue;
                        Object post=ReadingPosition.response(item.invoke(adapter,index));
                        int no=ReadingPosition.number(post);
                        if(no<1)continue;
                        boolean hasNote = enabled && !urls.isEmpty() && urls.containsKey(key(SiteNativeBoards.copiedText(NativeThreadContext.url(board,version,no))));
                        SiteBoardGateway.AnimanchAction action=actions==null?null:actions.get(no);
                        if(action!=null){
                            if(heartEnabled && (action.heart||action.voted||action.heartCount>=0)){
                                heartRows.add(child);
                                bindAction(hearts,child,no,action,false,false);
                            }
                            if(action.own){
                                deleteRows.add(child);
                                bindAction(deletes,child,no,action,true,hasNote);
                            }
                        }
                        if(!hasNote)continue;
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
                removeActions(hearts,heartRows);
                removeActions(deletes,deleteRows);
            }catch(Exception unavailable){
                for(View child:new ArrayList<>(icons.keySet()))layer.removeView(icons.remove(child));
                removeActions(hearts,Collections.emptySet());
                removeActions(deletes,Collections.emptySet());
            }
            return true;
        }
        private void bindAction(Map<View,TextView> controls, View row, int number,
                SiteBoardGateway.AnimanchAction action, boolean delete, boolean hasNote) {
            if (activity == null) return;
            TextView control=controls.get(row);
            if(control==null){
                control=new TextView(list.getContext());
                control.setContentDescription(delete?"自分のレスを削除":"このレスにハート");
                control.setTag(delete?"haiagaru.animanch.delete":"haiagaru.animanch.heart");
                control.setGravity(Gravity.CENTER);
                control.setFocusable(true);
                controls.put(row,control);
                layer.addView(control,new FrameLayout.LayoutParams(-2,-2));
            }
            if(control.getTag(0x48690d03)!=action){
                control.setTag(0x48690d03,action);
                final TextView button=control;
                control.setText(delete?"削除":action.heartLabel());
                control.setEnabled(delete||action.heart&&!action.voted);
                control.setOnClickListener(v->{
                    if(delete){
                        new HaiagaruDialog.Builder(activity).setTitle("レス "+number+" を削除")
                                .setMessage("あにまん掲示板からこのレスを削除します。")
                                .setNegativeButton("キャンセル",null)
                                .setPositiveButton("削除",(d,w)->runAction(button,number,action,true)).show();
                    } else runAction(button,number,action,false);
                });
            }
            if(!delete){
                String label=action.heartLabel();
                if(!TextUtils.equals(control.getText(),label)){
                    control.setText(label);
                    if(action.voted)control.setEnabled(false);
                }
                String description=(action.voted?"ハート済み":action.heart?"このレスにハート":"ハート")
                        +(action.heartCount<0?"":"、"+action.heartCount+"件");
                if(!TextUtils.equals(control.getContentDescription(),description))control.setContentDescription(description);
            }
            TextView id=idText(row);
            if(id==null)id=firstText(row);
            int[] at=new int[2], host=new int[2];
            layer.getLocationOnScreen(host);
            row.getLocationOnScreen(at);
            int margin=Math.round(4*list.getResources().getDisplayMetrics().density);
            int width=Math.round((delete?48:32)*list.getResources().getDisplayMetrics().density);
            if(!delete)width=Math.max(width,(int)Math.ceil(control.getPaint().measureText(control.getText().toString()))+2*margin);
            int height=Math.round(28*list.getResources().getDisplayMetrics().density);
            FrameLayout.LayoutParams lp=(FrameLayout.LayoutParams)control.getLayoutParams();
            if(lp.width!=width||lp.height!=height){lp.width=width;lp.height=height;control.setLayoutParams(lp);}
            float x=at[0]-host[0]+row.getWidth()-width-margin-(hasNote?width:0);
            float y=at[1]-host[1]+row.getHeight()-height;
            if(!delete){
                y=at[1]-host[1];
                if(id!=null&&id.getLayout()!=null){
                    int[] idAt=new int[2];
                    id.getLocationOnScreen(idAt);
                    int line=id.getLayout().getLineCount()-1;
                    x=Math.min(x,idAt[0]-host[0]+id.getTotalPaddingLeft()+id.getLayout().getLineRight(line)+margin);
                    y=idAt[1]-host[1]+id.getTotalPaddingTop()+id.getLayout().getLineTop(line);
                    control.setTextColor(id.getCurrentTextColor());
                }
            }
            control.setX(x);control.setY(y);
            Rect visible=new Rect();
            control.setVisibility(row.getGlobalVisibleRect(visible)&&visible.contains((int)x+host[0]+width/2,(int)y+host[1]+height/2)?View.VISIBLE:View.GONE);
        }

        private void runAction(TextView button,int number,SiteBoardGateway.AnimanchAction action,boolean delete){
            if(!button.isEnabled()||button.getTag(0x48690d03)!=action)return;
            try{
                Object reader=fragment.get();
                String current=NativeThreadContext.url(NativeThreadContext.board(reader,version),version,1);
                if(!animanchThread.equals(AnimanchProtocol.threadId(SiteNativeBoards.copiedText(current))))return;
            }catch(Exception unavailable){return;}
            button.setEnabled(false);
            try{
                ACTIONS.execute(()->{
                    String failure=null;
                    try{gateway.runAnimanchAction(animanchThread,number,delete,action);}
                    catch(Exception e){failure=SiteBoardGateway.animanchActionFailure(e);}
                    final String error=failure;
                    activity.runOnUiThread(()->{
                        if(error!=null){
                            if(button.getTag(0x48690d03)==action)button.setEnabled(delete||action.heart&&!action.voted);
                            Toast.makeText(activity,error,Toast.LENGTH_LONG).show();
                        } else {
                            if(button.getTag(0x48690d03)==action){
                                button.setText(delete?"削除済":action.heartLabel());
                                button.setEnabled(false);
                            }
                            list.invalidate();
                            if(delete)OpenTabsRefresh.refreshWatchedFragment(fragment.get());
                        }
                    });
                });
            }catch(java.util.concurrent.RejectedExecutionException busy){
                button.setEnabled(true);
                Toast.makeText(activity,"処理中です。少し待ってから操作してください。",Toast.LENGTH_SHORT).show();
            }
        }

        private void removeActions(Map<View,TextView> controls,Set<View> active){
            for(View row:new ArrayList<>(controls.keySet()))if(!active.contains(row))layer.removeView(controls.remove(row));
        }
        public void onSharedPreferenceChanged(android.content.SharedPreferences p,String key){
            if(KEY.equals(key)||"animanchHeart".equals(key))list.postInvalidate();
        }
        public void onViewAttachedToWindow(View view){}
        public void onViewDetachedFromWindow(View view){prefs.unregisterOnSharedPreferenceChangeListener(this);if(list.getViewTreeObserver().isAlive())list.getViewTreeObserver().removeOnPreDrawListener(this);list.removeOnAttachStateChangeListener(this);for(View child:new ArrayList<>(icons.keySet()))layer.removeView(icons.remove(child));if(layer.getParent() instanceof ViewGroup)((ViewGroup)layer.getParent()).removeView(layer);removeActions(hearts,Collections.emptySet());removeActions(deletes,Collections.emptySet());SESSIONS.remove(list);}
    }
    private ResponseNoteIndicator(){}
}
