package l2;

import android.app.Person;
import android.os.Parcelable;
import android.text.PrecomputedText;
import android.text.TextPaint;

/* loaded from: classes2.dex */
public abstract /* synthetic */ class m {
    public static /* bridge */ /* synthetic */ Person d(Parcelable parcelable) {
        return (Person) parcelable;
    }

    public static /* synthetic */ PrecomputedText.Params.Builder j(TextPaint textPaint) {
        return new PrecomputedText.Params.Builder(textPaint);
    }
}
