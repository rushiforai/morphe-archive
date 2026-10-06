package app.yydarlinker.deepseekcaptions;

import java.util.Locale;

/**
 * One monotonic media clock for callback, player-query and frame application paths.  It keeps
 * observations separate: an older hook callback is never written back over a newer native sample.
 * The class is deliberately pure and does not touch MediaController, views, IPC or networking.
 */
final class RebuildClock {
  static final int UNKNOWN=-1;
  static final String OFFICIAL_PLAYER_QUERY="OFFICIAL_PLAYER_QUERY";
  static final String FRESH_MEDIA_ESTIMATE="FRESH_MEDIA_ESTIMATE";
  static final String HOOK_ONLY="HOOK_ONLY";
  static final String FROZEN="FROZEN";
  private static final long LEASE_MS=1500;
  private static final long MEDIA_TOLERANCE_MS=1800;

  private long confirmed,confirmedAt,epochAt,lastOutput,seekSerial;
  private long nativePosition,nativeAt,mediaPosition,mediaAt;
  private float nativeSpeed=1f,mediaSpeed=1f;
  private int nativeState=UNKNOWN,mediaState=UNKNOWN,selectedState=UNKNOWN;
  private boolean known,nativeKnown,mediaKnown;
  private String ownerEpoch="";
  private String source=HOOK_ONLY;
  private String validReason="unknown";

  synchronized void reset(long now) {
    confirmed=0;confirmedAt=0;nativePosition=0;nativeAt=0;mediaPosition=0;mediaAt=0;
    nativeSpeed=1f;mediaSpeed=1f;nativeState=UNKNOWN;mediaState=UNKNOWN;
    known=false;nativeKnown=false;mediaKnown=false;epochAt=Math.max(1,now);lastOutput=0;
    ownerEpoch="";source=HOOK_ONLY;validReason="reset";selectedState=UNKNOWN;seekSerial++;
  }

  static final class Update {
    final boolean seek;
    final long position;
    final String reason;
    Update(boolean seek,long position,String reason){this.seek=seek;this.position=position;this.reason=reason;}
  }

  synchronized Update updateHook(long position,long now) {
    position=Math.max(0,position);
    boolean nativeFresh=nativeKnown&&now-nativeAt<=LEASE_MS;
    boolean seek=known && !nativeFresh && (position<confirmed-250
        ||position-confirmed>Math.max(2500,(now-confirmedAt)*4+500));
    // A hook callback which merely confirms a native jump is an acknowledgement, not a second seek.
    if(nativeFresh && Math.abs(position-currentNative(now))<=MEDIA_TOLERANCE_MS)seek=false;
    if(seek){epochAt=now;mediaKnown=false;validReason="hook_seek";seekSerial++;}
    confirmed=position;confirmedAt=Math.max(1,now);known=true;lastOutput=position;
    if(!nativeFresh)source=HOOK_ONLY;
    return new Update(seek,position,seek?"seek":"accepted");
  }

  synchronized Update update(long position,long now){return updateHook(position,now);}

  synchronized Update acceptNative(String owner,long position,long now,int state,float speed){
    if(owner==null)owner="";
    if(!Float.isFinite(speed)||speed<=0||speed>4||position<0||now<=0)return new Update(false,current(now),"invalid_native");
    if(!ownerEpoch.equals(owner)&&!ownerEpoch.isEmpty()){
      nativeKnown=false;mediaKnown=false;known=false;lastOutput=0;validReason="owner_changed";
    }
    ownerEpoch=owner;
    boolean pausedMove=nativeKnown && nativeState==2 && state==2
        && Math.abs(position-nativePosition)>16;
    boolean seek=nativeKnown && (pausedMove || position<nativePosition-250
        ||position-nativePosition>Math.max(2500,(now-nativeAt)*4+500));
    if(seek){epochAt=now;mediaKnown=false;validReason="native_seek";seekSerial++;}
    nativePosition=position;nativeAt=now;nativeState=state;nativeSpeed=speed;nativeKnown=true;selectedState=state;
    confirmed=position;confirmedAt=now;known=true;lastOutput=position;source=OFFICIAL_PLAYER_QUERY;
    return new Update(seek,position,seek?"seek":"accepted");
  }

  synchronized Update acceptMedia(long position,long updated,long now,float speed,int state){
    boolean speedValid=Float.isFinite(speed)&&speed>=0&&speed<=4&&(state!=3||speed>0);
    if(position<0||updated<=0||updated>now||now-updated>LEASE_MS||!speedValid){
      mediaKnown=false;validReason="stale_media";return new Update(false,current(now),"stale");
    }
    if(updated<epochAt){mediaKnown=false;validReason="old_epoch";return new Update(false,current(now),"old_epoch");}
    long projected=position;
    if(state==3)projected=position+Math.round(Math.max(0,now-updated)*speed);
    boolean pausedMediaMove=(!nativeKnown||now-nativeAt>LEASE_MS) && mediaKnown
        && mediaState==2 && state==2 && updated>mediaAt && Math.abs(position-mediaPosition)>1500;
    if(known&&now-confirmedAt<=LEASE_MS && !pausedMediaMove){
      long atHook=position+Math.round((confirmedAt-updated)*speed);
      if(Math.abs(atHook-confirmed)>MEDIA_TOLERANCE_MS){mediaKnown=false;validReason="media_hook_timebase_mismatch";return new Update(false,current(now),"timebase_mismatch");}
    }
    if(pausedMediaMove){epochAt=updated;seekSerial++;}
    mediaPosition=position;mediaAt=updated;mediaSpeed=speed;mediaState=state;mediaKnown=true;
    if(!nativeKnown||now-nativeAt>LEASE_MS){source=FRESH_MEDIA_ESTIMATE;confirmed=projected;confirmedAt=now;known=true;lastOutput=state==2?position:projected;}
    validReason="media_accepted";return new Update(false,projected,"accepted");
  }

  synchronized void preserveHookProjection(long position){
    if(HOOK_ONLY.equals(source)&&selectedState!=2)lastOutput=position;
  }
  synchronized void discardMedia(long now){
    mediaKnown=false;
    if(!nativeKnown||now-nativeAt>LEASE_MS)selectedState=UNKNOWN;
  }
  synchronized long position(long now,long mediaPosition,long updated,float speed,int state){
    acceptMedia(mediaPosition,updated,now,speed,state);return current(now);
  }

  synchronized long current(long now){
    if(nativeKnown&&now-nativeAt<=LEASE_MS){
      long value=currentNative(now);source=OFFICIAL_PLAYER_QUERY;selectedState=nativeState;lastOutput=value;validReason="native_fresh";return value;
    }
    if(mediaKnown&&now-mediaAt<=LEASE_MS&&mediaAt>=epochAt){
      long value=mediaState==3?mediaPosition+Math.round(Math.max(0,now-mediaAt)*mediaSpeed):mediaPosition;
      source=FRESH_MEDIA_ESTIMATE;selectedState=mediaState;lastOutput=value;validReason="media_fresh";return value;
    }
    if(known){source=source.equals(OFFICIAL_PLAYER_QUERY)?FROZEN:HOOK_ONLY;validReason="stale_frozen";return lastOutput;}
    validReason="no_evidence";return 0;
  }

  private long currentNative(long now){
    return nativeState==3?nativePosition+Math.round(Math.max(0,now-nativeAt)*nativeSpeed):nativePosition;
  }

  /** The winning position and state travel together; a losing raw sample cannot donate pause. */
  static final class Observation {
    final long position, sampleAt, epoch;
    final int state;
    final float speed;
    final String source, reason, owner;
    Observation(long p,int s,float v,long at,long e,String src,String why,String owner){
      position=p;state=s;speed=v;sampleAt=at;epoch=e;source=src;reason=why;this.owner=owner;
    }
    boolean paused(){return state==2;}
  }
  synchronized Observation observation(long now){
    long value=current(now);
    boolean nativeSelected=OFFICIAL_PLAYER_QUERY.equals(source);
    boolean mediaSelected=FRESH_MEDIA_ESTIMATE.equals(source);
    return new Observation(value,selectedState,nativeSelected?nativeSpeed:mediaSelected?mediaSpeed:0,
        nativeSelected?nativeAt:mediaSelected?mediaAt:confirmedAt,epochAt,source,validReason,ownerEpoch);
  }

  synchronized long presentation(long now){return current(now);}
  synchronized long confirmed(){return confirmed;}
  synchronized boolean fresh(long now){return known&&(now-confirmedAt)<=LEASE_MS;}
  synchronized long epoch(){return epochAt;}
  synchronized long seekSerial(){return seekSerial;}
  synchronized String source(){return source;}
  synchronized String validReason(){return validReason;}
  synchronized String diagnostic(long now){
    long current=current(now);
    return "hookPos="+confirmed+";hookAt="+confirmedAt+";hookAge="+Math.max(0,now-confirmedAt)
        +";rawMedia="+mediaPosition+";updated="+mediaAt+";mediaAge="+Math.max(0,now-mediaAt)
        +";state="+mediaState+";speed="+mediaSpeed+";epoch="+epochAt+";validReason="+validReason
        +";currentEstimate="+current+";clock_source="+source;
  }
}