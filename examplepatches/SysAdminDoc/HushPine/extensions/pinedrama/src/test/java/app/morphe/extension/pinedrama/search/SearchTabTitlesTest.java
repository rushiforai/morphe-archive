package app.morphe.extension.pinedrama.search;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import android.content.Context;
import android.text.SpannableString;

import app.morphe.extension.shared.Utils;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class SearchTabTitlesTest {
    private Context context;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
    }

    @Test
    public void theReportedPlaceholderAsksForTheDramaLabel() {
        assertSame(context, SearchTabTitles.dramaLabelContext("${drama_tab_name}", context));
    }

    @Test
    public void aDramaPlaceholderIsFoundWhateverItsCaseOrSpacing() {
        assertSame(context, SearchTabTitles.dramaLabelContext("  ${ Mini_Drama_Tab } ", context));
    }

    @Test
    public void aMissingContextFallsBackToTheAppsOwn() {
        assertSame(context, SearchTabTitles.dramaLabelContext("${drama_tab_name}", null));
    }

    @Test
    public void onlyADramaPlaceholderAsksForTheDramaLabel() {
        assertNull(SearchTabTitles.dramaLabelContext("${shop_tab_name}", context));
        assertNull(SearchTabTitles.dramaLabelContext("Drama", context));
        assertNull(SearchTabTitles.dramaLabelContext("dramas", context));
        assertNull(SearchTabTitles.dramaLabelContext("Best ${drama_tab_name}", context));
        assertNull(SearchTabTitles.dramaLabelContext(null, context));
    }

    @Test
    public void otherPlaceholdersBecomeWords() {
        assertEquals("Shop", SearchTabTitles.readable("${shop_tab_name}"));
        assertEquals("Live room", SearchTabTitles.readable("${live_room_tab_name}"));
        assertEquals("Place", SearchTabTitles.readable("${place_name}"));
        assertEquals("Music", SearchTabTitles.readable("${music}"));
    }

    @Test
    public void aDramaPlaceholderStillReadsWellWithoutTheAppsLabel() {
        assertEquals("Drama", SearchTabTitles.readable("${drama_tab_name}"));
    }

    @Test
    public void realTitlesPassThroughUntouched() {
        CharSequence styled = new SpannableString("Videos");
        assertSame(styled, SearchTabTitles.readable(styled));
        String priced = "Price ${amount}";
        assertSame(priced, SearchTabTitles.readable(priced));
        assertNull(SearchTabTitles.readable(null));
    }

    @Test
    public void aPlaceholderWithNoUsableNameIsLeftAlone() {
        assertEquals("${}", SearchTabTitles.readable("${}"));
        assertEquals("${_tab_name}", SearchTabTitles.readable("${_tab_name}"));
    }
}
