package app.morphe.extension.chmate;
import android.app.*;import android.os.*;import android.content.*;import android.view.*;import android.widget.*;import java.util.*;import java.util.concurrent.*;
public class LayoutHarness extends Activity {
 public static Activity activity;protected void onCreate(Bundle b){super.onCreate(b);activity=this;setContentView(new FrameLayout(this));}
}
