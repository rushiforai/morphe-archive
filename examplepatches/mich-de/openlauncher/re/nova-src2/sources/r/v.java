package r;

import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Shader;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ClipDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.text.method.KeyListener;
import android.text.method.NumberKeyListener;
import android.util.AttributeSet;
import android.view.View;
import android.view.inputmethod.InputConnection;
import android.widget.AbsSeekBar;
import android.widget.EditText;
import io.sentry.e3;

/* loaded from: classes2.dex */
public class v {

    /* renamed from: d, reason: collision with root package name */
    public static final int[] f84884d = {16843067, 16843068};

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f84885a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final View f84886b;

    /* renamed from: c, reason: collision with root package name */
    public Object f84887c;

    public v(AbsSeekBar absSeekBar) {
        this.f84886b = absSeekBar;
    }

    public KeyListener a(KeyListener keyListener) {
        if (keyListener instanceof NumberKeyListener) {
            return keyListener;
        }
        ((e3) ((a5.d) this.f84887c).f267b).getClass();
        if (keyListener instanceof b6.f) {
            return keyListener;
        }
        if (keyListener == null) {
            return null;
        }
        return keyListener instanceof NumberKeyListener ? keyListener : new b6.f(keyListener);
    }

    public void b(AttributeSet attributeSet, int i5) {
        switch (this.f84885a) {
            case 0:
                AbsSeekBar absSeekBar = (AbsSeekBar) this.f84886b;
                x7.u uVarR = x7.u.r(absSeekBar.getContext(), attributeSet, f84884d, i5);
                Drawable drawableM = uVarR.m(0);
                if (drawableM != null) {
                    if (drawableM instanceof AnimationDrawable) {
                        AnimationDrawable animationDrawable = (AnimationDrawable) drawableM;
                        int numberOfFrames = animationDrawable.getNumberOfFrames();
                        AnimationDrawable animationDrawable2 = new AnimationDrawable();
                        animationDrawable2.setOneShot(animationDrawable.isOneShot());
                        for (int i11 = 0; i11 < numberOfFrames; i11++) {
                            Drawable drawableD = d(animationDrawable.getFrame(i11), true);
                            drawableD.setLevel(10000);
                            animationDrawable2.addFrame(drawableD, animationDrawable.getDuration(i11));
                        }
                        animationDrawable2.setLevel(10000);
                        drawableM = animationDrawable2;
                    }
                    absSeekBar.setIndeterminateDrawable(drawableM);
                }
                Drawable drawableM2 = uVarR.m(1);
                if (drawableM2 != null) {
                    absSeekBar.setProgressDrawable(d(drawableM2, false));
                }
                uVarR.s();
                return;
            default:
                TypedArray typedArrayObtainStyledAttributes = ((EditText) this.f84886b).getContext().obtainStyledAttributes(attributeSet, l.a.f72896i, i5, 0);
                try {
                    boolean z11 = typedArrayObtainStyledAttributes.hasValue(14) ? typedArrayObtainStyledAttributes.getBoolean(14, true) : true;
                    typedArrayObtainStyledAttributes.recycle();
                    b6.i iVar = (b6.i) ((e3) ((a5.d) this.f84887c).f267b).f67209c;
                    if (iVar.f17576b != z11) {
                        iVar.f17576b = z11;
                        if (z11) {
                            a6.a.a();
                            throw null;
                        }
                        return;
                    }
                    return;
                } catch (Throwable th2) {
                    typedArrayObtainStyledAttributes.recycle();
                    throw th2;
                }
        }
    }

    public b6.c c(InputConnection inputConnection) {
        a5.d dVar = (a5.d) this.f84887c;
        if (inputConnection == null) {
            dVar.getClass();
            inputConnection = null;
        } else {
            e3 e3Var = (e3) dVar.f267b;
            e3Var.getClass();
            if (!(inputConnection instanceof b6.c)) {
                inputConnection = new b6.c((EditText) e3Var.f67208b, inputConnection);
            }
        }
        return (b6.c) inputConnection;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public Drawable d(Drawable drawable, boolean z11) {
        if (drawable instanceof s4.a) {
            ((s4.b) ((s4.a) drawable)).getClass();
        } else {
            if (drawable instanceof LayerDrawable) {
                LayerDrawable layerDrawable = (LayerDrawable) drawable;
                int numberOfLayers = layerDrawable.getNumberOfLayers();
                Drawable[] drawableArr = new Drawable[numberOfLayers];
                for (int i5 = 0; i5 < numberOfLayers; i5++) {
                    int id2 = layerDrawable.getId(i5);
                    drawableArr[i5] = d(layerDrawable.getDrawable(i5), id2 == 16908301 || id2 == 16908303);
                }
                LayerDrawable layerDrawable2 = new LayerDrawable(drawableArr);
                for (int i11 = 0; i11 < numberOfLayers; i11++) {
                    layerDrawable2.setId(i11, layerDrawable.getId(i11));
                    layerDrawable2.setLayerGravity(i11, layerDrawable.getLayerGravity(i11));
                    layerDrawable2.setLayerWidth(i11, layerDrawable.getLayerWidth(i11));
                    layerDrawable2.setLayerHeight(i11, layerDrawable.getLayerHeight(i11));
                    layerDrawable2.setLayerInsetLeft(i11, layerDrawable.getLayerInsetLeft(i11));
                    layerDrawable2.setLayerInsetRight(i11, layerDrawable.getLayerInsetRight(i11));
                    layerDrawable2.setLayerInsetTop(i11, layerDrawable.getLayerInsetTop(i11));
                    layerDrawable2.setLayerInsetBottom(i11, layerDrawable.getLayerInsetBottom(i11));
                    layerDrawable2.setLayerInsetStart(i11, layerDrawable.getLayerInsetStart(i11));
                    layerDrawable2.setLayerInsetEnd(i11, layerDrawable.getLayerInsetEnd(i11));
                }
                return layerDrawable2;
            }
            if (drawable instanceof BitmapDrawable) {
                BitmapDrawable bitmapDrawable = (BitmapDrawable) drawable;
                Bitmap bitmap = bitmapDrawable.getBitmap();
                if (((Bitmap) this.f84887c) == null) {
                    this.f84887c = bitmap;
                }
                ShapeDrawable shapeDrawable = new ShapeDrawable(new RoundRectShape(new float[]{5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f}, null, null));
                shapeDrawable.getPaint().setShader(new BitmapShader(bitmap, Shader.TileMode.REPEAT, Shader.TileMode.CLAMP));
                shapeDrawable.getPaint().setColorFilter(bitmapDrawable.getPaint().getColorFilter());
                return z11 ? new ClipDrawable(shapeDrawable, 3, 1) : shapeDrawable;
            }
        }
        return drawable;
    }

    public v(EditText editText) {
        this.f84886b = editText;
        this.f84887c = new a5.d(editText);
    }
}
