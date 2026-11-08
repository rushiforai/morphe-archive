import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.BackgroundColorSpan;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Map;

/** Actual APK mini-card widgets with synthetic content/callbacks; no install or Reddit actions. */
public final class FeedCardChecks {
    static int checks;static float density;static Context context;static ClassLoader loader;static Class<?> skin;
    static final ArrayList<StyleChecks.Holder> holders=new ArrayList<>();
    static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;System.out.println("PASS: "+label);}
    static Object field(Object target,String name)throws Exception {Field f=target.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(target);}
    static int px(int value){return Math.round(value*density);}
    static Object controller(StyleChecks.Holder h)throws Exception {Field f=skin.getDeclaredField("CARDS");f.setAccessible(true);return ((Map<?,?>)f.get(null)).get(h.a);}
    static void bound(StyleChecks.Holder h)throws Exception {skin.getMethod("onPostBound",Object.class).invoke(null,h);}
    static int size(View root){int n=1;if(root instanceof ViewGroup){ViewGroup group=(ViewGroup)root;for(int i=0;i<group.getChildCount();i++)n+=size(group.getChildAt(i));}return n;}
    static StyleChecks.Holder card(String layout)throws Exception {
        View row=StyleChecks.inflate(layout);StyleChecks.Holder h=new StyleChecks.Holder();h.a=row;
        h.title=StyleChecks.find(row,"submission_header_title");h.infoTop=StyleChecks.find(row,"submission_header_info_top");h.thumbnailIv=StyleChecks.find(row,"submission_header_thumbnail");
        h.scoreTv=(TextView)StyleChecks.find(row,"submission_header_score");h.commentsTv=StyleChecks.find(row,"submission_header_comment_count");
        h.voteUpButton=StyleChecks.find(row,"submission_header_upvote");h.voteDownButton=StyleChecks.find(row,"submission_header_downvote");h.overFlowButton=StyleChecks.find(row,"submission_header_overflow");
        ((TextView)h.title).setText("A hand-painted GameCube, and the details that made it worth the effort");h.scoreTv.setText("500");((TextView)h.commentsTv).setText("41 comments");
        SpannableString info=new SpannableString("Metroid · neodido · 1h · Art");int start=info.toString().indexOf("Art");info.setSpan(new BackgroundColorSpan(Color.RED),start,info.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);((TextView)h.infoTop).setText(info);
        h.thumbnailIv.setVisibility(View.VISIBLE);((ImageView)h.thumbnailIv).setImageDrawable(new ColorDrawable(StyleChecks.role("colorPrimaryContainer")));
        for(View button:new View[]{h.voteUpButton,h.voteDownButton})button.getClass().getMethod("c",boolean.class,boolean.class).invoke(button,false,false);
        for(String name:new String[]{"submission_header_spoiler","submission_header_nsfw","awards_view"}){View view=StyleChecks.find(row,name);if(view!=null)view.setVisibility(View.GONE);}
        h.P=java.lang.Enum.valueOf((Class)Class.forName("jh1",true,loader),"MiniCards");holders.add(h);return h;
    }
    static void prepare(StyleChecks.Holder h)throws Exception {skin.getMethod("bindPost",Object.class).invoke(null,h);bound(h);}
    static ImageView icon(View button){
        if(button instanceof ImageView)return (ImageView)button;
        int id=button.getResources().getIdentifier("icon","id",button.getContext().getPackageName());
        return (ImageView)button.findViewById(id);
    }
    static void run(String[] args)throws Exception {
        loader=RuntimeUiChecks.initialize(args);StyleChecks.loader=loader;StyleChecks.settings();context=StyleChecks.candidateContext(RuntimeUiChecks.context,args[0],true);StyleChecks.context=context;density=context.getResources().getDisplayMetrics().density;
        skin=Class.forName("app.morphe.extension.boost.MaterialYouTweaks",true,loader);
        for(String layout:new String[]{"row_submission_minimal_cardview","row_submission_minimal_cardview_left"}){
            StyleChecks.Holder h=card(layout);Object icon=icon(h.voteUpButton).getDrawable();CharSequence description=h.voteUpButton.getContentDescription();
            int[] clicks={0};h.voteUpButton.setOnClickListener(v->clicks[0]++);h.overFlowButton.setOnClickListener(v->clicks[0]++);
            prepare(h);Object c=controller(h);ViewTreeObserver.OnPreDrawListener listener=(ViewTreeObserver.OnPreDrawListener)c;
            check((Boolean)field(c,"installed"),"Native bind completion installs "+layout+" before measurement");
            check(h.scoreTv.getText().toString().equals("500 points"),"Native score is formatted before the first feed measure");
            check(h.scoreTv.getParent().getClass().getName().endsWith("$CountsRow"),"Native counts move to the responsive footer");
            StyleChecks.measure(h.a,px(640));check(listener.onPreDraw() && !h.a.isLayoutRequested(),"First measured feed card draws without veto or an extra layout request");
            check(icon(h.voteUpButton).getDrawable()==icon && java.util.Objects.equals(description,h.voteUpButton.getContentDescription()),"Native vote drawable and accessibility label remain intact");
            check(h.voteUpButton.getWidth()==px(48) && h.voteUpButton.getHeight()==px(48) && icon(h.voteUpButton).getWidth()==px(18) && icon(h.voteUpButton).getHeight()==px(18),"Vote glyph is 18dp while retaining the 48dp touch target");
            check(h.overFlowButton.getWidth()==px(48) && h.overFlowButton.getPaddingLeft()==px(15) && ((ImageView)h.overFlowButton).getScaleType()==ImageView.ScaleType.CENTER_INSIDE,"Overflow has an 18dp drawing area within its native 48dp target");
            h.voteUpButton.performClick();h.overFlowButton.performClick();check(clicks[0]==2,"Moved vote and overflow callbacks each fire once");
            ViewGroup counts=(ViewGroup)h.scoreTv.getParent();
            check((Boolean)field(counts,"stacked") && h.commentsTv.getTop()>=h.scoreTv.getBottom() && h.scoreTv.getLeft()==h.commentsTv.getLeft(),"Wide feed cards stack points above comments at the left");
            ViewGroup badges=(ViewGroup)((java.lang.ref.WeakReference<?>)field(c,"badgeRow")).get();check(badges.getVisibility()==View.GONE,"Empty native badge row leaves no phantom gap");
            View nsfw=StyleChecks.find(h.a,"submission_header_nsfw");nsfw.setVisibility(View.VISIBLE);bound(h);check(badges.getVisibility()==View.VISIBLE,"Rebinding restores the original badge row when a native warning is visible");
            nsfw.setVisibility(View.GONE);bound(h);check(badges.getVisibility()==View.GONE,"Clearing native warnings removes only the empty badge row");
            int viewCount=size(h.a);Object owner=controller(h);
            for(int i=0;i<100;i++){
                h.scoreTv.setText(String.valueOf(i));((TextView)h.commentsTv).setText((i+1)+" comments");((TextView)h.infoTop).setText("Metroid · neodido · 2h");
                skin.getMethod("bindPost",Object.class).invoke(null,h);bound(h);StyleChecks.measure(h.a,px(420));
                if(!listener.onPreDraw() || h.a.isLayoutRequested())throw new AssertionError("Rebind requested another frame at "+i);
            }
            check(controller(h)==owner && size(h.a)==viewCount,"100 recycled bindings reuse the same layout and views");
            check(h.scoreTv.getText().toString().equals("99 points"),"Recycled cards retain the latest native score");
            h.scoreTv.setTextSize(24);((TextView)h.commentsTv).setTextSize(24);h.scoreTv.setText("12345");((TextView)h.commentsTv).setText("12345 comments");bound(h);StyleChecks.measure(h.a,px(260));
            check((Boolean)field(counts,"stacked"),"Narrow or large-font cards stack both counts instead of overlapping buttons");
            check(h.scoreTv.getLeft()>=0 && h.scoreTv.getRight()<=counts.getWidth() && h.commentsTv.getRight()<=counts.getWidth() && h.commentsTv.getTop()>=h.scoreTv.getBottom(),"Large-font count labels remain inside the footer without overlap");
            if(args.length>2 && layout.equals("row_submission_minimal_cardview"))StyleChecks.save(h.a,args[2]+"/feed-narrow-preview.png");
            h.scoreTv.setTextSize(14);((TextView)h.commentsTv).setTextSize(14);h.scoreTv.setText("500");((TextView)h.commentsTv).setText("41 comments");bound(h);counts.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);StyleChecks.measure(h.a,px(640));
            check((Boolean)field(counts,"stacked") && h.scoreTv.getRight()==h.commentsTv.getRight() && h.commentsTv.getTop()>=h.scoreTv.getBottom(),"Stacked counts share the logical right edge in RTL without overlap");counts.setLayoutDirection(View.LAYOUT_DIRECTION_LTR);
            ((TextView)h.infoTop).setText("Metroid · neodido · 1h");bound(h);StyleChecks.measure(h.a,px(360));
            if(args.length>2 && layout.equals("row_submission_minimal_cardview"))StyleChecks.save(h.a,args[2]+"/feed-card-preview.png");
        }
        int vetoes=0,extraLayouts=0;
        for(int i=0;i<32;i++){
            StyleChecks.Holder h=card(i%2==0 ? "row_submission_minimal_cardview":"row_submission_minimal_cardview_left");prepare(h);StyleChecks.measure(h.a,px(360));
            if(!((ViewTreeObserver.OnPreDrawListener)controller(h)).onPreDraw())vetoes++;if(h.a.isLayoutRequested())extraLayouts++;
        }
        check(vetoes==0 && extraLayouts==0,"32 newly entering feed cards produce zero extension draw vetoes or extra initial layouts");
        System.out.println("FEED CARD CHECKS PASSED: "+checks);System.exit(0);
    }
    public static void main(String[] args){try{run(args);}catch(Throwable error){error.printStackTrace(System.out);System.exit(1);}}
}
