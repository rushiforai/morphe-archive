package e.e.a;
/** Translate every native comment-settings spinner label, preserving its item index. */
public final class TranslationExtras220 {
 private TranslationExtras220(){}
 public static String[] array(String[] source){
  if(source==null)return new String[0];
  String[] output=source.clone();
  for(int i=0;i<output.length;i++) output[i]=UiStrings.translate(output[i]);
  return output;
 }
}
