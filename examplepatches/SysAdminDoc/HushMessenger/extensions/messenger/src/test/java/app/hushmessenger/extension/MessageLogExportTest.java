package app.hushmessenger.extension;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class MessageLogExportTest {
    private static final MessageLogExport.Labels LABELS = new MessageLogExport.Labels("Unknown chat", "Unsent", "No text");
    private static final long JAN = 1767268800000L;

    private static String stamp(long time) {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.US).format(new Date(time));
    }

    @Test public void textGroupsByChatMostRecentFirstWithMessagesInTheOrderTheyCame() {
        String text = MessageLogExport.text(List.of(
            new MessageLog.Entry(JAN + 3000, "t2", "third", "Ben", "Trip", "mid.3", false),
            new MessageLog.Entry(JAN + 2000, "t1", "second", "Ana", "", "mid.2", false),
            new MessageLog.Entry(JAN + 1000, "t2", "first", "Ana", "Trip", "mid.1", false)), LABELS);
        assertEquals("== Trip ==\n\n"
            + stamp(JAN + 1000) + "  Ana\nfirst\n\n"
            + stamp(JAN + 3000) + "  Ben\nthird\n\n"
            + "\n== Ana ==\n\n"
            + stamp(JAN + 2000) + "  Ana\nsecond\n\n", text);
    }

    @Test public void textSaysWhatsUnsentEmptyOrUnnamed() {
        String text = MessageLogExport.text(List.of(
            new MessageLog.Entry(JAN, "t", "", "", "", "mid.1", true)), LABELS);
        assertEquals("== Unknown chat ==\n\n" + stamp(JAN) + "  (Unsent)\nNo text\n\n", text);
    }

    @Test public void csvStartsWithTheMarkExcelNeedsAndHasOneRowPerMessageOldestFirst() {
        String csv = MessageLogExport.csv(List.of(
            new MessageLog.Entry(JAN + 2000, "t1", "second", "Ana", "", "mid.2", true),
            new MessageLog.Entry(JAN + 1000, "t2", "first", "Ben", "Trip", "mid.1", false)), LABELS);
        assertEquals((char) 0xFEFF + "Date,Chat,Sender,Message,Unsent\r\n"
            + stamp(JAN + 1000) + ",\"Trip\",\"Ben\",\"first\",\r\n"
            + stamp(JAN + 2000) + ",\"Ana\",\"Ana\",\"second\",yes\r\n", csv);
    }

    @Test public void csvKeepsQuotesCommasAndLineBreaksInsideOneCell() {
        assertEquals("\"she said \"\"hi, you\"\"\nthen left\"", MessageLogExport.cell("she said \"hi, you\"\nthen left"));
    }

    @Test public void aMessageCantRunAsASpreadsheetFormula() {
        for (String attack : new String[] {"=HYPERLINK(\"http://x\")", "+1+1", "-1+1", "@SUM(A1)", "\tcmd", "\rcmd"}) {
            String cell = MessageLogExport.cell(attack);
            assertEquals(attack, '\'', cell.charAt(1));
        }
        assertEquals("\"plain = text\"", MessageLogExport.cell("plain = text"));
        assertEquals("\"\"", MessageLogExport.cell(""));
    }

    @Test public void fileNamesCarryTheDateTheFormatAndTheMonth() {
        String day = new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date(JAN));
        assertEquals("Messenger log " + day + ".txt", MessageLogExport.fileName(MessageLogExport.TEXT, JAN));
        assertEquals("Messenger log " + day + ".csv", MessageLogExport.fileName(MessageLogExport.CSV, JAN));
        assertEquals("Messenger log " + day.substring(0, 7) + ".txt", MessageLogExport.monthlyName(JAN));
        assertEquals("text/plain", MessageLogExport.mime(MessageLogExport.TEXT));
        assertEquals("text/csv", MessageLogExport.mime(MessageLogExport.CSV));
    }
}
