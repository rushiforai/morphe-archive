package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

/** Hands an explicit draft to stock ChMate's exported editor. Never reads cookies or sends a post. */
public final class StockChmatePosting {
    static final int ACTION=0x7e00000d;
    static final String LONG_PRESS="stockPostingOnWriteLongPress";
    static final String SKIP_CONFIRM="stockPostingSkipConfirmation";
    static final String SHOW_MENU="stockPostingShowMenu";
    private static final String PACKAGE = "jp.co.airfront.android.a2chMate";
    private static final String EDITOR = "jp.syoboi.a2chMate.activity.ResEditActivity";
    private static final String HANDOFF = "app.morphe.extension.chmate.STOCK_POST_DRAFT";
    private static final int MENU = 0x48690062;
    private static final Map<Activity, Draft> DRAFTS = new WeakHashMap<>();
    private static final Map<MenuItem, WeakReference<Activity>> MENUS = new WeakHashMap<>();
    private static final android.util.LruCache<String,Pending> REQUESTS=new android.util.LruCache<>(8);
    private static final class Pending {
        final WeakReference<Activity> activity;
        final Draft draft;
        final byte[] body;
        final String subject;
        Pending(Activity activity,Draft draft,String subject){
            this.activity=new WeakReference<>(activity);this.draft=draft;this.subject=subject;
            body=BoardPostResult.fingerprint(draft.body.get().getText());
        }
    }
    private static String toolbarTarget(Object fragment,Activity activity)throws Exception{
        String version=activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName;
        return StockChmatePostingRules.target(NativeThreadContext.url(NativeThreadContext.board(fragment,version),version,0));
    }
    public static boolean longClick(Object fragment,android.view.View button){
        if(button==null||button.getId()!=2||!FeatureSwitches.enabled(LONG_PRESS,false))return false;
        Activity activity=Haiagaru.toolbarActivity(fragment);if(activity==null)return false;
        try{String target=toolbarTarget(fragment,activity);if(target==null)return false;openEditor(activity,target);return true;}
        catch(Exception unavailable){return false;}
    }
    static void openFromToolbar(Object fragment){
        Activity activity=Haiagaru.toolbarActivity(fragment);if(activity==null)return;
        try{
            String target=toolbarTarget(fragment,activity);
            if(target==null){message(activity,"通常版ChMateで書き込む","エッヂのスレを開いてから利用してください。");return;}
            openEditor(activity,target);
        }catch(Exception unavailable){message(activity,"通常版へ渡せません","現在の投稿先を確認できませんでした。");}
    }
    static Intent editorIntent(String address){
        String target=StockChmatePostingRules.target(address);
        if(target==null)throw new IllegalArgumentException("エッヂの投稿先を確認できません。");
        // No body/subject extras: retain the stock application's own draft.
        return new Intent(Intent.ACTION_SENDTO,Uri.parse(target)).setClassName(PACKAGE,EDITOR).putExtra(HANDOFF,true);
    }
    private static void openEditor(Activity activity,String target){
        try{relay(activity,editorIntent(target),null);}
        catch(ActivityNotFoundException|SecurityException missing){message(activity,"通常版ChMateを開けません","同じユーザー領域に通常版ChMateをインストール・有効化してください。");}
    }
    private static void relay(Activity activity,Intent editor,String token){
        activity.getApplicationContext().startActivity(new Intent(activity,StockPostingRelayActivity.class)
                .putExtra("editor",editor).putExtra("request",token).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
    }
    static void returned(String token,boolean posted){
        Pending request=token==null?null:REQUESTS.remove(token);
        if(!posted||request==null)return;
        Activity activity=request.activity.get();Draft draft=request.draft;
        if(activity==null||activity.isFinishing()||activity.isDestroyed()||DRAFTS.get(activity)!=draft)return;
        EditText input=draft.body.get();Object owner=draft.owner.get();
        try{
            if(input==null||owner==null||!BoardPostResult.sameDraft(request.body,input.getText())
                    ||!java.util.Objects.equals(request.subject,draft.subject())){
                Toast.makeText(activity,"投稿は完了しました。変更された下書きは保持しています。",Toast.LENGTH_LONG).show();return;
            }
            String previous=input.getText().toString();
            try{
                input.setText("");
                if(request.subject!=null)owner.getClass().getMethod("haiagaruSetStockPostTitle",String.class).invoke(owner,"");
                owner.getClass().getMethod("haiagaruSaveExternalDraft").invoke(owner);
            }catch(Exception failure){
                input.setText(previous);
                if(request.subject!=null)owner.getClass().getMethod("haiagaruSetStockPostTitle",String.class).invoke(owner,request.subject);
                throw failure;
            }
            activity.setResult(Activity.RESULT_OK);activity.finish();
        }catch(Exception unavailable){
            Toast.makeText(activity,"投稿は完了しましたが、下書きの後処理を確認できませんでした。二重送信せず内容を確認してください。",Toast.LENGTH_LONG).show();
        }
    }
    private static final class Draft {
        final String target;
        final WeakReference<Object> owner;
        final WeakReference<EditText> body;
        Draft(Object owner, EditText body, String target) {
            this.owner = new WeakReference<>(owner); this.body = new WeakReference<>(body); this.target = target;
        }
        String subject() throws Exception {
            if (!StockChmatePostingRules.newThread(target)) return null;
            return (String) owner.get().getClass().getMethod("haiagaruStockPostTitle").invoke(owner.get());
        }
    }

    static void target(Object owner, String address, EditText body) {
        Activity activity = ExternalBoardAuth.activity(owner);
        if (activity == null || body == null) return;
        String target = StockChmatePostingRules.target(address);
        if (target == null || PACKAGE.equals(activity.getPackageName())) DRAFTS.remove(activity);
        else DRAFTS.put(activity, new Draft(owner, body, target));
        activity.invalidateOptionsMenu();
    }

    private static Draft current(Activity activity) {
        Draft draft = DRAFTS.get(activity);
        return draft != null && !activity.isFinishing() && !activity.isDestroyed()
                && draft.owner.get() != null && draft.body.get() != null && draft.body.get().isShown() ? draft : null;
    }

    static void addPostingMenu(Object owner, Menu menu) {
        Activity activity = ExternalBoardAuth.activity(owner);
        if (activity == null || menu == null) return;
        boolean visible = menuEnabled(activity) && Haiagaru.isPostingOverflowMenu(activity, menu) && current(activity) != null;
        MenuItem existing = menu.findItem(MENU);
        if (existing != null) { existing.setVisible(visible); return; }
        if (!visible) return;
        MenuItem item = menu.add(Menu.NONE, MENU, Menu.NONE, "通常版ChMateで書き込む");
        MENUS.put(item, new WeakReference<>(activity));
        item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        item.setOnMenuItemClickListener(clicked -> { if(menuEnabled(activity))confirm(activity); return true; });
    }

    private static boolean menuEnabled(Activity activity) {
        return activity!=null&&FeatureSwitches.prefs(activity).getBoolean(SHOW_MENU,true);
    }

    static boolean handlePostingMenu(Object owner, MenuItem item) {
        if (item == null || item.getItemId() != MENU) return false;
        Activity activity = ExternalBoardAuth.activity(owner);
        if (menuEnabled(activity)) confirm(activity);
        return true;
    }

    static boolean handlePostingActivityMenu(MenuItem item) {
        if (item == null || item.getItemId() != MENU) return false;
        WeakReference<Activity> ref = MENUS.get(item);
        if (ref != null && menuEnabled(ref.get())) confirm(ref.get());
        return true;
    }

    static void addSettingsButton(LinearLayout layout, Activity activity) {
        Button button = new Button(activity);
        button.setAllCaps(false); button.setText("通常版ChMateでエッヂに書き込む"); layout.addView(button);
        button.setOnClickListener(view -> message(activity, "通常版ChMateとの書き込み連携",
                "エッヂの書き込み画面で本文・スレタイを入力し、メニューの「通常版ChMateで書き込む」を選びます。\n\n"
                + "通常版の書き込み画面へ渡し、通常版に保存されている認証・レベルで送信できます。root・Shizuku・証明書の追加は不要です。\n\n"
                + "名前・メールは通常版の画面で確認してください。投稿成功の結果を受け取るとHaiagaruへ戻り、渡した下書きを削除します。戻るボタンで中断した場合は下書きを保持します。投稿履歴とCookieは通常版で管理されます。"));
    }

    static Intent intent(String target, String body, String subject) {
        StockChmatePostingRules.validate(target, body, subject);
        Intent intent = new Intent(Intent.ACTION_SENDTO, Uri.parse(target))
                .setClassName(PACKAGE, EDITOR).putExtra(Intent.EXTRA_TEXT, body).putExtra(HANDOFF, true);
        if (StockChmatePostingRules.newThread(target)) intent.putExtra(Intent.EXTRA_SUBJECT, subject);
        return intent;
    }

    /** Preserve only this explicit external editor request across native self-navigation wrappers. */
    static boolean isHandoff(Intent intent) {
        if (intent == null || !intent.getBooleanExtra(HANDOFF, false)
                || !Intent.ACTION_SENDTO.equals(intent.getAction())
                || !new android.content.ComponentName(PACKAGE, EDITOR).equals(intent.getComponent())) return false;
        String target = StockChmatePostingRules.target(intent.getDataString());
        return target != null && target.equals(intent.getDataString());
    }

    private static void confirm(Activity activity) {
        Draft draft = current(activity);
        if (draft == null) { message(activity, "通常版へ渡せません", "エッヂの書き込み画面から、もう一度お試しください。"); return; }
        try { StockChmatePostingRules.validate(draft.target, draft.body.get().getText().toString(), draft.subject()); }
        catch (IllegalArgumentException invalid) { message(activity, "入力内容を確認", invalid.getMessage()); return; }
        catch (Exception unavailable) { message(activity, "通常版へ渡せません", "スレタイを読み取れませんでした。Haiagaruの下書きは保持しています。"); return; }
        if(FeatureSwitches.prefs(activity).getBoolean(SKIP_CONFIRM,false)){launch(activity,draft);return;}
        LinearLayout options=new LinearLayout(activity);options.setOrientation(LinearLayout.VERTICAL);
        android.widget.CheckBox skip=new android.widget.CheckBox(activity);skip.setText("次回から表示しない");options.addView(skip);
        new HaiagaruDialog.Builder(activity).setTitle("通常版ChMateで書き込む")
                .setMessage("投稿先: " + draft.target + "\n\n本文" + (StockChmatePostingRules.newThread(draft.target) ? "とスレタイ" : "")
                        + "を通常版の書き込み画面へ渡します。名前・メールを確認し、通常版の画面で送信してください。\n\n"
                        + "通常版のエッヂ認証・レベルを使います。投稿成功の結果を受け取るとHaiagaruへ戻り、渡した下書きを削除します。戻るボタンで中断した場合は下書きを保持します。")
                .setView(options).setNegativeButton("戻る", null).setPositiveButton("通常版へ渡す", (dialog, which) -> {
                    FeatureSwitches.prefs(activity).edit().putBoolean(SKIP_CONFIRM,skip.isChecked()).apply();
                    launch(activity,draft);
                }).show();
    }

    private static void launch(Activity activity, Draft draft) {
        if (current(activity) != draft) { message(activity, "通常版へ渡せません", "書き込み画面が変わりました。もう一度お試しください。"); return; }
        final Intent intent;
        final String subject;
        try {
            subject=draft.subject();
            intent = intent(draft.target, draft.body.get().getText().toString(), subject);
            // Persist the original native draft without clearing or claiming that a post succeeded.
            Object owner = draft.owner.get();
            owner.getClass().getMethod("haiagaruSaveExternalDraft").invoke(owner);
        } catch (IllegalArgumentException invalid) { message(activity, "入力内容を確認", invalid.getMessage()); return; }
        catch (Exception unavailable) { message(activity, "通常版へ渡せません", "下書きを保存できませんでした。入力欄の内容を確認してから再試行してください。"); return; }
        try {
            // Native ChMate activities can intercept SENDTO and reopen their own editor.
            // Use the standard Application context for the external stock-app task.
            String token=java.util.UUID.randomUUID().toString();
            REQUESTS.put(token,new Pending(activity,draft,subject));
            relay(activity,intent,token);
            Toast.makeText(activity, "通常版で内容を確認して送信してください。", Toast.LENGTH_LONG).show();
        } catch (ActivityNotFoundException | SecurityException unavailable) {
            message(activity, "通常版ChMateを開けません", "同じユーザー領域に通常版ChMateをインストール・有効化してください。Haiagaruの下書きは保持しています。");
        } catch (RuntimeException failed) {
            message(activity, "通常版へ渡せません", "通常版の書き込み画面を開けませんでした。Haiagaruの下書きは保持しています。");
        }
    }

    private static void message(Activity activity, String title, String text) {
        if (!activity.isFinishing() && !activity.isDestroyed()) new HaiagaruDialog.Builder(activity)
                .setTitle(title).setMessage(text).setPositiveButton("閉じる", null).show();
    }
    private StockChmatePosting() {}
}
