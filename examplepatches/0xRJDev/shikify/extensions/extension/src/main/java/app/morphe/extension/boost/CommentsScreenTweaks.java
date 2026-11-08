package app.morphe.extension.boost;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import androidx.recyclerview.widget.RecyclerView$g;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.RelativeLayout;
import java.lang.ref.WeakReference;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.WeakHashMap;

/** Thread cards follow the native visible dataset, never just the attached neighbours. */
public final class CommentsScreenTweaks {
    private static final WeakHashMap<View,Row> ROWS=new WeakHashMap<>();
    private static final WeakHashMap<View,Controller> SCREENS=new WeakHashMap<>();
    private CommentsScreenTweaks() { }
    public static void bindComment(Object holder){bind(holder,"c0",false);}
    public static void bindLoadMore(Object holder){
        if(holder==null)return;
        for(Class<?> type=holder.getClass();type!=null;type=type.getSuperclass())if(type.getName().equals("com.rubenmayayo.reddit.ui.adapters.LoadMoreViewHolder")){bind(holder,"R",false);return;}
    }
    public static void bindPost(Object holder){bind(holder,"b0",true);}
    private static void bind(Object holder,String field,boolean post){
        Object value=CommentsChromeTweaks.field(holder,"a");if(!(value instanceof View))return;
        View view=(View)value;Row row=ROWS.get(view);
        if(row==null){row=new Row(view);ROWS.put(view,row);}
        row.holder=new WeakReference<>(holder);row.modelAccessor=CommentsChromeTweaks.accessor(holder,field);row.post=post;
    }
    public static void onBound(Object holder){
        Object value=CommentsChromeTweaks.field(holder,"a");if(!(value instanceof View))return;
        View view=(View)value;Row row=ROWS.get(view);if(row==null)return;
        moreReplies(view,row.model());
        for(Controller controller:SCREENS.values()) {
            if(controller.sync() && controller.shape(view,row))return;
        }
    }
    /** Keep native targets, progress and indentation; remove only the obsolete label box. */
    private static void moreReplies(View row,Object model){
        View label=find(row,"item_comment_loadmore_text");if(!(label instanceof TextView))return;
        TextView text=(TextView)label;text.setBackground(null);text.setBackgroundTintList(null);
        text.setPaddingRelative(0,dp(row,4),dp(row,12),dp(row,4));text.setMinHeight(dp(row,40));text.setGravity(android.view.Gravity.CENTER_VERTICAL);
        text.setTextColor(MaterialYouTweaks.color(row.getContext(),"colorPrimary",android.R.attr.colorAccent));
        Object count=CommentsChromeTweaks.field(model,"W"),kind=CommentsChromeTweaks.field(model,"X");
        if(Integer.valueOf(0).equals(kind) && count instanceof Integer){
            int id=row.getResources().getIdentifier("shikify_view_more","string",row.getContext().getPackageName());
            if(id!=0)text.setText(row.getResources().getString(id,count));
        }
        if(label.getParent() instanceof View)((View)label.getParent()).setBackground(null);
        View divider=find(row,"top_line");if(divider!=null)divider.setVisibility(View.GONE);
    }
    public static void attach(Object fragment){
        Object value=CommentsChromeTweaks.field(fragment,"mRecyclerView");if(!(value instanceof ViewGroup))return;
        ViewGroup view=(ViewGroup)value;Controller old=SCREENS.get(view);
        if(old!=null){old.fragment=new WeakReference<>(fragment);old.attach(view);return;}
        Controller controller=new Controller(fragment,view);SCREENS.put(view,controller);
        view.addOnAttachStateChangeListener(controller);controller.attach(view);
    }
    public static void detach(Object fragment){
        Object value=CommentsChromeTweaks.field(fragment,"mRecyclerView");if(!(value instanceof View))return;
        Controller controller=SCREENS.remove((View)value);if(controller!=null)controller.detach();
        ((View)value).removeOnAttachStateChangeListener(controller);
    }
    private static int dp(View view,int size){return CommentLayoutTweaks.dp(view,size);}
    private static int depth(Object value){
        if(value==null)return -1;
        boolean comment=false;
        for(Class<?> type=value.getClass();type!=null;type=type.getSuperclass())if(type.getName().equals("com.rubenmayayo.reddit.models.reddit.CommentViewModel")){comment=true;break;}
        if(!comment)return -1;
        Object result=CommentsChromeTweaks.field(value,"R");return result instanceof Integer ? (Integer)result:-1;
    }
    private static final class Controller implements ViewTreeObserver.OnPreDrawListener,ViewTreeObserver.OnGlobalLayoutListener,View.OnAttachStateChangeListener {
        WeakReference<Object> fragment;
        final WeakReference<ViewGroup> recycler;
        WeakReference<ViewTreeObserver> observer;
        Object[] snapshot=new Object[0];int[] levels=new int[0];boolean[] shown=new boolean[0];boolean[] starts=new boolean[0],ends=new boolean[0];int first=-1;
        final IdentityHashMap<Object,Integer> positions=new IdentityHashMap<>();
        WeakReference<Object> adapter;
        WeakReference<List<?>> dataset;
        java.lang.reflect.Method unregister;
        final DatasetObserver changes=new DatasetObserver(this);
        boolean dirty=true,structural=true;
        int changedStart=Integer.MAX_VALUE,changedEnd;
        void contentChanged(int start,int count){
            dirty=true;
            if(start<0 || count<0 || start>Integer.MAX_VALUE-count){structural=true;return;}
            changedStart=Math.min(changedStart,start);changedEnd=Math.max(changedEnd,start+count);
        }
        boolean contentSame(List<?> list){
            for(int i=changedStart;i<Math.min(changedEnd,snapshot.length);i++) {
                Object model=list.get(i);
                if(model!=snapshot[i] || depth(model)!=levels[i] || (levels[i]>=0 && visible(model)!=shown[i]))return false;
            }
            return true;
        }
        void observe(Object owner) {
            Object next=CommentsChromeTweaks.field(owner,"C"),old=adapter==null ? null:adapter.get();
            if(next==old)return;
            unobserve();dirty=true;structural=true;
            if(next==null)return;
            try {
                java.lang.reflect.Method register=next.getClass().getMethod("registerAdapterDataObserver",RecyclerView$g.class);
                unregister=next.getClass().getMethod("unregisterAdapterDataObserver",RecyclerView$g.class);
                register.invoke(next,changes);adapter=new WeakReference<>(next);
            }catch(ReflectiveOperationException | RuntimeException ignored){unregister=null;}
        }
        void unobserve(){
            Object old=adapter==null ? null:adapter.get();
            if(old!=null && unregister!=null)try{unregister.invoke(old,changes);}catch(ReflectiveOperationException | RuntimeException ignored) { }
            adapter=null;unregister=null;
        }
        @Override public void onGlobalLayout(){if(adapter==null){dirty=true;structural=true;}}
        Controller(Object owner,ViewGroup view){fragment=new WeakReference<>(owner);recycler=new WeakReference<>(view);}
        void attach(View view){
            ViewTreeObserver tree=view.getViewTreeObserver(),old=observer==null ? null:observer.get();if(old==tree)return;
            if(old!=null && old.isAlive()){old.removeOnPreDrawListener(this);old.removeOnGlobalLayoutListener(this);}
            tree.removeOnPreDrawListener(this);tree.addOnPreDrawListener(this);
            tree.removeOnGlobalLayoutListener(this);tree.addOnGlobalLayoutListener(this);observer=new WeakReference<>(tree);
            dirty=true;structural=true;Object owner=fragment.get();if(owner!=null)observe(owner);
        }
        void detach(){
            ViewTreeObserver old=observer==null ? null:observer.get();
            if(old!=null && old.isAlive()){
                old.removeOnPreDrawListener(this);
                old.removeOnGlobalLayoutListener(this);
            }
            observer=null;
            unobserve();
            dirty=true;
            structural=true;
        }
        @Override public void onViewAttachedToWindow(View view){attach(view);}
        @Override public void onViewDetachedFromWindow(View view){detach();}
        final IdentityHashMap<Class<?>,java.lang.reflect.Field> visibilityFields=new IdentityHashMap<>();
        boolean visible(Object model){
            try {
                Class<?> type=model.getClass();java.lang.reflect.Field field=visibilityFields.get(type);
                if(field==null){field=type.getField("S");field.setAccessible(true);visibilityFields.put(type,field);}
                return field.getBoolean(model);
            }catch(ReflectiveOperationException | RuntimeException ignored){return true;}
        }
        boolean same(List<?> list){
            if(list.size()!=snapshot.length)return false;
            for(int i=0;i<snapshot.length;i++)if(list.get(i)!=snapshot[i] || (levels[i]>=0 && visible(snapshot[i])!=shown[i]))return false;
            return true;
        }
        void refresh(List<?> list){
            snapshot=list.toArray();int count=snapshot.length;levels=new int[count];shown=new boolean[count];starts=new boolean[count];ends=new boolean[count];positions.clear();first=-1;
            for(int i=0;i<count;i++){positions.put(snapshot[i],i);levels[i]=depth(snapshot[i]);shown[i]=levels[i]<0 || visible(snapshot[i]);}
            int base=-1,previous=-1;
            for(int i=0;i<count;i++){
                if(!shown[i])continue;
                int level=levels[i];
                if(level<0){if(previous>=0)ends[previous]=true;base=-1;previous=-1;continue;}
                if(first<0)first=i;
                starts[i]=base<0 || level<=base;
                if(starts[i]){if(previous>=0)ends[previous]=true;base=level;}
                previous=i;
            }
            if(previous>=0)ends[previous]=true;
        }
        boolean sync(){
            Object owner=fragment.get();if(owner==null)return false;
            Object data=CommentsChromeTweaks.field(owner,"B");if(!(data instanceof List))return false;
            observe(owner);List<?> list=(List<?>)data;
            if(dirty || dataset==null || dataset.get()!=list || snapshot.length!=list.size()) {
                if(structural || dataset==null || dataset.get()!=list || snapshot.length!=list.size() || !contentSame(list))refresh(list);
                dataset=new WeakReference<>(list);dirty=false;structural=false;changedStart=Integer.MAX_VALUE;changedEnd=0;
            }
            return true;
        }
        boolean shape(View child,Row row){
            Integer index=positions.get(row.model());if(index==null)return false;
            if(row.post){row.postLayout(child);row.shape(child,0,false,true);}
            else if(shown[index] && levels[index]>=0)row.shape(child,starts[index] ? dp(child,index==first ? 14:8):0,starts[index],ends[index]);
            return true;
        }
        @Override public boolean onPreDraw(){
            ViewGroup view=recycler.get();if(view==null || !sync())return true;
            for(int i=0;i<view.getChildCount();i++){
                View child=view.getChildAt(i);Row row=ROWS.get(child);if(row!=null)shape(child,row);
            }
            // Row padding/layout is prepared after native binding, before RecyclerView measures.
            // Never withhold the entire frame when rows enter the viewport.
            return true;
        }
    }
    /** Exact native observer ABI, checked before applying to Boost 1.14.3. */
    public static final class DatasetObserver extends RecyclerView$g {
        final WeakReference<Controller> controller;
        DatasetObserver(Controller owner){controller=new WeakReference<>(owner);}
        void changed(){Controller owner=controller.get();if(owner!=null){owner.dirty=true;owner.structural=true;}}
        @Override public void a(){changed();}
        @Override public void b(){changed();}
        @Override public void c(int start,int count,Object payload){Controller owner=controller.get();if(owner!=null)owner.contentChanged(start,count);}
        @Override public void d(int start,int count){changed();}
        @Override public void e(int start,int count){changed();}
        @Override public void f(int from,int to){changed();}
        @Override public void g(){changed();}
    }
    private static final class Row {
        WeakReference<Object> holder;
        java.lang.reflect.Field modelAccessor;
        final int left,top,right,bottom;
        boolean post,postInstalled;
        Mask mask;
        Row(View view){left=view.getPaddingLeft();top=view.getPaddingTop();right=view.getPaddingRight();bottom=view.getPaddingBottom();}
        Object model(){
            Object owner=holder==null ? null:holder.get();
            if(owner==null || modelAccessor==null)return null;
            try{return modelAccessor.get(owner);}catch(ReflectiveOperationException | RuntimeException ignored){return null;}
        }
        boolean shape(View view,int gap,boolean first,boolean last){
            boolean changed=false;
            if(mask==null){
                mask=new Mask(view);Drawable original=view.getForeground();view.setForeground(original==null ? mask:new LayerDrawable(new Drawable[]{original,mask}));
                view.setBackgroundColor(MaterialYouTweaks.color(view.getContext(),"colorSurfaceContainerHigh",android.R.attr.colorBackground));changed=true;
            }
            if(view.getPaddingTop()!=top+gap || view.getPaddingLeft()!=left || view.getPaddingRight()!=right || view.getPaddingBottom()!=bottom){
                view.setPadding(left,top+gap,right,bottom);
                changed=true;
            }
            if(mask.gap!=gap || mask.first!=first || mask.last!=last){mask.gap=gap;mask.first=first;mask.last=last;mask.invalidateSelf();}
            return changed;
        }
        boolean postLayout(View row){
            if(postInstalled)return false;
            View media=find(row,"visibility_container"),metadata=find(row,"post_metadata");
            if(!(row instanceof LinearLayout) || media==null || metadata==null || media.getParent()!=row || metadata.getParent()!=row)return false;
            LinearLayout parent=(LinearLayout)row;
            if(parent.indexOfChild(media)!=0){ViewGroup.LayoutParams params=media.getLayoutParams();parent.removeView(media);parent.addView(media,0,params);}
            View title=find(row,"submission_header_title"),info=find(row,"subreddit_info");
            if(metadata instanceof RelativeLayout && title!=null && info!=null && title.getParent()==metadata && info.getParent()==metadata){
                RelativeLayout.LayoutParams tp=(RelativeLayout.LayoutParams)title.getLayoutParams();
                tp.removeRule(RelativeLayout.BELOW);
                tp.addRule(RelativeLayout.ALIGN_PARENT_TOP);
                title.setLayoutParams(tp);
                RelativeLayout.LayoutParams ip=(RelativeLayout.LayoutParams)info.getLayoutParams();
                ip.removeRule(RelativeLayout.ALIGN_PARENT_TOP);
                ip.addRule(RelativeLayout.BELOW,title.getId());
                ip.topMargin=dp(row,4);
                info.setLayoutParams(ip);
                View extra=find(row,"submission_info_extra");
                if(extra!=null && extra.getParent()==metadata){
                    RelativeLayout.LayoutParams ep=(RelativeLayout.LayoutParams)extra.getLayoutParams();
                    ep.addRule(RelativeLayout.BELOW,info.getId());
                    extra.setLayoutParams(ep);
                }
                View score=find(row,"submission_header_score");
                if(score!=null && score.getParent() instanceof LinearLayout && ((View)score.getParent()).getParent()==metadata) {
                    LinearLayout counts=(LinearLayout)score.getParent();
                    PostMetadataRow inline=new PostMetadataRow(row.getContext());inline.setId(View.generateViewId());
                    RelativeLayout.LayoutParams flow=new RelativeLayout.LayoutParams(-1,-2);flow.addRule(RelativeLayout.ALIGN_PARENT_TOP);
                    ((ViewGroup)metadata).removeView(title);((ViewGroup)metadata).removeView(info);((ViewGroup)metadata).removeView(counts);
                    title.setLayoutParams(new ViewGroup.MarginLayoutParams(-2,-2));inline.addView(title);
                    info.setLayoutParams(new ViewGroup.MarginLayoutParams(-2,-2));inline.addView(info);
                    while(counts.getChildCount()>0){
                        View item=counts.getChildAt(0);
                        ViewGroup.MarginLayoutParams params=new ViewGroup.MarginLayoutParams(item.getLayoutParams());
                        params.width=-2;
                        params.height=-2;
                        params.topMargin=params.bottomMargin=0;
                        counts.removeViewAt(0);
                        inline.addView(item,params);
                    }
                    ((ViewGroup)metadata).addView(inline,flow);
                    View thumb=find(row,"submission_header_thumbnail");
                    if(thumb!=null && thumb.getParent()==metadata){
                        RelativeLayout.LayoutParams p=(RelativeLayout.LayoutParams)thumb.getLayoutParams();
                        p.removeRule(RelativeLayout.BELOW);
                        p.addRule(RelativeLayout.ALIGN_PARENT_TOP);
                        thumb.setLayoutParams(p);
                        flow.addRule(RelativeLayout.START_OF,thumb.getId());
                        inline.setLayoutParams(flow);
                    }
                    if(extra!=null && extra.getParent()==metadata){
                        RelativeLayout.LayoutParams ep=(RelativeLayout.LayoutParams)extra.getLayoutParams();
                        ep.addRule(RelativeLayout.BELOW,inline.getId());
                        extra.setLayoutParams(ep);
                    }
                }
                // A visible native preview owns the full image; it no longer needs a thumbnail column.
                View preview=find(row,"preview_image"),gallery=find(row,"gallery_view");
                if((preview!=null && preview.getVisibility()==View.VISIBLE)||(gallery!=null && gallery.getVisibility()==View.VISIBLE)){
                    if(title.getParent()==metadata){tp.removeRule(RelativeLayout.LEFT_OF);tp.removeRule(RelativeLayout.START_OF);tp.width=-1;title.setLayoutParams(tp);}
                }
            }
            View self=find(row,"submission_header_selftext_container");
            if(self!=null)self.setBackground(null);
            postInstalled=true;return true;
        }
    }
    private static View find(View root,String name){int id=Ids.view(root,name);return id==0 ? null:root.findViewById(id);}
    /** Native metadata and counts share lines when space permits. All original
     * views, rich spans, accessibility and click/vote state remain live. */
    public static final class PostMetadataRow extends ViewGroup {
        private int[] x=new int[0],y=new int[0],widths=new int[0],heights=new int[0];
        TextView score,info;
        CharSequence lastScore;
        android.graphics.Typeface scoreTypeface;
        final int gap,rowGap;
        public PostMetadataRow(android.content.Context context){
            super(context);
            gap=Math.round(6*getResources().getDisplayMetrics().density);
            rowGap=Math.round(3*getResources().getDisplayMetrics().density);
        }
        @Override protected ViewGroup.LayoutParams generateDefaultLayoutParams(){return new ViewGroup.MarginLayoutParams(-2,-2);}
        @Override protected void onMeasure(int widthSpec,int heightSpec){
            if(score==null){
                View value=find(this,"submission_header_score"),author=find(this,"submission_header_info_top");
                if(value instanceof TextView)score=(TextView)value;
                if(author instanceof TextView)info=(TextView)author;
            }
            if(score!=null && info!=null){
                if(score.getTextSize()!=info.getTextSize())score.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,info.getTextSize());
                if(scoreTypeface!=score.getTypeface()){CommentLayoutTweaks.regularScore(score);scoreTypeface=score.getTypeface();}
                if(lastScore!=score.getText()){CommentLayoutTweaks.scoreLabel(score);lastScore=score.getText();}
            }
            int count=getChildCount();if(x.length<count){x=new int[count];y=new int[count];widths=new int[count];heights=new int[count];}
            int available=MeasureSpec.getMode(widthSpec)==MeasureSpec.UNSPECIFIED ? Integer.MAX_VALUE/4:MeasureSpec.getSize(widthSpec);
            if(count<2){setMeasuredDimension(resolveSize(0,widthSpec),resolveSize(0,heightSpec));return;}
            int countsWidth=0;
            for(int i=0;i<count;i++){
                View child=getChildAt(i);x[i]=y[i]=widths[i]=heights[i]=0;
                if(child.getVisibility()==GONE)continue;
                child.measure(MeasureSpec.makeMeasureSpec(available,MeasureSpec.AT_MOST),MeasureSpec.makeMeasureSpec(0,MeasureSpec.UNSPECIFIED));
                widths[i]=child.getMeasuredWidth();heights[i]=child.getMeasuredHeight();
                if(i>=2)countsWidth+=widths[i]+gap;
            }
            boolean titleLine=getChildAt(0) instanceof android.widget.TextView && ((android.widget.TextView)getChildAt(0)).getLineCount()<=1;
            if(widths[1]+countsWidth>available && titleLine && widths[0]+countsWidth<=available){
                int cursor=widths[0],height=heights[0];
                for(int i=2;i<count;i++)if(getChildAt(i).getVisibility()!=GONE){x[i]=cursor+gap;cursor=x[i]+widths[i];height=Math.max(height,heights[i]);}
                y[0]=(height-heights[0])/2;
                for(int i=2;i<count;i++)y[i]=(height-heights[i])/2;
                y[1]=height+rowGap;
                setMeasuredDimension(resolveSize(Math.max(cursor,widths[1]),widthSpec),resolveSize(y[1]+heights[1],heightSpec));return;
            }
            int cursor=widths[1],top=heights[0]+rowGap,lineHeight=heights[1],lineStart=1,desiredWidth=widths[0];
            y[1]=top;
            for(int i=2;i<count;i++){
                View child=getChildAt(i);if(child.getVisibility()==GONE)continue;
                int w=widths[i],h=heights[i],spacing=cursor==0 ? 0:gap;
                if(cursor>0 && cursor+spacing+w>available){
                    align(lineStart,i,top,lineHeight);
                    desiredWidth=Math.max(desiredWidth,cursor);
                    top+=lineHeight+rowGap;
                    cursor=0;
                    lineHeight=0;
                    lineStart=i;
                    spacing=0;
                }
                x[i]=cursor+spacing;y[i]=top;cursor=x[i]+w;lineHeight=Math.max(lineHeight,h);
            }
            align(lineStart,count,top,lineHeight);desiredWidth=Math.max(desiredWidth,cursor);
            setMeasuredDimension(resolveSize(desiredWidth,widthSpec),resolveSize(top+lineHeight,heightSpec));
        }
        void align(int first,int end,int top,int height){for(int i=first;i<end;i++)if(getChildAt(i).getVisibility()!=GONE)y[i]=top+(height-heights[i])/2;}
        @Override protected void onLayout(boolean changed,int left,int top,int right,int bottom){
            boolean rtl=getLayoutDirection()==LAYOUT_DIRECTION_RTL;
            for(int i=0;i<getChildCount();i++){int start=rtl ? getWidth()-x[i]-widths[i]:x[i];getChildAt(i).layout(start,y[i],start+widths[i],y[i]+heights[i]);}
        }
    }
    /** Opaque outside-of-card mask also works on Android versions without path outline clipping. */
    public static final class Mask extends Drawable {
        final WeakReference<View> view;final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);final Path path=new Path();
        int gap;boolean first,last;
        float lastWidth=-1,lastHeight=-1;int lastGap=-1;boolean lastFirst,lastLast;
        final RectF rect=new RectF();final float[] radii=new float[8];
        final float cornerRadius;
        Mask(View owner){
            view=new WeakReference<>(owner);
            cornerRadius=dp(owner,16);
            paint.setColor(MaterialYouTweaks.color(owner.getContext(),"colorSurfaceContainerLow",android.R.attr.colorBackground));
        }
        @Override public void draw(Canvas canvas){
            View owner=view.get();if(owner==null || (gap==0 && !first && !last))return;
            float w=getBounds().width(),h=getBounds().height();
            if(w!=lastWidth || h!=lastHeight || gap!=lastGap || first!=lastFirst || last!=lastLast){
                float radius=Math.min(cornerRadius,Math.max(0,h-gap)/2f),upper=first ? radius:0,lower=last ? radius:0;
                for(int i=0;i<4;i++)radii[i]=upper;
                for(int i=4;i<8;i++)radii[i]=lower;
                rect.set(0,gap,w,h);path.reset();path.setFillType(Path.FillType.EVEN_ODD);path.addRect(0,0,w,h,Path.Direction.CW);
                path.addRoundRect(rect,radii,Path.Direction.CW);
                lastWidth=w;lastHeight=h;lastGap=gap;lastFirst=first;lastLast=last;
            }
            canvas.drawPath(path,paint);
        }
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);}
        @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
}
