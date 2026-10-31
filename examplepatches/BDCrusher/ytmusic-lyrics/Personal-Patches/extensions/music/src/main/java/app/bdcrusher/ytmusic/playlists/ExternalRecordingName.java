/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;
import java.util.Set;
import java.util.regex.*;

/** Exact recording identifiers only; titles and uploader names never establish file identity. */
final class ExternalRecordingName {
    private static final Pattern ID=Pattern.compile("\\[([A-Za-z0-9_-]{11})\\]|\\(([A-Za-z0-9_-]{11})\\)");
    private ExternalRecordingName(){}
    static String match(String name,Set<String> known){
        if(name==null)return null;
        int dot=name.lastIndexOf('.');String base=dot<0?name:name.substring(0,dot);
        if(base.matches("[A-Za-z0-9_-]{11}")&&known.contains(base))return base;
        Matcher matcher=ID.matcher(base);String found=null;
        while(matcher.find()){String id=matcher.group(1)==null?matcher.group(2):matcher.group(1);
            if(!known.contains(id))continue;if(found!=null&&!found.equals(id))return null;found=id;}
        return found;
    }
}
