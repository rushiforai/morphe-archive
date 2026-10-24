package app.morphe.extension.chmate;

import android.os.Bundle;

/** External files are parsed as data only and require explicit confirmation. */
public final class SettingsImportActivity extends HaiagaruComposeActivity {
    @Override public void onCreate(Bundle state){
        super.onCreate(state);
        if(state==null)SettingsProfiles.load(this,getIntent().getData());else finish();
    }
}
