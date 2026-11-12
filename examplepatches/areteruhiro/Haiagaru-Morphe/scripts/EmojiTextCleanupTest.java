package app.morphe.extension.chmate;
public final class EmojiTextCleanupTest {
 public static void main(String[] args){int checks=0;
  String[][] cases={{"⚓\ufe0f","⚓"},{"⚓\ufe0e","⚓"},{"⚓&#65039;","⚓"},{"⚓&#xFE0F;","⚓"},{"a&#x00fe0e;b","ab"},{"👩\u200d💻","👩\u200d💻"},{"1\ufe0f\u20e3","1\u20e3"},{"漢\udb40\udd00","漢\udb40\udd00"},{"\ufffd","\ufffd"},{"abc<&>","abc<&>"}};
  for(String[] c:cases){if(!c[1].equals(EmojiTextCleanup.apply(c[0])))throw new AssertionError(c[0]);checks++;}
  if(EmojiTextCleanup.apply(null)!=null)throw new AssertionError("null");checks++;
  EmojiTextCleanup.enabled=false;if(!EmojiTextCleanup.apply("⚓\ufe0f").equals("⚓\ufe0f"))throw new AssertionError("OFF");checks++;
  EmojiTextCleanup.enabled=true;
  System.out.println("PASS "+checks+" selector/literal/NCR/ZWJ/keycap/IVS/OFF checks");
 }
}
