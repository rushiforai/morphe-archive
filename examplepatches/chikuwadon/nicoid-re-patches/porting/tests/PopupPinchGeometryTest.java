import e.e.a.PopupPinchGeometry;
import java.util.Random;

/** Host checks: javac -d out PopupPinchGeometry.java PopupPinchGeometryTest.java && java -cp out PopupPinchGeometryTest */
public class PopupPinchGeometryTest {
    static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
    static int[] bounds(float height) {
        return PopupPinchGeometry.bounds(height, 16f / 9f, 90, 800,
                1440, 2560, 700, 600, .5f, .5f);
    }
    public static void main(String[] args) {
        int[] smaller = bounds(100), normal = bounds(200), bigger = bounds(400);
        check(smaller[0] < normal[0] && normal[0] < bigger[0], "pinch direction");
        check(bounds(0)[1] == 90, "minimum size");
        check(bounds(99999)[1] == 800, "maximum size");
        check(bounds(Float.NaN)[1] == 90, "invalid span");
        check(bigger[2] + bigger[0] / 2 == 700 && bigger[3] + bigger[1] / 2 == 600,
                "midpoint anchor");
        int[] tiny = PopupPinchGeometry.bounds(100, 16f / 9f, 90, 800,
                120, 80, 10, 10, .5f, .5f);
        check(tiny[0] <= 120 && tiny[1] <= 80, "screen smaller than minimum");
        Random random = new Random(649091);
        for (int i = 0; i < 10000; i++) {
            int sw = 120 + random.nextInt(3000), sh = 80 + random.nextInt(3000);
            float ratio = .3f + random.nextFloat() * 3;
            int[] b = PopupPinchGeometry.bounds(random.nextFloat() * 6000 - 100,
                    ratio, 90, 2000, sw, sh, random.nextFloat() * sw,
                    random.nextFloat() * sh, random.nextFloat(), random.nextFloat());
            check(b[0] > 0 && b[1] > 0 && b[0] <= sw && b[1] <= sh, "size limits " + i);
            check(b[2] >= 0 && b[3] >= 0 && b[2] + b[0] <= sw && b[3] + b[1] <= sh,
                    "position limits " + i);
            check(Math.abs(b[0] - b[1] * ratio) <= ratio + 1, "aspect ratio rounding " + i);
        }
        System.out.println("Popup geometry: direction, limits, anchor and 10000 randomized cases passed.");
    }
}
