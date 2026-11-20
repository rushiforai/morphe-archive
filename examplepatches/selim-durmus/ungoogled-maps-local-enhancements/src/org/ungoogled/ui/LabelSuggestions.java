package org.ungoogled.ui;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.os.SystemClock;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.*;
import java.util.*;
import org.ungoogled.ui.LabelIndex.Candidate;

/**
 * "Your places" above Maps' search suggestions, from Local saved only (no network):
 * - while typing: matching Home, Work and labels, saved places (name, then note or category)
 *   and recent places, best match first;
 * - with an empty search box, in the main search and in the directions editor: Home, Work and
 *   every label, one tap away.
 * A tapped row is submitted through Maps' own search box. bearinmind's searchLabel (main search)
 * opens it and labelWaypoint (directions editor) fills only the stop being edited; both look the
 * text up with SavedStore.labelled, which the patch first sends to [picked] so a saved or recent
 * place resolves too.
 */
public final class LabelSuggestions {
    private static final WeakHashMap<Activity,Search> active=new WeakHashMap<>();
    private static final long PICK_WINDOW=5000, REBUILD=2000;
    private static final int TYPED_ROWS=4, EMPTY_ROWS=6;
    private static String pickedQuery;
    private static SavedStore.Place pickedPlace;
    private static long pickedAt;

    private LabelSuggestions() {}

    /** From the start of SavedStore.labelled (patched): the place just tapped, while its text is submitted. */
    public static synchronized SavedStore.Place picked(String query) {
        if(query==null||pickedPlace==null)return null;
        if(SystemClock.uptimeMillis()-pickedAt>PICK_WINDOW){pickedPlace=null;pickedQuery=null;return null;}
        return query.trim().equalsIgnoreCase(pickedQuery)?pickedPlace:null;
    }

    private static synchronized void pick(String query,SavedStore.Place place) {
        pickedQuery=query;pickedPlace=place;pickedAt=SystemClock.uptimeMillis();
    }

    public static void resume(Activity a) {
        if(!a.getClass().getName().equals("com.google.android.maps.MapsActivity"))return;
        pause(a);
        try{SavedStore.load(a);HistoryStore.load(a);Search s=new Search(a);active.put(a,s);s.root.post(s);}
        catch(Throwable t){android.util.Log.w("UA-Labels","Local search suggestions unavailable",t);}
    }

    public static void pause(Activity a){Search s=active.remove(a);if(s!=null)s.close();}

    static String coordinates(SavedStore.Place p){return String.format(Locale.US,"%.6f, %.6f",p.lat,p.lng);}

    /** Every row the panel could show, from Local saved and, when it is on, recent places. */
    static List<Candidate> candidates(Context c) {
        List<Candidate> all=new ArrayList<>();
        synchronized(SavedStore.class) {
            if(SavedStore.home!=null&&SavedStore.home.located())all.add(new Candidate(Candidate.LABEL,"Home",SavedStore.home.name,"",SavedStore.home));
            if(SavedStore.work!=null&&SavedStore.work.located())all.add(new Candidate(Candidate.LABEL,"Work",SavedStore.work.name,"",SavedStore.work));
            for(Map.Entry<String,SavedStore.Place> e:SavedStore.labels.entrySet())
                if(e.getValue()!=null&&e.getValue().located())all.add(new Candidate(Candidate.LABEL,e.getKey(),e.getValue().name,"",e.getValue()));
            for(SavedStore.Place p:SavedStore.places.values()) {
                if(p==null||!p.located()||p.name==null||p.name.isEmpty())continue;
                StringBuilder lists=new StringBuilder();
                for(String id:p.lists){String name=SavedStore.lists.get(id);if(name!=null)lists.append(lists.length()==0?"":", ").append(name);}
                String subtitle=lists.length()>0?lists.toString():!p.category.isEmpty()?p.category:"Saved";
                all.add(new Candidate(Candidate.SAVED,p.name,subtitle,p.note+" "+p.category,p));
            }
        }
        if(HistoryStore.enabled(c)) {
            for(HistoryStore.Entry e:HistoryStore.newestFirst()) {
                if(e==null||e.name==null||e.name.isEmpty()||(e.lat==0&&e.lng==0))continue;
                SavedStore.Place p=new SavedStore.Place();p.ftid=e.ftid;p.name=e.name;p.lat=e.lat;p.lng=e.lng;
                all.add(new Candidate(Candidate.RECENT,e.name,e.category==null||e.category.isEmpty()?"Recent":"Recent · "+e.category,"",p));
            }
        }
        return all;
    }

    private static final class Search implements Runnable,TextWatcher {
        final Activity activity;final ViewGroup root;final LinearLayout header;final float density;
        final int inputId,listId,zeroId,omniboxId,labelIcon,homeIcon,workIcon,savedIcon,recentIcon;
        EditText input;View list,zero;boolean closed;String signature="";
        List<Candidate> pool=Collections.emptyList();long pooledAt;String rankedFor;List<Candidate> ranked=Collections.emptyList();
        int left,top,right,bottom,shift;float translation;Rect clip;

        Search(Activity a) {
            activity=a;root=(ViewGroup)a.getWindow().getDecorView();density=a.getResources().getDisplayMetrics().density;
            inputId=HomeWorkShortcuts.resource(a,"id","search_omnibox_edit_text");
            listId=HomeWorkShortcuts.resource(a,"id","typed_suggest_container");
            labelIcon=HomeWorkShortcuts.resource(a,"drawable","ic_aliasing_nickname_black_drawable_24dp");
            // Optional: without them the empty-box list stays off and rows use the label icon.
            zeroId=optional(a,"id","recycler_view");omniboxId=optional(a,"id","search_omnibox_container");
            homeIcon=or(optional(a,"drawable","gs_home_vd_theme_24"),labelIcon);
            workIcon=or(optional(a,"drawable","gs_work_vd_theme_24"),labelIcon);
            savedIcon=or(optional(a,"drawable","gs_bookmark_fill1_vd_theme_24"),labelIcon);
            recentIcon=or(optional(a,"drawable","gs_history_vd_theme_24"),labelIcon);
            header=new LinearLayout(a);header.setOrientation(LinearLayout.VERTICAL);
            header.setBackgroundColor(0xff121212);header.setVisibility(View.GONE);
            root.addView(header,new FrameLayout.LayoutParams(-1,-2));
        }
        static int optional(Activity a,String type,String name){return a.getResources().getIdentifier(name,type,a.getPackageName());}
        static int or(int id,int fallback){return id!=0?id:fallback;}
        int dp(float v){return Math.round(v*density);}

        public void run() {
            if(closed)return;
            try {
                View candidate=root.findViewById(inputId);
                EditText next=candidate instanceof EditText?(EditText)candidate:null;
                if(input!=next){if(input!=null)input.removeTextChangedListener(this);input=next;
                    if(input!=null)input.addTextChangedListener(this);signature="";}
                render();
            } catch(Throwable t){android.util.Log.w("UA-Labels","Local search suggestions stopped",t);close();return;}
            root.postDelayed(this,150);
        }
        public void beforeTextChanged(CharSequence s,int start,int count,int after){}
        public void onTextChanged(CharSequence s,int start,int before,int count){signature="";root.post(this::renderSafely);}
        public void afterTextChanged(Editable e){}
        void renderSafely(){if(!closed)try{render();}catch(Throwable t){close();android.util.Log.w("UA-Labels","Local results unavailable",t);}}

        void restore() {
            if(list!=null){list.setTranslationY(translation);list.setPadding(left,top,right,bottom);list.setClipBounds(clip);}
            list=null;shift=0;signature="";header.setVisibility(View.GONE);
        }

        List<Candidate> matches(String query) {
            long now=SystemClock.uptimeMillis();
            if(now-pooledAt>REBUILD){pool=candidates(activity);pooledAt=now;rankedFor=null;}
            if(!query.equals(rankedFor)){ranked=LabelIndex.rankLocal(pool,query);rankedFor=query;}
            return ranked;
        }

        /** Maps' list under an empty search box: the shown "recycler_view" right below the search bar. */
        View emptyBoxList() {
            if(zeroId==0||omniboxId==0)return null;
            View bar=root.findViewById(omniboxId);
            if(bar==null||!bar.isShown())return null;
            int[] at=new int[2];bar.getLocationOnScreen(at);int below=at[1]+bar.getHeight();
            if(zero!=null&&zero.isAttachedToWindow()&&zero.isShown()&&alignedBelow(zero,below))return zero;
            zero=findBelow(root,below);
            return zero;
        }
        boolean alignedBelow(View v,int below) {
            int[] at=new int[2];v.getLocationOnScreen(at);
            // Our own shift moves it down: compare its untranslated top.
            int y=at[1]-Math.round(v.getTranslationY()-(v==list?translation:0));
            return Math.abs(y-below)<=dp(12)&&v.getWidth()>=root.getWidth()*9/10;
        }
        View findBelow(View v,int below) {
            if(!v.isShown())return null;
            if(v.getId()==zeroId&&alignedBelow(v,below))return v;
            if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;
                for(int i=0;i<g.getChildCount();i++){View f=findBelow(g.getChildAt(i),below);if(f!=null)return f;}}
            return null;
        }

        void render() {
            if(closed)return;
            if(input==null||!input.isShown()||!input.hasFocus()||!activity.hasWindowFocus()){restore();return;}
            String query=input.getText().toString();
            boolean empty=query.trim().isEmpty();
            View typed=root.findViewById(listId);
            View next=typed!=null&&typed.isShown()?typed:empty?emptyBoxList():null;
            if(next==null){restore();return;}
            List<Candidate> found=matches(empty?"":query);
            if(found.isEmpty()){restore();return;}
            if(next!=list){restore();list=next;translation=list.getTranslationY();clip=list.getClipBounds();
                left=list.getPaddingLeft();top=list.getPaddingTop();right=list.getPaddingRight();bottom=list.getPaddingBottom();}
            int limit=empty?EMPTY_ROWS:TYPED_ROWS;
            int count=Math.min(limit,Math.min(found.size(),Math.max(0,(list.getHeight()-dp(empty?60:100))/dp(58))));
            if(count==0){restore();return;}
            boolean labelsOnly=true;
            StringBuilder stamp=new StringBuilder(query);
            for(int i=0;i<count;i++){Candidate c=found.get(i);labelsOnly&=c.kind==Candidate.LABEL;
                stamp.append('|').append(c.kind).append(c.title).append('|').append(c.key).append('|').append(subtitle(c));}
            String current=stamp.toString();
            if(!current.equals(signature)) {
                header.removeAllViews();TextView title=text(labelsOnly?"Your labels":"Your places",12,0xffa8c7fa);
                title.setPadding(dp(20),dp(5),dp(20),dp(3));header.addView(title,new LinearLayout.LayoutParams(-1,dp(26)));
                for(int i=0;i<count;i++)header.addView(row(found.get(i)),new LinearLayout.LayoutParams(-1,dp(58)));
                View divider=new View(activity);divider.setBackgroundColor(0xff3c4043);header.addView(divider,new LinearLayout.LayoutParams(-1,dp(1)));
                signature=current;
            }
            int height=dp(27+count*58);int[] pos=new int[2],origin=new int[2];list.getLocationOnScreen(pos);root.getLocationOnScreen(origin);
            header.setTranslationX(pos[0]-origin[0]);header.setTranslationY(pos[1]-origin[1]-shift);
            ViewGroup.LayoutParams lp=header.getLayoutParams();if(lp.width!=list.getWidth()||lp.height!=height){lp.width=list.getWidth();lp.height=height;header.setLayoutParams(lp);}
            shift=height;list.setTranslationY(translation+shift);list.setPadding(left,top,right,bottom+shift);
            Rect bounds=new Rect(0,0,list.getWidth(),Math.max(0,list.getHeight()-shift));if(clip!=null)bounds.intersect(clip);
            list.setClipBounds(bounds);header.setVisibility(View.VISIBLE);
        }

        String subtitle(Candidate c) {
            if(c.kind==Candidate.SAVED&&c.score==LabelIndex.DETAIL&&c.place.note!=null&&!c.place.note.isEmpty())return c.place.note;
            if(c.subtitle==null||c.subtitle.isEmpty())return c.kind==Candidate.LABEL?"Saved location":"";
            return c.subtitle;
        }

        View row(Candidate c) {
            LinearLayout row=new LinearLayout(activity);row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(dp(22),0,dp(16),0);row.setMinimumHeight(dp(58));
            android.util.TypedValue ripple=new android.util.TypedValue();activity.getTheme().resolveAttribute(android.R.attr.selectableItemBackground,ripple,true);
            if(ripple.resourceId!=0)row.setBackgroundResource(ripple.resourceId);
            int iconId=c.kind==Candidate.SAVED?savedIcon:c.kind==Candidate.RECENT?recentIcon
                :c.title.equals("Home")&&c.place==SavedStore.home?homeIcon:c.title.equals("Work")&&c.place==SavedStore.work?workIcon:labelIcon;
            ImageView icon=new ImageView(activity);icon.setImageResource(iconId);icon.setColorFilter(c.kind==Candidate.RECENT?0xffbdc1c6:0xffa8c7fa);
            row.addView(icon,new LinearLayout.LayoutParams(dp(24),dp(24)));
            LinearLayout words=new LinearLayout(activity);words.setOrientation(LinearLayout.VERTICAL);words.setPadding(dp(18),0,0,0);
            TextView label=text(c.title,16,0xffe8eaed);if(c.kind==Candidate.LABEL)label.setTypeface(null,Typeface.BOLD);words.addView(label);
            String below=subtitle(c);if(!below.isEmpty())words.addView(text(below,12,0xffbdc1c6));
            row.addView(words,new LinearLayout.LayoutParams(0,-2,1));
            row.setContentDescription(c.title+(c.kind==Candidate.LABEL?", local labeled place":c.kind==Candidate.SAVED?", saved place":", recent place"));
            row.setFocusable(true);row.setOnClickListener(v->choose(c));
            return row;
        }

        void choose(Candidate c) {
            if(c.kind==Candidate.LABEL){submit(c.title);return;}
            String text=c.place.name!=null&&!c.place.name.trim().isEmpty()?c.place.name.trim():coordinates(c.place);
            pick(text,c.place);submit(text);
        }

        /**
         * Submits through Maps' own search box rather than opening the place: the main search then
         * opens it (bearinmind's searchLabel), while a directions waypoint editor fills only the
         * stop being edited (labelWaypoint) and keeps the other one.
         */
        void submit(String text) {
            EditText field=input;if(field==null)return;
            field.setText(text);field.setSelection(field.length());
            int action=field.getImeOptions()&EditorInfo.IME_MASK_ACTION;
            field.onEditorAction(action==EditorInfo.IME_ACTION_UNSPECIFIED||action==EditorInfo.IME_ACTION_NONE?EditorInfo.IME_ACTION_SEARCH:action);
            InputMethodManager ime=(InputMethodManager)activity.getSystemService(Context.INPUT_METHOD_SERVICE);
            if(ime!=null)ime.hideSoftInputFromWindow(field.getWindowToken(),0);
            field.clearFocus();restore();
        }
        TextView text(String value,int sp,int color){TextView v=new TextView(activity);v.setText(value);v.setTextSize(sp);v.setTextColor(color);
            v.setSingleLine(true);v.setEllipsize(android.text.TextUtils.TruncateAt.END);return v;}
        void close(){closed=true;root.removeCallbacks(this);if(input!=null)input.removeTextChangedListener(this);restore();root.removeView(header);}
    }
}
