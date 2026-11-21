package app.morphe.extension.instants;

import android.app.Dialog;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.ImageDecoder;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/** Headless fragment that picks media. Images are decoded off-main-thread and edited before
 * being handed to the existing camera substitution pipeline. */
@SuppressWarnings("deprecation")
public final class GalleryPickerFragment extends Fragment {
    static final String TAG = "InstantsGallery";
    private static final int REQUEST_PICK = 0x4750;
    private static final int MAX_DECODE_SIDE = 2048;
    private static final int MAX_OUTPUT_SIDE = 1440;
    private final Handler main = new Handler(Looper.getMainLooper());

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        if (state != null) { detach(); return; }
        try { startActivityForResult(pickerIntent(), REQUEST_PICK); }
        catch (Throwable t) { Log.e(TAG,"Unable to start gallery picker",t); detach(); }
    }

    private static Intent pickerIntent() {
        // Keep image + video selection on every supported Android version. ACTION_PICK_IMAGES
        // is image-only on many platform/provider combinations, so it would regress video upload.
        Intent pick=new Intent(Intent.ACTION_GET_CONTENT);
        pick.setType("*/*");
        pick.putExtra(Intent.EXTRA_MIME_TYPES,new String[]{"image/*","video/*"});
        pick.addCategory(Intent.CATEGORY_OPENABLE);
        return pick;
    }

    @Override public void onActivityResult(int requestCode,int resultCode,Intent data) {
        super.onActivityResult(requestCode,resultCode,data);
        if(requestCode!=REQUEST_PICK) return;
        final android.app.Activity activity=getActivity();
        final Uri uri=resultCode==android.app.Activity.RESULT_OK && data!=null ? data.getData():null;
        if(uri==null || activity==null) { detach(); return; }
        String type=activity.getContentResolver().getType(uri);
        if(type!=null && type.startsWith("video/")) {
            detach(); loadVideo(activity,uri); return;
        }
        final Context app=activity.getApplicationContext();
        detach();
        new Thread(() -> {
            Bitmap decoded=decode(app,uri);
            final Bitmap result=decoded;
            main.post(() -> {
                android.app.Activity current=InstantsGalleryHelper.getActivity();
                if(result==null) {
                    if(current!=null && !current.isFinishing()) Toast.makeText(current,InstantsStrings.imageFailed(current),Toast.LENGTH_SHORT).show();
                    return;
                }
                if(current==null || current.isFinishing() || current.isDestroyed()) { result.recycle(); return; }
                showCropEditor(current,result);
            });
        },"InstantsGalleryImage").start();
    }

    private static Bitmap decode(Context context,Uri uri) {
        try {
            ImageDecoder.Source source=ImageDecoder.createSource(context.getContentResolver(),uri);
            return ImageDecoder.decodeBitmap(source,(decoder,info,src) -> {
                int width=info.getSize().getWidth(), height=info.getSize().getHeight();
                float scale=Math.min(1f,(float)MAX_DECODE_SIDE/Math.max(width,height));
                if(scale<1f) decoder.setTargetSize(Math.max(1,Math.round(width*scale)),Math.max(1,Math.round(height*scale)));
                decoder.setAllocator(ImageDecoder.ALLOCATOR_SOFTWARE);
                decoder.setMutableRequired(true);
            });
        } catch(Throwable t) { Log.e(TAG,"Unable to decode selected image",t); return null; }
    }

    // Full-screen editor: the crop surface takes everything between a compact header and the
    // action row, instead of the small box an AlertDialog leaves for its view.
    private static void showCropEditor(android.app.Activity activity,Bitmap bitmap) {
        float density=activity.getResources().getDisplayMetrics().density;
        GalleryCropView cropView=new GalleryCropView(activity,bitmap);

        LinearLayout header=new LinearLayout(activity);
        header.setOrientation(LinearLayout.VERTICAL);
        header.setBackgroundColor(0xFF000000);
        header.setPadding(dp(density,20),dp(density,16),dp(density,20),dp(density,8));
        TextView title=new TextView(activity);
        title.setText(InstantsStrings.cropTitle(activity));
        title.setTextColor(0xFFFFFFFF);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP,18);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        header.addView(title,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));
        TextView hint=new TextView(activity);
        hint.setText(InstantsStrings.cropHint(activity));
        hint.setTextColor(0xB3FFFFFF);
        hint.setTextSize(TypedValue.COMPLEX_UNIT_SP,13);
        LinearLayout.LayoutParams hintParams=new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT);
        hintParams.topMargin=dp(density,6);
        header.addView(hint,hintParams);

        LinearLayout actions=new LinearLayout(activity);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setGravity(Gravity.END|Gravity.CENTER_VERTICAL);
        actions.setBackgroundColor(0xFF000000);
        actions.setPadding(dp(density,8),dp(density,8),dp(density,8),dp(density,8));
        Button cancel=actionButton(activity,InstantsStrings.cancel(activity),0xFFFFFFFF,density);
        Button use=actionButton(activity,InstantsStrings.useImage(activity),accentColor(activity),density);
        actions.addView(cancel);
        actions.addView(use);

        LinearLayout layout=new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setBackgroundColor(0xFF000000);
        layout.addView(header,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));
        layout.addView(cropView,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,0,1f));
        layout.addView(actions,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));

        final Dialog dialog=new Dialog(activity,android.R.style.Theme_Black_NoTitleBar);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(layout);
        dialog.setCanceledOnTouchOutside(false);

        cancel.setOnClickListener(v -> dialog.dismiss());
        use.setOnClickListener(v -> {
            try {
                Bitmap cropped=cropView.createCroppedBitmap(MAX_OUTPUT_SIDE);
                if(cropped==null) { Toast.makeText(activity,InstantsStrings.imageFailed(activity),Toast.LENGTH_SHORT).show(); return; }
                InstantsGalleryHelper.setPendingBitmap(cropped);
                Toast.makeText(activity,InstantsStrings.imageSelected(activity),Toast.LENGTH_SHORT).show();
                dialog.dismiss();
            } catch(Throwable t) { Log.e(TAG,"Unable to crop image",t); Toast.makeText(activity,InstantsStrings.imageFailed(activity),Toast.LENGTH_SHORT).show(); }
        });
        dialog.setOnDismissListener(d -> { if(!bitmap.isRecycled()) bitmap.recycle(); });
        dialog.show();
        Window window=dialog.getWindow();
        if(window!=null) {
            window.setBackgroundDrawable(new ColorDrawable(0xFF000000));
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.MATCH_PARENT);
        }
    }

    private static Button actionButton(android.app.Activity activity,String text,int color,float density) {
        Button button=new Button(activity);
        button.setText(text);
        button.setTextColor(color);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP,15);
        button.setAllCaps(false);
        button.setBackground(null);
        button.setPadding(dp(density,16),dp(density,12),dp(density,16),dp(density,12));
        return button;
    }

    private static int accentColor(Context context) {
        TypedValue value=new TypedValue();
        if(context.getTheme().resolveAttribute(android.R.attr.colorAccent,value,true)) {
            if(value.resourceId!=0) return context.getResources().getColor(value.resourceId,context.getTheme());
            return value.data;
        }
        return 0xFF7BB4FF;
    }

    private static int dp(float density,int value) {
        return Math.round(value*density);
    }

    private static void loadVideo(final android.app.Activity activity,final Uri uri) {
        final Context context=activity.getApplicationContext();
        new Thread(() -> {
            final GalleryVideoLoader.Result result=GalleryVideoLoader.load(context,uri);
            new Handler(Looper.getMainLooper()).post(() -> {
                if(result.status==GalleryVideoLoader.OK) {
                    InstantsGalleryHelper.setPendingVideo(result.file,result.thumbnail,result.width,result.height);
                    Toast.makeText(context,InstantsStrings.videoSelected(context),Toast.LENGTH_SHORT).show();
                } else if(result.status==GalleryVideoLoader.TOO_LONG) Toast.makeText(context,InstantsStrings.videoTooLong(context),Toast.LENGTH_LONG).show();
                else Toast.makeText(context,InstantsStrings.videoFailed(context),Toast.LENGTH_SHORT).show();
            });
        },"InstantsGalleryVideo").start();
    }

    private void detach() {
        try { getFragmentManager().beginTransaction().remove(this).commitAllowingStateLoss(); }
        catch(Throwable ignored) { }
    }
}
