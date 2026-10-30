// SPDX-License-Identifier: GPL-3.0-only
package local.maps.gsa;
/** Native page + mic controls, never animation or audio-playback guesses. */
public final class VoiceStripPolicy {
 public static String state(String page,String mic,long elapsed){
  if("RESPONSE".equals(page))return "RESPONSE";
  if("LIVE".equals(page)||"AGENT_DASHBOARD".equals(page))return "NATIVE";
  if("LOADING".equals(page))return elapsed<30000?"PROCESSING":"FALLBACK";
  if("INVOCATION".equals(page)&&("bbnz".equals(mic)||"bboa".equals(mic)))return "LISTENING";
  // Native cold start may construct both models before the microphone is ready.
  // Hidden/Idle are waiting states, never evidence of an active microphone.
  if("INVOCATION".equals(page)&&("bbob".equals(mic)||"bboc".equals(mic)))return elapsed<15000?"STARTING":"FALLBACK";
  return elapsed<10000?"STARTING":"FALLBACK";
 }
}
