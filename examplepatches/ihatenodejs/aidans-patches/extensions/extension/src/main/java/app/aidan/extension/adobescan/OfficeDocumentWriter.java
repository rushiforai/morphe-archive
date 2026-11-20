package app.aidan.extension.adobescan;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public final class OfficeDocumentWriter {

    private OfficeDocumentWriter() {}

    public static String escapeXml(final String s) {
        if (s == null) return "";
        final StringBuilder sb = new StringBuilder(s.length() + 16);
        for (int i = 0; i < s.length(); i++) {
            final char c = s.charAt(i);
            if ((c >= 0x00 && c <= 0x08) || c == 0x0B || c == 0x0C || (c >= 0x0E && c <= 0x1F)) {
                continue; // Strip prohibited XML 1.0 control characters
            }
            switch (c) {
                case '&':
                    sb.append("&amp;");
                    break;
                case '<':
                    sb.append("&lt;");
                    break;
                case '>':
                    sb.append("&gt;");
                    break;
                case '"':
                    sb.append("&quot;");
                    break;
                case '\'':
                    sb.append("&apos;");
                    break;
                default:
                    sb.append(c);
                    break;
            }
        }
        return sb.toString();
    }

    // =========================================================================
    // DOCX WRITER
    // =========================================================================

    public static void writeDocx(final List<PdfPageLayout> pages, final OutputStream out) throws IOException {
        try (final ZipOutputStream zos = new ZipOutputStream(new NonClosingOutputStream(out))) {
            putZipEntry(zos, "[Content_Types].xml",
                    "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n" +
                    "<Types xmlns=\"http://schemas.openxmlformats.org/package/2006/content-types\">\n" +
                    "  <Default Extension=\"rels\" ContentType=\"application/vnd.openxmlformats-package.relationships+xml\"/>\n" +
                    "  <Default Extension=\"xml\" ContentType=\"application/xml\"/>\n" +
                    "  <Override PartName=\"/word/document.xml\" ContentType=\"application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml\"/>\n" +
                    "</Types>");

            // 2. _rels/.rels
            putZipEntry(zos, "_rels/.rels",
                    "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n" +
                    "<Relationships xmlns=\"http://schemas.openxmlformats.org/package/2006/relationships\">\n" +
                    "  <Relationship Id=\"rId1\" Type=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument\" Target=\"word/document.xml\"/>\n" +
                    "</Relationships>");

            // 3. word/document.xml
            final StringBuilder doc = new StringBuilder();
            doc.append("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n");
            doc.append("<w:document xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\">\n");
            doc.append("  <w:body>\n");

            for (int pIdx = 0; pIdx < pages.size(); pIdx++) {
                final PdfPageLayout page = pages.get(pIdx);
                if (pIdx > 0) {
                    doc.append("    <w:p><w:r><w:br w:type=\"page\"/></w:r></w:p>\n");
                }

                // Write tables if any
                for (final PdfPageLayout.Table table : page.tables) {
                    doc.append("    <w:tbl>\n");
                    doc.append("      <w:tblPr><w:tblW w:w=\"0\" w:type=\"auto\"/><w:tblBorders>" +
                            "<w:top w:val=\"single\" w:sz=\"4\" w:space=\"0\" w:color=\"auto\"/>" +
                            "<w:left w:val=\"single\" w:sz=\"4\" w:space=\"0\" w:color=\"auto\"/>" +
                            "<w:bottom w:val=\"single\" w:sz=\"4\" w:space=\"0\" w:color=\"auto\"/>" +
                            "<w:right w:val=\"single\" w:sz=\"4\" w:space=\"0\" w:color=\"auto\"/>" +
                            "<w:insideH w:val=\"single\" w:sz=\"4\" w:space=\"0\" w:color=\"auto\"/>" +
                            "<w:insideV w:val=\"single\" w:sz=\"4\" w:space=\"0\" w:color=\"auto\"/>" +
                            "</w:tblBorders></w:tblPr>\n");
                    for (final List<String> row : table.rows) {
                        doc.append("      <w:tr>\n");
                        for (final String cell : row) {
                            doc.append("        <w:tc><w:p><w:r><w:t>")
                                    .append(escapeXml(cell))
                                    .append("</w:t></w:r></w:p></w:tc>\n");
                        }
                        doc.append("      </w:tr>\n");
                    }
                    doc.append("    </w:tbl>\n");
                }

                // Write paragraphs
                for (final PdfPageLayout.Paragraph para : page.paragraphs) {
                    doc.append("    <w:p>\n");
                    for (int lIdx = 0; lIdx < para.lines.size(); lIdx++) {
                        final PdfPageLayout.Line line = para.lines.get(lIdx);
                        if (lIdx > 0) {
                            doc.append("<w:r><w:br/></w:r>");
                        }
                        doc.append("<w:r><w:t xml:space=\"preserve\">")
                                .append(escapeXml(line.text()))
                                .append("</w:t></w:r>");
                    }
                    doc.append("</w:p>\n");
                }

                // If page had neither paragraphs nor tables, emit empty paragraph
                if (page.paragraphs.isEmpty() && page.tables.isEmpty()) {
                    doc.append("    <w:p/>\n");
                }
            }

            // Standard page size: Letter (12240 x 15840 dxa = 8.5 x 11 in)
            doc.append("    <w:sectPr><w:pgSz w:w=\"12240\" w:h=\"15840\"/></w:sectPr>\n");
            doc.append("  </w:body>\n");
            doc.append("</w:document>");

            putZipEntry(zos, "word/document.xml", doc.toString());
            zos.finish();
            zos.flush();
        }
    }

    // =========================================================================
    // XLSX WRITER
    // =========================================================================

    public static void writeXlsx(final List<PdfPageLayout> pages, final OutputStream out) throws IOException {
        try (final ZipOutputStream zos = new ZipOutputStream(new NonClosingOutputStream(out))) {
        final int pageCount = Math.max(1, pages.size());
            // 1. [Content_Types].xml
            final StringBuilder types = new StringBuilder();
            types.append("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n");
            types.append("<Types xmlns=\"http://schemas.openxmlformats.org/package/2006/content-types\">\n");
            types.append("  <Default Extension=\"rels\" ContentType=\"application/vnd.openxmlformats-package.relationships+xml\"/>\n");
            types.append("  <Default Extension=\"xml\" ContentType=\"application/xml\"/>\n");
            types.append("  <Override PartName=\"/xl/workbook.xml\" ContentType=\"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml\"/>\n");
            for (int i = 1; i <= pageCount; i++) {
                types.append("  <Override PartName=\"/xl/worksheets/sheet").append(i)
                        .append(".xml\" ContentType=\"application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml\"/>\n");
            }
            types.append("</Types>");
            putZipEntry(zos, "[Content_Types].xml", types.toString());

            // 2. _rels/.rels
            putZipEntry(zos, "_rels/.rels",
                    "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n" +
                    "<Relationships xmlns=\"http://schemas.openxmlformats.org/package/2006/relationships\">\n" +
                    "  <Relationship Id=\"rId1\" Type=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument\" Target=\"xl/workbook.xml\"/>\n" +
                    "</Relationships>");

            // 3. xl/_rels/workbook.xml.rels
            final StringBuilder wbRels = new StringBuilder();
            wbRels.append("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n");
            wbRels.append("<Relationships xmlns=\"http://schemas.openxmlformats.org/package/2006/relationships\">\n");
            for (int i = 1; i <= pageCount; i++) {
                wbRels.append("  <Relationship Id=\"rId").append(i)
                        .append("\" Type=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet\" Target=\"worksheets/sheet")
                        .append(i).append(".xml\"/>\n");
            }
            wbRels.append("</Relationships>");
            putZipEntry(zos, "xl/_rels/workbook.xml.rels", wbRels.toString());

            // 4. xl/workbook.xml
            final StringBuilder wb = new StringBuilder();
            wb.append("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n");
            wb.append("<workbook xmlns=\"http://schemas.openxmlformats.org/spreadsheetml/2006/main\" xmlns:r=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships\">\n");
            wb.append("  <sheets>\n");
            for (int i = 1; i <= pageCount; i++) {
                wb.append("    <sheet name=\"Page ").append(i).append("\" sheetId=\"").append(i)
                        .append("\" r:id=\"rId").append(i).append("\"/>\n");
            }
            wb.append("  </sheets>\n");
            wb.append("</workbook>");
            putZipEntry(zos, "xl/workbook.xml", wb.toString());

            // 5. xl/worksheets/sheetN.xml
            for (int pIdx = 0; pIdx < pageCount; pIdx++) {
                final PdfPageLayout page = (pIdx < pages.size()) ? pages.get(pIdx) : null;
                final StringBuilder sheet = new StringBuilder();
                sheet.append("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n");
                sheet.append("<worksheet xmlns=\"http://schemas.openxmlformats.org/spreadsheetml/2006/main\">\n");
                sheet.append("  <sheetData>\n");

                int rowNum = 1;

                if (page != null) {
                    // Output tables first
                    for (final PdfPageLayout.Table table : page.tables) {
                        for (final List<String> row : table.rows) {
                            sheet.append("    <row r=\"").append(rowNum).append("\">\n");
                            for (int colIdx = 0; colIdx < row.size(); colIdx++) {
                                final String colName = getColumnName(colIdx);
                                final String cellRef = colName + rowNum;
                                final String val = row.get(colIdx);
                                sheet.append("      <c r=\"").append(cellRef).append("\" t=\"inlineStr\"><is><t>")
                                        .append(escapeXml(val))
                                        .append("</t></is></c>\n");
                            }
                            sheet.append("    </row>\n");
                            rowNum++;
                        }
                    }

                    // Output non-table lines as text rows in column A
                    for (final PdfPageLayout.Paragraph para : page.paragraphs) {
                        for (final PdfPageLayout.Line line : para.lines) {
                            sheet.append("    <row r=\"").append(rowNum).append("\">\n");
                            sheet.append("      <c r=\"A").append(rowNum).append("\" t=\"inlineStr\"><is><t>")
                                    .append(escapeXml(line.text()))
                                    .append("</t></is></c>\n");
                            sheet.append("    </row>\n");
                            rowNum++;
                        }
                    }
                }

                if (rowNum == 1) {
                    // Empty sheet
                    sheet.append("    <row r=\"1\"><c r=\"A1\" t=\"inlineStr\"><is><t/></is></c></row>\n");
                }

                sheet.append("  </sheetData>\n");
                sheet.append("</worksheet>");

                putZipEntry(zos, "xl/worksheets/sheet" + (pIdx + 1) + ".xml", sheet.toString());
            }

            zos.finish();
            zos.flush();
        }
    }

    // =========================================================================
    // PPTX WRITER
    // =========================================================================

    public static void writePptx(final List<PdfPageLayout> pages, final OutputStream out) throws IOException {
        try (final ZipOutputStream zos = new ZipOutputStream(new NonClosingOutputStream(out))) {
        final int pageCount = Math.max(1, pages.size());
            // 1. [Content_Types].xml
            final StringBuilder types = new StringBuilder();
            types.append("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n");
            types.append("<Types xmlns=\"http://schemas.openxmlformats.org/package/2006/content-types\">\n");
            types.append("  <Default Extension=\"rels\" ContentType=\"application/vnd.openxmlformats-package.relationships+xml\"/>\n");
            types.append("  <Default Extension=\"xml\" ContentType=\"application/xml\"/>\n");
            types.append("  <Override PartName=\"/ppt/presentation.xml\" ContentType=\"application/vnd.openxmlformats-officedocument.presentationml.presentation.main+xml\"/>\n");
            types.append("  <Override PartName=\"/ppt/slideMasters/slideMaster1.xml\" ContentType=\"application/vnd.openxmlformats-officedocument.presentationml.slideMaster+xml\"/>\n");
            types.append("  <Override PartName=\"/ppt/slideLayouts/slideLayout1.xml\" ContentType=\"application/vnd.openxmlformats-officedocument.presentationml.slideLayout+xml\"/>\n");
            for (int i = 1; i <= pageCount; i++) {
                types.append("  <Override PartName=\"/ppt/slides/slide").append(i)
                        .append(".xml\" ContentType=\"application/vnd.openxmlformats-officedocument.presentationml.slide+xml\"/>\n");
            }
            types.append("</Types>");
            putZipEntry(zos, "[Content_Types].xml", types.toString());

            // 2. _rels/.rels
            putZipEntry(zos, "_rels/.rels",
                    "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n" +
                    "<Relationships xmlns=\"http://schemas.openxmlformats.org/package/2006/relationships\">\n" +
                    "  <Relationship Id=\"rId1\" Type=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument\" Target=\"ppt/presentation.xml\"/>\n" +
                    "</Relationships>");

            // 3. ppt/_rels/presentation.xml.rels
            final StringBuilder presRels = new StringBuilder();
            presRels.append("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n");
            presRels.append("<Relationships xmlns=\"http://schemas.openxmlformats.org/package/2006/relationships\">\n");
            presRels.append("  <Relationship Id=\"rIdMaster1\" Type=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster\" Target=\"slideMasters/slideMaster1.xml\"/>\n");
            for (int i = 1; i <= pageCount; i++) {
                presRels.append("  <Relationship Id=\"rIdSlide").append(i)
                        .append("\" Type=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide\" Target=\"slides/slide")
                        .append(i).append(".xml\"/>\n");
            }
            presRels.append("</Relationships>");
            putZipEntry(zos, "ppt/_rels/presentation.xml.rels", presRels.toString());

            // 4. ppt/presentation.xml
            final StringBuilder pres = new StringBuilder();
            pres.append("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n");
            pres.append("<p:presentation xmlns:p=\"http://schemas.openxmlformats.org/presentationml/2006/main\" xmlns:r=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships\">\n");
            pres.append("  <p:sldMasterIdLst><p:sldMasterId id=\"2147483648\" r:id=\"rIdMaster1\"/></p:sldMasterIdLst>\n");
            pres.append("  <p:sldIdLst>\n");
            for (int i = 1; i <= pageCount; i++) {
                pres.append("    <p:sldId id=\"").append(255 + i).append("\" r:id=\"rIdSlide").append(i).append("\"/>\n");
            }
            pres.append("  </p:sldIdLst>\n");
            pres.append("  <p:sldSz cx=\"9144000\" cy=\"6858000\"/>\n"); // 10 x 7.5 in (4:3 in EMUs)
            pres.append("  <p:notesSz cx=\"6858000\" cy=\"9144000\"/>\n");
            pres.append("</p:presentation>");
            putZipEntry(zos, "ppt/presentation.xml", pres.toString());

            // 5. ppt/slideMasters/slideMaster1.xml
            putZipEntry(zos, "ppt/slideMasters/slideMaster1.xml",
                    "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n" +
                    "<p:sldMaster xmlns:p=\"http://schemas.openxmlformats.org/presentationml/2006/main\" xmlns:a=\"http://schemas.openxmlformats.org/drawingml/2006/main\" xmlns:r=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships\">\n" +
                    "  <p:cSld><p:spTree><p:nvGrpSpPr><p:cNvPr id=\"1\" name=\"\"/><p:cNvGrpSpPr/><p:grpSpPr/></p:nvGrpSpPr><p:grpSpPr/></p:spTree></p:cSld>\n" +
                    "  <p:clrMap bg1=\"lt1\" tx1=\"dk1\" bg2=\"lt2\" tx2=\"dk2\" accent1=\"accent1\" accent2=\"accent2\" accent3=\"accent3\" accent4=\"accent4\" accent5=\"accent5\" accent6=\"accent6\" hlink=\"hlink\" folHlink=\"folHlink\"/>\n" +
                    "  <p:sldLayoutIdLst><p:sldLayoutId id=\"2147483649\" r:id=\"rIdLayout1\"/></p:sldLayoutIdLst>\n" +
                    "</p:sldMaster>");

            // 6. ppt/slideMasters/_rels/slideMaster1.xml.rels
            putZipEntry(zos, "ppt/slideMasters/_rels/slideMaster1.xml.rels",
                    "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n" +
                    "<Relationships xmlns=\"http://schemas.openxmlformats.org/package/2006/relationships\">\n" +
                    "  <Relationship Id=\"rIdLayout1\" Type=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideLayout\" Target=\"../slideLayouts/slideLayout1.xml\"/>\n" +
                    "</Relationships>");

            // 7. ppt/slideLayouts/slideLayout1.xml
            putZipEntry(zos, "ppt/slideLayouts/slideLayout1.xml",
                    "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n" +
                    "<p:sldLayout xmlns:p=\"http://schemas.openxmlformats.org/presentationml/2006/main\" xmlns:a=\"http://schemas.openxmlformats.org/drawingml/2006/main\" type=\"blank\">\n" +
                    "  <p:cSld><p:spTree><p:nvGrpSpPr><p:cNvPr id=\"1\" name=\"\"/><p:cNvGrpSpPr/><p:grpSpPr/></p:nvGrpSpPr><p:grpSpPr/></p:spTree></p:cSld>\n" +
                    "</p:sldLayout>");

            // 7b. ppt/slideLayouts/_rels/slideLayout1.xml.rels
            putZipEntry(zos, "ppt/slideLayouts/_rels/slideLayout1.xml.rels",
                    "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n" +
                    "<Relationships xmlns=\"http://schemas.openxmlformats.org/package/2006/relationships\">\n" +
                    "  <Relationship Id=\"rId1\" Type=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster\" Target=\"../slideMasters/slideMaster1.xml\"/>\n" +
                    "</Relationships>");
            // 8. Slides and their rels
            final long slideW_emu = 9144000L;
            final long slideH_emu = 6858000L;

            for (int pIdx = 0; pIdx < pageCount; pIdx++) {
                final PdfPageLayout page = (pIdx < pages.size()) ? pages.get(pIdx) : null;

                // ppt/slides/_rels/slideN.xml.rels
                putZipEntry(zos, "ppt/slides/_rels/slide" + (pIdx + 1) + ".xml.rels",
                        "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n" +
                        "<Relationships xmlns=\"http://schemas.openxmlformats.org/package/2006/relationships\">\n" +
                        "  <Relationship Id=\"rId1\" Type=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideLayout\" Target=\"../slideLayouts/slideLayout1.xml\"/>\n" +
                        "</Relationships>");

                // ppt/slides/slideN.xml
                final StringBuilder slide = new StringBuilder();
                slide.append("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n");
                slide.append("<p:sld xmlns:p=\"http://schemas.openxmlformats.org/presentationml/2006/main\" xmlns:a=\"http://schemas.openxmlformats.org/drawingml/2006/main\">\n");
                slide.append("  <p:cSld>\n");
                slide.append("    <p:spTree>\n");
                slide.append("      <p:nvGrpSpPr><p:cNvPr id=\"1\" name=\"\"/><p:cNvGrpSpPr/><p:grpSpPr/></p:nvGrpSpPr><p:grpSpPr/>\n");

                int spId = 2;
                if (page != null) {
                    for (final PdfPageLayout.Paragraph para : page.paragraphs) {
                        if (para.lines.isEmpty()) continue;
                        final PdfPageLayout.Line firstLine = para.lines.get(0);
                        final PdfPageLayout.Line lastLine = para.lines.get(para.lines.size() - 1);

                        float l = 1.0f, r = 0.0f;
                        for (final PdfPageLayout.Line ln : para.lines) {
                            if (ln.left < l) l = ln.left;
                            if (ln.right > r) r = ln.right;
                        }
                        float t = firstLine.top;
                        float b = lastLine.bottom;

                        long offX = Math.round(l * slideW_emu);
                        long offY = Math.round(t * slideH_emu);
                        long extX = Math.max(914400L, Math.round((r - l) * slideW_emu));
                        long extY = Math.max(300000L, Math.round((b - t) * slideH_emu));

                        slide.append("      <p:sp>\n");
                        slide.append("        <p:nvSpPr><p:cNvPr id=\"").append(spId).append("\" name=\"Text_").append(spId).append("\"/><p:cNvSpPr txBox=\"1\"/><p:nvPr/></p:nvSpPr>\n");
                        slide.append("        <p:spPr><a:xfrm><a:off x=\"").append(offX).append("\" y=\"").append(offY).append("\"/><a:ext cx=\"").append(extX).append("\" cy=\"").append(extY).append("\"/></a:xfrm><a:prstGeom prst=\"rect\"><a:avLst/></a:prstGeom><a:noFill/></p:spPr>\n");
                        slide.append("        <p:txBody><a:bodyPr wrap=\"square\"/><a:lstStyle/>\n");

                        for (final PdfPageLayout.Line ln : para.lines) {
                            slide.append("          <a:p><a:r><a:rPr lang=\"en-US\" sz=\"1400\"/><a:t>")
                                    .append(escapeXml(ln.text()))
                                    .append("</a:t></a:r></a:p>\n");
                        }

                        slide.append("        </p:txBody>\n");
                        slide.append("      </p:sp>\n");
                        spId++;
                    }
                }

                slide.append("    </p:spTree>\n");
                slide.append("  </p:cSld>\n");
                slide.append("</p:sld>");

                putZipEntry(zos, "ppt/slides/slide" + (pIdx + 1) + ".xml", slide.toString());
            }

            zos.finish();
            zos.flush();
        }
    }

    private static String getColumnName(int index) {
        final StringBuilder sb = new StringBuilder();
        int num = index;
        while (num >= 0) {
            sb.insert(0, (char) ('A' + (num % 26)));
            num = (num / 26) - 1;
        }
        return sb.toString();
    }

    private static void putZipEntry(final ZipOutputStream zos, final String name, final String content) throws IOException {
        final ZipEntry entry = new ZipEntry(name);
        zos.putNextEntry(entry);
        final byte[] bytes = content.getBytes(StandardCharsets.UTF_8);
        zos.write(bytes);
        zos.closeEntry();
    }

    private static final class NonClosingOutputStream extends java.io.FilterOutputStream {
        NonClosingOutputStream(final OutputStream out) {
            super(out);
        }

        @Override
        public void close() throws IOException {
            flush();
        }
    }
}
