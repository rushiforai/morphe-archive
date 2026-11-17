import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewStub;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Map;

/** Actual native layouts/models, synthetic content and callbacks; no app navigation/actions. */
public final class ThreadCardChecks {
    static int checks,width,modelId;static ClassLoader loader;static Class<?> chrome,screen;static float density;
    static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;System.out.println("PASS: "+label);}
    static Object get(Object target,String name)throws Exception{for(Class<?> t=target.getClass();t!=null;t=t.getSuperclass())try{Field f=t.getDeclaredField(name);f.setAccessible(true);return f.get(target);}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    static void set(Object target,String name,Object value)throws Exception{for(Class<?> t=target.getClass();t!=null;t=t.getSuperclass())try{Field f=t.getDeclaredField(name);f.setAccessible(true);f.set(target,value);return;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    static Object map(Class<?> cls,String field,Object key)throws Exception{Field f=cls.getDeclaredField(field);f.setAccessible(true);return ((Map<?,?>)f.get(null)).get(key);}
    static Object commentModel(int depth)throws Exception{Object m=Class.forName("com.rubenmayayo.reddit.models.reddit.CommentModel",true,loader).getConstructor().newInstance();set(m,"R",depth);set(m,"b","synthetic-comment-"+(modelId++));return m;}
    public static final class CountingList extends ArrayList<Object> {
        int reads,copies;
        @Override public Object get(int index){reads++;return super.get(index);}
        @Override public Object[] toArray(){copies++;return super.toArray();}
    }
    public static final class Fragment {public ViewGroup mRecyclerView;public ArrayList<Object>B=new CountingList();public Object c,C;}
    public static final class NavigationContext extends android.content.ContextWrapper {
        android.content.Intent launched;int launches;
        NavigationContext(Context base){super(base);}
        @Override public void startActivity(android.content.Intent intent){launched=intent;launches++;}
    }
    static Object nativeAdapter()throws Exception {
        Class<?> owner=Class.forName("com.rubenmayayo.reddit.ui.comments.CommentsFragment",true,loader);
        Class<?> callback=Class.forName("r41",true,loader);
        return Class.forName("com.rubenmayayo.reddit.ui.comments.CommentsFragment$m",true,loader).getConstructor(owner,callback).newInstance(null,null);
    }
    static void notifyData(Fragment fragment)throws Exception{fragment.C.getClass().getMethod("notifyDataSetChanged").invoke(fragment.C);}
    public static final class Post {public View a;public Object b0;public boolean Q=true;public Object P;public ImageView previewImageview;}
    public static final class Manager {public View C(int index){return null;}public int Z0(){return 0;}}
    static Post postStrong;
    static ArrayList<Object> holders=new ArrayList<>();static ArrayList<ViewTreeObserver.OnPreDrawListener> layouts=new ArrayList<>();
    static Object nativeHolder(View root,Object model)throws Exception{return nativeHolder(root,model,false);}
    static Object nativeHolder(View root,Object model,boolean collapsed)throws Exception{
        Object owner=StyleChecks.allocate(Class.forName(collapsed ? "a11":"com.rubenmayayo.reddit.ui.adapters.CommentViewHolder",true,loader));set(owner,"a",root);set(owner,"c0",model);
        String[][]fields={{"plusCollapsedTv","item_comment_plus"},{"authorTv","item_comment_author"},{"authorAvatarIv","item_comment_author_avatar"},{"authorTagTv","item_comment_author_tag"},{"authorRichFlairTv","item_comment_author_rich_flair"},{"scoreTv","item_comment_score"},{"timeTv","item_comment_time"},{"commentTv","item_comment_body"},{"commentContainer","item_comment_container"},{"awardsView","awards_view"},{"collapsedTv","item_comment_collapsed"},{"distinguishedTv","item_comment_distinguished"},{"indentView","indent_view"}};
        for(String[] f:fields)set(owner,f[0],StyleChecks.find(root,f[1]));
        ((TextView)get(owner,"authorTv")).setText("Parent_or_reply");((TextView)get(owner,"scoreTv")).setText("?");((TextView)get(owner,"timeTv")).setText("6h");
        Object body=get(owner,"commentTv");if(body!=null)body.getClass().getMethod("setTextHtml",String.class).invoke(body,"<p>A comment inside its parent thread.</p>");
        Object indent=get(owner,"indentView");indent.getClass().getMethod("setIndentLevel",int.class).invoke(indent,get(model,"R"));
        chrome.getMethod("onCommentBind",Object.class).invoke(null,owner);
        chrome.getMethod("onRowBound",Object.class).invoke(null,owner);
        check(((View)get(owner,"authorTv")).getParent().getClass().getName().endsWith("CommentLayoutTweaks$HeaderRow"),"Native comment completion prepares metadata before the row is measured");
        Class<?> cls=Class.forName("app.morphe.extension.boost.CommentLayoutTweaks",true,loader);layouts.add((ViewTreeObserver.OnPreDrawListener)map(cls,"ROWS",root));holders.add(owner);return owner;
    }
    static void settle(Fragment fragment)throws Exception{
        ViewTreeObserver.OnPreDrawListener controller=(ViewTreeObserver.OnPreDrawListener)map(screen,"SCREENS",fragment.mRecyclerView);
        notifyData(fragment);
        for(int i=0;i<4;i++){for(ViewTreeObserver.OnPreDrawListener row:layouts)row.onPreDraw();controller.onPreDraw();StyleChecks.measure(fragment.mRecyclerView,width);}
        check(controller.onPreDraw(),"Thread layout settles without repeated invalidation");
    }
    static Object mask(View row)throws Exception{return get(map(screen,"ROWS",row),"mask");}
    static boolean flag(View row,String name)throws Exception{return (Boolean)get(mask(row),name);}
    static int colorAt(View row,int x,int y){Bitmap b=Bitmap.createBitmap(row.getWidth(),row.getHeight(),Bitmap.Config.ARGB_8888);row.draw(new Canvas(b));int color=b.getPixel(x,y);b.recycle();return color;}
    static void run(String[] args)throws Exception{
        loader=RuntimeUiChecks.initialize(args);StyleChecks.loader=loader;StyleChecks.settings();Context context=StyleChecks.candidateContext(RuntimeUiChecks.context,args[0],true);StyleChecks.context=context;
        // Android 17 rejects provider acquisition by an unregistered shell app_process.
        // The untouched, initially GONE progress spinner is a framework View only in this harness.
        // All other load-more widgets, XML dimensions, native holder and model remain actual Boost types.
        StyleChecks.omitProgressSpinner=true;
        density=context.getResources().getDisplayMetrics().density;width=Math.round(360*density);
        chrome=Class.forName("app.morphe.extension.boost.CommentsChromeTweaks",true,loader);screen=Class.forName("app.morphe.extension.boost.CommentsScreenTweaks",true,loader);
        Fragment fragment=new Fragment();fragment.C=nativeAdapter();LinearLayout viewport=new LinearLayout(context);viewport.setOrientation(LinearLayout.VERTICAL);fragment.mRecyclerView=viewport;
        Object postModel=Class.forName("com.rubenmayayo.reddit.models.reddit.SubmissionModel",true,loader).getConstructor().newInstance();set(postModel,"S","Metroid");set(postModel,"a0","Metroid Country");fragment.c=postModel;fragment.B.add(postModel);
        screen.getMethod("attach",Object.class).invoke(null,fragment);
        View post=StyleChecks.inflate("row_submission_comments");ViewStub stub=(ViewStub)StyleChecks.find(post,"main_layout_stub");stub.inflate();
        View image=StyleChecks.find(post,"preview_image");image.setVisibility(View.VISIBLE);((ImageView)image).setImageDrawable(new ColorDrawable(Color.GREEN));
        for(String name:new String[]{"submission_header_thumbnail","poll_view","crosspost_parent","state_submission_view","submission_header_nsfw"}){View v=StyleChecks.find(post,name);if(v!=null)v.setVisibility(View.GONE);}
        ((TextView)StyleChecks.find(post,"submission_header_info_top")).setText("Example-User-1234 · 7h · reddit");
        ((TextView)StyleChecks.find(post,"submission_header_score")).setText("43");
        ((TextView)StyleChecks.find(post,"submission_header_comment_count")).setText("4 comments");
        View selfPanel=StyleChecks.find(post,"submission_header_selftext_container");selfPanel.setVisibility(View.VISIBLE);selfPanel.setBackgroundColor(Color.BLACK);
        TextView selfAuthor=(TextView)StyleChecks.find(post,"submission_header_selftext_author");selfAuthor.setText("sample_user");
        View selfBody=StyleChecks.find(post,"submission_header_selftext");selfBody.setVisibility(View.VISIBLE);selfBody.getClass().getMethod("setTextHtml",String.class).invoke(selfBody,"<p>Here is my hand-painted GameCube. Tell me honestly if you like it.</p>");
        TextView postTitle=(TextView)StyleChecks.find(post,"submission_header_title");postTitle.setText("Metroid Country");
        Post postHolder=new Post();postStrong=postHolder;postHolder.a=post;postHolder.b0=postModel;postHolder.previewImageview=(ImageView)image;postHolder.P=java.lang.Enum.valueOf((Class)Class.forName("jh1",true,loader),"Cards");
        Class.forName("app.morphe.extension.boost.CommentSwipeActions",true,loader).getMethod("bindPost",Object.class).invoke(null,postHolder);
        chrome.getMethod("onRowBound",Object.class).invoke(null,postHolder);
        check(selfPanel.getBackground()==null,"Post completion removes the dark self-text panel before measurement");
        check(selfBody.getParent()==selfPanel && selfAuthor.getText().toString().equals("sample_user"),"Native OP body, author and view ownership are retained outside the dark box");
        viewport.addView(post,new LinearLayout.LayoutParams(-1,-2));
        Object[] models={commentModel(0),commentModel(1),commentModel(2),commentModel(0),commentModel(1)};
        View[] rows=new View[models.length];
        for(int i=0;i<models.length;i++){fragment.B.add(models[i]);rows[i]=StyleChecks.inflate("row_comment_indent_avatar");nativeHolder(rows[i],models[i]);viewport.addView(rows[i],new LinearLayout.LayoutParams(-1,-2));}
        ViewTreeObserver.OnPreDrawListener initialController=(ViewTreeObserver.OnPreDrawListener)map(screen,"SCREENS",viewport);
        check((Integer)get(mask(rows[0]),"gap")==Math.round(14*density),"Root spacing is already applied by bind completion before the first measure");
        StyleChecks.measure(viewport,width);
        boolean permit=true;for(ViewTreeObserver.OnPreDrawListener row:layouts)permit&=row.onPreDraw();permit&=initialController.onPreDraw();
        check(permit && !viewport.isLayoutRequested(),"Newly bound comments draw immediately without cancelling or requesting another initial layout");
        settle(fragment);
        check(((ViewGroup)post).getChildAt(0)==StyleChecks.find(post,"visibility_container"),"Native cropped image container precedes the post metadata");
        View metadata=StyleChecks.find(post,"post_metadata"),info=StyleChecks.find(post,"subreddit_info");
        check(metadata.getTop()>=StyleChecks.find(post,"visibility_container").getBottom(),"Post details are below the large image");
        check(info.getTop()>=postTitle.getBottom(),"Native author/subreddit metadata is below the post title");
        TextView postScore=(TextView)StyleChecks.find(post,"submission_header_score"),postComments=(TextView)StyleChecks.find(post,"submission_header_comment_count"),postInfo=(TextView)StyleChecks.find(post,"submission_header_info_top");
        check(postScore.getText().toString().equals("43 points") && postScore.getTextSize()==postInfo.getTextSize(),"Post score uses compact author-sized points text");
        postScore.setText("88");settle(fragment);check(postScore.getText().toString().equals("88 points"),"Native post score rebinds retain the points suffix");
        postScore.setText("88 points");settle(fragment);check(postScore.getText().toString().equals("88 points"),"Re-measuring never duplicates the points suffix");
        ViewGroup inline=(ViewGroup)postTitle.getParent();
        check(inline.getClass().getName().endsWith("$PostMetadataRow") && postScore.getParent()==inline && postComments.getParent()==inline,"Native title, author metadata and counts use one adaptive header without a dedicated counts row");
        CharSequence originalInfo=postInfo.getText(),originalTitle=postTitle.getText();float titleSize=postTitle.getTextSize(),infoSize=postInfo.getTextSize(),scoreSize=postScore.getTextSize(),commentsSize=postComments.getTextSize();
        postInfo.setText("u/example · 1h");postTitle.setText("A longer post title with enough words to span multiple lines");settle(fragment);
        check(postScore.getLeft()>=info.getRight() && postScore.getTop()<info.getBottom() && postScore.getBottom()>info.getTop(),"Score follows the username metadata on the same line when it fits");
        postInfo.setText("a_long_account_name · a_long_subreddit_name · 12h · reddit");postTitle.setText("Post");settle(fragment);
        check(postScore.getLeft()>=postTitle.getRight() && postScore.getTop()<postTitle.getBottom() && postComments.getTop()<info.getTop(),"Counts use available space after a short title when the author line is full");
        int[] countClicks={0};postComments.setOnClickListener(v->countClicks[0]++);postComments.performClick();check(countClicks[0]==1,"Reflow keeps the original comments-count view and its click handler");
        postTitle.setTextSize(24);postInfo.setTextSize(24);postScore.setTextSize(24);postComments.setTextSize(24);StyleChecks.measure(viewport,Math.round(260*density));
        boolean fits=true,overlap=false;
        for(int i=0;i<inline.getChildCount();i++){View a=inline.getChildAt(i);if(a.getVisibility()==View.GONE)continue;fits &= a.getLeft()>=0 && a.getRight()<=inline.getWidth();for(int j=0;j<i;j++){View b=inline.getChildAt(j);if(b.getVisibility()!=View.GONE && a.getLeft()<b.getRight() && a.getRight()>b.getLeft() && a.getTop()<b.getBottom() && a.getBottom()>b.getTop())overlap=true;}}
        check(fits && !overlap,"Narrow large-font headers wrap native labels without clipping or overlap");
        postTitle.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,titleSize);postInfo.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,infoSize);postScore.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,scoreSize);postComments.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,commentsSize);postTitle.setText(originalTitle);postInfo.setText(originalInfo);settle(fragment);
        check(!flag(post,"first") && flag(post,"last"),"Post has rounded bottom corners matching the mockup");
        check(flag(rows[0],"first") && !flag(rows[0],"last"),"Parent opens one continuous rounded thread");
        check(!flag(rows[1],"first") && !flag(rows[1],"last"),"Middle child has no separate card corners");
        check(!flag(rows[2],"first") && flag(rows[2],"last"),"Last grandchild closes its parent's rounded card");
        check(flag(rows[3],"first") && !flag(rows[3],"last") && flag(rows[4],"last"),"Following parent and child form another card");
        check((Integer)get(mask(rows[0]),"gap")==Math.round(14*density),"Larger gap separates the post and first parent thread");
        check((Integer)get(mask(rows[3]),"gap")==Math.round(8*density) && rows[1].getPaddingTop()==0,"Only root threads receive inter-card spacing");
        int page=StyleChecks.role("colorSurfaceContainerLow"),surface=StyleChecks.role("colorSurfaceContainerHigh");
        check(page!=surface,"Lighter page role remains distinct from thread surfaces");
        check(StyleChecks.role("ContentBackground")==page && StyleChecks.role("ToolbarColor")==page,"Native page and toolbar reference the lighter dynamic role");
        check(colorAt(rows[0],0,0)==page,"First root gap renders the actual wallpaper-based page colour");
        check(colorAt(rows[0],0,rows[0].getPaddingTop())==page,"Top corner is rounded instead of painting a rectangular surface");
        check(colorAt(rows[1],0,rows[1].getHeight()/2)==surface,"Children continue the same surface without horizontal gaps");
        check(((TextView)get(holders.get(0),"scoreTv")).getText().toString().equals("[score hidden]"),"Hidden comment scores use the proper label");
        TextView score=(TextView)get(holders.get(0),"scoreTv");score.setText("12");settle(fragment);check(score.getText().toString().equals("12 points"),"Native score updates replace the hidden label cleanly");
        score.setText("?");settle(fragment);check(score.getText().toString().equals("[score hidden]"),"Rebinding a hidden score never appends points");
        Object flair=get(holders.get(0),"authorRichFlairTv");Class<?> flairModelClass=Class.forName("com.rubenmayayo.reddit.models.reddit.FlairModel",true,loader);Object flairModel=flairModelClass.getConstructor().newInstance();set(flairModel,"b","User flair");
        flair.getClass().getMethod("c",flairModelClass,boolean.class).invoke(flair,flairModel,false);((View)flair).setVisibility(View.VISIBLE);settle(fragment);
        View author=(View)get(holders.get(0),"authorTv");check(((View)flair).getParent()==author.getParent(),"Actual native user flair shares the username's header");
        ViewGroup header=(ViewGroup)author.getParent();check(header.indexOfChild((View)flair)>header.indexOfChild(author) && header.indexOfChild((View)flair)<header.indexOfChild(score),"User flair is ordered between username and score");
        check(((View)flair).getTop()==author.getTop() || Math.abs(((View)flair).getTop()-author.getTop())<Math.round(8*density),"Normal-length flair stays on the username line");
        // Boost's actual collapse retains the models and sets CommentViewModel.S=false.
        set(models[1],"S",false);set(models[2],"S",false);viewport.removeView(rows[1]);viewport.removeView(rows[2]);settle(fragment);
        check(flag(rows[0],"first") && flag(rows[0],"last"),"Native hidden-descendant flags close the parent card without removing models");
        set(models[1],"S",true);set(models[2],"S",true);viewport.addView(rows[1],2);viewport.addView(rows[2],3);settle(fragment);
        check(!flag(rows[0],"last") && flag(rows[2],"last"),"Native expansion flags restore the group without changing list identities");
        // Also cover actual dataset removal/reinsertion used by other list mutations.
        fragment.B.remove(models[1]);fragment.B.remove(models[2]);viewport.removeView(rows[1]);viewport.removeView(rows[2]);settle(fragment);
        check(flag(rows[0],"first") && flag(rows[0],"last"),"Collapsed parent becomes a complete rounded card");
        View collapsed=StyleChecks.inflate("row_comment_collapsed_indent");nativeHolder(collapsed,models[0],true);viewport.removeView(rows[0]);viewport.addView(collapsed,1,new LinearLayout.LayoutParams(-1,-2));settle(fragment);
        check(flag(collapsed,"first") && flag(collapsed,"last"),"Actual fully-collapsed holder/layout receives the complete rounded card");
        viewport.removeView(collapsed);viewport.addView(rows[0],1,new LinearLayout.LayoutParams(-1,-2));
        fragment.B.add(2,models[1]);fragment.B.add(3,models[2]);viewport.addView(rows[1],2);viewport.addView(rows[2],3);settle(fragment);
        check(!flag(rows[0],"last") && flag(rows[2],"last"),"Expanding restores the continuous parent/child card");
        // Detached/offscreen neighbours remain in B; visible children must not get fake corners.
        viewport.removeView(rows[0]);settle(fragment);check(!flag(rows[1],"first"),"Offscreen parent does not turn its visible child into a new card");viewport.addView(rows[0],1);settle(fragment);
        Object replacement=commentModel(0);set(holders.get(1),"c0",replacement);fragment.B.set(2,replacement);chrome.getMethod("onCommentBind",Object.class).invoke(null,holders.get(1));settle(fragment);
        check(flag(rows[0],"last") && flag(rows[1],"first"),"Recycled row and same-size dataset replacement update thread boundaries");
        Object more=Class.forName("com.rubenmayayo.reddit.models.reddit.LoadMoreModel",true,loader).getConstructor().newInstance();set(more,"R",1);set(more,"W",2);fragment.B.add(more);
        View loadMore=StyleChecks.inflate("row_comment_loadmore_indent");Object moreHolder=StyleChecks.allocate(Class.forName("com.rubenmayayo.reddit.ui.adapters.LoadMoreViewHolder",true,loader));set(moreHolder,"a",loadMore);set(moreHolder,"R",more);holders.add(moreHolder);
        set(moreHolder,"indentView",StyleChecks.find(loadMore,"indent_view"));loadMore.setOnClickListener(v->{});
        Class<?> actualFragmentClass=Class.forName("com.rubenmayayo.reddit.ui.comments.CommentsFragment",true,loader);
        Object actualFragment=StyleChecks.allocate(actualFragmentClass);set(actualFragment,"B",fragment.B);set(actualFragment,"c",postModel);
        Class<?> adapterClass=Class.forName("com.rubenmayayo.reddit.ui.comments.CommentsFragment$m",true,loader);
        Object actualAdapter=adapterClass.getConstructor(actualFragmentClass,Class.forName("r41",true,loader)).newInstance(actualFragment,null);fragment.C=actualAdapter;
        adapterClass.getMethod("onBindViewHolder",Class.forName("androidx.recyclerview.widget.RecyclerView$a0",true,loader),int.class).invoke(actualAdapter,moreHolder,fragment.B.size()-1);
        check(mask(loadMore)!=null && get(moreHolder,"R")==more,"Real native adapter executes the new completion hook with the correct load-more holder");
        check(((Integer)get(get(moreHolder,"indentView"),"A"))==1,"Native indentation continues after the completion hook returns");
        TextView moreText=(TextView)StyleChecks.find(loadMore,"item_comment_loadmore_text");
        check(moreText.getText().toString().equals("View more (2)") && moreText.getBackground()==null,"Native more-replies completion uses an unboxed Compact count");
        check(loadMore.hasOnClickListeners(),"Native more-replies row remains the original clickable target");
        set(more,"W",17);adapterClass.getMethod("onBindViewHolder",Class.forName("androidx.recyclerview.widget.RecyclerView$a0",true,loader),int.class).invoke(actualAdapter,moreHolder,fragment.B.size()-1);
        check(moreText.getText().toString().equals("View more (17)"),"Recycled more-replies label updates from the native model rather than stale text");

        viewport.addView(loadMore,new LinearLayout.LayoutParams(-1,-2));settle(fragment);
        check(!flag(rows[4],"last") && flag(loadMore,"last") && !flag(loadMore,"first"),"Native load-more row remains inside its parent thread card");
        // Persistent toolbar remains correct at the top, with the post still fully visible.
        Class<?> toolbarClass=Class.forName("androidx.appcompat.widget.Toolbar",true,loader);NavigationContext navigation=new NavigationContext(context);Object toolbar=toolbarClass.getConstructor(Context.class,android.util.AttributeSet.class).newInstance(navigation,null);
        toolbarClass.getMethod("setTitle",CharSequence.class).invoke(toolbar,"Comments");toolbarClass.getMethod("setSubtitle",CharSequence.class).invoke(toolbar,"Best");
        Class<?> headerClass=Class.forName("app.morphe.extension.boost.CommentsChromeTweaks$Header",true,loader);java.lang.reflect.Constructor<?> ctor=headerClass.getDeclaredConstructor(Object.class,ViewGroup.class,toolbarClass,Object.class);ctor.setAccessible(true);Object titleController=ctor.newInstance(fragment,viewport,toolbar,new Manager());
        ((ViewTreeObserver.OnPreDrawListener)titleController).onPreDraw();
        check(toolbarClass.getMethod("getTitle").invoke(toolbar).toString().equals("r/Metroid") && toolbarClass.getMethod("getSubtitle").invoke(toolbar).toString().equals("Metroid Country"),"Toolbar shows subreddit/title while the original post is visible");
        ViewGroup toolbarView=(ViewGroup)toolbar;
        StyleChecks.measure(toolbarView,width);
        for(int i=0;i<120;i++)((ViewTreeObserver.OnPreDrawListener)titleController).onPreDraw();
        check(!toolbarView.isLayoutRequested(),"120 steady header frames do not request another toolbar layout");
        TextView subHeader=null,titleHeader=null;
        for(int i=0;i<toolbarView.getChildCount();i++)if(toolbarView.getChildAt(i) instanceof TextView){
            TextView text=(TextView)toolbarView.getChildAt(i);
            if(text.getText().toString().equals("r/Metroid"))subHeader=text;
            if(text.getText().toString().equals("Metroid Country"))titleHeader=text;
        }
        check(subHeader!=null && titleHeader!=null && subHeader.isClickable() && titleHeader.isClickable(),"Both persistent header lines are tappable");
        subHeader.performClick();
        check(navigation.launches==1 && navigation.launched.getComponent().getClassName().equals("com.rubenmayayo.reddit.ui.submissions.subreddit.SubredditActivity"),"Subreddit tap builds Boost's real native SubredditActivity intent without launching it");
        Object subscription=navigation.launched.getParcelableExtra("subreddit");
        check("Metroid".equals(get(subscription,"a")),"Native subreddit intent carries the correct subscription model");
        titleHeader.performClick();check(navigation.launches==2,"Post-title line opens the same native subreddit route");
        toolbarClass.getMethod("setSubtitle",CharSequence.class).invoke(toolbar,"Top");((ViewTreeObserver.OnPreDrawListener)titleController).onPreDraw();
        check(toolbarClass.getMethod("getSubtitle").invoke(toolbar).toString().equals("Metroid Country"),"Native sort updates keep the requested persistent title display");
        java.lang.reflect.Method detach=headerClass.getDeclaredMethod("detach");detach.setAccessible(true);detach.invoke(titleController);
        check(toolbarClass.getMethod("getSubtitle").invoke(toolbar).toString().equals("Top"),"Leaving the screen restores the last native sort subtitle");
        check(!subHeader.hasOnClickListeners() && !titleHeader.hasOnClickListeners() && !subHeader.isClickable(),"Leaving comments removes header listeners and restores clickability");
        fragment.B.set(2,models[1]);set(holders.get(1),"c0",models[1]);chrome.getMethod("onCommentBind",Object.class).invoke(null,holders.get(1));settle(fragment);
        Object controller=map(screen,"SCREENS",viewport);
        CountingList data=(CountingList)fragment.B;
        int originalSize=data.size();for(int i=0;i<10000;i++)data.add(new Object());
        notifyData(fragment);((ViewTreeObserver.OnPreDrawListener)controller).onPreDraw();
        Object snapshot=get(controller,"snapshot");data.reads=data.copies=0;
        long start=android.os.SystemClock.elapsedRealtimeNanos();
        for(int i=0;i<240;i++)((ViewTreeObserver.OnPreDrawListener)controller).onPreDraw();
        long elapsed=android.os.SystemClock.elapsedRealtimeNanos()-start;
        check(data.reads==0 && data.copies==0 && get(controller,"snapshot")==snapshot,"240 steady frames with 10,000 offscreen models never scan or copy the dataset");
        System.out.println("CONTROLLER COST: "+(elapsed/240/1000)+" us per steady callback (isolated helper, not an in-app FPS measurement)");
        data.reads=data.copies=0;fragment.C.getClass().getMethod("notifyItemChanged",int.class).invoke(fragment.C,1);
        ((ViewTreeObserver.OnPreDrawListener)controller).onPreDraw();
        check(data.reads==1 && data.copies==0 && get(controller,"snapshot")==snapshot,"Native content-only notification checks one row without rebuilding 10,000 boundaries");
        set(models[1],"S",false);data.copies=0;fragment.C.getClass().getMethod("notifyItemChanged",int.class).invoke(fragment.C,2);
        ((ViewTreeObserver.OnPreDrawListener)controller).onPreDraw();
        check(data.copies==1 && !((boolean[])get(controller,"shown"))[2],"Native row notification still detects hidden-descendant visibility changes");
        set(models[1],"S",true);fragment.C.getClass().getMethod("notifyItemChanged",int.class).invoke(fragment.C,2);((ViewTreeObserver.OnPreDrawListener)controller).onPreDraw();
        for(String method:new String[]{"notifyDataSetChanged","notifyItemChanged","notifyItemInserted","notifyItemRemoved","notifyItemMoved"}){
            int parameters=method.equals("notifyDataSetChanged") ? 0:method.equals("notifyItemMoved") ? 2:1;
            if(parameters==0)fragment.C.getClass().getMethod(method).invoke(fragment.C);
            else if(parameters==1)fragment.C.getClass().getMethod(method,int.class).invoke(fragment.C,1);
            else fragment.C.getClass().getMethod(method,int.class,int.class).invoke(fragment.C,1,2);
            check((Boolean)get(controller,"dirty"),"Native "+method+" invalidates thread boundaries");
            ((ViewTreeObserver.OnPreDrawListener)controller).onPreDraw();
        }
        Object oldAdapter=fragment.C;fragment.C=nativeAdapter();((ViewTreeObserver.OnPreDrawListener)controller).onPreDraw();
        oldAdapter.getClass().getMethod("notifyDataSetChanged").invoke(oldAdapter);
        check(!(Boolean)get(controller,"dirty"),"Replacing the adapter unregisters the old dataset observer");
        notifyData(fragment);check((Boolean)get(controller,"dirty"),"Replacement adapter notifications reach the controller");
        data.subList(originalSize,data.size()).clear();notifyData(fragment);settle(fragment);
        if(args.length>2)StyleChecks.save(viewport,args[2]+"/thread-cards-preview.png");
        screen.getMethod("detach",Object.class).invoke(null,fragment);screen.getMethod("attach",Object.class).invoke(null,fragment);settle(fragment);check(flag(loadMore,"last"),"Pause/resume retains correct grouping without duplicate spacing");
        System.out.println("THREAD CARD CHECKS PASSED: "+checks);System.exit(0);
    }
    public static void main(String[] args){try{run(args);}catch(Throwable error){error.printStackTrace(System.out);System.exit(1);}}
}
