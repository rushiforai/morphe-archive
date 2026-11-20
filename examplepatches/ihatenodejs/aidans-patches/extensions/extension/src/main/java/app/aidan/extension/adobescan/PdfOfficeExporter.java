package app.aidan.extension.adobescan;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import com.tom_roush.pdfbox.android.PDFBoxResourceLoader;
import com.tom_roush.pdfbox.pdmodel.PDDocument;
import com.tom_roush.pdfbox.pdmodel.PDPage;
import com.tom_roush.pdfbox.pdmodel.common.PDRectangle;
import com.tom_roush.pdfbox.pdmodel.encryption.InvalidPasswordException;
import com.tom_roush.pdfbox.rendering.ImageType;
import com.tom_roush.pdfbox.rendering.PDFRenderer;
import com.tom_roush.pdfbox.text.PDFTextStripper;
import com.tom_roush.pdfbox.text.TextPosition;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class PdfOfficeExporter {

    private static final String TAG = "PdfOfficeExporter";

    private PdfOfficeExporter() {}

    public interface ExportCallback {
        void onProgress(int percent);
        void onComplete(int status, int pageCount, long outputBytes);
    }

    public static void export(
            final Context context,
            final ParcelFileDescriptor inputPdf,
            final ParcelFileDescriptor outputOffice,
            final int format,
            final ParcelFileDescriptor ocrModel,
            final ExportCallback callback) {
        export(context, inputPdf, outputOffice, format, ocrModel, null, callback);
    }

    public static void export(
            final Context context,
            final ParcelFileDescriptor inputPdf,
            final ParcelFileDescriptor outputOffice,
            final int format,
            final ParcelFileDescriptor ocrModel,
            final String password,
            final ExportCallback callback) {

        if (context == null || inputPdf == null || outputOffice == null) {
            if (callback != null) callback.onComplete(NativePdfEngine.IO_ERROR, 0, 0);
            return;
        }

        try {
            PDFBoxResourceLoader.init(context);
        } catch (final Throwable t) {
            Log.w(TAG, "PDFBoxResourceLoader.init exception", t);
        }

        PDDocument document = null;
        try {
            if (callback != null) callback.onProgress(5);

            try (final InputStream is = new FileInputStream(inputPdf.getFileDescriptor())) {
                if (password != null && !password.isEmpty()) {
                    document = PDDocument.load(is, password);
                } else {
                    document = PDDocument.load(is);
                }
            }

            if (document.isEncrypted()) {
                document.setAllSecurityToBeRemoved(true);
            }
            final int pageCount = document.getNumberOfPages();
            if (pageCount <= 0) {
                if (callback != null) callback.onComplete(NativePdfEngine.INVALID_PDF, 0, 0);
                return;
            }

            final List<PdfPageLayout> layouts = new ArrayList<>(pageCount);
            PDFRenderer renderer = null;

            for (int i = 0; i < pageCount; i++) {
                final PDPage page = document.getPage(i);
                final PDRectangle cropBox = page.getCropBox() != null ? page.getCropBox() : page.getMediaBox();
                final float pageW = cropBox != null ? cropBox.getWidth() : 612f;
                final float pageH = cropBox != null ? cropBox.getHeight() : 792f;

                // 1. Attempt embedded text extraction with geometric positions
                final List<PdfPageLayout.Word> embeddedWords = extractEmbeddedWords(document, i, pageW, pageH);

                if (!embeddedWords.isEmpty()) {
                    layouts.add(new PdfPageLayout(i, pageW, pageH, embeddedWords));
                } else {
                    // 2. Scanned or image-only page: render and run native OCR if model is available
                    if (ocrModel != null && ocrModel.getFd() >= 0) {
                        if (renderer == null) {
                            renderer = new PDFRenderer(document);
                        }

                        float dpi = 200f;
                        float pixelW = (pageW / 72f) * dpi;
                        float pixelH = (pageH / 72f) * dpi;
                        if (pixelW * pixelH > 8000000f) {
                            float scale = (float) Math.sqrt(8000000f / (pixelW * pixelH));
                            dpi *= scale;
                        }

                        Bitmap pageBitmap = null;
                        try {
                            pageBitmap = renderer.renderImageWithDPI(i, dpi, ImageType.RGB);
                            final PdfPageLayout.Word[] ocrWords = NativePdfEngine.recognize(pageBitmap, ocrModel.getFd());
                            final List<PdfPageLayout.Word> ocrList = new ArrayList<>();
                            if (ocrWords != null) {
                                Collections.addAll(ocrList, ocrWords);
                            }
                            layouts.add(new PdfPageLayout(i, pageW, pageH, ocrList));
                        } catch (final Throwable t) {
                            Log.w(TAG, "OCR recognition error on page " + i, t);
                            layouts.add(new PdfPageLayout(i, pageW, pageH, Collections.<PdfPageLayout.Word>emptyList()));
                        } finally {
                            if (pageBitmap != null) {
                                pageBitmap.recycle();
                            }
                        }
                    } else {
                        // Empty/blank page fallback
                        layouts.add(new PdfPageLayout(i, pageW, pageH, Collections.<PdfPageLayout.Word>emptyList()));
                    }
                }

                if (callback != null) {
                    final int pct = 5 + (int) (80.0f * (i + 1) / pageCount);
                    callback.onProgress(pct);
                }
            }

            // Write output format
            final FileOutputStream fos = new FileOutputStream(outputOffice.getFileDescriptor());
            switch (format) {
                case NativePdfEngine.EXPORT_DOCX:
                    OfficeDocumentWriter.writeDocx(layouts, fos);
                    break;
                case NativePdfEngine.EXPORT_XLSX:
                    OfficeDocumentWriter.writeXlsx(layouts, fos);
                    break;
                case NativePdfEngine.EXPORT_PPTX:
                    OfficeDocumentWriter.writePptx(layouts, fos);
                    break;
                default:
                    if (callback != null) callback.onComplete(NativePdfEngine.ENGINE_FAILURE, 0, 0);
                    return;
            }
            fos.flush();
            try {
                outputOffice.getFileDescriptor().sync();
            } catch (final Throwable ignored) {}

            final long outputBytes = outputOffice.getStatSize();
            if (callback != null) {
                callback.onProgress(100);
                callback.onComplete(NativePdfEngine.OK, pageCount, outputBytes >= 0 ? outputBytes : 0);
            }

        } catch (final Throwable t) {
            if (isInvalidPassword(t)) {
                Log.w(TAG, "Office export rejected due to password: " + t.getMessage());
                if (callback != null) {
                    final int status = (password != null && !password.isEmpty())
                            ? NativePdfEngine.WRONG_PASSWORD
                            : NativePdfEngine.PASSWORD_REQUIRED;
                    callback.onComplete(status, 0, 0);
                }
                return;
            }
            Log.e(TAG, "Office export failed", t);
            if (callback != null) {
                callback.onComplete(NativePdfEngine.ENGINE_FAILURE, 0, 0);
            }
        } finally {
            if (document != null) {
                try {
                    document.close();
                } catch (final IOException ignored) {}
            }
        }
    }

    private static List<PdfPageLayout.Word> extractEmbeddedWords(
            final PDDocument document,
            final int pageIndex,
            final float pageW,
            final float pageH) {

        final List<PdfPageLayout.Word> words = new ArrayList<>();
        try {
            final PositionStripper stripper = new PositionStripper(pageIndex, pageW, pageH, words);
            stripper.setStartPage(pageIndex + 1);
            stripper.setEndPage(pageIndex + 1);
            stripper.getText(document);
        } catch (final Throwable t) {
            Log.w(TAG, "Failed extracting text positions from page " + pageIndex, t);
        }
        return words;
    }


    private static boolean isInvalidPassword(Throwable t) {
        while (t != null) {
            if (t instanceof InvalidPasswordException) {
                return true;
            }
            t = t.getCause();
        }
        return false;
    }
    private static class PositionStripper extends PDFTextStripper {
        private final float pageW;
        private final float pageH;
        private final List<PdfPageLayout.Word> wordCollector;

        PositionStripper(int pageIndex, float pageW, float pageH, List<PdfPageLayout.Word> wordCollector) throws IOException {
            super();
            this.pageW = Math.max(1f, pageW);
            this.pageH = Math.max(1f, pageH);
            this.wordCollector = wordCollector;
        }

        @Override
        protected void writeString(String text, List<TextPosition> textPositions) {
            if (textPositions == null || textPositions.isEmpty()) return;

            final StringBuilder wordText = new StringBuilder();
            float minX = 1.0f, minY = 1.0f, maxX = 0.0f, maxY = 0.0f;
            boolean hasChar = false;

            for (TextPosition tp : textPositions) {
                final String unicode = tp.getUnicode();
                if (unicode == null || unicode.isEmpty()) continue;

                if (Character.isWhitespace(unicode.charAt(0))) {
                    if (hasChar && wordText.length() > 0) {
                        wordCollector.add(new PdfPageLayout.Word(wordText.toString(), minX, minY, maxX, maxY));
                        wordText.setLength(0);
                        minX = 1.0f; minY = 1.0f; maxX = 0.0f; maxY = 0.0f;
                        hasChar = false;
                    }
                    continue;
                }

                wordText.append(unicode);
                hasChar = true;

                float x = tp.getXDirAdj() / pageW;
                float y = tp.getYDirAdj() / pageH;
                float w = tp.getWidthDirAdj() / pageW;
                float h = tp.getHeightDir() / pageH;

                float left = Math.max(0.0f, Math.min(1.0f, x));
                float top = Math.max(0.0f, Math.min(1.0f, y - h));
                float right = Math.max(0.0f, Math.min(1.0f, x + w));
                float bottom = Math.max(0.0f, Math.min(1.0f, y));

                if (left < minX) minX = left;
                if (top < minY) minY = top;
                if (right > maxX) maxX = right;
                if (bottom > maxY) maxY = bottom;
            }

            if (hasChar && wordText.length() > 0) {
                wordCollector.add(new PdfPageLayout.Word(wordText.toString(), minX, minY, maxX, maxY));
            }
        }
    }
}
