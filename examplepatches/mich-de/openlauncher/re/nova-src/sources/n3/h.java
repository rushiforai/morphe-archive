package n3;

import android.os.Build;
import android.text.Layout;
import android.text.Spanned;
import android.text.StaticLayout;
import android.text.TextDirectionHeuristic;
import android.text.TextPaint;
import android.text.TextUtils;
import com.moloco.sdk.internal.services.a0;

/* loaded from: classes.dex */
public abstract class h {
    public static StaticLayout a(CharSequence charSequence, TextPaint textPaint, int i5, int i11, TextDirectionHeuristic textDirectionHeuristic, Layout.Alignment alignment, int i12, TextUtils.TruncateAt truncateAt, int i13, int i14, boolean z11, int i15, int i16, int i17, int i18) {
        if (i11 < 0) {
            s3.a.a("invalid start value");
        }
        int length = charSequence.length();
        if (i11 < 0 || i11 > length) {
            s3.a.a("invalid end value");
        }
        if (i12 < 0) {
            s3.a.a("invalid maxLines value");
        }
        if (i5 < 0) {
            s3.a.a("invalid width value");
        }
        if (i13 < 0) {
            s3.a.a("invalid ellipsizedWidth value");
        }
        StaticLayout.Builder builderObtain = StaticLayout.Builder.obtain(charSequence, 0, i11, textPaint, i5);
        builderObtain.setTextDirection(textDirectionHeuristic);
        builderObtain.setAlignment(alignment);
        builderObtain.setMaxLines(i12);
        builderObtain.setEllipsize(truncateAt);
        builderObtain.setEllipsizedWidth(i13);
        builderObtain.setLineSpacing(0.0f, 1.0f);
        builderObtain.setIncludePad(z11);
        builderObtain.setBreakStrategy(i15);
        builderObtain.setHyphenationFrequency(i18);
        builderObtain.setIndents(null, null);
        int i19 = Build.VERSION.SDK_INT;
        builderObtain.setJustificationMode(i14);
        if (i19 >= 28) {
            builderObtain.setUseLineSpacingFromFallbacks(true);
        }
        if (i19 >= 33) {
            builderObtain.setLineBreakConfig(a0.b().setLineBreakStyle(i16).setLineBreakWordStyle(i17).build());
        }
        if (i19 >= 35) {
            builderObtain.setUseBoundsForWidth(false);
        }
        return builderObtain.build();
    }

    public static final boolean b(Spanned spanned, Class cls) {
        return spanned.nextSpanTransition(-1, spanned.length(), cls) != spanned.length();
    }
}
