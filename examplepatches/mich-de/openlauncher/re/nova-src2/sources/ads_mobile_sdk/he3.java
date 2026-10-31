package ads_mobile_sdk;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.GradientDrawable;
import android.widget.TextView;

/* loaded from: classes2.dex */
public final class he3 extends TextView {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f4369a = 0;

    public he3(Context context) throws Resources.NotFoundException {
        CharSequence string;
        super(context);
        try {
            string = context.getResources().getString(2132020115);
        } catch (Resources.NotFoundException unused) {
            string = "Test Ad";
        }
        setText(string);
        setTextSize(15.0f);
        setTextColor(-1);
        setPadding(5, 0, 5, 0);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(0);
        gradientDrawable.setColor(-12303292);
        gradientDrawable.setCornerRadius(8.0f);
        setBackground(gradientDrawable);
    }
}
