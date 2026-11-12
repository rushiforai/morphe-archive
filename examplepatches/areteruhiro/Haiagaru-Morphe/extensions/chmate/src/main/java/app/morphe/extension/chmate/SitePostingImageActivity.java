package app.morphe.extension.chmate;

import android.app.*;import android.content.*;import android.net.Uri;import android.os.Bundle;import java.io.*;

/** Chooses a single image bound to the native composer's board/thread; never sends by itself. */
public final class SitePostingImageActivity extends Activity {
 private String target;private boolean picking;
 @Override protected void onCreate(Bundle state){super.onCreate(state);try{SiteBoardGateway gateway=SiteBoardGateway.get(this);target=gateway.attachmentTarget(getIntent().getStringExtra("postingUrl"));
  picking=state!=null&&state.getBoolean("picking",false);
  if(!picking)new AlertDialog.Builder(this).setTitle("この投稿先への画像添付").setMessage("選択した画像は、この板・スレで次に送信する投稿に添付します。10分以内に書き込み画面の送信ボタンを押してください。画像を選ぶだけでは送信しません。")
   .setPositiveButton("画像を選択",(d,w)->{picking=true;startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("image/*").addCategory(Intent.CATEGORY_OPENABLE),1);})
   .setNeutralButton("添付を解除",(d,w)->{try{gateway.attachment(target,null);}catch(IOException ignored){}finish();}).setNegativeButton("閉じる",(d,w)->finish()).setOnCancelListener(d->finish()).show();
 }catch(Exception error){failure(error);}}
 @Override protected void onSaveInstanceState(Bundle state){state.putBoolean("picking",picking);super.onSaveInstanceState(state);}
 @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if(request!=1)return;picking=false;if(result!=RESULT_OK||data==null||data.getData()==null){finish();return;}Uri uri=data.getData();
  new Thread(()->{try{if(!"content".equals(uri.getScheme()))throw new IOException("画像ファイルを選択してください");ByteArrayOutputStream out=new ByteArrayOutputStream();try(InputStream in=getContentResolver().openInputStream(uri)){if(in==null)throw new IOException("画像を開けません");byte[] buffer=new byte[8192];int n;while((n=in.read(buffer))!=-1){if(out.size()+n>8*1024*1024)throw new IOException("画像は8MiB以内で指定してください");out.write(buffer,0,n);}}
    SitePostProtocol.Image image=new SitePostProtocol.Image(out.toByteArray());SiteBoardGateway.get(this).attachment(target,image);runOnUiThread(()->{if(!isFinishing()){android.widget.Toast.makeText(this,"画像を選択しました。書き込み画面から送信してください",android.widget.Toast.LENGTH_LONG).show();finish();}});
   }catch(Exception error){runOnUiThread(()->failure(error));}},"Haiagaru-post-image").start();
 }
 private void failure(Exception error){if(isFinishing()||isDestroyed())return;new AlertDialog.Builder(this).setTitle("画像を添付できません").setMessage(error.getMessage()).setPositiveButton("閉じる",(d,w)->finish()).setOnCancelListener(d->finish()).show();}
}
