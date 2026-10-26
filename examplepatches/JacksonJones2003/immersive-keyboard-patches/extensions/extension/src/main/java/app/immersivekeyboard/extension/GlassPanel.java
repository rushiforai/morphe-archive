package app.immersivekeyboard.extension;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Gives the translucent keyboard panel a glass look: light caught along its edges, a faint
 * sheen across it and a bright rim on top. An app cannot bend the pixels behind its window,
 * so the edge "refraction" is imitated with light and dark bands; keys are left untouched.
 */
@SuppressWarnings("unused")
public final class GlassPanel {
    private static final float EDGE_GLOW_DP = 14f;
    private static final float EDGE_SHADE_DP = 26f;
    private static final float SIDE_GLOW_DP = 9f;
    private static final float RIM_DP = 1.25f;

    private static volatile boolean enabled;

    private static final Paint PAINT = new Paint(Paint.ANTI_ALIAS_FLAG);
    private static float cachedLeft = -1, cachedTop = -1, cachedRight = -1, cachedBottom = -1;
    private static Shader sheen, topGlow, topShade, bottomGlow, leftGlow, rightGlow, rim;

    private GlassPanel() {
    }

    /** Injection point. Present only when the Glass Panel patch is applied. */
    public static void enable() {
        enabled = true;
    }

    static boolean isEnabled() {
        return enabled;
    }

    private static final String TAG = "ImmersiveKB";
    // A material style of 0 tells vivo's compositor to use the custom material supplied below.
    private static final int VIVO_STYLE_CUSTOM = 0;
    private static final String VIVO_MATERIAL_CLASS = "android.view.blur.IVivoBlurRender$BlurGeometry";
    private static final float RIM_LIGHT_ROTATION = 0.9f;
    private static final float RIM_LIGHT_LENGTH = 10f;

    /** Rim light strength on dark glass, where full strength makes the corners glare. */
    private static final float DARK_RIM_LIGHT = 0.5f;

    /**
     * Turns on the real glass material that vivo's OriginOS builds into its window blur:
     * the compositor refracts what is behind the edges and adds a rim light. The recipe is
     * the one vivo's own search screen uses for its search box and suggestion card ("strong"
     * glass, in its night and day variants), so the keyboard matches those. Returns false on
     * systems whose blur has no such options, where the drawn imitation is used instead.
     */
    static boolean applySystemGlass(Drawable blur, boolean dark) {
        if (!enabled || blur == null) {
            return false;
        }
        try {
            Class<?> materialClass = Class.forName(VIVO_MATERIAL_CLASS);
            Object material = materialClass.getDeclaredConstructor().newInstance();
            // Tint layers: color, opacity and blend mode of up to three masks over the blur.
            set(material, "mSaturation", dark ? 40f : 20f);
            set(material, "mMaskColor_1", dark ? 0x000000 : 0xE6E6E6);
            set(material, "mMaskOpacity_1", dark ? 0.35f : 0.1f);
            set(material, "mMaskFusion_1", dark ? 2 : 0);
            set(material, "mMaskColor_2", dark ? 0xBFBFBF : 0x262626);
            set(material, "mMaskOpacity_2", dark ? 0.08f : 0.1f);
            set(material, "mMaskFusion_2", dark ? 0 : 7);
            set(material, "mMaskColor_3", 0xFFFFFF);
            set(material, "mMaskOpacity_3", 0f);
            set(material, "mMaskFusion_3", 0);
            set(material, "mFinalOpacity", 1f);
            set(material, "mFinalFusion", 0);
            // Glass: how far the edge bends what is behind it. The search box's 60 px range
            // is meant for a small pill; on a keyboard-sized sheet it makes the short bottom
            // strip look almost unblurred, so keep the band narrow.
            set(material, "mNeedGlassEffect", true);
            // Dark glass keeps its edges soft, like the search box above the keyboard; on light
            // glass a white rim barely shows, so the edge bends and shines harder there.
            set(material, "mRefractionIntensity", dark ? 100f : 170f);
            set(material, "mRefractionRange", dark ? 26f : 40f);
            // Rim light. Each light only lights the border around its own angle, which on a
            // wide sheet leaves parts of it dark; two opposite lights stretched along the whole
            // border light it evenly. Tuned on a vivo X Fold.
            set(material, "mLightColor", 0xFFFFFF);
            set(material, "mLight1Intensity", dark ? DARK_RIM_LIGHT : 1f);
            set(material, "mLight1Rotation", RIM_LIGHT_ROTATION);
            set(material, "mLight1LengthL", RIM_LIGHT_LENGTH);
            set(material, "mLight1LengthR", RIM_LIGHT_LENGTH);
            set(material, "mLight1StrokeWidth", dark ? 3f : 6f);
            set(material, "mLight1Saturation", dark ? 0.4f : 0.5f);
            set(material, "mLight2Intensity", dark ? DARK_RIM_LIGHT : 1f);
            set(material, "mLight2Rotation", RIM_LIGHT_ROTATION + (float) Math.PI);
            set(material, "mLight2Length", RIM_LIGHT_LENGTH);
            set(material, "mLight2StrokeWidth", dark ? 3f : 6f);

            Method setStyle = blur.getClass().getDeclaredMethod("setStyle", int.class);
            setStyle.setAccessible(true);
            setStyle.invoke(blur, VIVO_STYLE_CUSTOM);
            Method setMaterial = blur.getClass()
                    .getDeclaredMethod("setCustomMaterial", materialClass);
            setMaterial.setAccessible(true);
            setMaterial.invoke(blur, material);
            return true;
        } catch (ClassNotFoundException | NoSuchMethodException missing) {
            return false;
        } catch (Throwable failure) {
            Log.w(TAG, "system glass unavailable: " + failure);
            return false;
        }
    }

    private static void set(Object target, String name, Object value) throws Exception {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        field.set(target, value);
    }

    /**
     * Drawn underneath the keyboard, so the panel's own tint softens it and keys cover it.
     * The rectangle is the whole panel including the bottom bar.
     */
    static void drawBehind(Canvas canvas, float left, float top, float right, float bottom,
            float density) {
        if (!enabled || bottom - top <= 0 || right - left <= 0) {
            return;
        }
        prepare(left, top, right, bottom, density);
        float glow = EDGE_GLOW_DP * density;
        float shade = EDGE_SHADE_DP * density;
        float side = SIDE_GLOW_DP * density;

        fill(canvas, sheen, left, top, right, bottom);
        // Light gathered at the top edge, then the darker band a thick glass edge leaves.
        fill(canvas, topGlow, left, top, right, top + glow);
        fill(canvas, topShade, left, top, right, top + shade);
        fill(canvas, bottomGlow, left, bottom - glow, right, bottom);
        fill(canvas, leftGlow, left, top, left + side, bottom);
        fill(canvas, rightGlow, right - side, top, right, bottom);
    }

    /** Drawn over the finished keyboard: the thin bright rim along the panel's top edge. */
    static void drawOnTop(Canvas canvas, float left, float top, float right, float density) {
        if (!enabled || right - left <= 0) {
            return;
        }
        float thickness = RIM_DP * density;
        if (rim == null) {
            return;
        }
        fill(canvas, rim, left, top, right, top + thickness);
    }

    private static void fill(Canvas canvas, Shader shader, float left, float top, float right,
            float bottom) {
        PAINT.setShader(shader);
        canvas.drawRect(left, top, right, bottom, PAINT);
        PAINT.setShader(null);
    }

    private static void prepare(float left, float top, float right, float bottom,
            float density) {
        if (left == cachedLeft && top == cachedTop && right == cachedRight
                && bottom == cachedBottom && sheen != null) {
            return;
        }
        cachedLeft = left;
        cachedTop = top;
        cachedRight = right;
        cachedBottom = bottom;
        float glow = EDGE_GLOW_DP * density;
        float shade = EDGE_SHADE_DP * density;
        float side = SIDE_GLOW_DP * density;
        int clear = Color.TRANSPARENT;

        sheen = new LinearGradient(left, top, right, bottom,
                new int[]{white(34), clear, clear, white(14)},
                new float[]{0f, 0.38f, 0.72f, 1f}, Shader.TileMode.CLAMP);
        topGlow = new LinearGradient(0, top, 0, top + glow,
                white(92), clear, Shader.TileMode.CLAMP);
        topShade = new LinearGradient(0, top, 0, top + shade,
                new int[]{clear, black(30), clear},
                new float[]{0.3f, 0.62f, 1f}, Shader.TileMode.CLAMP);
        bottomGlow = new LinearGradient(0, bottom - glow, 0, bottom,
                clear, white(44), Shader.TileMode.CLAMP);
        leftGlow = new LinearGradient(left, 0, left + side, 0,
                white(56), clear, Shader.TileMode.CLAMP);
        rightGlow = new LinearGradient(right - side, 0, right, 0,
                clear, white(56), Shader.TileMode.CLAMP);
        // Brightest toward the corners, the way a curved glass edge catches light.
        rim = new LinearGradient(left, 0, right, 0,
                new int[]{white(210), white(105), white(210)},
                new float[]{0f, 0.5f, 1f}, Shader.TileMode.CLAMP);
    }

    private static int white(int alpha) {
        return Color.argb(alpha, 255, 255, 255);
    }

    private static int black(int alpha) {
        return Color.argb(alpha, 0, 0, 0);
    }
}
