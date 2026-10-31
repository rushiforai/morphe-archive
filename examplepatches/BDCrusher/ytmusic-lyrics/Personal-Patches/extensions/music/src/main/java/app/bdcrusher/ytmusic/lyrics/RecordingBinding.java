/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
/** Match metadata to a recording before it can reach a provider or permanent cache. */
public final class RecordingBinding {
 private String id="",title="",artist="";
 public boolean observe(String recording,String metadataId,String nextTitle,String nextArtist){
  if(recording==null||recording.isEmpty()||nextTitle==null||nextArtist==null)return false;
  boolean explicit=metadataId!=null&&metadataId.matches("[A-Za-z0-9_-]{11}");if(explicit&&!recording.equals(metadataId))return false;
  if(!id.isEmpty()&&!id.equals(recording)&&title.equals(nextTitle)&&artist.equals(nextArtist)&&!explicit)return false;
  id=recording;title=nextTitle;artist=nextArtist;return true;
 }
 public boolean matches(String recording,String nextTitle,String nextArtist){return id.equals(recording)&&title.equals(nextTitle)&&artist.equals(nextArtist);}
}
