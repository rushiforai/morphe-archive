package ads_mobile_sdk;

import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.text.TextUtils;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import b.d0;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;

/* loaded from: classes.dex */
public final class l61 extends RelativeLayout {

    /* renamed from: b, reason: collision with root package name */
    public static final float[] f6101b = {5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f};

    /* renamed from: a, reason: collision with root package name */
    public final AnimationDrawable f6102a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l61(Context context, md1 attribution, RelativeLayout.LayoutParams layoutParams) {
        AnimationDrawable animationDrawable;
        super(context);
        Intrinsics.g(attribution, "attribution");
        ShapeDrawable shapeDrawable = new ShapeDrawable(new RoundRectShape(f6101b, null, null));
        shapeDrawable.getPaint().setColor(attribution.f7138c);
        setLayoutParams(layoutParams);
        setBackground(shapeDrawable);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
        String str = attribution.f7136a;
        if (!TextUtils.isEmpty(str)) {
            RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
            TextView textView = new TextView(context);
            textView.setLayoutParams(layoutParams3);
            textView.setId(1195835393);
            textView.setTypeface(Typeface.DEFAULT);
            textView.setText(str);
            textView.setTextColor(attribution.f7139d);
            textView.setTextSize(attribution.f7140e);
            textView.setPadding(d0.b(context, 4), 0, d0.b(context, 4), 0);
            addView(textView);
            layoutParams2.addRule(1, textView.getId());
        }
        ImageView imageView = new ImageView(context);
        imageView.setLayoutParams(layoutParams2);
        imageView.setId(1195835394);
        List list = attribution.f7137b;
        if (list.size() > 1) {
            this.f6102a = new AnimationDrawable();
            Iterator it = list.iterator();
            while (it.hasNext()) {
                try {
                    Drawable drawable = ((wf1) it.next()).f11268a;
                    if (drawable != null && (animationDrawable = this.f6102a) != null) {
                        animationDrawable.addFrame(drawable, (int) Duration.h(attribution.f7141f));
                    }
                } catch (Exception e3) {
                    cz.b bVar = mu0.f7335a;
                    mu0.b("Error while getting drawable. " + e3, null);
                }
            }
            imageView.setBackground(this.f6102a);
        } else if (list.size() == 1) {
            try {
                imageView.setImageDrawable(((wf1) list.get(0)).f11268a);
            } catch (Exception e11) {
                cz.b bVar2 = mu0.f7335a;
                mu0.b("Error while getting drawable. " + e11, null);
            }
        }
        addView(imageView);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        AnimationDrawable animationDrawable = this.f6102a;
        if (animationDrawable != null) {
            animationDrawable.start();
        }
        super.onAttachedToWindow();
    }
}
