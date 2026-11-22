package app.morphe.extension.chmate;

import android.app.*;import android.content.*;import android.database.Cursor;import android.net.Uri;import android.os.Bundle;import android.provider.OpenableColumns;import android.widget.EditText;import java.io.*;

/** Chooses a single image bound to the native composer's board/thread; never sends by itself. */
public final class SitePostingImageActivity extends Activity {
 private static final String WEB_PICKER = "futabaWebPicker";
 private static final java.util.Map<String,android.webkit.ValueCallback<Uri[]>> WEB_PICKERS = new java.util.HashMap<>();
 static String openWebPicker(Activity activity,android.webkit.ValueCallback<Uri[]> callback){
  String token=java.util.UUID.randomUUID().toString();
  WEB_PICKERS.put(token,callback);
  try{activity.startActivity(new Intent(activity,SitePostingImageActivity.class).putExtra(WEB_PICKER,token));return token;}
  catch(RuntimeException unavailable){finishWebPicker(token,null);return null;}
 }
 static void finishWebPicker(String token,Uri uri){
  android.webkit.ValueCallback<Uri[]> callback=WEB_PICKERS.remove(token);
  if(callback!=null)callback.onReceiveValue(uri==null?null:new Uri[]{uri});
 }
 private String target;private boolean picking;
 @Override protected void onCreate(Bundle state){super.onCreate(state);
  String token=getIntent().getStringExtra(WEB_PICKER);
  if(token!=null){
   if(!WEB_PICKERS.containsKey(token)){finish();return;}
   if(state==null)try{
    startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
     .setType("*/*").putExtra(Intent.EXTRA_MIME_TYPES,new String[]{"image/gif","image/jpeg","image/png","video/webm","video/mp4"}),2);
   }catch(RuntimeException unavailable){finishWebPicker(token,null);finish();}
   return;
  }
  try{SiteBoardGateway gateway=SiteBoardGateway.get(this);target=gateway.attachmentTarget(getIntent().getStringExtra("postingUrl"));
  picking=state!=null&&state.getBoolean("picking",false);
  if(!picking)showAttachmentDialog(gateway);
 }catch(Exception error){failure(error);}}
 @Override protected void onSaveInstanceState(Bundle state){state.putBoolean("picking",picking);super.onSaveInstanceState(state);}
 @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);
  if(request==2){
   Uri uri=result==RESULT_OK&&data!=null?data.getData():null;
   finishWebPicker(getIntent().getStringExtra(WEB_PICKER),uri!=null&&"content".equals(uri.getScheme())?uri:null);
   finish();return;
  }
  if(request!=1)return;picking=false;if(result!=RESULT_OK||data==null||data.getData()==null){finish();return;}Uri uri=data.getData();
  new Thread(()->{try{if(!"content".equals(uri.getScheme()))throw new IOException("画像ファイルを選択してください");ByteArrayOutputStream out=new ByteArrayOutputStream();try(InputStream in=getContentResolver().openInputStream(uri)){if(in==null)throw new IOException("画像を開けません");byte[] buffer=new byte[8192];int n;while((n=in.read(buffer))!=-1){if(out.size()+n>8*1024*1024)throw new IOException("画像は8MiB以内で指定してください");out.write(buffer,0,n);}}
    String displayName=displayName(uri);SitePostProtocol.Image image=new SitePostProtocol.Image(out.toByteArray(),displayName);SiteBoardGateway.get(this).attachment(target,image);ThreadCommands.updateSiteAttachmentStatus(target,image.displayName);runOnUiThread(()->{if(!isFinishing()){android.widget.Toast.makeText(this,"画像を選択しました: "+image.displayName,android.widget.Toast.LENGTH_LONG).show();finish();}});
   }catch(Exception error){runOnUiThread(()->failure(error));}},"Haiagaru-post-image").start();
 }
 private String displayName(Uri uri){try(Cursor cursor=getContentResolver().query(uri,new String[]{OpenableColumns.DISPLAY_NAME},null,null,null)){if(cursor!=null&&cursor.moveToFirst()){int column=cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME);if(column>=0)return cursor.getString(column);}}catch(Exception ignored){}return "画像ファイル";}
 private void showAttachmentDialog(SiteBoardGateway gateway){
  SiteBoardProtocol.Board board=gateway.boards.get(target.substring(0,target.indexOf(':')));boolean futaba=board!=null&&board.kind.equals("futaba");String selected=gateway.attachmentName(target);
  android.widget.LinearLayout content=new android.widget.LinearLayout(this);content.setOrientation(android.widget.LinearLayout.VERTICAL);int pad=(int)(16*getResources().getDisplayMetrics().density);content.setPadding(pad,pad,pad,pad);
  android.widget.TextView status=new android.widget.TextView(this);status.setText((selected.isEmpty()?"添付画像はありません。":"添付ファイル: "+selected)+"\n\n選択した画像は、この板・スレの次回投稿に添付します。10分以内に送信してください。画像選択だけでは投稿しません。");content.addView(status);
  android.widget.Button choose=new android.widget.Button(this);choose.setText("画像ファイルを選択");content.addView(choose);
  EditText key=null;if(futaba){android.widget.TextView hint=new android.widget.TextView(this);hint.setText("ふたば削除キー（12文字以内）");content.addView(hint);key=new EditText(this);key.setSingleLine(true);key.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_VARIATION_PASSWORD);key.setFilters(new android.text.InputFilter[]{new android.text.InputFilter.LengthFilter(12)});key.setText(gateway.prefs.getString("password:"+board.url,""));content.addView(key);}
  final EditText deleteKey=key;
  AlertDialog dialog=new AlertDialog.Builder(this).setTitle("追加掲示板の画像添付")
   .setView(content).setPositiveButton(futaba?"削除キーを保存":"画像を選択",(d,w)->{if(futaba){gateway.prefs.edit().putString("password:"+board.url,deleteKey.getText().toString()).apply();android.widget.Toast.makeText(this,"削除キーを保存しました",android.widget.Toast.LENGTH_SHORT).show();}})
   .setNeutralButton("添付を解除",(d,w)->{try{gateway.attachment(target,null);ThreadCommands.updateSiteAttachmentStatus(target,"");}catch(IOException ignored){}finish();}).setNegativeButton("閉じる",(d,w)->finish()).create();
  choose.setOnClickListener(v->{dialog.dismiss();picking=true;startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("image/*").addCategory(Intent.CATEGORY_OPENABLE),1);});dialog.setOnCancelListener(d->finish());dialog.show();
 }
 private void failure(Exception error){if(isFinishing()||isDestroyed())return;new AlertDialog.Builder(this).setTitle("画像を添付できません").setMessage(error.getMessage()).setPositiveButton("閉じる",(d,w)->finish()).setOnCancelListener(d->finish()).show();}
}
