import app.morphe.extension.sabp.read.Whisper;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/** CI check: load the JNI library on the host, transcribe a 16 kHz mono 16-bit WAV, print the JSON. */
public class HostTest {
    public static void main(String[] a) throws Exception {
        if (!Whisper.available()) throw new IllegalStateException("load failed: " + Whisper.loadError());
        System.out.println("system: " + Whisper.systemInfo());
        byte[] all;
        try (DataInputStream in = new DataInputStream(new FileInputStream(a[1]))) {
            all = in.readAllBytes();
        }
        int off = 12; // skip RIFF header; find the "data" chunk
        int len = 0;
        ByteBuffer bb = ByteBuffer.wrap(all).order(ByteOrder.LITTLE_ENDIAN);
        while (off + 8 <= all.length) {
            String id = new String(all, off, 4, "US-ASCII");
            int size = bb.getInt(off + 4);
            if (id.equals("data")) { off += 8; len = Math.min(size, all.length - off); break; }
            off += 8 + size;
        }
        float[] pcm = new float[len / 2];
        for (int i = 0; i < pcm.length; i++) pcm[i] = bb.getShort(off + 2 * i) / 32768f;
        System.out.println("audio: " + pcm.length / 16000.0 + " s");
        long t = System.currentTimeMillis();
        try (Whisper w = Whisper.open(a[0])) {
            if (w == null) throw new IllegalStateException("model failed to open");
            System.out.println("load ms: " + (System.currentTimeMillis() - t));
            String json = w.transcribe(pcm, 2, a.length > 2 ? a[2] : null);
            if (json == null) throw new IllegalStateException("transcribe failed");
            System.out.println(json);
            if (!json.toLowerCase().contains("country")) throw new IllegalStateException("unexpected transcript");
        }
    }
}
