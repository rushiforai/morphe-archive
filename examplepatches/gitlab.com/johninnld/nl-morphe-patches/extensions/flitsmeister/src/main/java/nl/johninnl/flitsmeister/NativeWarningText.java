package nl.johninnl.flitsmeister;

import android.content.Context;
import java.lang.reflect.Method;

/** Pinned native text APIs only. Never calls a detector, sound manager or coroutine. */
final class NativeWarningText {
    private NativeWarningText(){}
    static final class Text {
        final String value,origin,language;
        Text(String value,String origin,String language){this.value=value;this.origin=origin;this.language=language;}
    }
    /** Keep exact native fragments; never declare a mixed-language sentence proven. */
    static Text withInstruction(Text announced,String instruction,String instructionLanguage){
        if(!useful(instruction))return announced;
        String language=instructionLanguage==null||instructionLanguage.isEmpty()?"und":instructionLanguage;
        if(announced.value.equals(instruction))return new Text(instruction,"native_text",language);
        boolean matching=!language.equals("und")&&!announced.language.equals("und")
            &&java.util.Locale.forLanguageTag(language).getLanguage().equals(java.util.Locale.forLanguageTag(announced.language).getLanguage());
        if(announced.value.contains(instruction))return new Text(announced.value,"native_text",matching?language:"und");
        // Prefer an instruction with its actual declared language over a guessed translated label.
        if(!matching||!useful(announced.value))return new Text(instruction,"native_text",language);
        return new Text(announced.value+" "+instruction,"native_text",language);
    }
    static Context context(Context fallback,Object nativeOwner){
        if(nativeOwner!=null)for(String field:new String[]{"a","b"})try{
            Object value=nativeOwner.getClass().getField(field).get(nativeOwner);if(value instanceof Context)return (Context)value;
        }catch(ReflectiveOperationException ignored){}
        return fallback;
    }
    static Text resolve(Context context,Object model,String phase,String supplied){
        if(useful(supplied))return new Text(supplied,"native_text",freeText(model,supplied)?"und":language(context));
        String value="";
        // Exit authority with no native words must never fall back to an entry warning.
        if("exit".equals(phase)){
            if(family(model,"AvgSpeedCheck"))value=resource(context,"tts_end_of_avg_speed_check");
            if(!useful(value)){
                String kind=family(model,"TrafficJam")?"traffic":family(model,"Incident")?text(call(model,"getIncidentType")):"";
                boolean dutch=language(context).startsWith("nl");String template="";
                if(kind.equals("traffic"))template=dutch?"Einde van de file.":"End of traffic jam.";
                else if(kind.equals("ROADWORKS"))template=dutch?"Einde van de wegwerkzaamheden.":"End of roadworks.";
                else if(kind.equals("ROAD_CLOSURE")||kind.equals("CLOSURE_WITH_REROUTE"))template=dutch?"Einde van de wegafsluiting.":"End of road closure.";
                if(!template.isEmpty())return new Text(template,"template",dutch?"nl":"en");
            }
            return new Text(value,"native_resource",language(context));
        }
        if(family(model,"SpeedCam"))value=callText(call(model,"getSpeedCamType"),"getLocalizedTTS",context);
        else if(family(model,"ServiceVehicle"))value=callText(model,"reportTitleText",context);
        else if(family(model,"CitsLaneClosed"))value=callText(model,"getLaneClosedTitle",context);
        else if(family(model,"CitsRoadWorks"))value=resource(context,"report_roadworks_singleline");
        else if(family(model,"CitsWeather")||family(model,"CitsSpeedAdvice"))value=joinNative(callText(model,"getTitle",context),callText(model,"getSubtitle",context));
        else if(family(model,"CitsBridgeClosed"))value=joinNative(callText(model,"reportTitleText",context),callText(model,"getShortDescription",context));
        else if(family(model,"TrafficJam"))value=joinNative(callText(model,"reportTitleText",context),callText(model,"getShortDescription",context));
        else if(family(model,"EarlyWarningNotification")){
            value=text(call(model,"getFreetext"));if(useful(value))return new Text(value,"native_text","und");
            value=callText(model,"getNotificationTitle",context);
            if(!useful(value))value=text(call(model,"getTitle"));
        }else if(family(model,"EarlyWarningReport")){
            value=text(call(model,"getFreeText"));
            if(useful(value)){
                if("BRIDGE_CLOSED".equals(text(call(model,"getEarlyWarningTypeEnum")))){
                    String wrapped=resource(context,"tts_incident_bridge",value);if(useful(wrapped))return new Text(wrapped,"native_resource",language(context));
                }
                return new Text(value,"native_text","und");
            }
            value=callText(model,"getShortDescription",context);
            if(!useful(value))value=callText(model,"getTitle",context,Boolean.TRUE);
        }else if(family(model,"Incident")){
            Object subtype=call(model,"getIncidentType");
            if("VOICE_ONLY".equals(text(subtype))){value=text(call(model,"getVoiceOnlyText"));if(useful(value))return new Text(value,"native_text","und");}
            Object pair=call(subtype,"getTTSString",context,model);
            if(Boolean.TRUE.equals(call(pair,"component2"))){value=text(call(model,"getFreeText"));if(useful(value))return new Text(value,"native_text","und");}
            value=text(call(pair,"component1"));
            if(useful(value)&&!"OTHER".equals(text(subtype))){String wrapped=resource(context,"tts_incident",value);if(useful(wrapped))value=wrapped;}
        }else if(family(model,"SpeedTrap")){
            Object hmp=call(model,"getHectometer");value=hmp==null?resource(context,"tts_speed_trap_other"):resource(context,"tts_speed_trap_nl",String.valueOf(hmp));
        }else if(family(model,"AvgSpeedCheck")){
            value=resource(context,"common_trajectcontrole_tts");Object speed=call(model,"getMaxSpeed");
            if(speed instanceof Number&&((Number)speed).intValue()>0){String withSpeed=resource(context,"report_maxspeed_tts",value,String.valueOf(speed));if(useful(withSpeed))value=withSpeed;}
        }else if(family(model,"PoliceHotspot"))value=resource(context,"common_hotspot");
        if(!useful(value))value=callText(model,"getShortDescription",context);
        if(!useful(value))value=callText(model,"reportTitleText",context);
        if(!useful(value))value=text(call(model,"getDescription"));
        if(!useful(value))value=text(call(model,"getTitle"));
        return new Text(value,"native_resource",language(context));
    }
    static boolean family(Object object,String name){if(object==null)return false;for(Class<?> c=object.getClass();c!=null;c=c.getSuperclass())if(c.getSimpleName().equals(name))return true;return false;}
    static String fingerprint(Object model){return fingerprint(model,null);}
    static String fingerprint(Object model,Context context){
        Object notification=family(model,"EarlyWarningReport")?call(model,"getNotification"):null;if(notification!=null)model=notification;
        String free=text(call(model,"getFreeText"));if(free.isEmpty())free=text(call(model,"getFreetext"));
        Text formatted=resolve(context,model,"active",null);
        try{
            java.io.ByteArrayOutputStream bytes=new java.io.ByteArrayOutputStream();java.io.DataOutputStream out=new java.io.DataOutputStream(bytes);
            for(String part:new String[]{free,text(call(model,"getDescription")),text(call(model,"getTitle")),text(call(model,"getVoiceOnlyText")),formatted.value,formatted.language}){byte[] encoded=part.getBytes(java.nio.charset.StandardCharsets.UTF_8);out.writeInt(encoded.length);out.write(encoded);}
            return hex(java.security.MessageDigest.getInstance("SHA-256").digest(bytes.toByteArray()));
        }catch(java.io.IOException|java.security.NoSuchAlgorithmException error){throw new IllegalStateException(error);}
    }
    static String free(Object model){String value=text(call(model,"getFreeText"));return value.isEmpty()?text(call(model,"getFreetext")):value;}
    static String hash(String value){
        try{return hex(java.security.MessageDigest.getInstance("SHA-256").digest(value.getBytes(java.nio.charset.StandardCharsets.UTF_8)));}
        catch(java.security.NoSuchAlgorithmException impossible){throw new IllegalStateException(impossible);}
    }
    private static String hex(byte[] bytes){char[] alphabet="0123456789abcdef".toCharArray(),out=new char[bytes.length*2];for(int i=0;i<bytes.length;i++){out[i*2]=alphabet[(bytes[i]&255)>>>4];out[i*2+1]=alphabet[bytes[i]&15];}return new String(out);}
    static Object call(Object object,String method,Object... arguments){
        if(object==null)return null;
        for(Method candidate:object.getClass().getMethods())if(candidate.getName().equals(method)&&candidate.getParameterTypes().length==arguments.length){
            Class<?>[] types=candidate.getParameterTypes();boolean fits=true;
            for(int i=0;i<types.length;i++)if(arguments[i]==null?types[i].isPrimitive():!(types[i].isInstance(arguments[i])||(types[i]==boolean.class&&arguments[i] instanceof Boolean))){fits=false;break;}
            if(fits)try{return candidate.invoke(object,arguments);}catch(ReflectiveOperationException ignored){return null;}
        }
        return null;
    }
    private static String callText(Object model,String method,Object... args){return text(call(model,method,args));}
    private static String joinNative(String title,String description){
        if(!useful(title))return description;if(!useful(description)||description.equals(title))return title;
        if(description.startsWith(title))return description;return title+". "+description;
    }
    private static boolean freeText(Object model,String supplied){for(String method:new String[]{"getFreeText","getFreetext","getVoiceOnlyText"}){String free=text(call(model,method));if(useful(free)&&supplied.contains(free))return true;}return false;}
    private static String resource(Context context,String name,Object... args){
        if(context==null)return "";
        try{
            int id=0;try{id=Class.forName("nl.flitsmeister.R$string").getField(name).getInt(null);}catch(ReflectiveOperationException ignored){}
            if(id==0)id=context.getResources().getIdentifier(name,"string",context.getPackageName());
            return id==0?"":context.getString(id,args);
        }catch(android.content.res.Resources.NotFoundException error){return "";}
    }
    private static String language(Context context){if(context!=null){android.os.LocaleList locales=context.getResources().getConfiguration().getLocales();if(!locales.isEmpty())return locales.get(0).toLanguageTag();}return "und";}
    static String text(Object value){return value==null?"":value instanceof Enum?((Enum<?>)value).name():String.valueOf(value);}
    static boolean useful(String value){
        if(value==null)return false;
        for(int at=0;at<value.length();){int point=value.codePointAt(at),type=Character.getType(point);
            if(!Character.isWhitespace(point)&&!Character.isSpaceChar(point)&&type!=Character.CONTROL&&type!=Character.FORMAT)return true;
            at+=Character.charCount(point);
        }
        return false;
    }
}
