import app.badfella.patches.ultimea.upstream.settings.*;
import app.badfella.patches.ultimea.upstream.theme.*;
import java.nio.*;
import java.nio.file.*;

/** Assert the actual stock-matched tracking, popup and accent edits in an extracted patched library. */
public class UltimeaExtrasCheck {
    static int word(byte[] bytes, int offset) {
        return ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN).getInt(offset);
    }

    public static void main(String[] args) throws Exception {
        byte[] stock = Files.readAllBytes(Path.of(args[0]));
        byte[] patched = Files.readAllBytes(Path.of(args[1]));
        var methods = new NativeMethods(stock);
        for (String endpoint : new String[]{"/api/data/v1/buried_point", "/api/data/v1/batch_buried_point", "/logan/upload.json"}) {
            var matches = methods.matching(endpoint);
            if (matches.size() != 1) throw new AssertionError(endpoint);
            var function = matches.get(0);
            int start = methods.asyncBodyStart(function);
            int branch = word(patched, start);
            assert (branch & 0xfc000000) == 0x14000000 : endpoint;
            int target = start + (branch << 6 >> 4);
            assert target > start && target < function.getEnd() : endpoint;
        }
        for (String endpoint : new String[]{"/api/base/v1/popup/record", "/api/base/v1/app_upgrade_popup_record", "/api/device/v1/firmware_upgrade_popup_record"}) {
            int start = methods.asyncBodyStart(methods.matching(endpoint).get(0));
            assert word(patched, start) == 0xaa1603e0 : endpoint;
            assert (word(patched, start + 4) & 0xfc000000) == 0x14000000 : endpoint;
        }
        var image = new ThemeElfImage(stock);
        var accent = new AccentInstructions(stock, image.getCodeStart(), image.getCodeEnd()).match();
        for (int site : new int[]{accent.getPaintColorReturn(), accent.getPackedColorReturn(), accent.getGradientColorReturn()}) {
            assert (word(patched, site) & 0xfc000000) == 0x94000000 : site;
        }
        var popup = methods.matching("app_popup").stream()
            .filter(f -> !f.getStringLoads().containsValue("language_english")).findFirst().orElseThrow();
        assert word(patched, popup.getStart()) == 0xaa1603e0;
        assert word(patched, popup.getStart() + 4) == 0xd65f03c0;
        System.out.println("PASS: tracking completion branches, popup suppression and three installed accent hooks");
    }
}
