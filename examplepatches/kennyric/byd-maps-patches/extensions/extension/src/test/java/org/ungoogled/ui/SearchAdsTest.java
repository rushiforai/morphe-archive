package org.ungoogled.ui;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;
public class SearchAdsTest {
    public static class Row { public int b, c; Row(int flags,int kind){b=flags;c=kind;} }
    @Test public void removesOnlySponsoredOneofCaseRegardlessOfServerDrivenFlag() {
        Row normal=new Row(1,2), ad=new Row(0,5), other=new Row(1,8);
        List<?> result=SearchAds.filter(Arrays.asList(normal,ad,other),true);
        assertEquals(Arrays.asList(normal,other),result);
    }
    @Test public void disabledSwitchPreservesOriginalListAndUnknownRowsSurvive() {
        List<?> rows=Arrays.asList(new Object(),null,new Row(1,2));
        assertSame(rows,SearchAds.filter(rows,false));assertEquals(rows,SearchAds.filter(rows,true));assertNull(SearchAds.filter(null,true));
    }
}
