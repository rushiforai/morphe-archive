package n36;

import android.inputmethodservice.InputMethodService;
import android.os.SystemClock;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;

import java.util.ArrayList;
import java.util.List;

/**
 * Minimal real IME service for the N36 input lane.
 *
 * <p>It implements the actual {@link android.view.inputmethod.InputMethodService} contract, so text is
 * delivered through a genuine {@link InputConnection} created by the framework for the served editor.
 * Every operation is recorded; a call that could not be delivered is recorded as a failure instead of
 * being silently replaced with {@code setText} on the view.</p>
 */
public final class N36TestIme extends InputMethodService {
    /** One observed IME operation. */
    public static final class Op {
        public final String kind;
        public final String detail;
        public final boolean delivered;
        public final long at;
        Op(String kind, String detail, boolean delivered) {
            this.kind = kind; this.detail = detail; this.delivered = delivered;
            this.at = SystemClock.uptimeMillis();
        }
    }

    private static final List<Op> OPS = new ArrayList<>();
    private static final List<String> SERVED = new ArrayList<>();
    private static volatile InputConnection connection;
    private static volatile N36TestIme instance;

    public static N36TestIme instance() { return instance; }

    public static synchronized List<Op> operations() { return new ArrayList<>(OPS); }

    public static synchronized List<String> servedEditors() { return new ArrayList<>(SERVED); }

    public static void reset() {
        synchronized (N36TestIme.class) {
            OPS.clear();
            SERVED.clear();
        }
    }

    private static synchronized void record(String kind, String detail, boolean delivered) {
        Op op = new Op(kind, detail, delivered);
        OPS.add(op);
        // The instrumentation cannot read this process, so the operation journal is also written to the
        // app external directory, where the device-side capture can read it verbatim.
        try {
            java.io.File dir = new java.io.File(getExternalFilesDirPublic(), "n36-ime");
            dir.mkdirs();
            try (java.io.FileOutputStream out = new java.io.FileOutputStream(new java.io.File(dir, "ops.txt"), true)) {
                out.write((op.at + " | " + kind + " | " + detail + " | delivered=" + delivered + "\n")
                        .getBytes(java.nio.charset.StandardCharsets.UTF_8));
            }
        } catch (Throwable ignored) { }
    }
    private static java.io.File getExternalFilesDirPublic() {
        N36TestIme current = instance;
        if (current == null) return new java.io.File("/sdcard/Android/data/app.morphe.n36.probe/files");
        java.io.File dir = current.getExternalFilesDir(null);
        return dir == null ? new java.io.File("/sdcard/Android/data/app.morphe.n36.probe/files") : dir;
    }

    @Override public void onCreate() {
        super.onCreate();
        instance = this;
        android.content.IntentFilter filter=new android.content.IntentFilter("morphe.n37.TEST_IME_COMMAND");
        if(android.os.Build.VERSION.SDK_INT>=33)registerReceiver(commands,filter,android.content.Context.RECEIVER_EXPORTED);
        else registerReceiver(commands,filter);
    }

    @Override public void onDestroy() {
        unregisterReceiver(commands);instance = null;
        super.onDestroy();
    }

    private int fieldId;
    private final android.content.BroadcastReceiver commands=new android.content.BroadcastReceiver(){
        @Override public void onReceive(android.content.Context context,android.content.Intent intent){
            if(!intent.getBooleanExtra("test_only",false))return;
            InputConnection current=getCurrentInputConnection();connection=current;
            String kind=intent.getStringExtra("kind"),text=intent.getStringExtra("text");boolean ok=false;
            if(current!=null){
                if("status".equals(kind))ok=true;
                else if("end".equals(kind)){
                    android.view.inputmethod.ExtractedText extracted=current.getExtractedText(new android.view.inputmethod.ExtractedTextRequest(),0);
                    if(extracted!=null&&extracted.text!=null){int end=extracted.startOffset+extracted.text.length();ok=current.setSelection(end,end);}
                }
                else if("compose".equals(kind))ok=current.setComposingText(text,1);
                else if("commit".equals(kind))ok=current.commitText(text,1);
                else if("finish".equals(kind))ok=current.finishComposingText();
                else if("delete".equals(kind))ok=current.deleteSurroundingText(intent.getIntExtra("before",0),intent.getIntExtra("after",0));
                else if("all".equals(kind))ok=current.performContextMenuAction(android.R.id.selectAll);
                else if("paste".equals(kind))ok=current.performContextMenuAction(android.R.id.paste);
            }
            CharSequence before=current==null?null:current.getTextBeforeCursor(4096,0);
            record("command:"+kind,"id="+intent.getLongExtra("id",-1)+";field="+fieldId,ok);
            android.content.Intent ack=new android.content.Intent("morphe.n37.TEST_IME_ACK");
            ack.setPackage("app.morphe.android.youtube");ack.putExtra("id",intent.getLongExtra("id",-1));
            ack.putExtra("kind",kind);ack.putExtra("ok",ok);ack.putExtra("served",current!=null);
            ack.putExtra("field",fieldId);ack.putExtra("pid",android.os.Process.myPid());
            ack.putExtra("text",before==null?"":before.toString());sendBroadcast(ack);
        }
    };

    @Override public View onCreateInputView() {
        // A real IME view exists so the platform treats this as a served input method. The lane never
        // synthesises text through this view; every edit goes through the InputConnection below.
        View view = new View(this);
        view.setMinimumHeight(1);
        return view;
    }

    @Override public void onStartInput(EditorInfo attribute, boolean restarting) {
        super.onStartInput(attribute, restarting);
        connection = getCurrentInputConnection();fieldId=attribute==null?-1:attribute.fieldId;
        String name = attribute == null ? "none" : String.valueOf(attribute.packageName) + "/" + attribute.fieldId;
        synchronized (N36TestIme.class) { SERVED.add(name + (restarting ? " (restart)" : " (start)")); }
        record("startInput", name + ";restarting=" + restarting + ";inputType=" + (attribute == null ? -1 : attribute.inputType)
                + ";imeOptions=" + (attribute == null ? -1 : attribute.imeOptions), connection != null);
    }

    @Override public void onFinishInput() {
        record("finishInput", "", true);
        connection = null;
        super.onFinishInput();
    }

    @Override public void onStartInputView(EditorInfo info, boolean restarting) {
        super.onStartInputView(info, restarting);
        connection = getCurrentInputConnection();
        record("startInputView", "restarting=" + restarting, connection != null);
    }

    @Override public void onFinishInputView(boolean finishingInput) {
        record("finishInputView", "finishing=" + finishingInput, true);
        super.onFinishInputView(finishingInput);
    }

    /** True when the platform handed this IME a live connection for the current editor. */
    public static boolean connected() {
        InputConnection current = connection;
        return current != null;
    }

    public static boolean setComposing(String text) {
        InputConnection current = connection;
        if (current == null) { record("setComposingText", text, false); return false; }
        boolean ok = current.setComposingText(text, 1);
        record("setComposingText", text, ok);
        return ok;
    }

    public static boolean commit(String text) {
        InputConnection current = connection;
        if (current == null) { record("commitText", text, false); return false; }
        boolean ok = current.commitText(text, 1);
        record("commitText", text, ok);
        return ok;
    }

    public static boolean finishComposing() {
        InputConnection current = connection;
        if (current == null) { record("finishComposingText", "", false); return false; }
        boolean ok = current.finishComposingText();
        record("finishComposingText", "", ok);
        return ok;
    }

    public static boolean deleteSurrounding(int before, int after) {
        InputConnection current = connection;
        if (current == null) { record("deleteSurroundingText", before + "/" + after, false); return false; }
        boolean ok = current.deleteSurroundingText(before, after);
        record("deleteSurroundingText", before + "/" + after, ok);
        return ok;
    }

    public static boolean sendKey(int keyCode) {
        InputConnection current = connection;
        if (current == null) { record("sendKeyEvent", String.valueOf(keyCode), false); return false; }
        boolean ok = current.sendKeyEvent(new android.view.KeyEvent(android.view.KeyEvent.ACTION_DOWN, keyCode))
                & current.sendKeyEvent(new android.view.KeyEvent(android.view.KeyEvent.ACTION_UP, keyCode));
        record("sendKeyEvent", String.valueOf(keyCode), ok);
        return ok;
    }

    public static String composingText() {
        InputConnection current = connection;
        if (current == null) return null;
        CharSequence text = current.getTextBeforeCursor(64, 0);
        return text == null ? "" : text.toString();
    }
}
