package dev.jason.gboardpatches.extension.sharedmodel;
import org.junit.Test;
import static org.junit.Assert.*;
public class VoiceEditModeTest {
 @Test public void ordinaryDictationIsUnchanged(){assertNull(VoiceEditPolicy.operation(false,"fix it"));assertNull(VoiceEditPolicy.operation(false,"make this professional"));}
 @Test public void quotedFixItDoesNotExecuteOutsideEditMode(){assertNull(VoiceEditPolicy.operation(false,"He said fix it."));}
 @Test public void explicitlyArmedFixUsesProofread(){assertEquals("proofread",VoiceEditPolicy.operation(true,"Fix it!"));}
 @Test public void explicitCustomCommandStaysAnInstruction(){assertEquals("edit",VoiceEditPolicy.operation(true,"Change 12 to 14"));}
 @Test public void emptyTranscriptCannotEdit(){assertNull(VoiceEditPolicy.operation(true," "));}
}
