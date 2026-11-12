package app.morphe.extension.chmate;

public final class OutgoingPostCleanupTest {
    public static void main(String[] args){
        String[][] cases={{"前� 後","前 後"},{"� \n�\t末尾 "," \n\t末尾 "},{"&#65533; &#xFFFD; &#X00fffd;","  "},{"&#00065533;",""},{"&amp;#65533;","&amp;#65533;"},{"😀 ⚓\ufe0f 👩\u200d💻 𠮷\udb40\udd00","😀 ⚓\ufe0f 👩\u200d💻 𠮷\udb40\udd00"},{"\ufffc\ufffe","\ufffc\ufffe"},{"�",""},{"", ""},{"普通の本文と U+FFFD の説明","普通の本文と U+FFFD の説明"}};
        int checks=0;for(String[] pair:cases){if(!java.util.Objects.equals(pair[1],OutgoingPostCleanup.apply(pair[0])))throw new AssertionError("cleanup case "+checks);checks++;}
        if(OutgoingPostCleanup.apply(null)!=null)throw new AssertionError("null");checks++;
        String valid="unchanged text";if(OutgoingPostCleanup.apply(valid)!=valid)throw new AssertionError("unchanged body identity");checks++;
        System.out.println("PASS "+checks+" outgoing replacement-glyph/space/newline/Unicode cases");
    }
}
