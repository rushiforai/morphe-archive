package tj;

import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextDirectionHeuristics;
import android.text.TextPaint;
import android.text.TextUtils;
import androidx.compose.ui.node.LayoutNode;

/* loaded from: classes3.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public CharSequence f89377a;

    /* renamed from: b, reason: collision with root package name */
    public final TextPaint f89378b;

    /* renamed from: c, reason: collision with root package name */
    public final int f89379c;

    /* renamed from: d, reason: collision with root package name */
    public int f89380d;

    /* renamed from: j, reason: collision with root package name */
    public boolean f89386j;

    /* renamed from: e, reason: collision with root package name */
    public Layout.Alignment f89381e = Layout.Alignment.ALIGN_NORMAL;

    /* renamed from: f, reason: collision with root package name */
    public int f89382f = LayoutNode.NotPlacedPlaceOrder;

    /* renamed from: g, reason: collision with root package name */
    public float f89383g = 1.0f;

    /* renamed from: h, reason: collision with root package name */
    public int f89384h = 1;

    /* renamed from: i, reason: collision with root package name */
    public boolean f89385i = true;

    /* renamed from: k, reason: collision with root package name */
    public TextUtils.TruncateAt f89387k = null;

    public e(CharSequence charSequence, TextPaint textPaint, int i5) {
        this.f89377a = charSequence;
        this.f89378b = textPaint;
        this.f89379c = i5;
        this.f89380d = charSequence.length();
    }

    public final StaticLayout a() {
        if (this.f89377a == null) {
            this.f89377a = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        int iMax = Math.max(0, this.f89379c);
        CharSequence charSequenceEllipsize = this.f89377a;
        int i5 = this.f89382f;
        TextPaint textPaint = this.f89378b;
        if (i5 == 1) {
            charSequenceEllipsize = TextUtils.ellipsize(charSequenceEllipsize, textPaint, iMax, this.f89387k);
        }
        int iMin = Math.min(charSequenceEllipsize.length(), this.f89380d);
        this.f89380d = iMin;
        if (this.f89386j && this.f89382f == 1) {
            this.f89381e = Layout.Alignment.ALIGN_OPPOSITE;
        }
        StaticLayout.Builder builderObtain = StaticLayout.Builder.obtain(charSequenceEllipsize, 0, iMin, textPaint, iMax);
        builderObtain.setAlignment(this.f89381e);
        builderObtain.setIncludePad(this.f89385i);
        builderObtain.setTextDirection(this.f89386j ? TextDirectionHeuristics.RTL : TextDirectionHeuristics.LTR);
        TextUtils.TruncateAt truncateAt = this.f89387k;
        if (truncateAt != null) {
            builderObtain.setEllipsize(truncateAt);
        }
        builderObtain.setMaxLines(this.f89382f);
        float f11 = this.f89383g;
        if (f11 != 1.0f) {
            builderObtain.setLineSpacing(0.0f, f11);
        }
        if (this.f89382f > 1) {
            builderObtain.setHyphenationFrequency(this.f89384h);
        }
        return builderObtain.build();
    }
}
