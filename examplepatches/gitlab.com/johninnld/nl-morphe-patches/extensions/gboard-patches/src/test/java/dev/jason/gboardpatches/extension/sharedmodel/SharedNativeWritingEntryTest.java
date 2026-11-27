package dev.jason.gboardpatches.extension.sharedmodel;
import org.junit.Test;
import static org.junit.Assert.*;
public class SharedNativeWritingEntryTest {
 @Test public void nativeDisabledButtonUsesActualLocalReadiness(){assertEquals(2,SharedNativeWritingEntry.resolve(4,true,true,true));assertEquals(4,SharedNativeWritingEntry.resolve(2,true,false,true));}
 @Test public void protectedEditorsStayDisabled(){assertEquals(4,SharedNativeWritingEntry.resolve(2,true,true,false));}
 @Test public void otherBackendsAndNativeSuppressionRemainUntouched(){assertEquals(6,SharedNativeWritingEntry.resolve(6,false,true,true));assertEquals(3,SharedNativeWritingEntry.resolve(3,true,true,true));}
}
