package app.morphe.extension.chmate;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;

/** GAS may wait 15 seconds for its script lock before producing any response. */
final class SharedNgHttp {
    static final int CONNECT_MS=15_000, READ_MS=60_000, TOTAL_MS=90_000, MAX_BYTES=4*1024*1024;
    interface Connections { HttpURLConnection open(URL url)throws IOException; }
    interface Clock { long nanos(); }

    static String request(String verb,String address,String body)throws IOException {
        return request(verb,address,body,url->(HttpURLConnection)url.openConnection(),System::nanoTime);
    }
    static String request(String verb,String address,String body,Connections connections,Clock clock)throws IOException {
        long deadline=clock.nanos()+TOTAL_MS*1_000_000L;
        // A POST can have reached GAS even if its response was lost. Never replay it here.
        boolean retryable="GET".equals(verb)&&body==null;
        for(int attempt=0;;attempt++) {
            try{return exchange(verb,address,body,connections,clock,deadline);}
            catch(SocketTimeoutException timeout) {
                if(!retryable||attempt!=0||remaining(clock,deadline)<=1000) {
                    SocketTimeoutException explained=new SocketTimeoutException("共有NGサーバーとの通信がタイムアウトしました。保存済みの条件は保持しています。しばらくしてから再同期してください");
                    explained.initCause(timeout);throw explained;
                }
            }
        }
    }
    private static int remaining(Clock clock,long deadline) {
        long nanos=deadline-clock.nanos();return nanos<=0?0:(int)Math.min(Integer.MAX_VALUE,(nanos+999_999L)/1_000_000L);
    }
    private static int timeout(Clock clock,long deadline,int limit)throws SocketTimeoutException {
        int left=remaining(clock,deadline);if(left==0)throw new SocketTimeoutException("Shared NG request deadline");return Math.min(left,limit);
    }
    private static String exchange(String verb,String address,String body,Connections connections,Clock clock,long deadline)throws IOException {
        for(int redirects=0;redirects<3;redirects++) {
            URL target=new URL(address);String host=target.getHost();
            if(!"https".equals(target.getProtocol())||target.getUserInfo()!=null||target.getPort()!=-1&&target.getPort()!=443
                    ||!(host.equals("script.google.com")||host.equals("script.googleusercontent.com")||host.equals("raw.githubusercontent.com")))
                throw new IOException("不正な転送先");
            HttpURLConnection connection=connections.open(target);
            try {
                connection.setInstanceFollowRedirects(false);
                connection.setConnectTimeout(timeout(clock,deadline,CONNECT_MS));
                connection.setReadTimeout(timeout(clock,deadline,READ_MS));
                connection.setRequestMethod(verb);
                byte[] bytes=body==null?null:body.getBytes(StandardCharsets.UTF_8);
                if(bytes!=null) {
                    connection.setDoOutput(true);connection.setRequestProperty("Content-Type","application/json; charset=utf-8");connection.setFixedLengthStreamingMode(bytes.length);
                }
                connection.connect();connection.setReadTimeout(timeout(clock,deadline,READ_MS));
                if(bytes!=null)try(OutputStream out=connection.getOutputStream()){out.write(bytes);}
                connection.setReadTimeout(timeout(clock,deadline,READ_MS));
                int code=connection.getResponseCode();
                if(code==302||code==303) {
                    String location=connection.getHeaderField("Location");if(location==null||location.isEmpty())throw new IOException("転送先がありません");
                    address=new URL(target,location).toString();verb="GET";body=null;continue;
                }
                if(code!=200)throw new IOException("HTTP "+code);
                try(InputStream in=connection.getInputStream();ByteArrayOutputStream out=new ByteArrayOutputStream()) {
                    byte[] buffer=new byte[8192];int count;
                    for(;;) {
                        connection.setReadTimeout(timeout(clock,deadline,READ_MS));count=in.read(buffer);if(count==-1)break;
                        if(out.size()+count>MAX_BYTES)throw new IOException("応答が大きすぎます");out.write(buffer,0,count);
                    }
                    timeout(clock,deadline,READ_MS);return out.toString("UTF-8");
                }
            } finally {connection.disconnect();}
        }
        throw new IOException("転送回数が多すぎます");
    }
    private SharedNgHttp(){}
}
