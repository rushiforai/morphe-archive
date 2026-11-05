package app.morphe.extension.chmate;

import android.content.*;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import java.io.*;
import java.util.*;

final class NativeArchiveFolderImport {
 static final class Tree implements ArchiveFolderTransfer.Source {
  final ContentResolver resolver;final Uri uri;
  Tree(Context c,Uri uri){resolver=c.getContentResolver();this.uri=uri;}
  public List<ArchiveFolderTransfer.Node> children(String id)throws IOException{
   List<ArchiveFolderTransfer.Node> out=new ArrayList<>();
   String[] columns={"document_id","_display_name","mime_type","_size","last_modified"};
   try(Cursor cursor=resolver.query(DocumentsContract.buildChildDocumentsUriUsingTree(uri,id),columns,null,null,null)){
    if(cursor==null)throw new IOException("フォルダを開けません");
    while(cursor.moveToNext())out.add(new ArchiveFolderTransfer.Node(cursor.getString(0),cursor.getString(1),DocumentsContract.Document.MIME_TYPE_DIR.equals(cursor.getString(2)),cursor.isNull(3)?-1:cursor.getLong(3),cursor.isNull(4)?0:cursor.getLong(4)));
   }catch(RuntimeException denied){throw new IOException("フォルダを読み取れません。Android/dataを選択できない場合は、元のarchiveフォルダをDownloadなどへコピーして選び直してください。",denied);}
   return out;
  }
  public InputStream open(String id)throws IOException{return resolver.openInputStream(DocumentsContract.buildDocumentUriUsingTree(uri,id));}
 }
 static void addButton(android.widget.LinearLayout box,android.app.Activity activity){
  android.widget.Button b=new android.widget.Button(activity);b.setText("ChMateのアーカイブフォルダから取り込む");box.addView(b);
  b.setText("ChMateのアーカイブフォルダ・ZIPから取り込む");
  b.setOnClickListener(v->new HaiagaruDialog.Builder(activity).setTitle("通常のChMateからアーカイブを移行")
   .setMessage("移行元のarchiveフォルダ、またはその親の2chMateフォルダを選択してください。DAT・IDXとフォルダ構造を保ち、選択した項目を復元します。同名ファイルは確認後に上書きし、選択していない項目と元データは変更しません。\n\nAndroid/dataを開けない場合は、元フォルダをDownloadなどへコピーしてから選択してください。取り込み後は標準のスレッドアーカイブ一覧を開き直してください。")
   .setNegativeButton("キャンセル",null).setNeutralButton("ZIPを選択",(d,w)->activity.startActivity(new Intent(activity,HaiagaruLocalBackupActivity.class).putExtra(HaiagaruLocalBackupActivity.EXTRA_MODE,HaiagaruLocalBackupActivity.MODE_IMPORT_ARCHIVE_ZIP)))
   .setPositiveButton("フォルダを選択",(d,w)->activity.startActivity(new Intent(activity,HaiagaruLocalBackupActivity.class).putExtra(HaiagaruLocalBackupActivity.EXTRA_MODE,HaiagaruLocalBackupActivity.MODE_IMPORT_ARCHIVE))).show());
 }
 private NativeArchiveFolderImport(){}
}
