package dev.jason.gboardpatches.extension.sharedmodel;
import org.junit.Test;import java.util.*;import static org.junit.Assert.*;
public class GrammarRangeTest {
 private String apply(String original,List<GrammarEdits.Edit> edits){StringBuilder result=new StringBuilder(original);int end=original.length();for(int i=edits.size()-1;i>=0;i--){GrammarEdits.Edit e=edits.get(i);assertTrue(e.start>=0 && e.start<e.end && e.end<=end);assertFalse(e.start>0 && Character.isLowSurrogate(original.charAt(e.start)));result.replace(e.start,e.end,e.replacement);end=e.start;}return result.toString();}
 @Test public void correctTextHasNoEdits(){assertTrue(GrammarEdits.between("This is correct.","This is correct.").isEmpty());}
 @Test public void multipleCorrectionsMapToOriginalSnapshot(){String a="She dont have book.",b="She doesn't have a book.";List<GrammarEdits.Edit> e=GrammarEdits.between(a,b);assertFalse(e.isEmpty());assertEquals(b,apply(a,e));}
 @Test public void emojiAndAccentsUseUtf16Positions(){String a="😀 Elle est arrive.",b="😀 Elle est arrivée.";List<GrammarEdits.Edit> e=GrammarEdits.between(a,b);assertFalse(e.isEmpty());assertEquals(b,apply(a,e));}
 @Test public void insertionAtEndKeepsANonemptyNativeRange(){String a="Thank you",b="Thank you.";List<GrammarEdits.Edit> e=GrammarEdits.between(a,b);assertFalse(e.isEmpty());assertEquals(b,apply(a,e));}
 @Test public void deletionAndInsertedArticleReconstructExactly(){for(String[] pair:new String[][]{{"I have have a book.","I have a book."},{"She is happy","She is very happy"},{"😀hello","😀 hello"}}){List<GrammarEdits.Edit> e=GrammarEdits.between(pair[0],pair[1]);assertFalse(e.isEmpty());assertEquals(pair[1],apply(pair[0],e));}}
}
