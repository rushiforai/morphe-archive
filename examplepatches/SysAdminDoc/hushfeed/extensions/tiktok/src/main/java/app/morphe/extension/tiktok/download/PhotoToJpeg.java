/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.download;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.ImageDecoder;
import android.os.Build;
import app.morphe.extension.shared.Logger;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

/**
 * Saves a HEIF or WebP photo again as a JPEG of the same size.
 *
 * <p>TikTok lists each photo of a post as a HEIF copy and a WebP copy, and its own HEIF rewrite
 * leaves signed addresses alone, so there's no JPEG to ask the server for. A .heif is a file plenty
 * of galleries and computers won't open (#105), and a .webp is one some computers and apps still
 * won't. Samsung's decoder turns TikTok's HEIF down as well ("invalid input" on the S22), so
 * {@link OriginalPhotos} fetches the WebP first and this rewrites whichever one came. Any other
 * format keeps exactly what TikTok sent, and so does a photo this Android can't decode (before 9,
 * or a HEIF the phone won't read), an animated one and a see-through one.
 */
final class PhotoToJpeg {
    /** High enough that the second encoding can't be told from the first at full size. */
    static final int QUALITY = 95;
    /** Far above any TikTok photo; a bigger one stays HEIF rather than risk the memory. */
    static final long MAX_PIXELS = 25_000_000L;

    private PhotoToJpeg() {}

    /**
     * Rewrites {@code file} as a JPEG when {@code extension}, read from its header, says HEIF or WebP.
     *
     * @return the extension the file holds afterwards: "jpg" once converted, else {@code extension}.
     */
    static String convert(Context context, File file, String extension) {
        if (!"heif".equals(extension) && !"heic".equals(extension) && !"webp".equals(extension)) {
            return extension;
        }
        if (Build.VERSION.SDK_INT < 28) return extension;
        File jpeg = null;
        Bitmap bitmap = null;
        try {
            bitmap = ImageDecoder.decodeBitmap(ImageDecoder.createSource(file), (decoder, info, source) -> {
                // A JPEG would keep the first frame and drop the rest.
                if (info.isAnimated()) throw new IllegalArgumentException("Animated photo kept as sent");
                if ((long) info.getSize().getWidth() * info.getSize().getHeight() > MAX_PIXELS) {
                    throw new IllegalArgumentException("Photo too large to convert: " + info.getSize());
                }
                // A hardware bitmap can't be encoded again.
                decoder.setAllocator(ImageDecoder.ALLOCATOR_SOFTWARE);
            });
            // JPEG has no transparency, so a see-through photo would turn black where it shows through.
            if (bitmap.hasAlpha()) return extension;
            jpeg = MediaCache.createTempFile(context, "photo-jpeg-", ".tmp");
            try (FileOutputStream output = new FileOutputStream(jpeg)) {
                if (!bitmap.compress(Bitmap.CompressFormat.JPEG, QUALITY, output)) {
                    throw new IOException("The JPEG encoder refused the photo");
                }
            }
            Files.move(jpeg.toPath(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            return "jpg";
        } catch (IOException | RuntimeException | OutOfMemoryError error) {
            Logger.printInfo(() -> "Kept the " + extension + " photo TikTok sent: " + error);
            return extension;
        } finally {
            if (bitmap != null) bitmap.recycle();
            if (jpeg != null && !MediaCache.delete(jpeg)) {
                Logger.printInfo(() -> "Could not remove a photo conversion temporary file");
            }
        }
    }
}
