/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;
import android.app.Activity;import android.content.Intent;import android.net.Uri;import android.os.Bundle;import android.widget.Toast;
/** System folder consent, with read-only persistent grants. No media files are copied or deleted. */
public final class ExternalFolderActivity extends Activity {
 @Override public void onCreate(Bundle state){super.onCreate(state);if(state==null){Intent picker=new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION|Intent.FLAG_GRANT_PREFIX_URI_PERMISSION);String old=ExternalFiles.folder(this);if(!old.isEmpty())picker.putExtra("android.provider.extra.INITIAL_URI",Uri.parse(old));try{startActivityForResult(picker,6738);}catch(Exception unavailable){Toast.makeText(this,"No folder picker is available",Toast.LENGTH_LONG).show();finish();}}}
 @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if(request!=6738)return;try{if(result==RESULT_OK&&data!=null&&data.getData()!=null){Uri tree=data.getData();getContentResolver().takePersistableUriPermission(tree,Intent.FLAG_GRANT_READ_URI_PERMISSION);ExternalFiles.selected(this,tree);}}catch(Exception rejected){Toast.makeText(this,"Folder permission was not retained; choose the folder again",Toast.LENGTH_LONG).show();}finally{finish();}}
}
