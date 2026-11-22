import local.lunaredge.cast.CastWire;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

public final class CastWireTest {
    public static void main(String[] args) throws Exception {
        String payload = "{\"type\":\"PING\",\"title\":\"Vídeo de prueba 📺\"}";
        byte[] encoded = CastWire.encode("sender-test", "receiver-0", "urn:x-cast:com.google.cast.tp.heartbeat", payload);
        CastWire.Message decoded = CastWire.decode(encoded);
        if (!decoded.source.equals("sender-test") || !decoded.destination.equals("receiver-0") || !decoded.payload.equals(payload)) throw new AssertionError("El mensaje no conserva sus campos");
        ByteArrayOutputStream framed = new ByteArrayOutputStream();
        CastWire.write(new DataOutputStream(framed), encoded);
        if (!CastWire.read(new DataInputStream(new ByteArrayInputStream(framed.toByteArray()))).payload.equals(payload)) throw new AssertionError("Encuadre incorrecto");
        boolean rejected = false;
        try { CastWire.decode(new byte[]{18, 20, 65}); } catch (IOException expected) { rejected = true; }
        if (!rejected) throw new AssertionError("No se rechaza un mensaje truncado");
        rejected = false;
        try { CastWire.read(new DataInputStream(new ByteArrayInputStream(new byte[]{127, 127, 127, 127}))); } catch (IOException expected) { rejected = true; }
        if (!rejected) throw new AssertionError("No se rechaza un tamaño excesivo");
        Files.write(Path.of("build/cast-wire-test.bin"), encoded);
        System.out.println("OK: sobre Cast, UTF-8, encuadre y mensajes inválidos.");
    }
}
