package com.feurstagram.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import org.junit.Test;

/** The link cleaner's own table (ShareLinks.selfCheck, which nothing used to run) and its edges. */
public class ShareLinksTest {

    @Test
    public void selfCheckPasses() {
        ShareLinks.selfCheck();
    }

    @Test
    public void onlyInstagramUrlsInsideTheTextAreTouched() {
        assertEquals("See https://www.instagram.com/p/ABC/ and https://example.com/?igsh=1",
                ShareLinks.clean("See https://www.instagram.com/p/ABC/?igsh=1 and https://example.com/?igsh=1"));
        assertEquals("backup code 1234 is not a link", ShareLinks.clean("backup code 1234 is not a link"));
    }

    @Test
    public void untouchedTextComesBackAsTheSameObject() {
        CharSequence styled = new StringBuilder("https://www.instagram.com/p/ABC/");
        assertSame(styled, ShareLinks.clean(styled));
        assertNull(ShareLinks.clean((String) null));
    }

    @Test
    public void functionalParametersStayInOrder() {
        assertEquals("https://www.instagram.com/p/ABC/?img_index=2&comment_id=7#x",
                ShareLinks.cleanUrl("https://www.instagram.com/p/ABC/?utm_source=a&img_index=2&comment_id=7&igsh=b#x"));
    }
}
