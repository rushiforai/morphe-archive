package app.aidan.extension.adobescan;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.junit.Test;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Element;

public class OfficeDocumentWriterTest {

    private Map<String, byte[]> unzipAll(final byte[] zipBytes) throws Exception {
        final Map<String, byte[]> map = new HashMap<>();
        try (final ZipInputStream zis = new ZipInputStream(new ByteArrayInputStream(zipBytes))) {
            ZipEntry entry;
            while ((entry = zis.getNextEntry()) != null) {
                if (!entry.isDirectory()) {
                    final ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    final byte[] buf = new byte[4096];
                    int r;
                    while ((r = zis.read(buf)) != -1) {
                        baos.write(buf, 0, r);
                    }
                    map.put(entry.getName(), baos.toByteArray());
                }
                zis.closeEntry();
            }
        }
        return map;
    }

    private Document parseXml(final byte[] xmlBytes) throws Exception {
        final DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setNamespaceAware(true);
        final DocumentBuilder db = dbf.newDocumentBuilder();
        return db.parse(new ByteArrayInputStream(xmlBytes));
    }

    @Test
    public void testDocxGenerationAndXmlValidity() throws Exception {
        final List<PdfPageLayout.Word> words = Arrays.asList(
                new PdfPageLayout.Word("Item", 0.1f, 0.1f, 0.2f, 0.12f),
                new PdfPageLayout.Word("Price", 0.6f, 0.1f, 0.7f, 0.12f),
                new PdfPageLayout.Word("Widget", 0.1f, 0.15f, 0.25f, 0.17f),
                new PdfPageLayout.Word("$10.00", 0.6f, 0.15f, 0.75f, 0.17f),
                new PdfPageLayout.Word("XML <special> & 'quote' \"test\"", 0.1f, 0.3f, 0.5f, 0.32f)
        );

        final PdfPageLayout page1 = new PdfPageLayout(0, 612f, 792f, words);
        final PdfPageLayout page2Blank = new PdfPageLayout(1, 612f, 792f, Collections.<PdfPageLayout.Word>emptyList());

        final ByteArrayOutputStream baos = new ByteArrayOutputStream();
        OfficeDocumentWriter.writeDocx(Arrays.asList(page1, page2Blank), baos);
        final byte[] zipBytes = baos.toByteArray();

        final Map<String, byte[]> entries = unzipAll(zipBytes);
        assertTrue(entries.containsKey("[Content_Types].xml"));
        assertTrue(entries.containsKey("_rels/.rels"));
        assertTrue(entries.containsKey("word/document.xml"));

        // Validate XML well-formedness using independent DOM parser
        final Document docXml = parseXml(entries.get("word/document.xml"));
        final NodeList pNodes = docXml.getElementsByTagNameNS("http://schemas.openxmlformats.org/wordprocessingml/2006/main", "p");
        assertTrue(pNodes.getLength() > 0);

        final String textContent = docXml.getDocumentElement().getTextContent();
        assertTrue(textContent.contains("Widget"));
        assertTrue(textContent.contains("XML <special> & 'quote' \"test\""));
    }

    @Test
    public void testXlsxPreservesLeadingZerosAndFormulasAsText() throws Exception {
        final List<PdfPageLayout.Word> words = Arrays.asList(
                new PdfPageLayout.Word("Code", 0.1f, 0.1f, 0.2f, 0.12f),
                new PdfPageLayout.Word("Formula", 0.6f, 0.1f, 0.7f, 0.12f),
                new PdfPageLayout.Word("007", 0.1f, 0.15f, 0.2f, 0.17f),
                new PdfPageLayout.Word("=SUM(A1:B2)", 0.6f, 0.15f, 0.8f, 0.17f)
        );

        final PdfPageLayout page = new PdfPageLayout(0, 612f, 792f, words);
        final ByteArrayOutputStream baos = new ByteArrayOutputStream();
        OfficeDocumentWriter.writeXlsx(Collections.singletonList(page), baos);
        final byte[] zipBytes = baos.toByteArray();

        final Map<String, byte[]> entries = unzipAll(zipBytes);
        assertTrue(entries.containsKey("[Content_Types].xml"));
        assertTrue(entries.containsKey("xl/workbook.xml"));
        assertTrue(entries.containsKey("xl/worksheets/sheet1.xml"));

        final Document sheetXml = parseXml(entries.get("xl/worksheets/sheet1.xml"));
        final NodeList cells = sheetXml.getElementsByTagName("c");
        assertTrue(cells.getLength() >= 2);

        // Verify cell type is inlineStr (not numeric or formula)
        for (int i = 0; i < cells.getLength(); i++) {
            assertEquals("inlineStr", cells.item(i).getAttributes().getNamedItem("t").getNodeValue());
        }

        final String text = sheetXml.getDocumentElement().getTextContent();
        assertTrue(text.contains("007"));
        assertTrue(text.contains("=SUM(A1:B2)"));
    }

    @Test
    public void testPptxSlideStructureAndBoxes() throws Exception {
        final List<PdfPageLayout.Word> words = Arrays.asList(
                new PdfPageLayout.Word("Slide", 0.1f, 0.1f, 0.3f, 0.15f),
                new PdfPageLayout.Word("Title", 0.32f, 0.1f, 0.5f, 0.15f),
                new PdfPageLayout.Word("Body", 0.1f, 0.3f, 0.3f, 0.35f),
                new PdfPageLayout.Word("Text", 0.32f, 0.3f, 0.5f, 0.35f)
        );

        final PdfPageLayout page1 = new PdfPageLayout(0, 612f, 792f, words);
        final ByteArrayOutputStream baos = new ByteArrayOutputStream();
        OfficeDocumentWriter.writePptx(Collections.singletonList(page1), baos);
        final byte[] zipBytes = baos.toByteArray();

        final Map<String, byte[]> entries = unzipAll(zipBytes);
        assertTrue(entries.containsKey("[Content_Types].xml"));
        assertTrue(entries.containsKey("ppt/presentation.xml"));
        assertTrue(entries.containsKey("ppt/slides/slide1.xml"));
        assertTrue(entries.containsKey("ppt/slides/_rels/slide1.xml.rels"));

        assertTrue(entries.containsKey("ppt/slideLayouts/_rels/slideLayout1.xml.rels"));
        final Document layoutRelsXml = parseXml(entries.get("ppt/slideLayouts/_rels/slideLayout1.xml.rels"));
        final NodeList relNodes = layoutRelsXml.getElementsByTagName("Relationship");
        boolean foundSlideMasterRel = false;
        for (int i = 0; i < relNodes.getLength(); i++) {
            final Element el = (Element) relNodes.item(i);
            if ("http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster".equals(el.getAttribute("Type"))
                    && "../slideMasters/slideMaster1.xml".equals(el.getAttribute("Target"))) {
                foundSlideMasterRel = true;
                break;
            }
        }
        assertTrue(foundSlideMasterRel);
        final Document slideXml = parseXml(entries.get("ppt/slides/slide1.xml"));
        final NodeList spNodes = slideXml.getElementsByTagNameNS("http://schemas.openxmlformats.org/presentationml/2006/main", "sp");
        assertTrue(spNodes.getLength() > 0);

        final String slideText = slideXml.getDocumentElement().getTextContent();
        assertTrue(slideText.contains("Slide Title"));
        assertTrue(slideText.contains("Body Text"));

        final Document presXml = parseXml(entries.get("ppt/presentation.xml"));
        final NodeList notesSz = presXml.getElementsByTagNameNS("http://schemas.openxmlformats.org/presentationml/2006/main", "notesSz");
        assertEquals(1, notesSz.getLength());
    }

    @Test
    public void testSingleMultiColumnLineFollowedByParagraph() {
        final List<PdfPageLayout.Word> words = Arrays.asList(
                new PdfPageLayout.Word("Item", 0.1f, 0.1f, 0.2f, 0.12f),
                new PdfPageLayout.Word("Price", 0.6f, 0.1f, 0.7f, 0.12f),
                new PdfPageLayout.Word("This", 0.1f, 0.2f, 0.2f, 0.22f),
                new PdfPageLayout.Word("is", 0.22f, 0.2f, 0.26f, 0.22f),
                new PdfPageLayout.Word("a", 0.28f, 0.2f, 0.30f, 0.22f),
                new PdfPageLayout.Word("paragraph", 0.32f, 0.2f, 0.50f, 0.22f)
        );

        final PdfPageLayout page = new PdfPageLayout(0, 612f, 792f, words);
        assertTrue("Single multi-column row should not form a table", page.tables.isEmpty());
        assertEquals("Should have reconstructed paragraphs from non-table lines", 2, page.paragraphs.size());
        assertEquals("Item Price", page.paragraphs.get(0).text());
        assertEquals("This is a paragraph", page.paragraphs.get(1).text());
    }

    @Test
    public void testZipStreamsLeaveUnderlyingStreamOpen() throws Exception {
        final java.util.concurrent.atomic.AtomicBoolean closed = new java.util.concurrent.atomic.AtomicBoolean(false);
        final ByteArrayOutputStream baos = new ByteArrayOutputStream() {
            @Override
            public void close() throws IOException {
                closed.set(true);
                super.close();
            }
        };

        final PdfPageLayout page = new PdfPageLayout(0, 612f, 792f, Collections.<PdfPageLayout.Word>emptyList());
        OfficeDocumentWriter.writeDocx(Collections.singletonList(page), baos);
        assertFalse("writeDocx must not close underlying OutputStream", closed.get());
        assertTrue("Zip data must be flushed", baos.size() > 0);

        baos.reset();
        closed.set(false);
        OfficeDocumentWriter.writeXlsx(Collections.singletonList(page), baos);
        assertFalse("writeXlsx must not close underlying OutputStream", closed.get());
        assertTrue("Zip data must be flushed", baos.size() > 0);

        baos.reset();
        closed.set(false);
        OfficeDocumentWriter.writePptx(Collections.singletonList(page), baos);
        assertFalse("writePptx must not close underlying OutputStream", closed.get());
        assertTrue("Zip data must be flushed", baos.size() > 0);
    }
}
