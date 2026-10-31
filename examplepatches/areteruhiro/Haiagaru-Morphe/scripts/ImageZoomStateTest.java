package app.morphe.extension.chmate;

public final class ImageZoomStateTest {
    static int count;
    static void expect(boolean expected,float current,float minimum,float fitted) {
        if(ImageZoomState.zoomed(current,minimum,fitted)!=expected)throw new AssertionError("zoom case "+count);
        count++;
    }
    public static void main(String[] args) {
        // Reported 332x176 image, automatically enlarged on a 1920-wide display.
        expect(false,5.7831326f,1f,5.7831326f);
        expect(true,7f,1f,5.7831326f);
        expect(false,5.7831326f,1f,5.7831326f);
        // Reported portrait screenshot: initial fit, then user zoom for reading.
        expect(false,.7653061f,.7653061f,.7653061f);
        expect(true,1.5f,.7653061f,.7653061f);
        expect(false,1.875f,1f,1.875f);
        expect(true,2.5f,1f,1.875f);
        expect(false,1f,1f,Float.NaN);
        expect(true,2f,1f,0f);
        System.out.println("PASS "+count+" native fit/zoom cases");
    }
}
