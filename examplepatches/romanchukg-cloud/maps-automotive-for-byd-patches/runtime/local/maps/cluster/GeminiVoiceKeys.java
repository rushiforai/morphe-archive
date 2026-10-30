// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

/** One assigned wheel key opens Gemini; by default the Tang DiLink5.0 dedicated LONG voice event.
 * Never consumes any other key, so BYD's short voice and the zoom keys keep their roles. */
final class GeminiVoiceKeys {
    static final int PASS=0, CONSUME=1, OPEN=2;
    static final WheelKeyPolicy.Binding TANG=WheelKeyPolicy.Bindings.tangGemini();
    private int device=-1;private long down=-1,lastOpen=-1;
    int handle(int action,int code,int scan,int deviceId,String name,long downTime,int repeat,
               boolean canceled,boolean enabled,boolean available,boolean audioSafe,long now){
        return handle(TANG,action,code,scan,deviceId,name,downTime,repeat,canceled,enabled,available,audioSafe,now);
    }
    int handle(WheelKeyPolicy.Binding key,int action,int code,int scan,int deviceId,String name,long downTime,int repeat,
               boolean canceled,boolean enabled,boolean available,boolean audioSafe,long now){
        if(key==null||code!=key.code||scan!=key.scan||!key.device.equals(name))return PASS;
        boolean owned=device==deviceId&&down==downTime;
        if(action==1){if(!owned)return PASS;device=-1;down=-1;return CONSUME;}
        if(action!=0)return PASS;
        if(owned)return CONSUME;
        if(repeat!=0||canceled||!enabled||!available||!audioSafe)return PASS;
        device=deviceId;down=downTime;
        // Some firmware duplicates its instant down/up pair; opening twice can close an assistant.
        if(lastOpen>=0&&now>=lastOpen&&now-lastOpen<800)return CONSUME;
        lastOpen=now;return OPEN;
    }
    void disconnected(){device=-1;down=-1;lastOpen=-1;}
}
