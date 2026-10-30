package local.maps.gsa;
import android.content.Context;
import android.media.*;
public final class LiveAudioFocusTest {
 static int checks;
 static void check(boolean value){checks++;if(!value)throw new AssertionError("check "+checks);}
 static LiveAudioFocus create(AudioManager audio){return new LiveAudioFocus(new Context(audio));}
 public static void main(String[] args){
  String[] active={"STARTING","LISTENING","TRANSCRIBING","PROCESSING","SPEAKING"};
  for(String state:active){check(LiveAudioFocus.needsFocus(state,"MIC_OPEN"));for(String mic:new String[]{"MIC_MUTED","MIC_CLOSED","UNKNOWN",null})check(!LiveAudioFocus.needsFocus(state,mic));}
  for(String state:new String[]{"MUTED","PAUSED","ERROR","ENDED","UNSUPPORTED",null})check(!LiveAudioFocus.needsFocus(state,"MIC_OPEN"));
  AudioManager audio=new AudioManager();LiveAudioFocus focus=create(audio);
  for(int i=0;i<100;i++)for(String state:active)focus.update(state,"MIC_OPEN");
  check(audio.requests==1);check(audio.abandons==0);check(focus.status().equals("GRANTED"));
  AudioFocusRequest first=audio.lastRequest;
  check(first.gain==AudioManager.AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK);
  check(first.attributes.usage==AudioAttributes.USAGE_ASSISTANT);check(first.attributes.content==AudioAttributes.CONTENT_TYPE_SPEECH);check(!first.delayed);
  focus.update("MUTED","MIC_MUTED");check(audio.abandons==1);check(audio.lastAbandoned==first);
  for(int i=0;i<100;i++)focus.update("PAUSED","MIC_OPEN");check(audio.abandons==1);
  focus.update("LISTENING","MIC_OPEN");AudioFocusRequest second=audio.lastRequest;check(audio.requests==2);check(first!=second);
  first.listener.onAudioFocusChange(AudioManager.AUDIOFOCUS_LOSS);check(audio.abandons==1);check(focus.status().equals("GRANTED"));
  focus.close();focus.close();check(audio.abandons==2);check(audio.lastAbandoned==second);check(focus.status().equals("CLOSED"));
  second.listener.onAudioFocusChange(AudioManager.AUDIOFOCUS_GAIN);focus.update("LISTENING","MIC_OPEN");check(audio.requests==2);check(focus.status().equals("CLOSED"));
  for(int loss:new int[]{-1,-2,-3}){
   audio=new AudioManager();focus=create(audio);focus.update("LISTENING","MIC_OPEN");AudioFocusRequest lease=audio.lastRequest;
   lease.listener.onAudioFocusChange(loss);check(audio.abandons==1);check(focus.status().equals("LOST"));
   for(int i=0;i<100;i++)focus.update("SPEAKING","MIC_OPEN");check(audio.requests==1);
   focus.update("MUTED","MIC_MUTED");focus.update("LISTENING","MIC_OPEN");check(audio.requests==2);focus.close();check(audio.abandons==2);
  }
  for(int denied:new int[]{0,2}){
   audio=new AudioManager();audio.result=denied;focus=create(audio);focus.update("LISTENING","MIC_OPEN");
   check(focus.status().equals("DENIED"));check(audio.abandons==1);
   for(int i=0;i<100;i++)focus.update("LISTENING","MIC_OPEN");check(audio.requests==1);focus.close();check(audio.abandons==1);
  }
  audio=new AudioManager();audio.failRequest=true;focus=create(audio);focus.update("LISTENING","MIC_OPEN");check(focus.status().equals("UNAVAILABLE"));check(audio.abandons==1);focus.close();check(audio.abandons==1);
  audio=new AudioManager();audio.failAbandon=true;focus=create(audio);focus.update("LISTENING","MIC_OPEN");focus.close();check(focus.status().equals("RELEASE_UNAVAILABLE"));check(audio.abandons==1);
  focus=create(null);focus.update("LISTENING","MIC_OPEN");check(focus.status().equals("UNAVAILABLE"));focus.close();check(focus.status().equals("CLOSED"));
  for(String end:new String[]{"ENDED","ERROR","UNSUPPORTED"}){audio=new AudioManager();focus=create(audio);focus.update("LISTENING","MIC_OPEN");focus.update(end,"MIC_OPEN");check(audio.abandons==1);focus.close();check(audio.abandons==1);}
  System.out.println("LiveAudioFocusTest PASS checks="+checks);
 }
}
