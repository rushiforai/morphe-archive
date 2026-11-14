package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

/** Keep the stock editor above Haiagaru and receive its explicit posting result. */
public final class StockPostingRelayActivity extends Activity {
    private static final int EDITOR=4813;
    @Override protected void onCreate(Bundle state){
        super.onCreate(state);
        if(state!=null)return;
        Intent editor=getIntent().getParcelableExtra("editor");
        if(!StockChmatePosting.isHandoff(editor)){finish();return;}
        // This plain Activity deliberately avoids ChMate's self-navigation wrappers.
        editor.setFlags(0);
        try{startActivityForResult(editor,EDITOR);}
        catch(RuntimeException unavailable){
            Toast.makeText(this,"通常版ChMateを開けませんでした。下書きは保持しています。",Toast.LENGTH_LONG).show();
            StockChmatePosting.returned(getIntent().getStringExtra("request"),false);finish();
        }
    }
    @Override protected void onActivityResult(int request,int result,Intent data){
        super.onActivityResult(request,result,data);
        if(request!=EDITOR)return;
        StockChmatePosting.returned(getIntent().getStringExtra("request"),result==RESULT_OK);
        finish();
    }
}
