package nl.johninnl.gboard;

import android.Manifest;
import android.app.Activity;
import android.content.pm.PackageManager;
import android.os.*;
import android.view.*;
import android.widget.*;

/** Client controls only. Model choice/downloads live exclusively in Local Model Host. */
public final class ParakeetSettingsActivity extends Activity {
    private static final int CONTACTS_PERMISSION = 42;
    private final Handler main=new Handler(Looper.getMainLooper());private Switch enabled;private Switch contactNames;private TextView status;private boolean binding;
    private final Runnable refresh=new Runnable(){@Override public void run(){render();main.postDelayed(this,1000);}};
    @Override protected void onCreate(Bundle saved){setTheme(Build.VERSION.SDK_INT>=29?android.R.style.Theme_DeviceDefault_DayNight:android.R.style.Theme_DeviceDefault_Light);super.onCreate(saved);setTitle("Local AI voice typing");
        LinearLayout column=new LinearLayout(this);column.setOrientation(LinearLayout.VERTICAL);int pad=(int)(20*getResources().getDisplayMetrics().density);column.setPadding(pad,pad,pad,pad);
        TextView title=new TextView(this);title.setText("Local AI voice typing");title.setTextSize(24);column.addView(title);
        TextView intro=new TextView(this);intro.setText("Use the speech model selected in Local Model Host. Gboard keeps its microphone, listening animation and text insertion. Audio stays on this phone. Select Standard in Voice typing to use this switch; Rambler is a separate Google backend.");intro.setTextSize(16);column.addView(intro);
        status=new TextView(this);status.setPadding(0,pad,0,pad);column.addView(status);
        enabled=new Switch(this);enabled.setText("Use shared local speech");enabled.setOnCheckedChangeListener((button,on)->{if(binding)return;if(on&&!SharedSpeechHook.ready(this)){render();return;}ParakeetStore.setEnabled(this,on);ParakeetEngine.release();render();});column.addView(enabled);
        contactNames = new Switch(this);
        contactNames.setText(localString("morphe_parakeet_contact_names", "Use contact names"));
        contactNames.setOnCheckedChangeListener((button, on) -> {
            if (binding) return;
            if (on && !contactsPermissionGranted()) {
                requestPermissions(new String[]{Manifest.permission.READ_CONTACTS}, CONTACTS_PERMISSION);
            } else {
                ParakeetStore.setContactNamesEnabled(this, on);
            }
            render();
        });
        column.addView(contactNames);
        TextView contactsNote = new TextView(this);
        contactsNote.setText(localString("morphe_parakeet_contact_names_summary",
            "With Parakeet Ultra selected in Local Model Host, use up to 32 contact display names to improve local dictation. Names stay on this phone and are not saved by Local Model Host."));
        column.addView(contactsNote);
        Button setup=new Button(this);setup.setText("Open or install Local AI");setup.setOnClickListener(v->SharedSpeechHook.settings(this));column.addView(setup);
        Button microphone=new Button(this);microphone.setText("Allow microphone");microphone.setOnClickListener(v->requestPermissions(new String[]{Manifest.permission.RECORD_AUDIO},41));column.addView(microphone);
        TextView note=new TextView(this);note.setText("Enable Local AI and prepare a speech model there before selecting it here. If your selected model pauses, this choice stays selected; no audio is silently sent to Google. Existing voice-dictionary entries stay saved separately.");column.addView(note);
        ScrollView scroll=new ScrollView(this);scroll.addView(column);setContentView(scroll);render();
    }
    private String localString(String key, String fallback) {
        int id = getResources().getIdentifier(key, "string", getPackageName());
        return id == 0 ? fallback : getString(id);
    }

    private boolean contactsPermissionGranted() {
        return checkSelfPermission(Manifest.permission.READ_CONTACTS) == PackageManager.PERMISSION_GRANTED;
    }

    @Override public void onRequestPermissionsResult(int request, String[] permissions, int[] results) {
        super.onRequestPermissionsResult(request, permissions, results);
        if (request != CONTACTS_PERMISSION) return;
        ParakeetStore.setContactNamesEnabled(this, contactsPermissionGranted());
        render();
    }

    private void render(){if(enabled==null)return;boolean on=ParakeetStore.enabled(this);binding=true;enabled.setChecked(on);enabled.setEnabled(on||SharedSpeechHook.ready(this));contactNames.setChecked(ParakeetStore.contactNamesEnabled(this) && contactsPermissionGranted());binding=false;status.setText(SharedSpeechHook.summary(this));}
    @Override protected void onResume(){super.onResume();main.post(refresh);}
    @Override protected void onPause(){main.removeCallbacks(refresh);super.onPause();}
}
