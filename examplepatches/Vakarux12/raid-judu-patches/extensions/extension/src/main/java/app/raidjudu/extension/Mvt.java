package app.raidjudu.extension;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

// a mapbox vector tile with one "raid" layer of report points
final class Mvt {
    static final int EXTENT = 4096;
    // dots near an edge are drawn by the neighbour tile too, or they get cut in half
    static final int BUFFER = 256;

    // the label only goes on points inside the tile so it is drawn once. empty when nothing is near
    static byte[] encode(List<Raid.Report> rows, int z, int x, int y) {
        ByteArrayOutputStream layer = new ByteArrayOutputStream(), values = new ByteArrayOutputStream();
        field(layer, 1, utf8("raid"));
        double n = 1 << z;
        int points = 0, labels = 0;
        for (Raid.Report r : rows) {
            double lat = Math.toRadians(r.lat);
            int px = (int) Math.round(((r.lng + 180) / 360 * n - x) * EXTENT);
            int py = (int) Math.round(((1 - Math.log(Math.tan(lat) + 1 / Math.cos(lat)) / Math.PI) / 2 * n - y) * EXTENT);
            if (px < -BUFFER || py < -BUFFER || px > EXTENT + BUFFER || py > EXTENT + BUFFER) continue;
            ByteArrayOutputStream f = new ByteArrayOutputStream();
            if (px >= 0 && py >= 0 && px < EXTENT && py < EXTENT) {
                field(f, 2, varints(0, labels++));
                ByteArrayOutputStream v = new ByteArrayOutputStream();
                field(v, 1, utf8(r.label));
                field(values, 4, v.toByteArray());
            }
            tag(f, 3, 1);
            // one moveTo
            field(f, 4, varints(9, zigzag(px), zigzag(py)));
            field(layer, 2, f.toByteArray());
            points++;
        }
        if (points == 0) return new byte[0];
        field(layer, 3, utf8("label"));
        byte[] v = values.toByteArray();
        layer.write(v, 0, v.length);
        tag(layer, 5, EXTENT);
        tag(layer, 15, 2);
        ByteArrayOutputStream tile = new ByteArrayOutputStream();
        field(tile, 3, layer.toByteArray());
        return tile.toByteArray();
    }

    private static byte[] utf8(String s) {
        return s.getBytes(StandardCharsets.UTF_8);
    }

    private static long zigzag(int v) {
        return ((v << 1) ^ (v >> 31)) & 0xFFFFFFFFL;
    }

    private static void tag(ByteArrayOutputStream o, int field, long v) {
        varint(o, field << 3);
        varint(o, v);
    }

    private static void field(ByteArrayOutputStream o, int field, byte[] b) {
        varint(o, field << 3 | 2);
        varint(o, b.length);
        o.write(b, 0, b.length);
    }

    private static byte[] varints(long... vs) {
        ByteArrayOutputStream o = new ByteArrayOutputStream();
        for (long v : vs) varint(o, v);
        return o.toByteArray();
    }

    private static void varint(ByteArrayOutputStream o, long v) {
        while ((v & ~0x7FL) != 0) {
            o.write((int) (v & 0x7F) | 0x80);
            v >>>= 7;
        }
        o.write((int) v);
    }
}
