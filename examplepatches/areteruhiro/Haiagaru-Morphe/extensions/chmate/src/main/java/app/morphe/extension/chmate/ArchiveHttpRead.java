package app.morphe.extension.chmate;
import java.io.*;
import java.net.*;
import java.util.*;
/** User-initiated archive GETs, including the 308 redirects omitted by older Android readers. */
final class ArchiveHttpRead {
    static byte[] read(String value,int maxBytes)throws IOException{
        URL next=new URL(value);Set<String> visited=new HashSet<>();long deadline=System.nanoTime()+60_000_000_000L;
        for(int hop=0;hop<8;hop++){
            if(!("http".equalsIgnoreCase(next.getProtocol())||"https".equalsIgnoreCase(next.getProtocol()))||next.getUserInfo()!=null)throw new ProtocolException("Invalid archive redirect");
            if(!visited.add(next.toExternalForm()))throw new ProtocolException("Archive redirect loop");
            HttpURLConnection connection=(HttpURLConnection)next.openConnection();
            connection.setConnectTimeout(6000);connection.setReadTimeout(15000);connection.setInstanceFollowRedirects(false);
            connection.setRequestProperty("User-Agent","Mozilla/5.0 Haiagaru");
            try{
                int code=connection.getResponseCode();String location=connection.getHeaderField("Location");
                if(code==301||code==302||code==303||code==307||code==308){
                    if(location==null||location.isEmpty())throw new ProtocolException("Archive redirect has no location");
                    URL target=new URL(next,location);
                    if("https".equalsIgnoreCase(next.getProtocol())&&!"https".equalsIgnoreCase(target.getProtocol()))throw new ProtocolException("Archive HTTPS downgrade rejected");
                    next=target;continue;
                }
                if(code<200||code>=300)throw new IOException("Archive HTTP "+code);
                try(InputStream input=new BufferedInputStream(connection.getInputStream());ByteArrayOutputStream output=new ByteArrayOutputStream()){
                    byte[] buffer=new byte[16384];int count;
                    while((count=input.read(buffer))!=-1){
                        if(System.nanoTime()>deadline)throw new SocketTimeoutException("Archive download deadline");
                        if(output.size()>maxBytes-count)throw new IOException("Archive response was too large");
                        output.write(buffer,0,count);
                    }
                    return output.toByteArray();
                }
            }finally{connection.disconnect();}
        }
        throw new ProtocolException("Archive redirect limit");
    }
    private ArchiveHttpRead(){}
}
