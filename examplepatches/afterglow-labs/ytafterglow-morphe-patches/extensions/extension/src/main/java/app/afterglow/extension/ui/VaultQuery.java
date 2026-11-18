package app.afterglow.extension.ui;

import app.afterglow.extension.downloads.DownloadRequest;
import app.afterglow.extension.downloads.LibraryItem;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** View state and labels; the durable engine owns the iOS Vault query policy. */
final class VaultQuery {
    static final String[] SORTS={"Newest","Recently Played","Title","Channel","File Size","Quality"};
    static final String[] GROUPS={"None","Media Type","Collection","Channel","Quality","Month Added"};
    String search="",channel="",collection="",quality="";
    boolean videos,audio,favorites,missing,recent;
    int sort,group=1;
    int filterCount(){return(videos?1:0)+(audio?1:0)+(favorites?1:0)+(missing?1:0)+(recent?1:0)+(channel.isEmpty()?0:1)+(collection.isEmpty()?0:1)+(quality.isEmpty()?0:1);}
    void clear(){videos=audio=favorites=missing=recent=false;channel=collection=quality="";}
    boolean constrained(){return !search.trim().isEmpty()||filterCount()>0;}
    Map<String,List<LibraryItem>> sections(List<LibraryItem> source,long now){
        app.afterglow.extension.downloads.VaultQuery query=new app.afterglow.extension.downloads.VaultQuery();
        query.searchText=search;query.channel=channel;query.collection=collection;query.sourceQuality=quality;
        query.videoOnly=videos;query.audioOnly=audio;query.favoritesOnly=favorites;query.missingOnly=missing;
        query.createdAfter=recent?now-30L*24*60*60*1000:0;
        query.sort=app.afterglow.extension.downloads.VaultQuery.Sort.values()[sort];
        query.grouping=app.afterglow.extension.downloads.VaultQuery.Group.values()[group];
        Map<String,List<LibraryItem>> result=new LinkedHashMap<>();
        for(app.afterglow.extension.downloads.VaultQuery.Section section:query.sections(source))result.put(section.title,section.items);
        return result;
    }
    static String media(DownloadRequest.Kind kind){switch(kind){case AUDIO:return "Audio";case CAPTIONS:return "Captions";case THUMBNAIL:return "Images";default:return "Video";}}
}
