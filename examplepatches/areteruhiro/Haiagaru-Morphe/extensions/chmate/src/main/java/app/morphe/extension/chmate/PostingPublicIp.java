package app.morphe.extension.chmate;

import android.content.Context;
import android.net.*;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.*;

/** User-initiated, read-only reference lookup. Never switches to another transport on failure. */
final class PostingPublicIp {
    static String fetch(Context context,boolean cellular,Network active)throws Exception{
        ConnectivityManager cm=(ConnectivityManager)context.getSystemService(Context.CONNECTIVITY_SERVICE);
        if(cm==null)throw new IOException("回線を確認できません");
        ConnectivityManager.NetworkCallback callback=null;Network network=active;
        try{
            if(cellular){
                CountDownLatch ready=new CountDownLatch(1);Network[] found={null};
                callback=new ConnectivityManager.NetworkCallback(){@Override public void onAvailable(Network n){found[0]=n;ready.countDown();}};
                cm.requestNetwork(new NetworkRequest.Builder().addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                        .addTransportType(NetworkCapabilities.TRANSPORT_CELLULAR).build(),callback);
                if(!ready.await(5,TimeUnit.SECONDS)||found[0]==null)throw new IOException("モバイル回線を取得できません");network=found[0];
            }
            if(network==null)throw new IOException("使用回線を取得できません");
            StringBuilder result=new StringBuilder();
            for(String[] endpoint:new String[][]{{"IPv4","https://api.ipify.org"},{"IPv6","https://api6.ipify.org"}}){
                if(result.length()>0)result.append('\n');result.append(endpoint[0]).append("：");
                try{result.append(query(network,endpoint[1]));}catch(IOException e){result.append("取得できません（未対応・接続失敗など）");}
            }
            return result.toString();
        }finally{if(callback!=null)try{cm.unregisterNetworkCallback(callback);}catch(RuntimeException ignored){}}
    }
    private static String query(Network network,String url)throws IOException{
        HttpURLConnection connection=(HttpURLConnection)network.openConnection(new URL(url));
        connection.setInstanceFollowRedirects(false);connection.setConnectTimeout(4000);connection.setReadTimeout(4000);
        connection.setUseCaches(false);connection.setRequestProperty("User-Agent","Haiagaru IP check");
        try{
            if(connection.getResponseCode()!=200)throw new IOException("IP lookup unavailable");
            try(InputStream in=connection.getInputStream();ByteArrayOutputStream out=new ByteArrayOutputStream()){
                for(int c;(c=in.read())!=-1;){if(out.size()>=128)throw new IOException("Invalid IP response");out.write(c);}
                String address=out.toString(StandardCharsets.US_ASCII.name()).trim();
                if(!PostingIpRules.address(address))throw new IOException("Invalid IP response");return address;
            }
        }finally{connection.disconnect();}
    }
    private PostingPublicIp(){}
}
