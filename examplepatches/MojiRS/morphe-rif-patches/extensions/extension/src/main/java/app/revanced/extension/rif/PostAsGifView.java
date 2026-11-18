package app.revanced.extension.rif;

import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;

import java.lang.ref.WeakReference;

/**
 * The "post as GIF (no sound)" row on the Submit screen's media tab (added to submit_fragment.xml
 * by the Reddit image hosting patch): a LinearLayout around one rif-styled switch. Hidden until a
 * video is chosen and its preview is on screen (rif clears the preview when an upload fails, and the
 * row goes with it, and it shows up with the picture); photos and GIFs hide it. The state (video chosen, switch on) survives
 * rotation through the view state. {@link ImageHosting#fixParams} reads {@link #asGif} to post the
 * video as a "videogif".
 */
public class PostAsGifView extends LinearLayout {

    private static final String TAG = "RifImageHosting";

    /** True while this row is on screen, a video is chosen and the switch is on. */
    static volatile boolean asGif;

    private static WeakReference<PostAsGifView> current = new WeakReference<>(null);

    private boolean video;
    private CompoundButton toggle;
    private ImageView preview;
    private final ViewTreeObserver.OnPreDrawListener previewWatch = new ViewTreeObserver.OnPreDrawListener() {
        @Override
        public boolean onPreDraw() {
            try {
                syncVisibility();
            } catch (Throwable t) {
                Log.w(TAG, "post-as-GIF row sync failed", t);
            }
            return true;
        }
    };

    public PostAsGifView(Context context) {
        super(context);
    }

    public PostAsGifView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public PostAsGifView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    /** Whether the row is on screen with a video chosen (the switch then decides, not the saved state). */
    static boolean showingVideo() {
        PostAsGifView view = current.get();
        return view != null && view.video && view.isAttachedToWindow();
    }

    /** Hook (the Submit screen's upload/resize branch, main thread): the chosen file is a video or not. */
    static void mediaChosen(boolean isVideo) {
        PostAsGifView view = current.get();
        if (view != null) view.setVideo(isVideo);
    }

    private void setVideo(boolean isVideo) {
        video = isVideo;
        update();
    }

    private void update() {
        try {
            syncVisibility();
            asGif = video && toggle != null && toggle.isChecked() && isAttachedToWindow();
        } catch (Throwable t) {
            Log.w(TAG, "post-as-GIF row update failed", t);
        }
    }

    /** rif clears the preview with a 1x1 bitmap, so a real picture is more than one pixel wide. */
    private static boolean hasPicture(ImageView view) {
        android.graphics.drawable.Drawable d = view.getDrawable();
        return d != null && d.getIntrinsicWidth() > 1 && d.getIntrinsicHeight() > 1;
    }

    /** Visible while a video is chosen and the form's preview shows a picture. */
    private void syncVisibility() {
        boolean show = video && (preview == null || hasPicture(preview));
        int want = show ? View.VISIBLE : View.GONE;
        if (getVisibility() != want) setVisibility(want);
    }

    @Override
    protected void onFinishInflate() {
        super.onFinishInflate();
        try {
            View child = getChildCount() > 0 ? getChildAt(0) : null;
            if (child instanceof CompoundButton) {
                toggle = (CompoundButton) child;
                toggle.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                    @Override
                    public void onCheckedChanged(CompoundButton button, boolean checked) {
                        update();
                        if (video) ImageHosting.gifToggled(checked);
                    }
                });
            }
        } catch (Throwable t) {
            Log.w(TAG, "post-as-GIF row setup failed", t);
        }
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        current = new WeakReference<>(this);
        try {
            int id = getResources().getIdentifier("submit_image_preview", "id", getContext().getPackageName());
            View found = id != 0 && getParent() instanceof View ? ((View) getParent()).findViewById(id) : null;
            preview = found instanceof ImageView ? (ImageView) found : null;
            getViewTreeObserver().addOnPreDrawListener(previewWatch);
        } catch (Throwable t) {
            Log.w(TAG, "post-as-GIF row can't watch the preview", t);
        }
        update();
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        try {
            getViewTreeObserver().removeOnPreDrawListener(previewWatch);
        } catch (Throwable t) {
            Log.w(TAG, "post-as-GIF row cleanup failed", t);
        }
        if (current.get() == this) {
            current = new WeakReference<>(null);
            asGif = false;
        }
    }

    @Override
    protected Parcelable onSaveInstanceState() {
        SavedState state = new SavedState(super.onSaveInstanceState());
        state.video = video;
        return state;
    }

    @Override
    protected void onRestoreInstanceState(Parcelable state) {
        if (!(state instanceof SavedState)) {
            super.onRestoreInstanceState(state);
            return;
        }
        SavedState saved = (SavedState) state;
        super.onRestoreInstanceState(saved.getSuperState());
        video = saved.video;
        update();
    }

    private static final class SavedState extends BaseSavedState {
        boolean video;

        SavedState(Parcelable superState) {
            super(superState);
        }

        private SavedState(Parcel in) {
            super(in);
            video = in.readInt() != 0;
        }

        @Override
        public void writeToParcel(Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeInt(video ? 1 : 0);
        }

        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() {
            @Override
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            @Override
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };
    }
}
