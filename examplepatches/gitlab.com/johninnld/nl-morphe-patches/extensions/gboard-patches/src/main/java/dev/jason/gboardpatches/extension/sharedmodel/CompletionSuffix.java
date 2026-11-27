package dev.jason.gboardpatches.extension.sharedmodel;
import java.util.Locale;
import java.util.regex.*;
/** Mechanical rejection only. Semantic quality remains an independent native-model acceptance gate. */
public final class CompletionSuffix {
 private static final Pattern NUMBER_OR_URL=Pattern.compile("[0-9]+(?:[.,:/-][0-9]+)*|https?://\\S+",Pattern.CASE_INSENSITIVE);
 private CompletionSuffix(){}
 public static String checked(String prefix,String suffix){
  if(prefix==null || suffix==null || suffix.trim().isEmpty() || suffix.length()>160 || suffix.indexOf('\n')>=0 || suffix.indexOf('\r')>=0)return null;
  String clean=suffix.trim(),lower=clean.toLowerCase(Locale.ROOT);
  if(clean.startsWith("\"") || clean.startsWith("“") || clean.startsWith("'") || clean.endsWith("\"") || clean.endsWith("”")
    || lower.startsWith("sure,") || lower.startsWith("here is") || lower.startsWith("here's") || clean.contains("<start_of_turn>") || clean.contains("<end_of_turn>"))return null;
  String input=prefix.trim();if(!input.isEmpty() && (clean.startsWith(input) || input.endsWith(clean)))return null;
  Matcher values=NUMBER_OR_URL.matcher(suffix);while(values.find())if(!prefix.contains(values.group()))return null;
  return suffix;
 }
}
