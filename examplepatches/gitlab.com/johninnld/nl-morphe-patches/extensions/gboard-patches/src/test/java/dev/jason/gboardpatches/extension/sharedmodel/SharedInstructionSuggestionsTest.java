package dev.jason.gboardpatches.extension.sharedmodel;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=34,manifest=Config.NONE)
public class SharedInstructionSuggestionsTest {
 @Test public void zeroSuggestionsIsAValidNoChangesResult(){assertEquals(0,SharedInstructionSuggestions.parse("[]").length);}
 @Test public void fencedAndWrappedJsonPreserveTheActualInstructions(){assertArrayEquals(new String[]{"Make it friendlier"},SharedInstructionSuggestions.parse("```json\n[\"Make it friendlier\"]\n```"));assertArrayEquals(new String[]{"Shorten it"},SharedInstructionSuggestions.parse("{\"suggestions\":[\"Shorten it\"]}"));}
 @Test public void usefulInstructionsAreNotRejectedByTheOldUndocumented160CharacterLimit(){String instruction="a".repeat(200);assertEquals(instruction,SharedInstructionSuggestions.parse("[\""+instruction+"\"]")[0]);}
 @Test public void malformedOrUnboundedOutputIsNeverAnAction(){for(String text:new String[]{"not json","[1]","[\"\"]","[\"a\",\"b\",\"c\",\"d\"]","[\"a\"] trailing","[\""+"a".repeat(513)+"\"]"}){try{SharedInstructionSuggestions.parse(text);fail(text.substring(0,Math.min(20,text.length())));}catch(IllegalArgumentException expected){assertTrue(expected.getMessage().startsWith("SUGGESTIONS_"));}}}
 @Test public void duplicateSuggestionsDoNotProduceDuplicateButtons(){assertArrayEquals(new String[]{"Shorten it"},SharedInstructionSuggestions.parse("[\"Shorten it\",\"Shorten it\"]"));}
 @Test public void identicalSuggestionOutputCannotBecomeAnApplyAction() {
  String draft = "Veuillez envoyer la facture 1042 à Anaïs.";
  String equivalent = java.text.Normalizer.normalize(" " + draft + " ", java.text.Normalizer.Form.NFD);
  assertTrue(SharedTextActions.unchanged(draft, equivalent));
  assertFalse(SharedTextActions.unchanged(draft, "Pourriez-vous envoyer la facture 1042 à Anaïs ?"));
 }
}
