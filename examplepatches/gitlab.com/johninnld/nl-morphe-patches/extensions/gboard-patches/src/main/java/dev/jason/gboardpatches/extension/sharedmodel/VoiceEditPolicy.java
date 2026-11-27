package dev.jason.gboardpatches.extension.sharedmodel;
/** Plain dictation, including quoted commands, has no edit effect outside an explicitly armed session. */
public final class VoiceEditPolicy {
 private VoiceEditPolicy(){}
 public static String operation(boolean armed,String transcript){if(!armed || transcript==null || transcript.trim().isEmpty())return null;String plain=transcript.trim().toLowerCase(java.util.Locale.ROOT).replaceAll("[.!?]+$","");return plain.equals("fix it")||plain.equals("proofread")||plain.equals("correct this")?"proofread":"edit";}
}
