package app.morphe.extension.youtube.bilibilidanmaku;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

/** Separate translucent Activity to receive ACTION_OPEN_DOCUMENT without patching YouTube's activity. */
public final class BilibiliXmlPickerActivity extends Activity {
    private static final int PICK_XML = 7341;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        if (state == null) {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("*/*");
            intent.putExtra(Intent.EXTRA_MIME_TYPES, new String[] { "text/xml", "application/xml", "text/plain", "application/octet-stream" });
            startActivityForResult(intent, PICK_XML);
        }
    }

    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == PICK_XML) {
            if (resultCode == RESULT_OK && data != null && data.getData() != null)
                BilibiliDanmakuController.importXml(getApplicationContext(), data.getData());
            finish();
        }
    }
}
