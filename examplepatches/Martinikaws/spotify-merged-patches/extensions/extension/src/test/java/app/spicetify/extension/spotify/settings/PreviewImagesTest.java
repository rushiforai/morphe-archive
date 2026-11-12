package app.spicetify.extension.spotify.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import android.graphics.Bitmap;
import android.os.Looper;
import android.widget.ImageView;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class PreviewImagesTest {
    private static final Executor DIRECT = Runnable::run;

    @Test
    public void sampleSizeIsTheLargestPowerOfTwoAtOrAboveTheTarget() {
        assertEquals(4, PreviewImages.sampleSize(1600, 900, 400));
        assertEquals(2, PreviewImages.sampleSize(1599, 900, 400));
        assertEquals(1, PreviewImages.sampleSize(300, 900, 400));
    }

    @Test
    public void sampleSizeAlsoKeepsATallPreviewUnderEightMegabytes() {
        // About 130 MB at full size, which Android refuses to draw; a quarter of each side is about 8.1 MB.
        assertEquals(4, PreviewImages.sampleSize(1080, 30_000, 1080));
    }

    @Test
    public void sampleSizeGivesUpOnSizesThatArentPositive() {
        assertEquals(0, PreviewImages.sampleSize(-1, -1, 400)); // what a failed bounds decode reports
        assertEquals(0, PreviewImages.sampleSize(1600, 900, 0));
    }

    @Test
    public void loadDecodesShowsAndCachesTheBitmap() {
        byte[] png = png();
        AtomicInteger calls = new AtomicInteger();
        PreviewImages.Downloader downloader = url -> {
            calls.incrementAndGet();
            return png;
        };
        PreviewImages images = new PreviewImages(downloader, DIRECT);
        ImageView view = new ImageView(RuntimeEnvironment.getApplication());

        images.load("https://example.com/preview.png", view, 4);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertNotNull(view.getDrawable());
        assertEquals(1, calls.get());

        images.load("https://example.com/preview.png", view, 4);
        assertEquals(1, calls.get());
    }

    @Test
    public void aRecycledRowDownloadsOnlyItsNewPreview() {
        List<Runnable> queued = new ArrayList<>();
        List<String> downloaded = new ArrayList<>();
        PreviewImages images = new PreviewImages(url -> {
            downloaded.add(url);
            return png();
        }, queued::add);
        ImageView row = new ImageView(RuntimeEnvironment.getApplication());

        images.load("https://example.com/a.png", row, 4);
        images.load("https://example.com/b.png", row, 4); // recycled for another theme before a.png's turn
        for (Runnable task : queued) task.run();
        Shadows.shadowOf(Looper.getMainLooper()).idle();

        assertEquals(Collections.singletonList("https://example.com/b.png"), downloaded);
        assertNotNull(row.getDrawable());
    }

    @Test
    public void aPreviewAnotherTaskDecodedIsNotDownloadedAgain() {
        List<Runnable> queued = new ArrayList<>();
        AtomicInteger calls = new AtomicInteger();
        PreviewImages images = new PreviewImages(url -> {
            calls.incrementAndGet();
            return png();
        }, queued::add);
        ImageView first = new ImageView(RuntimeEnvironment.getApplication());
        ImageView second = new ImageView(RuntimeEnvironment.getApplication());

        images.load("https://example.com/preview.png", first, 4);
        images.load("https://example.com/preview.png", second, 4);
        for (Runnable task : queued) task.run();
        Shadows.shadowOf(Looper.getMainLooper()).idle();

        assertEquals(1, calls.get());
        assertNotNull(first.getDrawable());
        assertNotNull(second.getDrawable());
    }

    @Test
    public void aPreviewThatArrivesAfterItsRowWasRecycledIsNotShown() {
        List<Runnable> queued = new ArrayList<>();
        PreviewImages images = new PreviewImages(url -> png(), queued::add);
        ImageView row = new ImageView(RuntimeEnvironment.getApplication());

        images.load("https://example.com/a.png", row, 4);
        queued.remove(0).run(); // a.png is decoded and waits for the main thread
        images.load("https://example.com/b.png", row, 4); // meanwhile the row shows another theme
        Shadows.shadowOf(Looper.getMainLooper()).idle();

        assertNull(row.getDrawable()); // b.png is still queued, and a.png doesn't take its place
    }

    @Test
    public void downloadsQueuedBeforeCancelQueuedAreDropped() {
        List<Runnable> queued = new ArrayList<>();
        AtomicInteger calls = new AtomicInteger();
        PreviewImages images = new PreviewImages(url -> {
            calls.incrementAndGet();
            return png();
        }, queued::add);
        ImageView view = new ImageView(RuntimeEnvironment.getApplication());

        images.load("https://example.com/preview.png", view, 4);
        images.cancelQueued();
        for (Runnable task : queued) task.run();

        assertEquals(0, calls.get());
    }

    private static byte[] png() {
        Bitmap bitmap = Bitmap.createBitmap(8, 4, Bitmap.Config.ARGB_8888);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, out);
        return out.toByteArray();
    }
}
