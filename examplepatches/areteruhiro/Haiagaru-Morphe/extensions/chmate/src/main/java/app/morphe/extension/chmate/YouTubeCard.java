package app.morphe.extension.chmate;

import java.net.URI;

final class YouTubeCard {
    static String id(String url){
        try{URI uri=URI.create(url);String host=uri.getHost();if(host==null)return null;
            host=host.toLowerCase(java.util.Locale.ROOT);String id=null;
            if(host.equals("youtu.be"))id=uri.getPath().substring(1);
            else if(host.equals("youtube.com")||host.endsWith(".youtube.com")){
                String path=uri.getPath();
                if(path.matches("/(shorts|embed|live)/[^/]+/?"))id=path.split("/")[2];
                else if(path.equals("/watch")&&uri.getRawQuery()!=null)for(String part:uri.getRawQuery().split("&"))if(part.startsWith("v="))id=part.substring(2);
            }
            return id!=null&&id.matches("[A-Za-z0-9_-]{11}")?id:null;
        }catch(RuntimeException invalid){return null;}
    }
    private YouTubeCard(){}
}
