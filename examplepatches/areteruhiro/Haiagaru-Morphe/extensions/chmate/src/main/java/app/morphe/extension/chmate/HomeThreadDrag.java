package app.morphe.extension.chmate;

import android.app.Activity;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.*;
import android.widget.*;
import java.util.*;

/** Routes edit-mode gestures over the existing HOME list, without replacing its rows or adapter. */
public final class HomeThreadDrag extends FrameLayout {
    private final Activity activity;
    private final Object fragment;
    private final View root,list;
    private final int mode;
    private final Handler handler=new Handler(Looper.getMainLooper());
    private float downX,downY,y,grabOffset;
    private final Button pin;
    private final int controlsHeight;
    private int from=-1,to=-1;
    private boolean dragging;
    private String draggedLabel;
    private Bitmap image;
    private List<?> snapshot;
    private int[] headingForPosition;
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Map<TextView,RowPin> rowPins=new IdentityHashMap<>();
    private final Map<Object,String> rowKeys=new IdentityHashMap<>();
    private final Set<TextView> visibleTitles=Collections.newSetFromMap(new IdentityHashMap<>());
    private final ViewTreeObserver.OnPreDrawListener pinListener=()->{bindVisiblePins();return true;};
    private java.lang.reflect.Method childAdapterPosition;
    private final Runnable hold=this::begin;
    private final Runnable scroll=new Runnable(){public void run(){
        if(!dragging)return;
        int[] bounds=new int[2];list.getLocationOnScreen(bounds);int[] own=new int[2];getLocationOnScreen(own);
        float local=y+own[1]-bounds[1];int edge=Math.round(48*getResources().getDisplayMetrics().density);
        int delta=local<edge?-Math.max(1,Math.round((edge-local)/6)):local>list.getHeight()-edge?Math.max(1,Math.round((local-list.getHeight()+edge)/6)):0;
        if(delta!=0){if(list instanceof ListView)((ListView)list).smoothScrollBy(delta,16);else list.scrollBy(0,delta);}
        updateTarget();handler.postDelayed(this,16);
    }};
    static void toggle(Activity activity,Object fragment,View root,int mode){
        if(root==null)return;
        View existing=root.findViewWithTag("haiagaru.home.drag");
        if(existing instanceof HomeThreadDrag){((HomeThreadDrag)existing).finish();return;}
        View list=FilterPosition.findList(root);
        if(list==null||!(list.getParent() instanceof ViewGroup)||!HomeThreadOrder.canReorder(mode)
                ||HomeThreadOrder.presented(list,mode)==null){
            Toast.makeText(activity,"HOMEのスレ一覧を表示してください",Toast.LENGTH_SHORT).show();return;}
        ViewGroup parent=(ViewGroup)list.getParent();int index=parent.indexOfChild(list);ViewGroup.LayoutParams params=list.getLayoutParams();
        HomeThreadDrag wrapper=new HomeThreadDrag(activity,fragment,root,list,mode);
        wrapper.setTag("haiagaru.home.drag");
        parent.addView(wrapper,index,params);
        parent.removeView(list);
        FrameLayout.LayoutParams listParams=new FrameLayout.LayoutParams(-1,-1);
        listParams.bottomMargin=wrapper.controlsHeight;
        wrapper.addView(list,0,listParams);
        activity.invalidateOptionsMenu();
    }
    static boolean active(Object fragment){try{View root=(View)fragment.getClass().getMethod("getView").invoke(fragment);return root!=null&&root.findViewWithTag("haiagaru.home.drag") instanceof HomeThreadDrag;}catch(Exception ignored){return false;}}
    private HomeThreadDrag(Activity activity,Object fragment,View root,View list,int mode){
        super(activity);this.activity=activity;this.fragment=fragment;this.root=root;this.list=list;this.mode=mode;setWillNotDraw(false);
        controlsHeight=Math.round(52*getResources().getDisplayMetrics().density);
        LinearLayout controls=new LinearLayout(activity);controls.setOrientation(LinearLayout.HORIZONTAL);
        android.util.TypedValue background=new android.util.TypedValue();activity.getTheme().resolveAttribute(android.R.attr.colorBackground,background,true);controls.setBackgroundColor(background.data);
        pin=new Button(activity);
        pin.setText("並び替えを終了");
        pin.setOnClickListener(v->finish());
        if(mode!=107){
            Button labels=new Button(activity);
            labels.setText("ラベル作成・編集");
            labels.setOnClickListener(v->HomeThreadOrder.labels(activity,mode));
            controls.addView(labels,new LinearLayout.LayoutParams(0,-1,1));

        }
        Button reset=new Button(activity);
        reset.setText("元の並び順に戻す");
        reset.setOnClickListener(view->HomeThreadOrder.confirmResetOrder(activity,mode));
        controls.addView(reset,new LinearLayout.LayoutParams(0,-1,1));
        controls.addView(pin,new LinearLayout.LayoutParams(0,-1,1));
        FrameLayout.LayoutParams buttons=new FrameLayout.LayoutParams(-1,controlsHeight,Gravity.BOTTOM);addView(controls,buttons);controls.setElevation(16*getResources().getDisplayMetrics().density);
        setFocusableInTouchMode(true);setOnKeyListener((v,key,event)->{if(key==android.view.KeyEvent.KEYCODE_BACK&&event.getAction()==1){finish();return true;}return false;});
    }
    private void finish(){cancel();if(!(getParent() instanceof ViewGroup))return;ViewGroup parent=(ViewGroup)getParent();int index=parent.indexOfChild(this);ViewGroup.LayoutParams params=getLayoutParams();removeView(list);parent.removeView(this);parent.addView(list,index,params);activity.invalidateOptionsMenu();}
    private int position(float x,float y){
        int[] own=new int[2],origin=new int[2];getLocationOnScreen(own);list.getLocationOnScreen(origin);
        float lx=x+own[0]-origin[0],ly=y+own[1]-origin[1];
        if(lx<0||lx>=list.getWidth()||ly<0||ly>=list.getHeight())return -1;
        if(list instanceof ListView)return ((ListView)list).pointToPosition((int)lx,(int)ly);
        try{ViewGroup group=(ViewGroup)list;for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);
            if(ly>=child.getTop()&&ly<child.getBottom())return childPosition(child,i);}
        }catch(Exception ignored){}return -1;
    }
    private View row(int position){
        if(list instanceof ListView)return ((ListView)list).getChildAt(position-((ListView)list).getFirstVisiblePosition());
        try{ViewGroup group=(ViewGroup)list;for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);if(childPosition(child,i)==position)return child;}}catch(Exception ignored){}return null;
    }
    private void begin(){
        List<?> visible=HomeThreadOrder.presented(list,mode);
        snapshot=visible==null?null:new ArrayList<>(visible);from=position(downX,downY);
        if(snapshot==null||from<0||from>=snapshot.size())return;
        String sourceKey=HomeThreadOrder.key(snapshot.get(from));
        draggedLabel=sourceKey==null||HomeThreadOrder.boardSection(snapshot.get(from))?HomeThreadOrder.sectionKey(snapshot.get(from)):null;
        if(draggedLabel==null&&(sourceKey==null||HomeThreadOrder.pinned(sourceKey,mode)))return;
        if(draggedLabel!=null){headingForPosition=new int[snapshot.size()];int heading=-1;
            for(int i=0;i<snapshot.size();i++){if(HomeThreadOrder.sectionKey(snapshot.get(i))!=null)heading=i;headingForPosition[i]=heading;}}
        try{View view=row(from);if(view==null||view.getWidth()<=0||view.getHeight()<=0)return;
            int height=Math.min(view.getHeight(),getHeight());image=Bitmap.createBitmap(view.getWidth(),height,Bitmap.Config.ARGB_8888);view.draw(new Canvas(image));
        }catch(RuntimeException error){cancel();return;}

        int[] own=new int[2],location=new int[2];getLocationOnScreen(own);View source=row(from);source.getLocationOnScreen(location);grabOffset=downY-(location[1]-own[1]);
        dragging=true;to=from;y=downY;
        MotionEvent cancel=MotionEvent.obtain(android.os.SystemClock.uptimeMillis(),android.os.SystemClock.uptimeMillis(),MotionEvent.ACTION_CANCEL,downX,downY,0);
        super.dispatchTouchEvent(cancel);cancel.recycle();getParent().requestDisallowInterceptTouchEvent(true);
        performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);handler.post(scroll);invalidate();
    }
    private void updateTarget(){int index=position(downX,y);if(snapshot!=null&&index>=0&&index<snapshot.size()){
            if(draggedLabel!=null){
            if(headingForPosition!=null&&headingForPosition[index]>=0)to=headingForPosition[index];
            postInvalidateOnAnimation();
            return;
        }
        to=index;
        }postInvalidateOnAnimation();}
    @Override public boolean dispatchTouchEvent(MotionEvent event){
        int action=event.getActionMasked();
        if(action==MotionEvent.ACTION_DOWN){cancel();downX=event.getX();downY=event.getY();handler.postDelayed(hold,ViewConfiguration.getLongPressTimeout());}
        if(dragging){
            y=event.getY();updateTarget();
            if(action==MotionEvent.ACTION_UP){
                List<?> current=HomeThreadOrder.presented(list,mode);
                if(HomeThreadOrder.mode(fragment)==mode&&current!=null&&sameRows(snapshot,current)&&from>=0&&to>=0&&from!=to){
                    boolean saved;
                    if(draggedLabel!=null){
                        saved=HomeThreadOrder.moveLabel(snapshot.get(from),snapshot.get(to),mode,snapshot);
                    }else{
                        saved=HomeThreadOrder.dropThread(snapshot.get(from),snapshot.get(to),mode,to>from);
                    }
                    cancel();
                    if(saved)BrowsingHistory.refreshVisible(activity);
                }
                else cancel();
            }else if(action==MotionEvent.ACTION_CANCEL||action==MotionEvent.ACTION_POINTER_DOWN)cancel();
            return true;
        }
        if(action==MotionEvent.ACTION_MOVE&&(Math.abs(event.getX()-downX)>ViewConfiguration.get(getContext()).getScaledTouchSlop()||Math.abs(event.getY()-downY)>ViewConfiguration.get(getContext()).getScaledTouchSlop()))handler.removeCallbacks(hold);
        if(action==MotionEvent.ACTION_UP&&Math.abs(event.getY()-downY)<=ViewConfiguration.get(getContext()).getScaledTouchSlop()
                &&Math.abs(event.getX()-downX)<=ViewConfiguration.get(getContext()).getScaledTouchSlop()){
            int index=position(event.getX(),event.getY());List<?> rows=HomeThreadOrder.presented(list,mode);
            if(rows!=null&&index>=0&&index<rows.size()){
                String key=HomeThreadOrder.key(rows.get(index));
                if(key!=null&&!key.startsWith("board\n")){
                    handler.removeCallbacks(hold);HomeThreadOrder.togglePin(key,mode);
                    bindVisiblePins();
                    MotionEvent canceled=MotionEvent.obtain(event);canceled.setAction(MotionEvent.ACTION_CANCEL);
                    super.dispatchTouchEvent(canceled);canceled.recycle();invalidate();return true;
                }
            }
        }
        if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL||action==MotionEvent.ACTION_POINTER_DOWN)handler.removeCallbacks(hold);
        return super.dispatchTouchEvent(event);
    }
    static boolean sameRows(List<?> first,List<?> second){if(first==null||second==null||first.size()!=second.size())return false;for(int i=0;i<first.size();i++)if(first.get(i)!=second.get(i)&&!HomeThreadOrder.sameHeading(first.get(i),second.get(i)))return false;return true;}
    private void cancel(){handler.removeCallbacks(hold);handler.removeCallbacks(scroll);dragging=false;draggedLabel=null;snapshot=null;headingForPosition=null;from=to=-1;if(image!=null){image.recycle();image=null;}if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(false);invalidate();}
    private int childPosition(View child,int visibleIndex){
        if(list instanceof ListView)return ((ListView)list).getFirstVisiblePosition()+visibleIndex;
        try{
            if(childAdapterPosition==null)childAdapterPosition=list.getClass().getMethod("getChildAdapterPosition",View.class);
            return ((Number)childAdapterPosition.invoke(list,child)).intValue();
        }catch(ReflectiveOperationException ignored){return -1;}
    }

    private void bindVisiblePins(){
        List<?> rows=HomeThreadOrder.presented(list,mode);
        if(rows==null||!(list instanceof ViewGroup))return;
        ViewGroup children=(ViewGroup)list;
        Set<String> pinned=HomeThreadOrder.pins(mode);
        visibleTitles.clear();
        for(int i=0;i<children.getChildCount();i++){
            View child=children.getChildAt(i);
            int position=childPosition(child,i);
            if(position<0)continue;
            Object item=list instanceof ListView?((ListView)list).getItemAtPosition(position)
                :position<rows.size()?rows.get(position):null;
            String key=rowKey(item);
            if(key==null||key.startsWith("board\n"))continue;
            TextView title=threadTitle(child);
            if(title==null)continue;
            visibleTitles.add(title);
            RowPin pin=rowPins.get(title);
            Drawable[] drawables=title.getCompoundDrawablesRelative();
            if(pin==null||drawables[2]!=pin){
                pin=new RowPin(title,drawables[2]);
                rowPins.put(title,pin);
                title.setCompoundDrawablesRelative(drawables[0],drawables[1],pin,drawables[3]);
            }
            pin.setPinned(pinned.contains(key));
        }
        Iterator<Map.Entry<TextView,RowPin>> entries=rowPins.entrySet().iterator();
        while(entries.hasNext()){
            Map.Entry<TextView,RowPin> entry=entries.next();
            if(!visibleTitles.contains(entry.getKey())){
                removeRowPin(entry.getKey(),entry.getValue());
                entries.remove();
            }
        }
    }

    private String rowKey(Object row){
        if(row==null)return null;
        if(rowKeys.containsKey(row))return rowKeys.get(row);
        if(rowKeys.size()>=256)rowKeys.clear();
        String key=HomeThreadOrder.key(row);rowKeys.put(row,key);return key;
    }

    private static TextView threadTitle(View row){
        View nativeTitle=row.findViewById(0x7f0902d7);
        if(nativeTitle instanceof TextView)return (TextView)nativeTitle;
        return firstRowText(row);
    }

    private static TextView firstRowText(View row){
        if(row.getVisibility()!=View.VISIBLE)return null;
        if(row instanceof TextView&&((TextView)row).length()>0)return (TextView)row;
        if(row instanceof ViewGroup){
            ViewGroup group=(ViewGroup)row;
            for(int i=0;i<group.getChildCount();i++){
                TextView text=firstRowText(group.getChildAt(i));
                if(text!=null)return text;
            }
        }
        return null;
    }

    private static void removeRowPin(TextView title,RowPin pin){
        Drawable[] drawables=title.getCompoundDrawablesRelative();
        if(drawables[2]==pin)title.setCompoundDrawablesRelative(drawables[0],drawables[1],pin.original,drawables[3]);
    }

    private static final class RowPin extends Drawable {
        final Drawable original;
        private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path glyph=new Path();
        private final float density;
        private final int iconWidth;
        private boolean pinned;

        RowPin(TextView title,Drawable original){
            this.original=original;
            density=title.getResources().getDisplayMetrics().density;
            iconWidth=Math.round(22*density);
            glyph.moveTo(-3,-6);
            glyph.lineTo(3,-6);
            glyph.lineTo(2,-2);
            glyph.lineTo(4,1);
            glyph.lineTo(-4,1);
            glyph.lineTo(-2,-2);
            glyph.close();
            setBounds(0,0,getIntrinsicWidth(),getIntrinsicHeight());
        }

        void setPinned(boolean value){
            if(pinned!=value){
                pinned=value;
                invalidateSelf();
            }
        }

        @Override public int getIntrinsicWidth(){return iconWidth+(original==null?0:original.getBounds().width());}
        @Override public int getIntrinsicHeight(){
            return Math.max(Math.round(18*density),original==null?0:original.getBounds().height());
        }

        @Override public void draw(Canvas canvas){
            Rect box=getBounds();
            if(original!=null){
                Rect nativeBounds=original.getBounds();
                canvas.save();
                canvas.translate(box.left-nativeBounds.left,box.exactCenterY()-nativeBounds.exactCenterY());
                original.draw(canvas);
                canvas.restore();
            }
            canvas.save();
            canvas.translate(box.right-iconWidth/2f,box.exactCenterY());
            canvas.scale(density,density);
            paint.setColor(pinned?0xff1976d2:0xff757575);
            paint.setStrokeWidth(1.4f);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setStyle(pinned?Paint.Style.FILL_AND_STROKE:Paint.Style.STROKE);
            canvas.drawPath(glyph,paint);
            canvas.drawLine(0,1,0,6,paint);
            canvas.restore();
        }

        @Override public void setAlpha(int alpha){}
        @Override public void setColorFilter(ColorFilter filter){}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }

    @Override protected void dispatchDraw(Canvas canvas){
        super.dispatchDraw(canvas);
        android.graphics.Rect visible=new android.graphics.Rect();
        if(!list.getLocalVisibleRect(visible))return;
        int[] own=new int[2];getLocationInWindow(own);
        int[] origin=new int[2];list.getLocationInWindow(origin);
        float left=origin[0]-own[0], top=origin[1]-own[1];
        int saved=canvas.save();
        canvas.clipRect(left+Math.max(visible.left,list.getPaddingLeft()),
            top+Math.max(visible.top,list.getPaddingTop()),
            left+Math.min(visible.right,list.getWidth()-list.getPaddingRight()),
            top+Math.min(visible.bottom,list.getHeight()-list.getPaddingBottom()));
        if(dragging&&image!=null){
            paint.setAlpha(190);
            canvas.drawBitmap(image,left,y-grabOffset,paint);
            paint.setAlpha(255);
            int marker=to;
            if(draggedLabel!=null&&snapshot!=null&&to>=0){
                String section=HomeThreadOrder.sectionKey(snapshot.get(to));
                if(to>from){
                    while(marker+1<snapshot.size()){
                        String next=HomeThreadOrder.sectionKey(snapshot.get(marker+1));
                        if(next!=null&&!next.equals(section))break;
                        marker++;
                    }
                }else{
                    while(marker>0&&section!=null&&section.equals(HomeThreadOrder.sectionKey(snapshot.get(marker-1))))marker--;
                }
            }
            View target=row(marker);
            float line=target==null?(draggedLabel!=null&&to>from?top+visible.bottom-3:y)
                    :top+target.getY()+(to>=from||(draggedLabel==null&&snapshot!=null&&to>=0&&HomeThreadOrder.key(snapshot.get(to))==null)?target.getHeight():0);
            paint.setColor(0xff448aff);
            canvas.drawRect(left,line-2,left+list.getWidth(),line+2,paint);
        }
        canvas.restoreToCount(saved);
    }
    @Override protected void onAttachedToWindow(){
        super.onAttachedToWindow();
        getViewTreeObserver().addOnPreDrawListener(pinListener);
    }

    @Override protected void onDetachedFromWindow(){
        ViewTreeObserver observer=getViewTreeObserver();
        if(observer.isAlive())observer.removeOnPreDrawListener(pinListener);
        for(Map.Entry<TextView,RowPin> entry:rowPins.entrySet())removeRowPin(entry.getKey(),entry.getValue());
        rowPins.clear();
        visibleTitles.clear();
        cancel();
        super.onDetachedFromWindow();
    }
}
