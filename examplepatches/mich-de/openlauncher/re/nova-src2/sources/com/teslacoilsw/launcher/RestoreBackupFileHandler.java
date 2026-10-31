package com.teslacoilsw.launcher;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import mx.l1;

/* loaded from: classes4.dex */
public class RestoreBackupFileHandler extends Activity {
    @Override // android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = getIntent();
        if (intent == null || intent.getData() == null) {
            finish();
        } else {
            new l1(this, intent.getData(), this, intent).execute(new Void[0]);
        }
    }
}
