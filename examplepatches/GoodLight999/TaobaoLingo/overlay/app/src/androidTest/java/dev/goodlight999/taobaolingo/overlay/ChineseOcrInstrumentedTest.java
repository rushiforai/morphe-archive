package dev.goodlight999.taobaolingo.overlay;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import com.google.mlkit.vision.common.InputImage;
import com.google.mlkit.nl.translate.TranslateLanguage;
import com.google.mlkit.nl.translate.Translation;
import com.google.mlkit.nl.translate.TranslatorOptions;
import com.google.android.gms.tasks.Tasks;
import com.google.mlkit.vision.text.TextRecognition;
import com.google.mlkit.vision.text.chinese.ChineseTextRecognizerOptions;
import org.junit.Test;
import org.junit.runner.RunWith;
import androidx.test.ext.junit.runners.AndroidJUnit4;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import static org.junit.Assert.*;

/** Standalone bundled Chinese OCR recognition test: no network or Taobao account needed. */
@RunWith(AndroidJUnit4.class)
public final class ChineseOcrInstrumentedTest {
    @Test public void translatesChineseToJapaneseOnDevice() throws Exception {
        var translator = Translation.getClient(new TranslatorOptions.Builder()
            .setSourceLanguage(TranslateLanguage.CHINESE)
            .setTargetLanguage(TranslateLanguage.JAPANESE)
            .build());
        try {
            // This integration test verifies network model acquisition and
            // then performs translation locally, not against Taobao's servers.
            Tasks.await(translator.downloadModelIfNeeded(), 180, TimeUnit.SECONDS);
            String output = Tasks.await(translator.translate("搜索商品"), 40, TimeUnit.SECONDS);
            assertNotNull("Translation returned null", output);
            assertFalse("Translation is empty", output.trim().isEmpty());
            assertNotEquals("Text remained untranslated", "搜索商品", output.trim());
        } finally {
            translator.close();
        }
    }

    @Test public void readsSyntheticChineseProductText() throws Exception {
        Bitmap frame = Bitmap.createBitmap(800, 220, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(frame);
        canvas.drawColor(Color.WHITE);
        Paint brush = new Paint(Paint.ANTI_ALIAS_FLAG);
        brush.setColor(Color.BLACK);
        brush.setTextSize(82f);
        canvas.drawText("淘宝 商品 搜索", 36f, 136f, brush);
        var recognizer = TextRecognition.getClient(new ChineseTextRecognizerOptions.Builder().build());
        try {
            CountDownLatch done = new CountDownLatch(1);
            AtomicReference<String> result = new AtomicReference<>();
            AtomicReference<Exception> error = new AtomicReference<>();
            recognizer.process(InputImage.fromBitmap(frame, 0))
                .addOnSuccessListener(x -> result.set(x.getText()))
                .addOnFailureListener(error::set)
                .addOnCompleteListener(x -> done.countDown());
            assertTrue("OCR did not complete in 45 seconds", done.await(45, TimeUnit.SECONDS));
            if (error.get() != null) throw error.get();
            String output = result.get();
            assertNotNull("OCR unexpectedly empty", output);
            assertTrue("Expected Chinese characters in OCR: " + output,
                output.contains("淘宝") || output.contains("商品") || output.contains("搜索"));
        } finally {
            recognizer.close();
            frame.recycle();
        }
    }
}
