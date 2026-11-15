package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.widget.*;
import java.io.*;
import java.net.*;
import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.*;

/** Public Futapo ranking; no scripts, login or eager thread-body downloads. */
final class FutabaRanking {
    static final String SOURCE="https://futapo.futakuro.com/ranking/index.html";
    static final class Row {
        final String url,title;final int speed,replies;
        Row(String url,String title,int speed,int replies){this.url=url;this.title=title;this.speed=speed;this.replies=replies;}
        public String toString(){return "勢い "+speed+" / "+replies+"レス\n"+title+"\n"+url;}
    }
    static List<Row> parse(String html)throws IOException{
        LinkedHashMap<String,Row> rows=new LinkedHashMap<>();
        for(Element tr:Jsoup.parse(html,SOURCE).select("tr")){
            Element a=tr.selectFirst("td.title a[href]"),s=tr.selectFirst("td.ikioi"),r=tr.selectFirst("td.res");
            if(a==null||s==null||r==null)continue;
            String url=a.absUrl("href").replaceFirst("^http:","https:");
            try{SiteBoardProtocol.Board board=SiteBoardProtocol.address(url);if(!board.kind.equals("futaba")||board.thread==null)continue;
                String title=a.text().trim();if(title.isEmpty())continue;
                int speed=Integer.parseInt(s.text().replace(",","").trim()),replies=Integer.parseInt(r.text().replace(",","").trim());
                if(speed<0||replies<0)continue;rows.putIfAbsent(url,new Row(url,title,speed,replies));if(rows.size()>=200)break;
            }catch(IOException|IllegalArgumentException invalid){/* Ignore advertisements and malformed rows. */}
        }
        if(rows.isEmpty())throw new IOException("勢いランキングの形式を確認できません");
        return Collections.unmodifiableList(new ArrayList<>(rows.values()));
    }
    static void show(Activity activity){
        if(!SiteBoardGateway.get(activity).siteEnabled("futaba")){new HaiagaruDialog.Builder(activity).setMessage("ふたばの使用をオンにしてください").setPositiveButton("閉じる",null).show();return;}
        TextView loading=new TextView(activity);loading.setText("ランキングを取得しています…");
        LinearLayout box=new LinearLayout(activity);box.setOrientation(1);box.addView(loading);
        Spinner scope=new Spinner(activity);scope.setAdapter(new ArrayAdapter<>(activity,android.R.layout.simple_spinner_dropdown_item,new String[]{"全板","may","img"}));box.addView(scope);
        ListView list=new ListView(activity);box.addView(list,new LinearLayout.LayoutParams(-1,(int)(420*activity.getResources().getDisplayMetrics().density)));
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(activity).setTitle("ふたばの勢いランキング（ふたぽ）").setView(box).setNegativeButton("閉じる",null).create();dialog.show();
        new Thread(()->{
            List<Row> result=null;String failure=null;HttpURLConnection c=null;
            try{c=(HttpURLConnection)new URL(SOURCE).openConnection();c.setConnectTimeout(10000);c.setReadTimeout(15000);c.setInstanceFollowRedirects(false);
                if(c.getResponseCode()!=200)throw new IOException("HTTP "+c.getResponseCode());
                ByteArrayOutputStream bytes=new ByteArrayOutputStream();try(InputStream in=c.getInputStream()){byte[] b=new byte[8192];int n;while((n=in.read(b))!=-1){if(bytes.size()+n>2*1024*1024)throw new IOException("応答が大きすぎます");bytes.write(b,0,n);}}
                result=parse(new SiteBoardGateway.Response(200,bytes.toByteArray(),c.getContentType()==null?"text/html":c.getContentType(),null).text());
            }catch(Exception error){failure="ランキングを取得できませんでした。通信状態・サイトを確認してください。";}finally{if(c!=null)c.disconnect();}
            final List<Row> received=result;final String error=failure;
            activity.runOnUiThread(()->{
                if(activity.isFinishing()||activity.isDestroyed()||!dialog.isShowing())return;
                if(error!=null){loading.setText(error);dialog.refresh();return;}
                List<Row> visible=new ArrayList<>();Runnable update=()->{visible.clear();for(Row row:received)if(scope.getSelectedItemPosition()==0||row.url.startsWith(scope.getSelectedItemPosition()==1?"https://may.2chan.net/":"https://img.2chan.net/"))visible.add(row);list.setAdapter(new ArrayAdapter<>(activity,android.R.layout.simple_list_item_1,new ArrayList<>(visible)));loading.setText(visible.size()+"件・元サイトの勢い順。スレをタップしてアプリで開きます。");dialog.refresh();};
                scope.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onItemSelected(AdapterView<?> p,android.view.View v,int position,long id){update.run();}public void onNothingSelected(AdapterView<?> p){}});
                list.setOnItemClickListener((p,v,position,id)->{Row row=visible.get(position);list.setEnabled(false);
                    new Thread(()->{String openFailure=null;try{SiteBoardGateway gateway=SiteBoardGateway.get(activity);boolean registered=false;
                        for(SiteBoardProtocol.Board existing:gateway.boards.values())if(existing.url.equals(SiteBoardProtocol.address(row.url).url)){registered=true;break;}
                        if(!registered)gateway.register(row.url,"ふたば "+URI.create(row.url).getHost());
                    }catch(Exception unavailable){openFailure="スレを開けませんでした";}final String message=openFailure;
                    activity.runOnUiThread(()->{if(activity.isFinishing()||activity.isDestroyed())return;list.setEnabled(true);
                        if(message!=null)Toast.makeText(activity,message,Toast.LENGTH_LONG).show();else activity.startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse(row.url)).setClass(activity,OpenUrlActivity.class));});
                    },"Haiagaru-ranking-open").start();});update.run();
            });
        },"Haiagaru-futaba-ranking").start();
    }
    private FutabaRanking(){}
}
