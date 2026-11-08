package app.morphe.extension.boost;

import android.graphics.Typeface;
import android.os.Build;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.WeakHashMap;

/** Keep native bound views/listeners; arrange their metadata together. */
public final class CommentLayoutTweaks {
    private static final WeakHashMap<View, Layout> ROWS=new WeakHashMap<>();
    private CommentLayoutTweaks() { }
    public static void bind(Object holder) {
        Object value=CommentsChromeTweaks.field(holder,"a");
        if (!(value instanceof View)) return;
        View row=(View)value;
        if (ROWS.containsKey(row)) return;
        Layout layout=new Layout(holder,row); ROWS.put(row,layout);
        row.addOnAttachStateChangeListener(layout); layout.attach(row);
    }
    public static void onBound(Object holder) {
        Object value=CommentsChromeTweaks.field(holder,"a");
        Layout layout=value instanceof View ? ROWS.get((View)value):null;
        if(layout!=null)layout.onPreDraw();
    }
    static int dp(View view,int value) { return Math.round(value*view.getResources().getDisplayMetrics().density); }
    /** The post title above a profile comment already provides the gap this header would add. */
    static void compactHeader(View container) {
        if(!(container instanceof ViewGroup))return;ViewGroup group=(ViewGroup)container;
        for(int index=0;index<group.getChildCount();index++){
            View child=group.getChildAt(index);
            if(child instanceof HeaderRow && child.getLayoutParams() instanceof ViewGroup.MarginLayoutParams){
                ViewGroup.MarginLayoutParams params=(ViewGroup.MarginLayoutParams)child.getLayoutParams();
                if(params.topMargin!=dp(child,4)){params.topMargin=dp(child,4);child.setLayoutParams(params);}
            }
        }
    }
    static void regularScore(View view) {
        if(!(view instanceof TextView))return;TextView text=(TextView)view;Typeface face=text.getTypeface();
        text.setTypeface(Build.VERSION.SDK_INT>=28 ? Typeface.create(face,400,face!=null && face.isItalic()):Typeface.create(face,face!=null && face.isItalic() ? Typeface.ITALIC:Typeface.NORMAL));
    }
    static boolean scoreLabel(TextView text) {
        String value=text.getText().toString(),next=value;
        if(value.indexOf('?')>=0)next=value.replace("?","[score hidden]").replace(" points","");
        else if(value.equals("1") || value.equals("1 points"))next="1 point";
        else if(!value.isEmpty() && !value.contains("[score hidden]") && !value.endsWith(" points") && !value.endsWith(" point"))next=value+" points";
        if(next.equals(value))return false;
        text.setText(next);return true;
    }
    private static final class Layout implements ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener {
        final WeakReference<Object> holder;
        final WeakReference<View> root;
        Typeface applied;
        WeakReference<ViewTreeObserver> observer;
        WeakReference<HeaderRow> header;
        WeakReference<CharSequence> lastScore;
        WeakReference<TextView> authorView,scoreView,timeView;
        boolean dirty;
        Layout(Object owner,View row) {
            holder=new WeakReference<>(owner);root=new WeakReference<>(row);
            Object author=CommentsChromeTweaks.field(owner,"authorTv"),score=CommentsChromeTweaks.field(owner,"scoreTv"),time=CommentsChromeTweaks.field(owner,"timeTv");
            if(author instanceof TextView)authorView=new WeakReference<>((TextView)author);
            if(score instanceof TextView)scoreView=new WeakReference<>((TextView)score);
            if(time instanceof TextView)timeView=new WeakReference<>((TextView)time);
        }
        void attach(View view) {
            ViewTreeObserver old=observer==null ? null:observer.get();
            if (old==view.getViewTreeObserver()) return;
            FrameBus.remove(old,this); ViewTreeObserver tree=FrameBus.add(view,this); observer=tree==null ? null:new WeakReference<>(tree);
        }
        @Override public void onViewAttachedToWindow(View view) { attach(view); }
        @Override public void onViewDetachedFromWindow(View view) {
            FrameBus.remove(observer==null ? null:observer.get(),this);
            observer=null;
        }
        @Override public boolean onPreDraw() {
            dirty=false;
            View row=root.get(); Object owner=holder.get();
            if (row==null || owner==null) return true;
            TextView author=authorView==null ? null:authorView.get();
            if(author==null)return true;
            if (header==null && author.getParent() instanceof RelativeLayout) install(owner,author,(RelativeLayout)author.getParent());
            Typeface current=author.getTypeface();
            if (current!=applied) {
                applied=Build.VERSION.SDK_INT>=28 ? Typeface.create(current,Math.max(500,current==null ? 400:current.getWeight()),current!=null && current.isItalic())
                    : Typeface.create(current,current!=null && current.isItalic() ? Typeface.BOLD_ITALIC:Typeface.BOLD);
                author.setTypeface(applied); applied=author.getTypeface(); dirty=true;
            }
            TextView score=scoreView==null ? null:scoreView.get(),time=timeView==null ? null:timeView.get();
            matchSize(score,author.getTextSize());matchSize(time,author.getTextSize());
            if(score!=null && score.getAlpha()!=0.78f)score.setAlpha(0.78f);
            if(time!=null && time.getAlpha()!=0.78f)time.setAlpha(0.78f);
            if(score!=null && (lastScore==null || lastScore.get()!=score.getText())) {
                dirty|=scoreLabel(score);lastScore=new WeakReference<>(score.getText());
            }
            // Never cancel a scrolling frame. The native adapter completion hook
            // prepares new rows before measurement; this is a fallback for other lists.
            return true;
        }
        void matchSize(TextView text,float size) {
            if(text!=null && Math.abs(text.getTextSize()-size)>.01f) {
                text.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,size);dirty=true;
            }
        }
        void install(Object owner,TextView author,RelativeLayout parent) {
            Object score=CommentsChromeTweaks.field(owner,"scoreTv");if(score instanceof View)regularScore((View)score);
            HeaderRow line=new HeaderRow(parent.getContext(),author); header=new WeakReference<>(line); line.setId(View.generateViewId());
            RelativeLayout.LayoutParams hp=new RelativeLayout.LayoutParams(-1,-2);
            hp.setMarginStart(dp(parent,12));hp.setMarginEnd(dp(parent,12));hp.topMargin=dp(parent,12);hp.bottomMargin=dp(parent,4);
            parent.addView(line,hp);
            for(String name:new String[]{"authorAvatarIv","plusCollapsedTv","authorTv","authorTagTv","distinguishedTv"}) move(CommentsChromeTweaks.field(owner,name),parent);
            Object flair=CommentsChromeTweaks.field(owner,"authorRichFlairTv");
            if(flair instanceof View && ((View)flair).getParent() instanceof ViewGroup) {
                View child=(View)flair;ViewGroup wrapper=(ViewGroup)child.getParent();
                if(wrapper.getParent()==parent) { wrapper.removeView(child);line.addView(child,new ViewGroup.LayoutParams(-2,-2));if(wrapper.getChildCount()==0)parent.removeView(wrapper); }
            }
            move(CommentsChromeTweaks.field(owner,"scoreTv"),parent);
            int dotId=parent.getResources().getIdentifier("item_comment_dot","id",parent.getContext().getPackageName());
            if(dotId!=0) move(parent.findViewById(dotId),parent);
            for(String name:new String[]{"timeTv","awardsView","collapsedTv"}) move(CommentsChromeTweaks.field(owner,name),parent);
            Object body=CommentsChromeTweaks.field(owner,"commentTv");
            if(body instanceof View && ((View)body).getParent()==parent) {
                View text=(View)body; RelativeLayout.LayoutParams bp=(RelativeLayout.LayoutParams)text.getLayoutParams();
                bp.removeRule(RelativeLayout.BELOW);bp.addRule(RelativeLayout.BELOW,line.getId());
                bp.topMargin=dp(parent,2);text.setLayoutParams(bp);
                text.setPaddingRelative(dp(parent,12),text.getPaddingTop(),dp(parent,12),Math.max(text.getPaddingBottom(),dp(parent,12)));
            } else hp.bottomMargin=dp(parent,12);
            dirty=true;
        }
        void move(Object value,RelativeLayout parent) {
            if(!(value instanceof View) || ((View)value).getParent()!=parent) return;
            View child=(View)value; ViewGroup.LayoutParams old=child.getLayoutParams();
            int width=old.width,height=old.height;
            parent.removeView(child);
            if(child instanceof TextView) { ((TextView)child).setSingleLine(true);((TextView)child).setEllipsize(TextUtils.TruncateAt.END); }
            child.setPaddingRelative(child.getPaddingStart(),0,child.getPaddingEnd(),0);
            HeaderRow line=header.get();if(line!=null)line.addView(child,new ViewGroup.LayoutParams(width,height));
        }
        static void clear(RelativeLayout.LayoutParams params) {
            for(int i=0;i<params.getRules().length;i++) params.removeRule(i);
            params.setMargins(0,0,0,0);
            params.setMarginStart(0);
            params.setMarginEnd(0);
        }
    }
    /** Baseline-aligned flowing metadata; long usernames yield room to points/time. */
    public static final class HeaderRow extends ViewGroup {
        final TextView author;
        final ArrayList<int[]> positions=new ArrayList<>();
        public HeaderRow(android.content.Context context,TextView name) { super(context);author=name; }
        @Override protected void onMeasure(int widthSpec,int heightSpec) {
            int width=MeasureSpec.getSize(widthSpec),gap=dp(this,4),fixed=0;
            for(int i=0;i<getChildCount();i++) {
                View child=getChildAt(i);if(child.getVisibility()==GONE) continue;
                ViewGroup.LayoutParams p=child.getLayoutParams();
                child.measure(getChildMeasureSpec(MeasureSpec.makeMeasureSpec(width,MeasureSpec.AT_MOST),0,p.width),getChildMeasureSpec(MeasureSpec.makeMeasureSpec(0,MeasureSpec.UNSPECIFIED),0,p.height));
                if(child!=author) fixed+=child.getMeasuredWidth()+gap;
            }
            int budget=Math.max(Math.min(dp(this,64),width/3),width-fixed-gap);
            author.measure(MeasureSpec.makeMeasureSpec(Math.min(author.getMeasuredWidth(),Math.max(0,budget)),MeasureSpec.EXACTLY),MeasureSpec.makeMeasureSpec(0,MeasureSpec.UNSPECIFIED));
            while(positions.size()<getChildCount())positions.add(new int[4]);
            int x=0,y=0,lineHeight=0,ascent=0,descent=0,lineStart=0;
            for(int i=0;i<getChildCount();i++) {
                View child=getChildAt(i);int w=child.getMeasuredWidth(),h=child.getMeasuredHeight();
                if(child.getVisibility()==GONE) { int[] p=positions.get(i);p[0]=p[1]=p[2]=p[3]=0;continue; }
                if(x>0 && x+w>width) { alignLine(lineStart,i,y,lineHeight,ascent);y+=lineHeight+gap;x=0;lineHeight=ascent=descent=0;lineStart=i; }
                int baseline=child.getBaseline();
                if(baseline>=0) { ascent=Math.max(ascent,baseline);descent=Math.max(descent,h-baseline); }
                lineHeight=Math.max(Math.max(lineHeight,h),ascent+descent);
                // The separator glyph has its own side space, so its neighbours sit closer.
                boolean separator=child instanceof TextView && "\u00b7".contentEquals(((TextView)child).getText());
                if(separator && x>0)x=Math.max(0,x-dp(this,3));
                int[] p=positions.get(i);p[0]=x;p[1]=y;p[2]=w;p[3]=h;x+=w+(separator ? gap-dp(this,3):gap);
            }
            alignLine(lineStart,getChildCount(),y,lineHeight,ascent);
            setMeasuredDimension(resolveSize(width,widthSpec),resolveSize(y+lineHeight,heightSpec));
        }
        void alignLine(int start,int end,int top,int height,int baseline) {
            for(int i=start;i<end;i++) { View child=getChildAt(i);if(child.getVisibility()==GONE)continue;
                int[] p=positions.get(i);int b=child.getBaseline();p[1]=top+(b>=0 ? baseline-b:(height-p[3])/2);
            }
        }
        @Override protected void onLayout(boolean changed,int l,int t,int r,int b) {
            for(int i=0;i<getChildCount() && i<positions.size();i++) {
                int[] p=positions.get(i);
                int x=getLayoutDirection()==LAYOUT_DIRECTION_RTL ? getWidth()-p[0]-p[2]:p[0];
                getChildAt(i).layout(x,p[1],x+p[2],p[1]+p[3]);
            }
        }
    }
}
