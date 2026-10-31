package com.reandroid.xml.kxml2;

import org.junit.Assert;
import org.junit.Test;
import org.xmlpull.v1.XmlPullParser;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class KXmlParserLineNumberTest {

    @Test
    public void testLineNumbersAcrossBufferRefills() throws Exception {
        List<Integer> lines = new ArrayList<>();
        String xml = createDocument(3000, lines);
        // Far larger than the buffer, so it is refilled many times
        Assert.assertTrue(xml.length() > 8 * 8192);

        KXmlParser parser = new KXmlParser();
        assertLines(parser, xml, lines);
    }

    @Test
    public void testReusedParserStartsCountingOver() throws Exception {
        List<Integer> lines1 = new ArrayList<>();
        String xml1 = createDocument(200, lines1);
        List<Integer> lines2 = new ArrayList<>();
        String xml2 = createDocument(50, lines2);

        KXmlParser parser = new KXmlParser();
        assertLines(parser, xml1, lines1);
        assertLines(parser, xml2, lines2);
    }

    private static void assertLines(KXmlParser parser, String xml, List<Integer> lines) throws Exception {
        parser.setInput(new StringReader(xml));
        int element = 0;
        int event;
        while ((event = parser.next()) != XmlPullParser.END_DOCUMENT) {
            if (event != XmlPullParser.START_TAG || !parser.getName().equals("e")) {
                continue;
            }
            int expected = lines.get(element);
            Assert.assertEquals("element " + element, expected, parser.getLineNumber());
            // Asked again at the same place
            Assert.assertEquals("element " + element, expected, parser.getLineNumber());
            element++;
        }
        Assert.assertEquals(lines.size(), element);
    }

    /**
     * One element per line with blank and indented lines in between, and the line of each
     * element in lines.
     */
    private static String createDocument(int elements, List<Integer> lines) {
        Random random = new Random(elements);
        StringBuilder builder = new StringBuilder();
        builder.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<root>\n");
        int line = 3;
        for (int i = 0; i < elements; i++) {
            int blank = random.nextInt(4);
            for (int j = 0; j < blank; j++) {
                builder.append("   \n");
                line++;
            }
            builder.append("    <e name=\"element_").append(i).append("\" value=\"");
            int padding = random.nextInt(40);
            for (int j = 0; j < padding; j++) {
                builder.append('x');
            }
            builder.append("\"/>\n");
            lines.add(line);
            line++;
        }
        builder.append("</root>\n");
        return builder.toString();
    }
}
