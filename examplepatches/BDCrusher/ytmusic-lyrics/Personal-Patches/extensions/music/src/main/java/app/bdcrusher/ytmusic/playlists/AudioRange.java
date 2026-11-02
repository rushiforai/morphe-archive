/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;

/** Single byte ranges used by Music's native extractor; no network or filesystem effects. */
public record AudioRange(long start,long end,boolean partial,boolean satisfiable) {
    public long length(){return satisfiable?end-start+1:0;}
    public static AudioRange parse(String header,String query,long total){
        if(total<=0)return new AudioRange(0,-1,header!=null||query!=null,false);
        String value=header!=null?header.startsWith("bytes=")?header.substring(6):"invalid":query;
        if(value==null)return new AudioRange(0,total-1,false,true);
        if(!value.matches("[0-9]*-[0-9]*"))return new AudioRange(0,-1,true,false);
        String[] parts=value.split("-",-1);try{
            if(parts[0].isEmpty()){if(parts[1].isEmpty())return new AudioRange(0,-1,true,false);long suffix=Long.parseLong(parts[1]);return suffix<=0?new AudioRange(0,-1,true,false):new AudioRange(Math.max(0,total-suffix),total-1,true,true);}
            long start=Long.parseLong(parts[0]),end=parts[1].isEmpty()?total-1:Math.min(total-1,Long.parseLong(parts[1]));
            return new AudioRange(start,end,true,start<total&&end>=start);
        }catch(NumberFormatException invalid){return new AudioRange(0,-1,true,false);}
    }
}
