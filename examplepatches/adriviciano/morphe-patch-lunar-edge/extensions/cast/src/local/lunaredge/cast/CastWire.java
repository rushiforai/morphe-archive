package local.lunaredge.cast;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

/** Codificación mínima del sobre protobuf Cast V2, sin dependencias añadidas a la APK. */
public final class CastWire {
    private CastWire() { }

    public static final class Message {
        public String source = "";
        public String destination = "";
        public String namespace = "";
        public String payload = "";
    }

    public static byte[] encode(String source, String destination, String namespace, String json) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        integer(out, 1, 0);
        string(out, 2, source);
        string(out, 3, destination);
        string(out, 4, namespace);
        integer(out, 5, 0);
        string(out, 6, json);
        return out.toByteArray();
    }

    public static void write(DataOutputStream out, byte[] body) throws IOException {
        out.writeInt(body.length);
        out.write(body);
        out.flush();
    }

    public static Message read(DataInputStream in) throws IOException {
        int size = in.readInt();
        if (size <= 0 || size > 1024 * 1024) throw new IOException("Sobre Cast inválido");
        byte[] body = new byte[size];
        in.readFully(body);
        return decode(body);
    }

    public static Message decode(byte[] body) throws IOException {
        int[] cursor = {0};
        Message message = new Message();
        while (cursor[0] < body.length) {
            int key = varint(body, cursor);
            int field = key >>> 3;
            int wire = key & 7;
            if (wire == 0) {
                varint(body, cursor);
            } else if (wire == 2) {
                int count = varint(body, cursor);
                if (count < 0 || count > body.length - cursor[0]) throw new IOException("Campo Cast truncado");
                String value = new String(body, cursor[0], count, StandardCharsets.UTF_8);
                cursor[0] += count;
                if (field == 2) message.source = value;
                if (field == 3) message.destination = value;
                if (field == 4) message.namespace = value;
                if (field == 6) message.payload = value;
            } else {
                throw new IOException("Tipo de campo Cast no admitido");
            }
        }
        return message;
    }

    private static int varint(byte[] bytes, int[] cursor) throws IOException {
        int value = 0;
        for (int shift = 0; shift < 35; shift += 7) {
            if (cursor[0] >= bytes.length) throw new IOException("Varint truncado");
            int next = bytes[cursor[0]++] & 255;
            value |= (next & 127) << shift;
            if ((next & 128) == 0) return value;
        }
        throw new IOException("Varint demasiado largo");
    }

    private static void varint(ByteArrayOutputStream out, int value) {
        do {
            int next = value & 127;
            value >>>= 7;
            out.write(value == 0 ? next : next | 128);
        } while (value != 0);
    }

    private static void integer(ByteArrayOutputStream out, int field, int value) {
        varint(out, field << 3);
        varint(out, value);
    }

    private static void string(ByteArrayOutputStream out, int field, String text) {
        byte[] bytes = text.getBytes(StandardCharsets.UTF_8);
        varint(out, (field << 3) | 2);
        varint(out, bytes.length);
        out.write(bytes, 0, bytes.length);
    }
}
