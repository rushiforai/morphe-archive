package app.medium.extension;

import org.junit.Assert;
import org.junit.Test;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

public class MediumTranslatorTest {

    @Test
    public void testTranslateEnglishToRussian() {
        String input = "Hello, world! What should programmers do while AI writes code?";
        String result = MediumTranslator.translateText(input, "ru");

        System.out.println("Original: " + input);
        System.out.println("Translated: " + result);

        Assert.assertNotNull(result);
        Assert.assertFalse(result.isEmpty());
        // Verify translation contains Russian characters or translated text
        Assert.assertTrue(result.contains("программист") || result.contains("код") || result.contains("Привет") || result.contains("мир"));
    }

    @Test
    public void testAsyncTranslation() throws InterruptedException {
        final CountDownLatch latch = new CountDownLatch(1);
        final AtomicReference<String> outputRef = new AtomicReference<>();
        final AtomicReference<Exception> errorRef = new AtomicReference<>();

        String input = "Artificial Intelligence is transforming software development.";

        MediumTranslator.translateTextAsync(input, "ru", new MediumTranslator.TranslationCallback() {
            @Override
            public void onSuccess(String translatedText) {
                outputRef.set(translatedText);
                latch.countDown();
            }

            @Override
            public void onError(Exception e) {
                errorRef.set(e);
                latch.countDown();
            }
        });

        boolean completed = latch.await(10, TimeUnit.SECONDS);
        Assert.assertTrue("Async translation timed out", completed);
        Assert.assertNull("Async translation raised error: " + errorRef.get(), errorRef.get());

        String result = outputRef.get();
        System.out.println("Async translated: " + result);
        Assert.assertNotNull(result);
        Assert.assertTrue(result.contains("Искусственный") || result.contains("интеллект") || result.contains("программного"));
    }
}