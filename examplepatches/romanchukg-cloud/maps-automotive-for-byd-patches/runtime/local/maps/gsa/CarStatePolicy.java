// SPDX-License-Identifier: GPL-3.0-only
package local.maps.gsa;
/** Pinned native Live state names, never UI text/animation inference. */
public final class CarStatePolicy {
 public static String microphone(Object muted){return muted instanceof Boolean?((Boolean)muted?"MIC_MUTED":"MIC_OPEN"):"UNKNOWN";}
 public static String state(String type,String mic){
  if("bhjm".equals(type))return "ERROR";
  if("bhjk".equals(type))return "ENDED";
  if("bhjr".equals(type)||"bhjn".equals(type))return "SPEAKING";
  if("bhju".equals(type)||"bhjq".equals(type))return "PROCESSING";
  if("bhjv".equals(type))return "TRANSCRIBING";
  if("bhjo".equals(type)){if("MIC_OPEN".equals(mic))return "LISTENING";if("MIC_MUTED".equals(mic)||"MIC_CLOSED".equals(mic))return "MUTED";return "UNSUPPORTED";}
  if("bhjs".equals(type)||"bhjp".equals(type))return "STARTING";
  if("bhjl".equals(type))return "PAUSED";
  return "UNSUPPORTED";
 }
 public static String glow(String state){
  if("LISTENING".equals(state))return "LISTENING";
  if("SPEAKING".equals(state))return "GEMINI_SPEAKING";
  if("PROCESSING".equals(state))return "PROCESSING";
  if("TRANSCRIBING".equals(state))return "TRANSCRIBING";
  if("STARTING".equals(state))return "INVOCATION";
  return "GONE";
 }
 public static String title(String state){
  if("LISTENING".equals(state))return "Listening";
  if("SPEAKING".equals(state))return "Gemini is speaking";
  if("PROCESSING".equals(state))return "Thinking";
  if("TRANSCRIBING".equals(state))return "Understanding your request";
  if("STARTING".equals(state))return "Connecting";
  if("MUTED".equals(state))return "Microphone muted";
  if("PAUSED".equals(state))return "Conversation paused";
  if("ERROR".equals(state))return "Unable to continue — open original view";
  return "Conversation ended";
 }
}
