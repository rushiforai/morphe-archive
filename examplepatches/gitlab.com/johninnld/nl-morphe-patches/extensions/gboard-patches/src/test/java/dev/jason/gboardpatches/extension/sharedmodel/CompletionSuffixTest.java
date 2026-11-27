package dev.jason.gboardpatches.extension.sharedmodel;
import org.junit.Test;
import static org.junit.Assert.*;
public class CompletionSuffixTest {
 @Test public void validSuffixPreservesItsLeadingSpace(){assertEquals(" there",CompletionSuffix.checked("I will meet you"," there"));}
 @Test public void echoAndQuotesAreRejected(){assertNull(CompletionSuffix.checked("See you soon","See you soon again"));assertNull(CompletionSuffix.checked("See you soon","soon"));assertNull(CompletionSuffix.checked("See you soon","\" tomorrow\""));}
 @Test public void noInventedNumbersOrUrls(){assertNull(CompletionSuffix.checked("Our meeting is"," at 14:30"));assertNull(CompletionSuffix.checked("Our page is"," https://example.org"));assertEquals(" at 14:30",CompletionSuffix.checked("The time is 14:30. Meet me"," at 14:30"));}
 @Test public void emptyPreambleAndDialogueLeakAreRejected(){for(String value:new String[]{""," ","Sure, here you go","Here is the answer","\nDriver: hello","<start_of_turn>model"})assertNull(CompletionSuffix.checked("This is enough text",value));}
}
