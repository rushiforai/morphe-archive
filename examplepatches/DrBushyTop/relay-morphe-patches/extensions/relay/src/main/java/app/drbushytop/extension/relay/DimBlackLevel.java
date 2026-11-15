package app.drbushytop.extension.relay;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.Application;
import android.content.ContentResolver;
import android.content.res.ColorStateList;
import android.database.ContentObserver;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RuntimeShader;
import android.graphics.drawable.AnimatedImageDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableContainer;
import android.graphics.drawable.DrawableWrapper;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.util.Log;
import android.util.TypedValue;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewTreeObserver;
import android.webkit.WebView;
import android.widget.ImageView;
import android.widget.TextView;

import app.drbushytop.extension.relay.inline.InlineCommentMedia;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Relay's Night theme, made to look like Night (OLED), turns its blacks into dark grey while the
 * screen brightness is very low.
 *
 * <p>vivo's LTPO phones hold the screen at 60 Hz in dim light while half of it or more is darker
 * than 49/255, presumably because a slow refresh flickers there. Measured on a vivo X300 Ultra,
 * holding 60 Hz costs more battery than the grey's light does at that brightness. Above that
 * brightness the rate drops with black too, so the theme stays black.
 *
 * <p>The grey comes from a curve over the whole window: black becomes 51/255, darker tones are
 * lifted in proportion (so a dark toolbar stays apart from the background), and everything from
 * 102/255 up, text included, is left as it is. Pictures, videos (thumbnails, previews,
 * pictures in comments) and web pages in Relay's browser are cut out of it, so they keep their own
 * blacks; views drawn over them, such as toolbars, are still lifted.
 */
@SuppressWarnings("unused")
public final class DimBlackLevel {
    private static final String TAG = "RelayDimBlack";
    /** Set by the patch on the Night theme only. */
    private static final String MARKER_ATTR = "drbushytopLiftInDimLight";
    /** What black becomes: the darkest grey that lets the rate drop is 49; two steps of margin. */
    private static final float LIFTED = 51 / 255f;
    /**
     * The brightness setting (0 to 1) below which black holds 60 Hz: 0.023 does, 0.024 does not.
     * Lifting starts a little above it, where the grey costs nothing measurable, and stops a
     * little higher still, so the screen does not flip back and forth around one value.
     */
    private static final float LIFT_BELOW = 0.030f;
    private static final float UNLIFT_ABOVE = 0.036f;
    private static final long FADE_MS = 400;
    private static final String BRIGHTNESS = "screen_brightness_float";
    private static final String CURVE =
            "uniform shader content;"
            + "uniform half lift;"
            // Pictures, which keep their blacks (rounded rectangles, each with the rectangle its
            // parents clip it to, and when it is drawn)...
            + "uniform float holeCount;"
            + "uniform float4 holes[16];"
            + "uniform float4 holeClips[16];"
            + "uniform float holeRadii[16];"
            + "uniform float holeOrders[16];"
            // ...and the views drawn over them, which do not.
            + "uniform float coverCount;"
            + "uniform float4 covers[8];"
            + "uniform float4 coverClips[8];"
            + "uniform float coverRadii[8];"
            + "uniform float coverOrders[8];"
            + "bool inside(float2 p, float4 r, float4 c, float radius) {"
            + "  if (p.x < c.x || p.y < c.y || p.x > c.z || p.y > c.w) return false;"
            + "  if (p.x < r.x || p.y < r.y || p.x > r.z || p.y > r.w) return false;"
            + "  float2 q = clamp(p, r.xy + radius, r.zw - radius);"
            + "  return distance(p, q) <= radius;"
            + "}"
            + "bool picture(float2 p) {"
            + "  for (int i = 0; i < 16; i++) {"
            + "    if (float(i) >= holeCount) return false;"
            + "    if (inside(p, holes[i], holeClips[i], holeRadii[i])) {"
            + "      bool covered = false;"
            + "      for (int j = 0; j < 8; j++) {"
            + "        if (float(j) >= coverCount) break;"
            + "        if (coverOrders[j] > holeOrders[i]"
            + "            && inside(p, covers[j], coverClips[j], coverRadii[j])) covered = true;"
            + "      }"
            + "      if (!covered) return true;"
            + "    }"
            + "  }"
            + "  return false;"
            + "}"
            + "half4 main(float2 p) {"
            + "  half4 c = content.eval(p);"
            + "  if (picture(p)) return c;"
            // Colours are premultiplied, so transparent parts of the window stay transparent.
            + "  return half4(max(c.rgb, c.a * lift + c.rgb * 0.5), c.a);"
            + "}";

    private static final WeakHashMap<Activity, Lift> LIFTS = new WeakHashMap<>();
    private static ContentResolver resolver;
    private static boolean dim;
    private static boolean installed;

    private DimBlackLevel() {
    }

    /** Hook: Relay's Application#onCreate. */
    public static void install(Application application) {
        try {
            if (application == null || installed || Build.VERSION.SDK_INT < 33) return;
            installed = true;
            resolver = application.getContentResolver();
            readBrightness();
            ContentObserver observer = new ContentObserver(new Handler(Looper.getMainLooper())) {
                @Override
                public void onChange(boolean selfChange) {
                    readBrightness();
                    for (Lift lift : new ArrayList<>(LIFTS.values())) lift.update(true);
                }
            };
            resolver.registerContentObserver(Settings.System.getUriFor(BRIGHTNESS), false, observer);
            resolver.registerContentObserver(Settings.System.getUriFor(Settings.System.SCREEN_BRIGHTNESS), false, observer);
            application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityResumed(Activity activity) {
                    readBrightness();
                    Lift lift = LIFTS.get(activity);
                    if (lift == null) {
                        if (!marked(activity)) return;
                        lift = new Lift(activity.getWindow().getDecorView());
                        LIFTS.put(activity, lift);
                    }
                    // Coming back to the screen: no need to fade.
                    lift.update(false);
                }

                @Override
                public void onActivityDestroyed(Activity activity) {
                    Lift lift = LIFTS.remove(activity);
                    if (lift != null) lift.cancel();
                }

                @Override public void onActivityCreated(Activity activity, Bundle savedInstanceState) {}
                @Override public void onActivityStarted(Activity activity) {}
                @Override public void onActivityPaused(Activity activity) {}
                @Override public void onActivityStopped(Activity activity) {}
                @Override public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}
            });
        } catch (Throwable t) {
            Log.e(TAG, "install", t);
        }
    }

    /** Whether the activity uses the Night theme. */
    private static boolean marked(Activity activity) {
        try {
            if (activity.getWindow() == null) return false;
            int attr = activity.getResources().getIdentifier(MARKER_ATTR, "attr", activity.getPackageName());
            if (attr == 0) return false;
            TypedValue value = new TypedValue();
            return activity.getTheme().resolveAttribute(attr, value, true)
                    && value.type == TypedValue.TYPE_INT_BOOLEAN && value.data != 0;
        } catch (Throwable t) {
            Log.e(TAG, "marked", t);
            return false;
        }
    }

    private static void readBrightness() {
        try {
            float brightness;
            try {
                brightness = Settings.System.getFloat(resolver, BRIGHTNESS);
            } catch (Throwable unreadable) {
                // Only the 0 to 255 setting: 0.030 is between 7 and 8.
                brightness = Settings.System.getInt(resolver, Settings.System.SCREEN_BRIGHTNESS) / 255f;
            }
            dim = dim ? brightness < UNLIFT_ABOVE : brightness < LIFT_BELOW;
        } catch (Throwable t) {
            dim = false;
        }
    }


    /** The curve over one activity's window, faded in and out, with the pictures cut out of it. */
    private static final class Lift implements ViewTreeObserver.OnPreDrawListener {
        private final View decor;
        private final RuntimeShader shader = new RuntimeShader(CURVE);
        private final Pictures pictures;
        /** 0 is no change, {@link #LIFTED} is fully lifted. */
        private float shown;
        private ValueAnimator fade;

        Lift(View decor) {
            this.decor = decor;
            pictures = new Pictures(decor.getResources().getDisplayMetrics().density);
            decor.getViewTreeObserver().addOnPreDrawListener(this);
        }

        /** Before each frame: pictures move as the screen scrolls, so the cut-outs follow them. */
        @Override
        public boolean onPreDraw() {
            try {
                if (shown > 0f && pictures.find(decor)) apply(shown);
            } catch (Throwable t) {
                Log.e(TAG, "onPreDraw", t);
            }
            return true;
        }

        void update(boolean animate) {
            float target = dim ? LIFTED : 0f;
            if (fade != null) {
                fade.cancel();
                fade = null;
            }
            if (shown == target) return;
            if (Log.isLoggable(TAG, Log.DEBUG)) Log.d(TAG, "lifted blacks: " + dim);
            if (target > 0f) pictures.find(decor);
            if (!animate) {
                apply(target);
                return;
            }
            fade = ValueAnimator.ofFloat(shown, target);
            fade.setDuration(FADE_MS);
            fade.addUpdateListener(animation -> apply((Float) animation.getAnimatedValue()));
            fade.start();
        }

        void cancel() {
            if (fade != null) fade.cancel();
            ViewTreeObserver observer = decor.getViewTreeObserver();
            if (observer.isAlive()) observer.removeOnPreDrawListener(this);
        }

        private void apply(float lift) {
            try {
                shown = lift;
                if (lift <= 0f) {
                    decor.setRenderEffect(null);
                    return;
                }
                shader.setFloatUniform("lift", lift);
                pictures.setUniforms(shader);
                decor.setRenderEffect(RenderEffect.createRuntimeShaderEffect(shader, "content"));
            } catch (Throwable t) {
                Log.e(TAG, "apply", t);
            }
        }
    }

    /**
     * Where the window shows pictures and videos, which keep their own blacks, and the views
     * drawn over them (toolbars, buttons), which are lifted like the rest.
     */
    private static final class Pictures {
        private static final int MAX_HOLES = 16;
        private static final int MAX_COVERS = 8;
        /** Smaller pictures are icons, which sit on the theme's background. */
        private static final float MIN_PICTURE_DP = 40;

        private final float minPicture;
        private final Areas holes = new Areas(MAX_HOLES);
        private final Areas covers = new Areas(MAX_COVERS);
        private float[] last = new float[0];
        /** Drawing order of the view being looked at: later ones are drawn over earlier ones. */
        private int order;

        Pictures(float density) {
            minPicture = MIN_PICTURE_DP * density;
        }

        /** @return whether anything changed since the last call. */
        boolean find(View root) {
            holes.clear();
            covers.clear();
            order = 0;
            walk(root, 0f, 0f, new RectF(0, 0, root.getWidth(), root.getHeight()), null, 0f);
            float[] now = holes.snapshot(covers);
            if (Arrays.equals(now, last)) return false;
            last = now;
            return true;
        }

        void setUniforms(RuntimeShader shader) {
            holes.setUniforms(shader, "hole");
            covers.setUniforms(shader, "cover");
        }

        /**
         * @param x       where the parent's content starts in the window (its scroll included)
         * @param clip    what the parents let this view draw in
         * @param outline the rounded outline the nearest parent clips to, or null
         */
        private void walk(View view, float x, float y, RectF clip, RectF outline, float outlineRadius) {
            if (view.getVisibility() != View.VISIBLE || view.getAlpha() <= 0f) return;
            float left = x + view.getLeft() + view.getTranslationX();
            float top = y + view.getTop() + view.getTranslationY();
            RectF bounds = new RectF(left, top, left + view.getWidth(), top + view.getHeight());
            if (!RectF.intersects(bounds, clip)) return;
            int self = order++;

            boolean picture = false;
            if (view instanceof ImageView) {
                picture = imageView((ImageView) view, bounds, clip, outline, outlineRadius, self);
            } else if (view instanceof TextureView || view instanceof WebView) {
                // A video, or a web page in Relay's browser: both keep their own colours.
                picture = addPicture(bounds, clip, view.getClipToOutline() ? radius(view) : 0f, self);
            } else if (!(view instanceof TextView) && !(view instanceof ViewGroup)) {
                picture = customView(view, bounds, clip, self);
            }
            // Only matters over a picture drawn before it.
            if (!picture && holes.count > 0 && solid(view.getBackground())) {
                covers.add(bounds, clip, radius(view), self);
            }
            if (view instanceof TextView) textPictures((TextView) view, bounds, clip);

            if (!(view instanceof ViewGroup)) return;
            ViewGroup group = (ViewGroup) view;
            RectF childClip = clip;
            if (group.getClipChildren()) {
                childClip = new RectF(bounds);
                if (group.getClipToPadding()) {
                    childClip.left += group.getPaddingLeft();
                    childClip.top += group.getPaddingTop();
                    childClip.right -= group.getPaddingRight();
                    childClip.bottom -= group.getPaddingBottom();
                }
                if (!childClip.intersect(clip)) return;
            }
            if (group.getClipToOutline()) {
                float radius = radius(group);
                if (radius > 0f) {
                    outline = bounds;
                    outlineRadius = radius;
                }
            }
            float childX = left - group.getScrollX();
            float childY = top - group.getScrollY();
            for (View child : drawingOrder(group)) walk(child, childX, childY, childClip, outline, outlineRadius);
        }

        private boolean imageView(ImageView view, RectF bounds, RectF clip, RectF outline,
                                  float outlineRadius, int self) {
            Drawable drawable = view.getDrawable();
            float corner = pictureCorner(drawable);
            if (corner < 0f) return false;
            RectF content = new RectF(bounds.left + view.getPaddingLeft(), bounds.top + view.getPaddingTop(),
                    bounds.right - view.getPaddingRight(), bounds.bottom - view.getPaddingBottom());
            RectF shown = content;
            int width = drawable.getIntrinsicWidth();
            int height = drawable.getIntrinsicHeight();
            if (width > 0 && height > 0 && view.getScaleType() != ImageView.ScaleType.FIT_XY) {
                // Letterboxed or cropped: only where the picture itself is drawn.
                shown = new RectF(0, 0, width, height);
                view.getImageMatrix().mapRect(shown);
                shown.offset(content.left - view.getScrollX(), content.top - view.getScrollY());
                if (!shown.intersect(content)) return false;
            }
            float radius = Math.max(view.getClipToOutline() ? radius(view) : 0f, corner * shown.width());
            // Rounded by the parent it fills.
            if (radius == 0f && outline != null && covers(shown, outline)) {
                shown = outline;
                radius = outlineRadius;
            }
            return addPicture(shown, clip, radius, self);
        }

        /**
         * A view of the app's own that draws a picture it keeps in a field, such as Relay's
         * post thumbnails.
         */
        private boolean customView(View view, RectF bounds, RectF clip, int self) {
            if (view.getClass().getName().startsWith("android.")) return false;
            for (Field field : drawableFields(view.getClass())) {
                Drawable drawable;
                try {
                    drawable = (Drawable) field.get(view);
                } catch (Throwable t) {
                    continue;
                }
                float corner = pictureCorner(drawable);
                if (corner < 0f) continue;
                // Only one drawn over the whole view: anything else may be a pending or old one.
                Rect area = drawable.getBounds();
                if (area.width() < view.getWidth() - 1 || area.height() < view.getHeight() - 1) continue;
                return addPicture(bounds, clip, corner * bounds.width(), self);
            }
            return false;
        }

        private static final Map<Class<?>, List<Field>> DRAWABLE_FIELDS = new HashMap<>();

        private static List<Field> drawableFields(Class<?> type) {
            List<Field> fields = DRAWABLE_FIELDS.get(type);
            if (fields != null) return fields;
            fields = new ArrayList<>();
            for (Class<?> c = type; c != null && c != View.class && !c.getName().startsWith("android."); c = c.getSuperclass()) {
                for (Field field : c.getDeclaredFields()) {
                    if (!Drawable.class.isAssignableFrom(field.getType()) || Modifier.isStatic(field.getModifiers())) continue;
                    try {
                        field.setAccessible(true);
                        fields.add(field);
                    } catch (Throwable ignored) {
                        // Not readable: not looked at.
                    }
                }
            }
            DRAWABLE_FIELDS.put(type, fields);
            return fields;
        }

        private void textPictures(TextView view, RectF bounds, RectF clip) {
            List<RectF> pictures = InlineCommentMedia.pictureBounds(view);
            if (pictures == null) return;
            RectF viewClip = new RectF(bounds);
            if (!viewClip.intersect(clip)) return;
            float radius = InlineCommentMedia.pictureCornerRadius();
            for (RectF picture : pictures) {
                picture.offset(bounds.left, bounds.top);
                addPicture(picture, viewClip, radius, order++);
            }
        }

        private boolean addPicture(RectF area, RectF clip, float radius, int drawn) {
            if (Math.min(area.width(), area.height()) < minPicture) return false;
            holes.add(area, clip, radius, drawn);
            return true;
        }

        /** Whether {@code inner} reaches every edge of {@code outer}, give or take a pixel. */
        private static boolean covers(RectF inner, RectF outer) {
            return inner.left <= outer.left + 1 && inner.top <= outer.top + 1
                    && inner.right >= outer.right - 1 && inner.bottom >= outer.bottom - 1;
        }

        /** Children in the order they are drawn: by elevation, then as added. */
        private static List<View> drawingOrder(ViewGroup group) {
            int count = group.getChildCount();
            List<View> children = new ArrayList<>(count);
            boolean raised = false;
            for (int i = 0; i < count; i++) {
                View child = group.getChildAt(i);
                if (child == null) continue;
                children.add(child);
                if (child.getZ() != 0f) raised = true;
            }
            if (raised) children.sort((a, b) -> Float.compare(a.getZ(), b.getZ()));
            return children;
        }

        private static float radius(View view) {
            try {
                ViewOutlineProvider provider = view.getOutlineProvider();
                if (provider == null || view.getWidth() == 0 || view.getHeight() == 0) return 0f;
                Outline outline = new Outline();
                provider.getOutline(view, outline);
                return Math.max(0f, outline.getRadius());
            } catch (Throwable t) {
                return 0f;
            }
        }

        /** Corner rounding of opaque bitmaps already looked at, as a fraction of their width. */
        private static final Map<Bitmap, Float> CORNERS = new WeakHashMap<>();

        /**
         * Whether a drawable is a photo, GIF or video frame, and how round its corners are.
         *
         * @return -1 when it is not a picture, otherwise its corner radius as a fraction of its
         * width: a picture rounded by transparent corners, like Relay's thumbnails, shows the
         * theme in them.
         */
        private static float pictureCorner(Drawable drawable) {
            if (drawable == null) return -1f;
            if (drawable instanceof BitmapDrawable) return bitmapCorner(((BitmapDrawable) drawable).getBitmap());
            if (drawable instanceof AnimatedImageDrawable) return 0f;
            if (drawable instanceof LayerDrawable) {
                // A cross-fade from a placeholder to the picture.
                LayerDrawable layers = (LayerDrawable) drawable;
                for (int i = 0; i < layers.getNumberOfLayers(); i++) {
                    float corner = pictureCorner(layers.getDrawable(i));
                    if (corner >= 0f) return corner;
                }
                return -1f;
            }
            if (drawable instanceof DrawableContainer) return pictureCorner(drawable.getCurrent());
            if (drawable instanceof DrawableWrapper) return pictureCorner(((DrawableWrapper) drawable).getDrawable());
            // Glide's GIFs.
            return drawable.getClass().getName().endsWith("GifDrawable") ? 0f : -1f;
        }

        private static float bitmapCorner(Bitmap bitmap) {
            if (bitmap == null || bitmap.isRecycled()) return -1f;
            if (!bitmap.hasAlpha()) return 0f;
            Float known = CORNERS.get(bitmap);
            if (known != null) return known;
            float corner;
            try {
                int width = bitmap.getWidth();
                int height = bitmap.getHeight();
                if (Color.alpha(bitmap.getPixel(width / 2, height / 2)) < 255) {
                    // See-through in the middle: an icon or a cut-out shape.
                    corner = -1f;
                } else {
                    // How far the transparent corner reaches along the diagonal, d, is r(1 - 1/√2).
                    int d = 0;
                    int max = Math.min(width, height) / 2;
                    while (d < max && Color.alpha(bitmap.getPixel(d, d)) < 128) d++;
                    corner = d / (1f - (float) Math.sqrt(0.5)) / width;
                }
            } catch (Throwable t) {
                // Pixels not readable (a hardware bitmap): taken as square.
                corner = 0f;
            }
            CORNERS.put(bitmap, corner);
            return corner;
        }

        private static Method shapeFillColor;

        /** Whether a background hides what is under it. */
        private static boolean solid(Drawable drawable) {
            if (drawable == null || drawable.getAlpha() < 255) return false;
            if (drawable instanceof ColorDrawable) {
                return Color.alpha(((ColorDrawable) drawable).getColor()) == 255;
            }
            if (drawable instanceof RippleDrawable) {
                // Its mask is not drawn, and a ripple alone is see-through.
                RippleDrawable ripple = (RippleDrawable) drawable;
                for (int i = 0; i < ripple.getNumberOfLayers(); i++) {
                    if (ripple.getId(i) != android.R.id.mask && solid(ripple.getDrawable(i))) return true;
                }
                return false;
            }
            if (drawable instanceof LayerDrawable) {
                LayerDrawable layers = (LayerDrawable) drawable;
                for (int i = 0; i < layers.getNumberOfLayers(); i++) {
                    if (solid(layers.getDrawable(i))) return true;
                }
                return false;
            }
            if (drawable instanceof DrawableContainer) return solid(drawable.getCurrent());
            if (drawable instanceof DrawableWrapper) return solid(((DrawableWrapper) drawable).getDrawable());
            if (drawable instanceof GradientDrawable) {
                ColorStateList color = ((GradientDrawable) drawable).getColor();
                return color != null && Color.alpha(color.getColorForState(drawable.getState(), color.getDefaultColor())) == 255;
            }
            if (drawable.getClass().getName().endsWith("MaterialShapeDrawable")) {
                // Toolbars, the bottom bar and the floating button: often coloured by a tint
                // rather than a fill, so solid unless the fill is see-through.
                try {
                    if (shapeFillColor == null) shapeFillColor = drawable.getClass().getMethod("getFillColor");
                    ColorStateList color = (ColorStateList) shapeFillColor.invoke(drawable);
                    return color == null || Color.alpha(color.getColorForState(drawable.getState(), color.getDefaultColor())) > 0;
                } catch (Throwable t) {
                    return true;
                }
            }
            return drawable.getOpacity() == PixelFormat.OPAQUE;
        }
    }

    /** Rounded rectangles for the shader, in window pixels, with what clips each and when it is drawn. */
    private static final class Areas {
        final int max;
        final float[] rects;
        final float[] clips;
        final float[] radii;
        final float[] orders;
        int count;

        Areas(int max) {
            this.max = max;
            rects = new float[max * 4];
            clips = new float[max * 4];
            radii = new float[max];
            orders = new float[max];
        }

        void clear() {
            count = 0;
        }

        void add(RectF rect, RectF clip, float radius, int order) {
            if (count == max || !RectF.intersects(rect, clip)) return;
            int i = count * 4;
            rects[i] = rect.left;
            rects[i + 1] = rect.top;
            rects[i + 2] = rect.right;
            rects[i + 3] = rect.bottom;
            clips[i] = clip.left;
            clips[i + 1] = clip.top;
            clips[i + 2] = clip.right;
            clips[i + 3] = clip.bottom;
            radii[count] = Math.min(radius, Math.min(rect.width(), rect.height()) / 2f);
            orders[count] = order;
            count++;
        }

        void setUniforms(RuntimeShader shader, String name) {
            shader.setFloatUniform(name + "Count", count);
            shader.setFloatUniform(name + "s", rects);
            shader.setFloatUniform(name + "Clips", clips);
            shader.setFloatUniform(name + "Radii", radii);
            shader.setFloatUniform(name + "Orders", orders);
        }

        /** Everything in use, this and {@code other}, to tell whether a frame changed anything. */
        float[] snapshot(Areas other) {
            float[] out = new float[2 + (count + other.count) * 10];
            int at = 0;
            out[at++] = count;
            out[at++] = other.count;
            at = copy(out, at);
            other.copy(out, at);
            return out;
        }

        private int copy(float[] out, int at) {
            System.arraycopy(rects, 0, out, at, count * 4);
            at += count * 4;
            System.arraycopy(clips, 0, out, at, count * 4);
            at += count * 4;
            System.arraycopy(radii, 0, out, at, count);
            at += count;
            System.arraycopy(orders, 0, out, at, count);
            return at + count;
        }
    }
}
