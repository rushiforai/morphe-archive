package app.morphe.extension.chmate;

import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.EnumMap;
import java.util.List;
import java.util.Locale;

/** Navigation only: original views, listeners, visibility and preference keys are retained. */
final class SettingsSections {
    enum Category {
        GENERAL("言語・基本設定", "Language and basics", "表示する言語や広告を変える", "Change language and ads"),
        DISPLAY("画面・文字の表示", "Display and text", "文字の間隔、ボタン、並び順を変える", "Spacing, toolbar buttons and ordering"),
        POSTING("書き込み", "Writing posts", "入力する文字の大きさや送信時の動作", "Editor text size and posting behavior"),
        MEDIA("画像・動画を見る", "View images and videos", "画像の自動保存、動画の再生、プレビュー", "Automatic downloads, playback and previews"),
        UPLOAD("画像・動画を投稿する", "Upload images and videos", "アップロード先、ログイン、投稿した画像", "Upload service, sign-in and your uploads"),
        SOCIAL("X（Twitter）の投稿表示", "X (Twitter) previews", "リンク先の文章を表示・折りたたむ", "Show post text and collapse previews"),
        CHECKER("同じID・ワッチョイの投稿を調べる", "Find posts by ID or Wacchoi", "IDとワッチョイの必死チェッカー・画面の設定", "ID and Wacchoi checker provider and display"),
        NG("見たくない投稿を隠す（NG）", "Hide unwanted posts (NG)", "名前・ID・言葉で非表示にする", "Hide posts by name, ID or words"),
        HISTORY("履歴・コピーした文章", "History and copied text", "閲覧・書き込み・検索の履歴と保存件数", "Browsing, posting, search and retention"),
        ARCHIVE("保存したレス・過去のスレ", "Saved posts and old threads", "アーカイブ、過去ログ、エッヂの検索", "Archives, old threads and Edge search"),
        BACKUP("バックアップ・機種変更", "Backup and changing phones", "設定やログを保存・復元する", "Save and restore settings and logs"),
        ADVANCED("通信・詳しい設定", "Network and advanced", "外部板の認証や通信の調整。必要なときに", "Board authentication and network adjustments"),
        EXPERT("エキスパート設定", "Expert settings", "個別の動作を細かく切り替える", "Control additional behaviors individually");
        final String ja, en, jaSummary, enSummary;
        Category(String ja, String en, String jaSummary, String enSummary) {
            this.ja=ja; this.en=en; this.jaSummary=jaSummary; this.enSummary=enSummary;
        }
    }
    private static final class Section {
        final List<View> views=new ArrayList<>();
        LinearLayout body;
        Button card;
        String index;
        Factory factory;
        final List<Option> options=new ArrayList<>();
        boolean indexed;
    }
    private static final class Option {
        final String name;
        final View target;
        Option(String name,View target){this.name=name;this.target=target;}
    }
    private final LinearLayout layout;
    private final boolean english;
    private final EnumMap<Category,Section> sections=new EnumMap<>(Category.class);
    private Category collecting, selected;
    private int start;
    private EditText search;
    private LinearLayout intro;
    private Button back;
    private TextView title, summary, status;
    private String query="";
    private LinearLayout results;
    private int searchGeneration;
    interface Factory { LinearLayout create(); }
    private Runnable closeAction;
    void setCloseAction(Runnable action){closeAction=action;}
    void defer(Category category,String keywords,Factory factory){Section s=new Section();s.factory=factory;s.index=keywords;sections.put(category,s);}
    SettingsSections(LinearLayout layout, boolean english) { this.layout=layout; this.english=english; }
    private String text(String ja,String en) { return english?en:ja; }
    private int dp(int n) { return (int)(n*layout.getResources().getDisplayMetrics().density+.5f); }
    void begin(Category category) { collect(); collecting=category; start=layout.getChildCount(); }
    private void collect() {
        if(collecting==null)return;
        Section s=sections.get(collecting);
        if(s==null){s=new Section();sections.put(collecting,s);}
        for(int i=start;i<layout.getChildCount();i++)s.views.add(layout.getChildAt(i));
    }
    private TextView label(String value,int size,boolean bold) {
        TextView v=new TextView(layout.getContext()); v.setText(value); v.setTextSize(size);
        if(bold)v.setTypeface(v.getTypeface(),Typeface.BOLD);
        v.setPadding(0,dp(6),0,dp(8)); return v;
    }
    private Button button(String value) {
        Button b=new Button(layout.getContext()); b.setText(value); b.setAllCaps(false);
        b.setTextSize(16); b.setGravity(android.view.Gravity.START|android.view.Gravity.CENTER_VERTICAL);
        b.setMinHeight(dp(56)); b.setPadding(dp(16),dp(12),dp(16),dp(12)); return b;
    }
    void finish() {
        collect(); layout.removeAllViews();
        back=button(text("‹ 戻る","‹ Back"));
        back.setOnClickListener(v->{if(!goBack()&&closeAction!=null)closeAction.run();}); layout.addView(back);
        title=label("",22,true); layout.addView(title);
        summary=label("",14,false); layout.addView(summary);
        intro=new LinearLayout(layout.getContext()); intro.setOrientation(LinearLayout.VERTICAL);
        intro.addView(label(text("まずは下の項目を選んでください。分からない設定はそのままで使えます。","Choose a topic below. You can leave unfamiliar settings as they are."),14,false));
        layout.addView(intro);
        search=new EditText(layout.getContext()); search.setSingleLine(true);
        search.setTextSize(16); search.setMinHeight(dp(52));
        search.setHint(text("設定を探す：文字、画像、NGなど","Find a setting: text, images, NG…"));
        search.setContentDescription(text("設定名や説明から検索","Search setting names and descriptions"));
        layout.addView(search);
        status=label("",14,false);layout.addView(status);
        results=new LinearLayout(layout.getContext());results.setOrientation(LinearLayout.VERTICAL);
        layout.addView(results);
        for(Category c:Category.values()) {
            Section s=sections.get(c);if(s==null||(s.views.isEmpty()&&s.factory==null))continue;
            String heading=text(c.ja,c.en)+"  ›";
            android.text.SpannableString caption=new android.text.SpannableString(heading+"\n"+text(c.jaSummary,c.enSummary));
            caption.setSpan(new android.text.style.StyleSpan(Typeface.BOLD),0,heading.length(),0);
            caption.setSpan(new android.text.style.RelativeSizeSpan(.85f),heading.length()+1,caption.length(),0);
            s.card=button("");s.card.setTypeface(null,Typeface.NORMAL);s.card.setText(caption);
            // Theme-derived colors remain legible in both light and dark ChMate themes.
            GradientDrawable surface=new GradientDrawable(); surface.setCornerRadius(dp(12));
            int color=s.card.getCurrentTextColor();
            surface.setColor((color & 0x00ffffff)|0x0c000000);
            surface.setStroke(dp(1),(color & 0x00ffffff)|0x28000000);
            s.card.setBackground(surface);
            LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(-1,-2);params.bottomMargin=dp(10);
            layout.addView(s.card,params);
            s.card.setOnClickListener(v->open(c));
            StringBuilder index=new StringBuilder(c.ja+" "+c.en+" "+c.jaSummary+" "+c.enSummary);
            if(s.index!=null)index.append(' ').append(s.index);
            for(View v:s.views)index.append(' ').append(labels(v));
            s.index=index.toString();
            if(s.factory==null){s.body=new LinearLayout(layout.getContext());s.body.setOrientation(LinearLayout.VERTICAL);for(View v:s.views)s.body.addView(v);}
        }
        search.addTextChangedListener(new TextWatcher(){
            public void beforeTextChanged(CharSequence s,int st,int count,int after){}
            public void onTextChanged(CharSequence s,int st,int before,int count){query=s.toString();update();}
            public void afterTextChanged(Editable e){}
        });
        update();layout.setFocusableInTouchMode(true);layout.requestFocus();
    }
    private void open(Category c) {
        Section section=sections.get(c);
        if(section==null)return;
        ensureBody(c,section);
        // Returning from a nested dialog preserves this category and its controls.
        selected=c;update();
        android.view.inputmethod.InputMethodManager ime=(android.view.inputmethod.InputMethodManager)layout.getContext().getSystemService(android.content.Context.INPUT_METHOD_SERVICE);
        if(ime!=null)ime.hideSoftInputFromWindow(search.getWindowToken(),0);
        layout.requestFocus();top();
    }
    private void ensureBody(Category c,Section section) {
        if(section.body==null){
            long started=android.os.SystemClock.uptimeMillis();
            section.body=section.factory.create();
            android.util.Log.d("Haiagaru","Settings category "+c+" created in "+(android.os.SystemClock.uptimeMillis()-started)+"ms");
        }
        if(!section.indexed){collectOptions(section.body,section.options);section.indexed=true;}
    }
    boolean goBack() {
        if(selected==null){if(!query.trim().isEmpty()){search.setText("");return true;}return false;}
        selected=null;update();top();return true;
    }
    private void top(){layout.post(()->{if(layout.getParent() instanceof android.widget.ScrollView)((android.widget.ScrollView)layout.getParent()).scrollTo(0,0);});}
    private void update() {
        boolean home=selected==null;
        boolean searching=home&&!query.trim().isEmpty();
        int generation=++searchGeneration;
        results.removeAllViews();results.setVisibility(searching?View.VISIBLE:View.GONE);
        back.setVisibility(View.VISIBLE);
        title.setText(home?text("何を変えたいですか？","What would you like to change?"):text(selected.ja,selected.en));
        summary.setText(home?text("変更は自動で保存されます。","Changes are saved automatically."):
                text(selected.jaSummary,selected.enSummary)+"\n"+text("変更はその場で保存されます。戻ると直前の画面へ戻ります。","Changes are saved immediately. Back returns to the previous screen."));
        intro.setVisibility(home&&query.trim().isEmpty()?View.VISIBLE:View.GONE);
        search.setVisibility(home?View.VISIBLE:View.GONE);
        int found=0;
        for(Category c:Category.values()){
            Section s=sections.get(c);if(s==null||s.card==null)continue;
            boolean match=matches(s.index,query);
            s.card.setVisibility(home&&!searching?View.VISIBLE:View.GONE);
            if(s.body!=null){
                if(!home&&selected==c){if(s.body.getParent()==null)layout.addView(s.body);s.body.setVisibility(View.VISIBLE);}
                else if(s.body.getParent()==layout)layout.removeView(s.body);
            }
            if(match)found++;
        }
        status.setVisibility(home&&!query.trim().isEmpty()?View.VISIBLE:View.GONE);
        status.setText(found==0?text("見つかりませんでした。「画像」「文字」など短い言葉で探してみてください。","No results. Try a short word such as images or text."):
                text("関連する設定：","Related topics: ")+found+text("件。項目を選ぶと設定できます。",". Choose one to open its settings."));
        if(searching){
            status.setText(text("設定項目を検索しています…","Searching settings…"));
            // Debounce typing; build at most one category per UI queue turn, only on search.
            layout.postDelayed(()->searchNext(generation,0,0),250);
        }
    }
    private void searchNext(int generation,int position,int count){
        if(generation!=searchGeneration||!layout.isAttachedToWindow())return;
        Category[] categories=Category.values();
        if(position==categories.length){
            status.setText(count==0?text("一致する設定項目がありません。短い言葉で検索してください。","No matching options. Try a shorter word."):
                    text("設定項目：","Matching options: ")+count+text("件。タップすると設定へ移動します。",". Tap to open."));return;
        }
        Category c=categories[position];Section s=sections.get(c);
        int found=count;
        if(s!=null){
            ensureBody(c,s);
            for(Option option:s.options){
                if(!matches(option.name,query))continue;
                Button result=button(option.name+"\n"+text(c.ja,c.en)+"  ›");
                result.setOnClickListener(v->{open(c);reveal(option.target);});
                results.addView(result);found++;
            }
        }
        final int total=found;
        layout.postDelayed(()->searchNext(generation,position+1,total),16);
    }
    // Index labels, never typed values, login details or selected spinner values.
    private static void collectOptions(ViewGroup parent,List<Option> options){
        for(int i=0;i<parent.getChildCount();i++){
            View view=parent.getChildAt(i);
            if(view.getVisibility()!=View.VISIBLE)continue;
            if(view instanceof EditText||view instanceof android.widget.Spinner)continue;
            if(view instanceof TextView){
                String name=((TextView)view).getText().toString().trim();
                if(name.isEmpty())continue;
                View next=i+1<parent.getChildCount()?parent.getChildAt(i+1):null;
                if(view instanceof Button||view instanceof android.widget.CompoundButton)
                    options.add(new Option(name,view));
                else if(next instanceof EditText||next instanceof android.widget.Spinner)
                    options.add(new Option(name,next));
            }else if(view instanceof ViewGroup)collectOptions((ViewGroup)view,options);
        }
    }
    // Never index editable values, credentials or spinner selections.
    private static String labels(View view) {
        if(view instanceof EditText||view instanceof android.widget.Spinner)return "";
        if(view instanceof TextView)return ((TextView)view).getText().toString();
        StringBuilder result=new StringBuilder();
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)result.append(' ').append(labels(((ViewGroup)view).getChildAt(i)));
        return result.toString();
    }
    static boolean matches(String labels,String query) {
        String text=java.text.Normalizer.normalize(labels,java.text.Normalizer.Form.NFKC).toLowerCase(Locale.ROOT);
        String normalized=java.text.Normalizer.normalize(query,java.text.Normalizer.Form.NFKC).trim().toLowerCase(Locale.ROOT);
        if(normalized.isEmpty())return true;
        for(String word:normalized.split("\\s+"))if(!text.contains(word))return false;
        return true;
    }
    void reveal(View target) {
        for(Category c:Category.values()){
            Section s=sections.get(c);if(s==null)continue;
            for(View p=target;p!=null;p=p.getParent() instanceof View?(View)p.getParent():null)if(p==s.body){selected=c;break;}
        }
        update();target.requestFocus();
        target.post(()->target.requestRectangleOnScreen(new Rect(0,0,target.getWidth(),target.getHeight()),false));
    }
    void revealCategory(Category c){open(c);}
}
