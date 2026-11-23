package app.voidhack.extension.applemusic.font;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public final class FontInspectorTest {

    @Test
    public void rejectsNonFontBytes() {
        FontInspector.FontInfo info = FontInspector.inspectBytes("not a font file".getBytes(StandardCharsets.UTF_8), "bad.txt");
        assertFalse(info.valid);
    }

    @Test
    public void parsesVariableFontNameOs2AndFvarWghtAxis() throws IOException {
        byte[] sfnt = buildSyntheticSfnt(0x00010000, "LINE Seed JP", 400, true, 100f, 900f);
        FontInspector.FontInfo info = FontInspector.inspectBytes(sfnt, "lineseed.ttf");

        assertTrue(info.valid);
        assertFalse(info.isCollection);
        assertEquals("LINE Seed JP", info.displayName);
        assertTrue(info.isVariableWeight());
        FontInspector.FaceInfo face = info.primaryFace();
        assertNotNull(face);
        assertEquals(400, face.weight);
        assertEquals(100, face.minWeight);
        assertEquals(900, face.maxWeight);
        assertEquals(700, FontInspector.clampVariableWeight(700, face));
        assertEquals(900, FontInspector.clampVariableWeight(1000, face));
    }

    @Test
    public void parsesStaticOtfFontWeight() throws IOException {
        byte[] otf = buildSyntheticSfnt(0x4F54544F, "Hiragino Sans W6", 600, false, 0f, 0f);
        FontInspector.FontInfo info = FontInspector.inspectBytes(otf, "hira.otf");

        assertTrue(info.valid);
        assertFalse(info.isVariableWeight());
        assertEquals("Hiragino Sans W6", info.displayName);
        assertEquals(600, info.primaryFace().weight);
    }

    @Test
    public void parsesMultiFaceTtcCollection() throws IOException {
        byte[] ttc = buildSyntheticTtc("Hiragino Sans", new int[]{300, 600, 800});
        FontInspector.FontInfo info = FontInspector.inspectBytes(ttc, "HiraginoSans.ttc");

        assertTrue(info.valid);
        assertTrue(info.isCollection);
        assertEquals("Hiragino Sans", info.displayName);
        assertEquals(3, info.faces.size());
        assertEquals(300, info.faces.get(0).weight);
        assertEquals(600, info.faces.get(1).weight);
        assertEquals(800, info.faces.get(2).weight);
        assertEquals(2, info.faces.get(2).ttcIndex);
    }

    @Test
    public void computesEffectiveWeightsAndBoldSlotRouting() {
        assertEquals(500, FontInspector.effectiveWeight(400, 100));
        assertEquals(100, FontInspector.effectiveWeight(200, -200));
        assertEquals(900, FontInspector.effectiveWeight(800, 200));
        assertFalse(FontInspector.shouldUseBoldSlot(500, true));
        assertTrue(FontInspector.shouldUseBoldSlot(600, true));
        assertFalse(FontInspector.shouldUseBoldSlot(700, false));
    }

    private static byte[] buildSyntheticSfnt(
            int magic, String family, int weight, boolean variable, float minW, float maxW) throws IOException {
        byte[] nameTable = buildNameTable(family);
        byte[] os2Table = buildOs2Table(weight);
        byte[] fvarTable = variable ? buildFvarTable(minW, maxW) : null;

        int numTables = variable ? 3 : 2;
        int headerSize = 12 + numTables * 16;
        int nameOff = headerSize;
        int os2Off = nameOff + nameTable.length;
        int fvarOff = os2Off + os2Table.length;

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        DataOutputStream out = new DataOutputStream(baos);
        out.writeInt(magic);
        out.writeShort(numTables);
        out.writeShort(0);
        out.writeShort(0);
        out.writeShort(0);

        writeTableRecord(out, 0x6E616D65, nameOff, nameTable.length); // 'name'
        writeTableRecord(out, 0x4F532F32, os2Off, os2Table.length);   // 'OS/2'
        if (variable) {
            writeTableRecord(out, 0x66766172, fvarOff, fvarTable.length); // 'fvar'
        }
        out.write(nameTable);
        out.write(os2Table);
        if (variable) out.write(fvarTable);
        return baos.toByteArray();
    }

    private static byte[] buildSyntheticTtc(String family, int[] weights) throws IOException {
        byte[] nameTable = buildNameTable(family);
        int headerSize = 12 + weights.length * 4;
        int faceDirSize = 12 + 2 * 16;
        int tablesBase = headerSize + weights.length * faceDirSize;
        int nameOff = tablesBase;
        int os2Base = nameOff + nameTable.length;
        byte[][] os2Tables = new byte[weights.length][];
        for (int i = 0; i < weights.length; i++) {
            os2Tables[i] = buildOs2Table(weights[i]);
        }

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        DataOutputStream out = new DataOutputStream(baos);
        out.writeInt(0x74746366); // 'ttcf'
        out.writeShort(1);
        out.writeShort(0);
        out.writeInt(weights.length);
        for (int i = 0; i < weights.length; i++) {
            out.writeInt(headerSize + i * faceDirSize);
        }
        for (int i = 0; i < weights.length; i++) {
            out.writeInt(0x00010000);
            out.writeShort(2);
            out.writeShort(0);
            out.writeShort(0);
            out.writeShort(0);
            writeTableRecord(out, 0x6E616D65, nameOff, nameTable.length);
            writeTableRecord(out, 0x4F532F32, os2Base + i * os2Tables[i].length, os2Tables[i].length);
        }
        out.write(nameTable);
        for (byte[] os2 : os2Tables) out.write(os2);
        return baos.toByteArray();
    }

    private static void writeTableRecord(DataOutputStream out, int tag, int offset, int length) throws IOException {
        out.writeInt(tag);
        out.writeInt(0);
        out.writeInt(offset);
        out.writeInt(length);
    }

    private static byte[] buildNameTable(String family) throws IOException {
        byte[] strBytes = family.getBytes(StandardCharsets.UTF_16BE);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        DataOutputStream out = new DataOutputStream(baos);
        out.writeShort(0);  // format
        out.writeShort(1);  // count
        out.writeShort(18); // stringOffset = 6 + 12
        out.writeShort(3);  // platformId = Windows
        out.writeShort(1);  // encodingId = Unicode BMP
        out.writeShort(0x0409); // en-US
        out.writeShort(16); // Preferred Family
        out.writeShort(strBytes.length);
        out.writeShort(0);
        out.write(strBytes);
        return baos.toByteArray();
    }

    private static byte[] buildOs2Table(int weight) throws IOException {
        byte[] buf = new byte[68];
        buf[4] = (byte) ((weight >>> 8) & 0xFF);
        buf[5] = (byte) (weight & 0xFF);
        return buf;
    }

    private static byte[] buildFvarTable(float minW, float maxW) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        DataOutputStream out = new DataOutputStream(baos);
        out.writeShort(1);  // majorVersion
        out.writeShort(0);  // minorVersion
        out.writeShort(16); // axesArrayOffset
        out.writeShort(2);  // reserved
        out.writeShort(1);  // axisCount
        out.writeShort(20); // axisSize
        out.writeShort(0);  // instanceCount
        out.writeShort(0);  // instanceSize
        out.writeInt(0x77676874); // 'wght'
        out.writeInt(Math.round(minW * 65536f));
        out.writeInt(Math.round(400f * 65536f));
        out.writeInt(Math.round(maxW * 65536f));
        out.writeShort(0);
        out.writeShort(0);
        return baos.toByteArray();
    }
}
