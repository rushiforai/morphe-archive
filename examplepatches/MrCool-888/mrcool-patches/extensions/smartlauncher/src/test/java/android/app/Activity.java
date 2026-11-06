package android.app;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import java.util.ArrayList;
import java.util.List;
public class Activity extends Context {
    public final List<Intent> intents = new ArrayList<>();
    public int requestCode = -1, startCalls, finishCalls, setResultCalls;
    public Bundle options;
    public RuntimeException failure;
    public void startActivityForResult(Intent i, int r, Bundle o) { startCalls++; if (failure != null) throw failure; intents.add(i); requestCode=r; options=o; }
    public void setResult(int code) { setResultCalls++; }
    public void finish() { finishCalls++; }
}
