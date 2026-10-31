package app.local.extension.curve;

import android.view.*;
import android.widget.*;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import java.lang.reflect.Proxy;
import java.util.*;
import java.util.function.Consumer;

/** Curve's card view, image loader and snapping helper, with bounded page widths. */
final class BatchCardCarousel extends RecyclerView {
    private final BatchGbitActivity activity;
    private final List<String> ids;
    private final Map<String,String> labels;
    private final Set<String> available;
    private final Map<String,Button> buttons=new HashMap<>();
    private final Consumer<String> selection;
    private final LinearLayoutManager layout;
    private final Object snap;
    private String selected;
    private int pageWidth,position,pendingPosition=-1;

    BatchCardCarousel(BatchGbitActivity activity,Map<String,String> labels,Set<String> available,String selected,Consumer<String> selection) throws Exception {
        super(activity);
        this.activity=activity; this.labels=labels; this.available=available; this.selection=selection;
        ids=new ArrayList<>(labels.keySet()); this.selected=selected; position=Math.max(0,ids.indexOf(selected));
        layout=new LinearLayoutManager(activity,HORIZONTAL,false);
        // Curve's shrinker renames LayoutManager, so resolve this host-library boundary at runtime.
        BatchCurve.call(this,"setLayoutManager",layout);
        setClipToPadding(false); setNestedScrollingEnabled(false); BatchCurve.call(this,"setItemAnimator",(Object)null);
        Class<?> listener=Class.forName("com.curve.transactions.gbit.CarouselSnapHelper$SnapToPosition");
        Object callback=Proxy.newProxyInstance(listener.getClassLoader(),new Class<?>[]{listener},(proxy,method,args)-> {
            if(method.getName().equals("onSnappedToPosition")) { int index=(Integer)args[0]; post(()->settled(index)); return null; }
            if(method.getName().equals("hashCode")) return System.identityHashCode(proxy);
            if(method.getName().equals("equals")) return proxy==args[0];
            return "Batch card snap listener";
        });
        snap=Class.forName("com.curve.transactions.gbit.CarouselSnapHelper").getConstructor(listener).newInstance(callback);
        setAdapter(new Cards());
        BatchCurve.call(snap,"attachToRecyclerView",this);
        addOnScrollListener(new OnScrollListener() {
            @Override public void onScrollStateChanged(RecyclerView view,int state) {
                if(state==SCROLL_STATE_DRAGGING) pendingPosition=-1;
                if(state!=SCROLL_STATE_IDLE) { BatchCardCarousel.this.selected=null; updateLabels(); selection.accept(null); }
                else post(()-> { try { BatchCurve.call(snap,"findSnapView",layout); } catch(Exception e) { throw new IllegalStateException("Curve card snapping changed",e); } });
            }
        });
    }
    private int dp(int value) { return Math.round(value*getResources().getDisplayMetrics().density); }
    @Override protected void onSizeChanged(int w,int h,int oldw,int oldh) {
        super.onSizeChanged(w,h,oldw,oldh);
        if(w<=0 || w==oldw) return;
        pageWidth=Math.round(w*0.82f); int inset=(w-pageWidth)/2;
        setPadding(inset,0,inset,0); getAdapter().notifyDataSetChanged();
        layout.scrollToPositionWithOffset(position,0);
        post(()->center(position));
    }
    private void center(int index) {
        if(index<0 || index>=ids.size()) return;
        pendingPosition=index; selected=null; updateLabels(); selection.accept(null);
        try { BatchCurve.call(snap,"scrollToPosition",index); }
        catch(Exception e) { throw new IllegalStateException("Curve card snapping changed",e); }
    }
    private void settled(int index) {
        if(!isAttachedToWindow() || getScrollState()!=SCROLL_STATE_IDLE || index<0 || index>=ids.size()) return;
        if(pendingPosition!=-1 && pendingPosition!=index) return;
        View page=layout.findViewByPosition(index);
        if(page==null || Math.abs(page.getLeft()+page.getWidth()/2-getWidth()/2)>1) return;
        pendingPosition=-1;
        position=index; String next=available.contains(ids.get(index))?ids.get(index):null;
        if(Objects.equals(selected,next)) return;
        selected=next; updateLabels(); selection.accept(next);
    }
    private void updateLabels() {
        for(Map.Entry<String,Button> entry:buttons.entrySet()) bindLabel(entry.getValue(),entry.getKey());
    }
    private void bindLabel(Button button,String id) {
        button.setText((id.equals(selected)?"Selected: ":"")+labels.get(id)+(available.contains(id)?"":"\nUnavailable for this selection"));
        button.setEnabled(available.contains(id));
    }
    private final class Card extends ViewHolder {
        final View art; final ImageView image; final Button button;
        Card(LinearLayout tile,View art,ImageView image,Button button) { super(tile); this.art=art; this.image=image; this.button=button; }
    }
    private final class Cards extends Adapter<Card> {
        @Override public int getItemCount() { return ids.size(); }
        @Override public Card onCreateViewHolder(ViewGroup parent,int type) {
            LinearLayout tile=new LinearLayout(activity); tile.setOrientation(LinearLayout.VERTICAL); tile.setPadding(dp(8),0,dp(8),0);
            tile.setLayoutParams(new ViewGroup.MarginLayoutParams(Math.max(1,pageWidth),ViewGroup.LayoutParams.WRAP_CONTENT));
            try {
                View art=(View)Class.forName("com.curve.transactions.view.CardCarouselItem").getConstructor(android.content.Context.class).newInstance(activity);
                ImageView image=(ImageView)BatchCurve.call(art,"getCardImageView");
                art.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                tile.addView(art,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,Math.max(1,Math.round((pageWidth-dp(16))/1.586f))));
                Button button=(Button)activity.getLayoutInflater().inflate(activity.res("morphe_batch_button","layout"),tile,false);
                button.setMaxLines(3); tile.addView(button,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));
                Card holder=new Card(tile,art,image,button);
                View.OnClickListener click=v->{ int index=holder.getBindingAdapterPosition(); if(index!=NO_POSITION) center(index); };
                art.setOnClickListener(click); button.setOnClickListener(click); return holder;
            } catch(Exception e) { throw new IllegalStateException("Curve card view changed",e); }
        }
        @Override public void onBindViewHolder(Card holder,int index) {
            String id=ids.get(index);
            holder.itemView.getLayoutParams().width=Math.max(1,pageWidth);
            holder.art.getLayoutParams().height=Math.max(1,Math.round((pageWidth-dp(16))/1.586f));
            buttons.values().remove(holder.button); buttons.put(id,holder.button); bindLabel(holder.button,id);
            try { BatchCurve.bindCardImage(holder.image,id); }
            catch(Exception e) { throw new IllegalStateException("Curve card image loader changed",e); }
        }
        @Override public void onViewRecycled(Card holder) { buttons.values().remove(holder.button); }
    }
}
