package app.morphe.extension.instants;

import android.app.Fragment;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.widget.Toast;
import android.util.Log;

import java.io.InputStream;

/**
 * Headless fragment used only to launch the system gallery and receive its result.
 * A fragment is used instead of an Activity so the patched app's manifest does not
 * need a new component.
 */
@SuppressWarnings("deprecation")
public final class GalleryPickerFragment extends Fragment {
    static final String TAG = "InstantsGallery";
    private static final int REQUEST_PICK = 0x4750;
    private static final int MAX_SIDE = 1440;

    @Override
    public void onCreate(Bundle state) {
        super.onCreate(state);
        // Recreated after a configuration change: do not reopen the picker.
        if (state != null) {
            detach();
            return;
        }
        try {
            Intent pick = new Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
            pick.setType("image/*");
            startActivityForResult(pick, REQUEST_PICK);
        } catch (Throwable t) {
            Log.e(TAG, "Unable to start gallery picker", t);
            detach();
        }
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != REQUEST_PICK) return;

        android.app.Activity activity = getActivity();
        Bitmap bitmap = null;
        if (resultCode == android.app.Activity.RESULT_OK && data != null && data.getData() != null) {
            bitmap = decode(data.getData());
        }
        detach();
        if (bitmap != null && activity != null) {
            InstantsGalleryHelper.setPendingBitmap(bitmap);
            Toast.makeText(activity, "Imagem selecionada. Toque no obturador para enviar.", Toast.LENGTH_SHORT).show();
        }
    }

    private void detach() {
        try {
            getFragmentManager().beginTransaction().remove(this).commitAllowingStateLoss();
        } catch (Throwable ignored) {
            // Fragment already detached.
        }
    }

    private Bitmap decode(Uri uri) {
        InputStream in = null;
        try {
            in = getActivity().getContentResolver().openInputStream(uri);
            if (in == null) return null;
            Bitmap bitmap = BitmapFactory.decodeStream(in);
            if (bitmap == null) return null;

            // ACTION_PICK does not guarantee EXIF orientation is baked into the bitmap.
            int orientation = ExifInterface.ORIENTATION_NORMAL;
            try {
                if (in != null) in.close();
                in = getActivity().getContentResolver().openInputStream(uri);
                if (in != null) {
                    ExifInterface exif = new ExifInterface(in);
                    orientation = exif.getAttributeInt(
                            ExifInterface.TAG_ORIENTATION,
                            ExifInterface.ORIENTATION_NORMAL
                    );
                }
            } catch (Throwable ignored) {}

            return centerCropSquare(applyOrientation(bitmap, orientation));
        } catch (Throwable t) {
            Log.e(TAG, "Unable to decode selected image", t);
            return null;
        } finally {
            try { if (in != null) in.close(); } catch (Throwable ignored) {}
        }
    }

    // Instants rejects non-square media ("Media has an invalid aspect ratio"), so the
    // selected image is center-cropped to 1:1 and capped to a sane size.
    private static Bitmap centerCropSquare(Bitmap source) {
        int side = Math.min(source.getWidth(), source.getHeight());
        int x = (source.getWidth() - side) / 2;
        int y = (source.getHeight() - side) / 2;
        Bitmap square = Bitmap.createBitmap(source, x, y, side, side);
        if (square != source) source.recycle();
        if (side <= MAX_SIDE) return square;
        Bitmap scaled = Bitmap.createScaledBitmap(square, MAX_SIDE, MAX_SIDE, true);
        if (scaled != square) square.recycle();
        return scaled;
    }

    private static Bitmap applyOrientation(Bitmap source, int orientation) {
        Matrix matrix = new Matrix();
        switch (orientation) {
            case ExifInterface.ORIENTATION_FLIP_HORIZONTAL:
                matrix.setScale(-1, 1); break;
            case ExifInterface.ORIENTATION_ROTATE_180:
                matrix.setRotate(180); break;
            case ExifInterface.ORIENTATION_FLIP_VERTICAL:
                matrix.setRotate(180); matrix.postScale(-1, 1); break;
            case ExifInterface.ORIENTATION_TRANSPOSE:
                matrix.setRotate(90); matrix.postScale(-1, 1); break;
            case ExifInterface.ORIENTATION_ROTATE_90:
                matrix.setRotate(90); break;
            case ExifInterface.ORIENTATION_TRANSVERSE:
                matrix.setRotate(-90); matrix.postScale(-1, 1); break;
            case ExifInterface.ORIENTATION_ROTATE_270:
                matrix.setRotate(-90); break;
            default:
                return source;
        }
        try {
            Bitmap rotated = Bitmap.createBitmap(source, 0, 0, source.getWidth(), source.getHeight(), matrix, true);
            if (rotated != source) source.recycle();
            return rotated;
        } catch (Throwable ignored) {
            return source;
        }
    }
}
