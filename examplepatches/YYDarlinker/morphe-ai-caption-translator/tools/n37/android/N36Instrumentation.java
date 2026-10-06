package n36;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.SystemClock;
import android.preference.Preference;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * Instrumentation for the N36 input lane. It runs the real official settings surface inside the final
 * DEX, serves a real IME service, and drives text through genuine {@link android.view.inputmethod.InputConnection}
 * calls. Every observation is written to the target app's files directory as JSON.
 */
@SuppressWarnings("deprecation")
public final class N36Instrumentation extends Instrumentation {
    private Bundle arguments;
    private N36Host host;
    private final JSONArray events = new JSONArray();
    private int textChanges;
    private java.util.concurrent.CountDownLatch archiveRelease;
    private long archiveBlockedAt;
    private void blockArchive() throws Exception {
        Class<?> c=Class.forName("app.yydarlinker.deepseekcaptions.CaptionDiagnosticArchive");Field f=c.getDeclaredField("IO");f.setAccessible(true);
        java.util.concurrent.ExecutorService io=(java.util.concurrent.ExecutorService)f.get(null);
        java.util.concurrent.CountDownLatch entered=new java.util.concurrent.CountDownLatch(1);archiveRelease=new java.util.concurrent.CountDownLatch(1);
        io.execute(()->{entered.countDown();try{archiveRelease.await(25,java.util.concurrent.TimeUnit.SECONDS);}catch(InterruptedException e){Thread.currentThread().interrupt();}});
        check(entered.await(2,java.util.concurrent.TimeUnit.SECONDS),"controlled archive backlog entered");archiveBlockedAt=SystemClock.uptimeMillis();
    }
    private void releaseArchive(){if(archiveRelease!=null)archiveRelease.countDown();}

    @Override public void onCreate(Bundle arguments) {
        this.arguments = arguments;
        N37ImeBridge.init(getTargetContext());
        start();
    }

    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            N36Host.callerLocale = arguments.getString("caller", "zh-CN");
            N36Host.callerFontScale = Float.parseFloat(arguments.getString("fontScale", "1.0"));
            N36Host.callerDark = "true".equals(arguments.getString("dark"));
            Intent intent = new Intent(getTargetContext(), N36Host.class)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            intent.putExtra("locale", arguments.getString("locale", "zh-CN"));
            intent.putExtra("dark", N36Host.callerDark);
            host = (N36Host) startActivitySync(intent);
            prepareLongArchive();
            settle(120);
            String action = arguments.getString("action", "input");
            JSONObject report = new JSONObject();
            report.put("action", action);
            report.put("sdk", android.os.Build.VERSION.SDK_INT);
            report.put("locale", N36Host.callerLocale);
            report.put("ime_available", imeAvailable());
            if("true".equals(arguments.getString("backlog")))blockArchive();
            if ("deep-scroll".equals(action)) report.put("deep_scroll", deepScrollLane());
            if ("input".equals(action)) report.put("input", inputLane());
            if ("scroll".equals(action)) report.put("scroll", scrollLane());
            if ("transition".equals(action)) report.put("transition", transitionLane());
            releaseArchive();
            report.put("events", events);
            report.put("ime_ops", imeOps());
            write("n36-" + action + ".json", report);
            result.putString("result", "PASS");
            finish(Activity.RESULT_OK, result);
        } catch (Throwable error) {
            releaseArchive();
            android.util.Log.e("N36", "INPUT_LANE_FAILURE", error);
            try {
                JSONObject report = new JSONObject();
                report.put("action", arguments.getString("action", "input"));
                report.put("failure", android.util.Log.getStackTraceString(error));
                releaseArchive();
            report.put("events", events);
                report.put("ime_ops", imeOps());
                write("n36-failure.json", report);
            } catch (Exception ignored) {}
            result.putString("failure", android.util.Log.getStackTraceString(error));
            finish(Activity.RESULT_CANCELED, result);
        }
    }


    private void prepareLongArchive() throws Exception {
        Class<?> archive=Class.forName("app.yydarlinker.deepseekcaptions.CaptionDiagnosticArchive");
        Method append=archive.getDeclaredMethod("append",Context.class,String.class,String.class);append.setAccessible(true);
        StringBuilder chunk=new StringBuilder();for(int row=0;row<50;row++){
          chunk.append("1791160215527 | SYNTHETIC_SAFE_HISTORY | fixture=").append(row).append(";");
          for(int n=0;n<900;n++)chunk.append('x');chunk.append('\n');
        }
        for(int batch=0;batch<82;batch++)append.invoke(null,host,"history",chunk.toString());
        Method read=archive.getDeclaredMethod("read",Context.class,String.class);read.setAccessible(true);
        String history=(String)read.invoke(null,host,"history");check(history.length()>=3824470,"long diagnostic workload materialized");
        marker("synthetic_archive_bytes="+history.getBytes(StandardCharsets.UTF_8).length);
    }

    private JSONObject deepScrollLane() throws Exception {
        JSONObject result=new JSONObject();ListView list=aiList();JSONArray rows=new JSONArray(),frames=new JSONArray();int[] binds={0};
        android.database.DataSetObserver observer=new android.database.DataSetObserver(){public void onChanged(){binds[0]++;}};
        runOnMainSync(()->list.getAdapter().registerDataSetObserver(observer));
        if("true".equals(arguments.getString("disableOverscroll")))runOnMainSync(()->list.setOverScrollMode(View.OVER_SCROLL_NEVER));
        boolean prompt="prompt".equals(arguments.getString("focus","natural"));
        if(prompt){View row=reveal(list,"deepseek_caption_prompt");EditText e=editorOf(row,"deepseek_caption_prompt");if(e!=null){tap(e);settle(200);check(N37ImeBridge.connected(),"prompt real IME served");check(N37ImeBridge.setComposing("天气"),"prompt Chinese composing ack");check(N37ImeBridge.commit("天気予報"),"prompt Japanese commit ack");N37ImeBridge.finishComposing();settle(120);runOnMainSync(()->{InputMethodManager im=(InputMethodManager)host.getSystemService(Context.INPUT_METHOD_SERVICE);im.hideSoftInputFromWindow(e.getWindowToken(),0);});settle(150);}}
        View preview=reveal(list,"deepseek_caption_style_preview");check(preview!=null,"preview is reachable");
        if("true".equals(arguments.getString("expanded"))){View drow=reveal(list,"deepseek_caption_diagnostics");View toggle=drow==null?null:tag(drow,"ai_diagnostics_toggle");if(toggle!=null){runOnMainSync(toggle::performClick);settle(160);}preview=reveal(list,"deepseek_caption_style_preview");}
        long[] before=counters(); final boolean[] sampling={true}; android.view.Choreographer.FrameCallback sample=new android.view.Choreographer.FrameCallback(){long last;
          public void doFrame(long at){if(!sampling[0])return;try{JSONObject r=new JSONObject().put("at",at/1000000).put("delta_ms",last==0?0:(at-last)/1000000).put("first",list.getFirstVisiblePosition()).put("top",list.getChildCount()>0?list.getChildAt(0).getTop():0).put("list_height",list.getHeight()).put("padding_bottom",list.getPaddingBottom()).put("dataset_changes",binds[0]).put("scroll_y",list.getScrollY()).put("can_down",list.canScrollVertically(1)).put("can_up",list.canScrollVertically(-1)).put("last",list.getLastVisiblePosition()).put("over_scroll_mode",list.getOverScrollMode());JSONArray childRows=new JSONArray();for(int c=0;c<list.getChildCount();c++){View v=list.getChildAt(c);int index=list.getFirstVisiblePosition()+c;Object item=list.getAdapter().getItem(index);String key=item instanceof android.preference.Preference?((android.preference.Preference)item).getKey():String.valueOf(item);childRows.put(new JSONObject().put("index",index).put("key",key).put("title",item instanceof android.preference.Preference?String.valueOf(((android.preference.Preference)item).getTitle()):"").put("top",v.getTop()).put("bottom",v.getBottom()).put("measured_height",v.getMeasuredHeight()).put("identity",System.identityHashCode(v)));}r.put("rows",childRows);View p=tag(list,"ai_style_preview_canvas");if(p!=null){int[] loc=new int[2];p.getLocationOnScreen(loc);r.put("preview_screen_top",loc[1]).put("preview_height",p.getHeight());}View focus=list.getRootView().findFocus();r.put("focus_class",focus==null?"none":focus.getClass().getName()).put("focus_id",focus==null?-1:focus.getId());frames.put(r);last=at;}catch(Exception ignored){}android.view.Choreographer.getInstance().postFrameCallback(this);}};
        runOnMainSync(()->android.view.Choreographer.getInstance().postFrameCallback(sample));
        for(int pass=0;pass<3;pass++){drag(list,-1,260,700);drag(list,1,260,90);fling(list,-1,1600);fling(list,1,1600);}
        settle(180);runOnMainSync(()->{sampling[0]=false;list.getAdapter().unregisterDataSetObserver(observer);});long[] after=counters();
        if(archiveRelease!=null){
            check(archiveRelease.getCount()==1,"archive remained blocked during natural gestures");
            result.put("archive_blocked_during_gestures",true).put("blocked_ms",SystemClock.uptimeMillis()-archiveBlockedAt);
            releaseArchive();settle(250);
        }
        result.put("focus_mode",arguments.getString("focus","natural")).put("frames",frames).put("dataset_changes",binds[0]).put("viewport_before",new JSONArray(before)).put("viewport_after",new JSONArray(after));
        return result;
    }

    // ---------------------------------------------------------------- input lane

    private JSONObject inputLane() throws Exception {
        long laneDeadline = SystemClock.uptimeMillis() + Long.parseLong(arguments.getString("laneMs", "45000"));
        marker("input:start");
        JSONObject lane = new JSONObject();
        JSONArray fields = new JSONArray();
        marker("input:ai-list");
        ListView list = aiList();
        marker("input:ai-list-ready");
        String[] keys = {
                "deepseek_caption_model",
                "deepseek_caption_api_key",
                "deepseek_caption_base_url",
                "deepseek_caption_prompt"
        };
        for (String key : keys) {
            JSONObject row = new JSONObject();
            row.put("key", key);
            if (SystemClock.uptimeMillis() > laneDeadline) { row.put("skipped", "lane_time_budget"); fields.put(row); continue; }
            marker("input:field:" + key);
            View rowView = reveal(list, key);
            if (rowView == null) { row.put("missing", true); fields.put(row); continue; }
            EditText editor = editorOf(rowView, key);
            if (editor == null) { row.put("missing_editor", true); fields.put(row); continue; }
            row.put("field_id", editor.getId());
            row.put("editor_class", editor.getClass().getName());
            row.put("single_line", editor.getMaxLines() == 1 || !editor.isSingleLine() == false);

            // A real tap so the production gesture path requests the IME, then wait for a served input.
            tap(editor);
            settle(120);
            long deadline = SystemClock.uptimeMillis() + 6000;
            while (!N37ImeBridge.connected() && SystemClock.uptimeMillis() < deadline) {
                SystemClock.sleep(100);
                settle(120);
            }
            row.put("connection_served", N37ImeBridge.connected());
            row.put("waited_ms", 6000 - Math.max(0, deadline - SystemClock.uptimeMillis()));
            row.put("window_focus", editor.hasWindowFocus());
            row.put("view_focus", editor.hasFocus());
            row.put("window_flags", windowFlags(editor));
            row.put("ime_visible", imeVisible(editor));
            if (!N37ImeBridge.connected()) {
                throw new IllegalStateException("No real IME connection for "+key);
            }
            row.put("before", editor.getText().toString());
            row.put("before_changes", textChanges(editor));
            android.content.Intent served=N37ImeBridge.call("status","",0,0);
            row.put("served_id",served.getIntExtra("field",-1));
            events.put(new JSONObject(row.toString()));
            check(served.getIntExtra("field",-1)==editor.getId(),"platform IME serves the tapped field "+key);
            check(N37ImeBridge.call("end","",0,0).getBooleanExtra("ok",false),"real InputConnection moves cursor to end "+key);
            // 1) composing then commit (Chinese and Japanese through the same path)
            boolean promptField="deepseek_caption_prompt".equals(key);
            String committedText=promptField?"天気予報":"n37-fixture";
            boolean composing=N37ImeBridge.setComposing(promptField?"天气":"n37");
            boolean committed=N37ImeBridge.commit(committedText);
            boolean finished = N37ImeBridge.finishComposing();
            row.put("set_composing", composing);
            row.put("composing_text_before_cursor", N37ImeBridge.composingText());
            row.put("commit", committed);
            row.put("finish_composing", finished);
            settle(120);
            String afterCompose = editor.getText().toString();
            row.put("after_compose", afterCompose);
            row.put("compose_visible_in_view", afterCompose.contains(committedText));
            // 2) delete through the IME
            boolean deleted = N37ImeBridge.deleteSurrounding(3, 0);
            settle(120);
            String afterDelete = editor.getText().toString();
            row.put("delete_surrounding", deleted);
            row.put("after_delete", afterDelete);
            row.put("delete_visible_in_view", afterDelete.equals(afterCompose.substring(0, Math.max(0, afterCompose.length() - 3))));
            // 3) plain ASCII commit (the key path is sensitive, so it is never filled with a real secret)
            boolean ascii = N37ImeBridge.commit("n36-probe-key");
            settle(120);
            String afterAscii = editor.getText().toString();
            row.put("ascii_commit", ascii);
            row.put("after_ascii", afterAscii);
            row.put("ascii_visible_in_view", afterAscii.contains("n36-probe-key"));
            runOnMainSync(()->{android.content.ClipboardManager clipboard=(android.content.ClipboardManager)host.getSystemService(Context.CLIPBOARD_SERVICE);clipboard.setPrimaryClip(android.content.ClipData.newPlainText("test-only","-paste"));});
            boolean pasted=N37ImeBridge.call("paste","",0,0).getBooleanExtra("ok",false);settle(120);
            row.put("paste_ack",pasted).put("paste_visible_in_view",editor.getText().toString().contains("-paste"));
            afterAscii=editor.getText().toString();
            row.put("change_count", textChanges(editor));
            // Dismiss the platform paste/IME panel through a real Back event before another tap.
            sendKeyDownUpSync(android.view.KeyEvent.KEYCODE_BACK);settle(250);
            // 4) focus loss then regain: the connection must be re-served and the text preserved
            runOnMainSync(editor::clearFocus);
            settle(120);
            SystemClock.sleep(400);
            tap(editor);
            settle(120);
            long regainDeadline = SystemClock.uptimeMillis() + 4000;
            while (!N37ImeBridge.connected() && SystemClock.uptimeMillis() < regainDeadline) {
                SystemClock.sleep(100);
                settle(120);
            }
            row.put("refocus_ime_visible", imeVisible(editor));
            row.put("refocus_text", editor.getText().toString());
            row.put("refocus_text_preserved", editor.getText().toString().equals(afterAscii));
            fillMetrics(row);
            check(composing&&committed&&finished&&deleted&&ascii&&pasted,"real input operations acknowledged "+key);
            check(row.getBoolean("compose_visible_in_view")&&row.getBoolean("delete_visible_in_view")&&row.getBoolean("ascii_visible_in_view")&&row.getBoolean("paste_visible_in_view"),"real edit visible in field "+key);
            fields.put(row);
            sendKeyDownUpSync(android.view.KeyEvent.KEYCODE_BACK);settle(250);
            runOnMainSync(editor::clearFocus);
            settle(120);
            Class<?> config=Class.forName("app.yydarlinker.deepseekcaptions.DeepSeekConfig");
            Method load=config.getDeclaredMethod("load",Context.class);load.setAccessible(true);Object saved=load.invoke(null,host);
            String fieldName="deepseek_caption_model".equals(key)?"model":"deepseek_caption_api_key".equals(key)?"apiKey":"deepseek_caption_base_url".equals(key)?"baseUrl":"prompt";
            Field value=saved.getClass().getDeclaredField(fieldName);value.setAccessible(true);String persisted=String.valueOf(value.get(saved));
            row.put("saved_value",persisted).put("saved_value_matches",persisted.equals(afterAscii.trim()));
            check(persisted.equals(afterAscii.trim()),"native edit persisted through the real save path "+key);
        }
        lane.put("fields",fields);
        // Recycle out of the prompt row and reopen it; retain the actual persisted custom text.
        JSONObject prompt=fields.getJSONObject(fields.length()-1);String savedPrompt=prompt.getString("saved_value");
        reveal(list,"deepseek_caption_model");View reopened=reveal(list,"deepseek_caption_prompt");
        EditText reopenedPrompt=editorOf(reopened,"deepseek_caption_prompt");
        check(reopenedPrompt!=null&&savedPrompt.equals(reopenedPrompt.getText().toString().trim()),"prompt survives actual scroll recycle/reopen");
        lane.put("scroll_recycle_reopen",true);
        Class<?> profiles=Class.forName("app.yydarlinker.deepseekcaptions.ApiProfiles");
        Method active=profiles.getDeclaredMethod("active",Context.class),create=profiles.getDeclaredMethod("create",Context.class,String.class,String.class),select=profiles.getDeclaredMethod("select",Context.class,String.class);
        active.setAccessible(true);create.setAccessible(true);select.setAccessible(true);String original=(String)active.invoke(null,host);
        final String[] next={null};final boolean[] changed={false};
        runOnMainSync(()->{try{next[0]=(String)create.invoke(null,host,"N37 dummy profile",fields.getJSONObject(2).getString("saved_value"));changed[0]=(Boolean)select.invoke(null,host,next[0]);}catch(Exception e){throw new IllegalStateException(e);}});
        check(changed[0],"real profile lifecycle switched to dummy profile");settle(250);
        check(next[0].equals(active.invoke(null,host)),"new profile owns the editors");
        runOnMainSync(()->{try{changed[0]=(Boolean)select.invoke(null,host,original);}catch(Exception e){throw new IllegalStateException(e);}});
        check(changed[0],"real profile lifecycle restored original dummy profile");settle(250);
        reopened=reveal(list,"deepseek_caption_prompt");reopenedPrompt=editorOf(reopened,"deepseek_caption_prompt");
        check(reopenedPrompt!=null&&savedPrompt.equals(reopenedPrompt.getText().toString().trim()),"custom prompt retained across profile switch");
        lane.put("profile_switch_roundtrip",true).put("viewport",viewport());
        return lane;
    }

    // ---------------------------------------------------------------- scroll lane

    private JSONObject scrollLane() throws Exception {
        JSONObject lane = new JSONObject();
        ListView list = aiList();
        View preview = reveal(list, "deepseek_caption_style_preview");
        check(preview != null, "preview row is visible");
        View canvas = tag(preview, "ai_style_preview_canvas");
        check(canvas != null, "preview canvas exists");
        long[] before = counters();
        int start = list.getFirstVisiblePosition();
        // Preserve the natural focus. The preview never requests focus in this lane.
        settle(120);
        // Fast and slow drags plus flings at the preview's top edge, with the IME closed.
        for (int pass = 0; pass < 3; pass++) {
            drag(list, -1, 260, 90);
            drag(list, 1, 260, 900);
            fling(list, -1, 1600);
            fling(list, 1, 1600);
        }
        settle(120);
        SystemClock.sleep(600);
        settle(120);
        long[] after = counters();
        JSONObject delta = new JSONObject();
        delta.put("forced_scroll", after[0] - before[0]);
        delta.put("padding", after[1] - before[1]);
        delta.put("mode_flip", after[2] - before[2]);
        delta.put("bounded_reveal", after[3] - before[3]);
        delta.put("caret_brings", after[4] - before[4]);
        lane.put("counter_delta", delta);
        lane.put("ime_hidden_during_gesture", !imeVisible(canvas.getRootView()));
        lane.put("first_visible_before", start);
        lane.put("first_visible_after", list.getFirstVisiblePosition());
        lane.put("preview_rebuilds", previewRebuilds());
        lane.put("viewport", viewport());
        return lane;
    }

    private JSONObject previewRebuilds() throws Exception {
        JSONObject value = new JSONObject();
        Class<?> preview = Class.forName("app.yydarlinker.deepseekcaptions.SubtitleStylePreview");
        Field calls = preview.getDeclaredField("sampleLayoutCalls");
        calls.setAccessible(true);
        long before = calls.getLong(null);
        ListView list = aiList();
        View row = reveal(list, "deepseek_caption_style_preview");
        View canvas = row == null ? null : tag(row, "ai_style_preview_canvas");
        for (int i = 0; i < 6 && canvas != null; i++) {
            runOnMainSync(canvas::invalidate);
            settle(120);
        }
        // Scroll the preview out of the viewport and back: a plain rebind must keep the measured label.
        runOnMainSync(() -> list.setSelection(Math.min(list.getAdapter().getCount() - 1, list.getFirstVisiblePosition() + 6)));
        settle(120); SystemClock.sleep(200);
        runOnMainSync(() -> list.setSelection(0));
        settle(120); SystemClock.sleep(200);
        long after = calls.getLong(null);
        value.put("warm_draw_and_rebind_rebuilds", after - before);
        value.put("total", after);
        return value;
    }

    // ---------------------------------------------------------------- transition lane

    private JSONObject transitionLane() throws Exception {
        JSONObject lane = new JSONObject();
        Class<?> authority = Class.forName("app.yydarlinker.deepseekcaptions.CaptionPlayerAuthority");
        Method notify = authority.getDeclaredMethod("onNotification", String.class, boolean.class);
        notify.setAccessible(true);
        Method stateName = authority.getDeclaredMethod("stateName");
        stateName.setAccessible(true);
        Method notifyState = authority.getDeclaredMethod("ownerEpoch");
        notifyState.setAccessible(true);
        String[] types = {"WATCH_WHILE_MAXIMIZED", "WATCH_WHILE_MINIMIZED", "WATCH_WHILE_MAXIMIZED",
                "WATCH_WHILE_FULLSCREEN", "WATCH_WHILE_MINIMIZED", "WATCH_WHILE_MAXIMIZED"};
        JSONArray rows = new JSONArray();
        for (int round = 0; round < 3; round++) {
            for (String type : types) {
                final String value = type;
                long start = System.nanoTime();
                runOnMainSync(() -> {
                    try { notify.invoke(null, value, false); } catch (Exception ignored) {}
                });
                long elapsed = System.nanoTime() - start;
                settle(120);
                JSONObject row = new JSONObject();
                row.put("round", round);
                row.put("type", type);
                row.put("state", stateName.invoke(null));
                row.put("callback_us", elapsed / 1000);
                row.put("anchor_visible", anchorVisible());
                rows.put(row);
            }
        }
        lane.put("notifications", rows);
        lane.put("surface", surfaceCounters());
        return lane;
    }

    private JSONObject surfaceCounters() throws Exception {
        JSONObject value = new JSONObject();
        Class<?> surface = Class.forName("app.yydarlinker.deepseekcaptions.CaptionSurface");
        for (String name : new String[]{"refreshSearchCount", "renderedSearchCount"}) {
            Field field = surface.getDeclaredField(name);
            field.setAccessible(true);
            value.put(name, field.getLong(null));
        }
        Class<?> suppressor = Class.forName("app.yydarlinker.deepseekcaptions.CaptionMusicSuppressor");
        for (String name : new String[]{"scanCount", "treeSummaryCount"}) {
            try {
                Field field = suppressor.getDeclaredField(name);
                field.setAccessible(true);
                value.put(name, field.getLong(null));
            } catch (NoSuchFieldException absent) { value.put(name, -1); }
        }
        return value;
    }

    // ---------------------------------------------------------------- helpers

    private boolean anchorVisible() throws Exception {
        Class<?> overlay = Class.forName("app.yydarlinker.deepseekcaptions.CaptionOverlay");
        Method visible = overlay.getDeclaredMethod("anchorVisible");
        visible.setAccessible(true);
        return (Boolean) visible.invoke(null);
    }

    private long[] counters() throws Exception {
        Class<?> viewport = Class.forName("app.yydarlinker.deepseekcaptions.CaptionEditorViewport");
        String[] names = {"forcedScrollCalls", "paddingCalls", "modeFlipCalls", "boundedRevealCalls", "caretBrings"};
        long[] values = new long[names.length];
        for (int i = 0; i < names.length; i++) {
            try {
                Field field = viewport.getDeclaredField(names[i]);
                field.setAccessible(true);
                values[i] = field.getLong(null);
            } catch (NoSuchFieldException absent) {
                values[i] = -1;
            }
        }
        return values;
    }

    private void fillMetrics(JSONObject row) throws Exception {
        long[] values = counters();
        row.put("forced_scroll_calls", values[0]);
        row.put("padding_calls", values[1]);
        row.put("mode_flip_calls", values[2]);
        row.put("bounded_reveal_calls", values[3]);
        row.put("caret_brings", values[4]);
    }

    private JSONObject viewport() throws Exception {
        Class<?> viewport = Class.forName("app.yydarlinker.deepseekcaptions.CaptionEditorViewport");
        JSONObject value = new JSONObject();
        String[] names = {"forcedScrollCalls", "paddingCalls", "modeFlipCalls", "layoutObservations",
                "boundedRevealCalls", "caretBrings"};
        for (String name : names) {
            try {
                Field field = viewport.getDeclaredField(name);
                field.setAccessible(true);
                value.put(name, field.getLong(null));
            } catch (NoSuchFieldException absent) {
                value.put(name, -1);
            }
        }
        return value;
    }

    private int textChanges(EditText editor) {
        final int[] count = {0};
        final TextWatcher[] holder = new TextWatcher[1];
        holder[0] = new TextWatcher() {
            public void beforeTextChanged(CharSequence s, int a, int b, int c) {}
            public void onTextChanged(CharSequence s, int a, int b, int c) {}
            public void afterTextChanged(Editable s) { count[0]++; }
        };
        runOnMainSync(() -> editor.addTextChangedListener(holder[0]));
        runOnMainSync(() -> editor.removeTextChangedListener(holder[0]));
        return count[0];
    }

    private String windowFlags(EditText editor) throws Exception {
        View root = editor.getRootView();
        if (!(root.getLayoutParams() instanceof WindowManager.LayoutParams)) return "no-window-params";
        WindowManager.LayoutParams params = (WindowManager.LayoutParams) root.getLayoutParams();
        boolean notFocusable = (params.flags & WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE) != 0;
        boolean altFocusableIm = (params.flags & WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM) != 0;
        int adjust = params.softInputMode & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST;
        return "not_focusable=" + notFocusable + ";alt_focusable_im=" + altFocusableIm + ";adjust=" + adjust;
    }

    private boolean imeVisible(View editor) {
        View root = editor.getRootView();
        if (android.os.Build.VERSION.SDK_INT >= 30) {
            android.view.WindowInsets insets = root.getRootWindowInsets();
            return insets != null && insets.isVisible(android.view.WindowInsets.Type.ime());
        }
        InputMethodManager ime = (InputMethodManager) host.getSystemService(Context.INPUT_METHOD_SERVICE);
        return ime != null && ime.isActive(editor);
    }

    /** True while the platform reports a real IME window on screen (read through UiAutomation). */
    private boolean imeWindowVisible() {
        try {
            for (android.view.accessibility.AccessibilityWindowInfo window : getUiAutomation().getWindows())
                if (window.getType() == android.view.accessibility.AccessibilityWindowInfo.TYPE_INPUT_METHOD) return true;
        } catch (Throwable unavailable) { }
        return false;
    }
    /** True when the platform reports the probe IME as the selected input method. */
    private boolean imeServiceSelected() {
        try {
            String current = android.provider.Settings.Secure.getString(
                    host.getContentResolver(), android.provider.Settings.Secure.DEFAULT_INPUT_METHOD);
            return current != null && current.startsWith("app.morphe.n36.probe/");
        } catch (Throwable unavailable) { return false; }
    }
    private boolean imeAvailable() {
        InputMethodManager ime = (InputMethodManager) host.getSystemService(Context.INPUT_METHOD_SERVICE);
        if (ime == null) return false;
        for (android.view.inputmethod.InputMethodInfo info : ime.getEnabledInputMethodList())
            if (info.getPackageName().equals(host.getPackageName())) return true;
        return false;
    }

    private JSONArray imeOps(){return N37ImeBridge.operations();}

    private EditText editorOf(View row, String key) throws Exception {
        try {
            Class<?> ids = Class.forName("app.yydarlinker.deepseekcaptions.CaptionEditorIds");
            Method forKey = ids.getDeclaredMethod("forKey", String.class);
            forKey.setAccessible(true);
            int id = (Integer) forKey.invoke(null, key);
            View found = row.findViewById(id);
            if (found instanceof EditText) return (EditText) found;
        } catch (ClassNotFoundException beforeN36) {
            // The baseline has no stable per-field id; the first editor of the row is the field.
        }
        return find(row, EditText.class);
    }

    private ListView aiList() throws Exception {
        android.preference.PreferenceFragment fragment = host.preferences;
        Object ai = fragment.findPreference("morphe_vot_screen__ai_captions");
        check(ai != null, "actual AI captions screen exists");
        Method getDialog = ai.getClass().getMethod("getDialog");
        Object dialog = getDialog.invoke(ai);
        if (dialog == null) {
            // Open the screen through the real list so the nested PreferenceScreen window is created.
            ListView rootList = find(fragment.getView(), ListView.class);
            clickPreference(rootList, "morphe_settings_screen_12_video_sort_by_key");
            ListView videoList = find(((android.app.Dialog) getDialogOf(
                    fragment.findPreference("morphe_settings_screen_12_video_sort_by_key"))).getWindow().getDecorView(),
                    ListView.class);
            clickPreference(videoList, "morphe_vot_screen__ai_captions");
            dialog = getDialog.invoke(ai);
        }
        check(dialog != null, "AI captions dialog is showing");
        return find(((android.app.Dialog) dialog).getWindow().getDecorView(), ListView.class);
    }

    private static Object getDialogOf(Object preference) throws Exception {
        Method getDialog = preference.getClass().getMethod("getDialog");
        return getDialog.invoke(preference);
    }

    private View reveal(ListView list, String key) throws Exception {
        int position = -1;
        for (int i = 0; i < list.getAdapter().getCount(); i++) {
            Object item = list.getAdapter().getItem(i);
            if (item instanceof Preference && key.equals(((Preference) item).getKey())) position = i;
        }
        if (position < 0) return null;
        final int selected = position;
        runOnMainSync(() -> list.setSelection(selected));
        settle(120);
        SystemClock.sleep(250);
        View row = list.getChildAt(position - list.getFirstVisiblePosition());
        if (row == null) {
            runOnMainSync(() -> list.setSelection(Math.max(0, selected - 1)));
            settle(120);
            SystemClock.sleep(250);
            row = list.getChildAt(position - list.getFirstVisiblePosition());
        }
        return row;
    }

    private void clickPreference(ListView list, String key) throws Exception {
        View row = reveal(list, key);
        check(row != null, "visible row for " + key);
        tap(row);
        settle(120);
        SystemClock.sleep(500);
    }

    private void tap(View view) throws Exception {
        check(view != null && view.isShown(), "pointer target is shown");
        for (int attempt = 0; attempt < 30 && !view.hasWindowFocus(); attempt++) {
            SystemClock.sleep(100);
            settle(120);
        }
        Rect visible=new Rect();
        check(view.getGlobalVisibleRect(visible),"visible target rectangle");
        int[] root=new int[2];view.getLocationOnScreen(root);
        visible.set(root[0],root[1],root[0]+view.getWidth(),root[1]+view.getHeight());
        for(android.view.ViewParent parent=view.getParent();parent instanceof View;parent=parent.getParent()){
            View clip=(View)parent;int[] xy=new int[2];clip.getLocationOnScreen(xy);
            if(parent instanceof android.view.ViewGroup&&((android.view.ViewGroup)parent).getClipChildren())
              visible.intersect(xy[0],xy[1],xy[0]+clip.getWidth(),xy[1]+clip.getHeight());
        }
        Rect frame = new Rect();
        view.getWindowVisibleDisplayFrame(frame);
        visible.intersect(frame);
        float x = visible.centerX();
        float y = visible.top + Math.min(visible.height() / 2f, 8 * view.getResources().getDisplayMetrics().density);
        long now = SystemClock.uptimeMillis();
        getUiAutomation().injectInputEvent(
                android.view.MotionEvent.obtain(now, now, android.view.MotionEvent.ACTION_DOWN, x, y, 0), true);
        getUiAutomation().injectInputEvent(
                android.view.MotionEvent.obtain(now, now + 70, android.view.MotionEvent.ACTION_UP, x, y, 0), true);
        settle(250);
        View focus=view.getRootView().findFocus();
        events.put(new JSONObject().put("tap_target",view.getId()).put("tap_x",x).put("tap_y",y)
          .put("rect",visible.toShortString()).put("root_x",root[0]).put("root_y",root[1])
          .put("has_focus",view.hasFocus()).put("focus_id",focus==null?-1:focus.getId()));
    }

    private void drag(ListView list, int direction, int distance, int millis) throws Exception {
        Rect bounds = new Rect();
        check(list.getGlobalVisibleRect(bounds), "list visible rectangle");
        int[] root = new int[2];
        list.getRootView().getLocationOnScreen(root);
        bounds.offset(root[0], root[1]);
        float x = bounds.centerX();
        float startY = bounds.centerY() + direction * distance / 2f;
        long now = SystemClock.uptimeMillis();
        getUiAutomation().injectInputEvent(
                android.view.MotionEvent.obtain(now, now, android.view.MotionEvent.ACTION_DOWN, x, startY, 0), true);
        int steps = 12;
        for (int i = 1; i <= steps; i++) {
            float y = startY - direction * distance * i / (float) steps;
            getUiAutomation().injectInputEvent(android.view.MotionEvent.obtain(
                    now, now + millis * i / steps, android.view.MotionEvent.ACTION_MOVE, x, y, 0), true);
        }
        getUiAutomation().injectInputEvent(android.view.MotionEvent.obtain(
                now, now + millis, android.view.MotionEvent.ACTION_UP, x, startY - direction * distance, 0), true);
        settle(120);
        SystemClock.sleep(120);
    }

    private void fling(ListView list, int direction, int velocity) throws Exception {
        Rect bounds = new Rect();
        check(list.getGlobalVisibleRect(bounds), "list visible rectangle");
        int[] root = new int[2];
        list.getRootView().getLocationOnScreen(root);
        bounds.offset(root[0], root[1]);
        float x = bounds.centerX();
        float startY = bounds.centerY() + direction * bounds.height() / 4f;
        long now = SystemClock.uptimeMillis();
        getUiAutomation().injectInputEvent(
                android.view.MotionEvent.obtain(now, now, android.view.MotionEvent.ACTION_DOWN, x, startY, 0), true);
        for (int i = 1; i <= 6; i++) {
            float y = startY - direction * bounds.height() * i / 12f;
            getUiAutomation().injectInputEvent(android.view.MotionEvent.obtain(
                    now, now + 8L * i, android.view.MotionEvent.ACTION_MOVE, x, y, 0), true);
        }
        android.view.MotionEvent up = android.view.MotionEvent.obtain(
                now, now + 56, android.view.MotionEvent.ACTION_UP, x, startY - direction * bounds.height() / 2f, 0);
        up.setSource(android.view.InputDevice.SOURCE_TOUCHSCREEN);
        getUiAutomation().injectInputEvent(up, true);
        settle(120);
        SystemClock.sleep(150);
    }

    private <T> T find(View view, Class<T> type) {
        if (type.isInstance(view)) return type.cast(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                T child = find(group.getChildAt(i), type);
                if (child != null) return child;
            }
        }
        return null;
    }

    private View tag(View view, String value) {
        if (value.equals(view.getTag())) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = tag(group.getChildAt(i), value);
                if (found != null) return found;
            }
        }
        return null;
    }

    /** Bounded settle. The IME keeps frames queued while it is visible, so an unbounded idle never returns. */
    private void settle(int millis) {
        SystemClock.sleep(millis);
        try { waitForIdleSync(); } catch (Throwable ignored) { }
    }

    private static void marker(String message) {
        android.util.Log.i("N36", "MARKER " + message);
    }
    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private void write(String name, JSONObject report) throws Exception {
        File directory = new File(getTargetContext().getFilesDir(), "n36-evidence");
        directory.mkdirs();
        try (FileOutputStream output = new FileOutputStream(new File(directory, name))) {
            output.write(report.toString(2).getBytes(StandardCharsets.UTF_8));
        }
        events.put(new JSONObject().put("wrote", name));
    }
}
