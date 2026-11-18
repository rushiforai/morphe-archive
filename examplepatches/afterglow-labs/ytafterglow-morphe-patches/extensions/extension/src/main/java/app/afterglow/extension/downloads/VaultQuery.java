package app.afterglow.extension.downloads;

import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/** The same folded search, filters, stable sorting, and section policy used by the iOS Vault. */
public final class VaultQuery {
    public enum Sort { NEWEST, RECENTLY_PLAYED, TITLE, CHANNEL, SIZE, QUALITY }
    public enum Group { NONE, MEDIA_TYPE, COLLECTION, CHANNEL, QUALITY, MONTH }
    public String searchText="", channel="", collection="", sourceQuality="";
    public boolean videoOnly, audioOnly, favoritesOnly, missingOnly;
    public long createdAfter, createdBefore;
    public Sort sort=Sort.NEWEST;
    public Group grouping=Group.NONE;
    public static final class Section {
        public final String title;
        public final List<LibraryItem> items;
        Section(String title,List<LibraryItem> items) { this.title=title; this.items=Collections.unmodifiableList(items); }
    }
    public List<Section> sections(List<LibraryItem> source) {
        List<LibraryItem> matches=new ArrayList<>();
        String needle=fold(searchText);
        for(LibraryItem i:source) {
            if(videoOnly && !audioOnly && i.kind!=DownloadRequest.Kind.VIDEO || audioOnly && !videoOnly && i.kind!=DownloadRequest.Kind.AUDIO) continue;
            if(favoritesOnly && !i.favorite || missingOnly && !i.isMissing()) continue;
            if(!fold(channel).isEmpty() && !fold(channel).equals(fold(i.channelName))) continue;
            if(!fold(collection).isEmpty() && !fold(collection).equals(fold(i.collectionName))) continue;
            if(!fold(sourceQuality).isEmpty() && !fold(sourceQuality).equals(fold(i.sourceQuality))) continue;
            if(createdAfter>0 && i.createdAt<createdAfter || createdBefore>0 && i.createdAt>createdBefore) continue;
            boolean found=needle.isEmpty();
            for(String value:new String[]{i.title,i.channelName,i.collectionName,i.sourceQuality,i.formatSummary,i.videoId,i.relativePath,i.originalFilename}) found |= fold(value).contains(needle);
            if(found) matches.add(i);
        }
        Comparator<LibraryItem> compare;
        switch(sort) {
            case RECENTLY_PLAYED: compare=(a,b)->Long.compare(b.lastPlayedAt,a.lastPlayedAt);break;
            case TITLE:compare=Comparator.comparing(a->fold(a.title));break;
            case CHANNEL:compare=Comparator.comparing(a->fold(a.channelName));break;
            case SIZE:compare=(a,b)->Long.compare(b.fileSize,a.fileSize);break;
            case QUALITY:compare=(a,b)->Integer.compare(quality(b),quality(a));break;
            default:compare=(a,b)->Long.compare(b.createdAt,a.createdAt);
        }
        matches.sort(compare);
        Map<String,List<LibraryItem>> groups=new LinkedHashMap<>();
        for(LibraryItem i:matches) groups.computeIfAbsent(group(i),key->new ArrayList<>()).add(i);
        List<String> keys=new ArrayList<>(groups.keySet());
        if(grouping==Group.MEDIA_TYPE) keys.sort(Comparator.comparingInt(s->s.equals("Video")?0:s.equals("Audio")?1:2));
        else keys.sort(Comparator.comparing(VaultQuery::fold));
        List<Section> result=new ArrayList<>();
        for(String key:keys) result.add(new Section(key,groups.get(key)));
        return Collections.unmodifiableList(result);
    }
    private String group(LibraryItem i) {
        switch(grouping) {
            case MEDIA_TYPE:return i.kind==DownloadRequest.Kind.AUDIO?"Audio":i.kind==DownloadRequest.Kind.THUMBNAIL?"Images":i.kind==DownloadRequest.Kind.CAPTIONS?"Captions":"Video";
            case COLLECTION:return i.collectionName.isEmpty()?"Unfiled":i.collectionName;
            case CHANNEL:return i.channelName.isEmpty()?"Unknown Channel":i.channelName;
            case QUALITY:return i.sourceQuality.isEmpty()?"Unknown Quality":i.sourceQuality;
            case MONTH:return new SimpleDateFormat("LLLL yyyy",Locale.US).format(new Date(i.createdAt));
            default:return "Library";
        }
    }
    static String fold(String s) { return Normalizer.normalize(s==null?"":s.trim(),Normalizer.Form.NFD).replaceAll("\\p{M}","").toLowerCase(Locale.ROOT); }
    private static int quality(LibraryItem i) {
        if(i.height>0) return i.height;
        String q=i.sourceQuality.isEmpty()?i.formatSummary:i.sourceQuality;
        if(q.toLowerCase(Locale.ROOT).contains("4k")) return 2160;
        java.util.regex.Matcher m=java.util.regex.Pattern.compile("^([0-9]+)").matcher(q);
        try { return m.find()?Integer.parseInt(m.group(1)):0; } catch(NumberFormatException e) { return 0; }
    }
}
