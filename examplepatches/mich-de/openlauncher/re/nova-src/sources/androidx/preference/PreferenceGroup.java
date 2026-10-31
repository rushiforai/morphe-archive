package androidx.preference;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Handler;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import androidx.compose.ui.node.LayoutNode;
import java.util.ArrayList;
import r6.h;

/* loaded from: classes2.dex */
public abstract class PreferenceGroup extends Preference {

    /* renamed from: m, reason: collision with root package name */
    public final ArrayList f14810m;

    public PreferenceGroup(Context context, AttributeSet attributeSet, int i5, int i11) {
        super(context, attributeSet, i5);
        new Handler();
        this.f14810m = new ArrayList();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, h.f85547i, i5, 0);
        typedArrayObtainStyledAttributes.getBoolean(2, typedArrayObtainStyledAttributes.getBoolean(2, true));
        if (typedArrayObtainStyledAttributes.hasValue(1) && typedArrayObtainStyledAttributes.getInt(1, typedArrayObtainStyledAttributes.getInt(1, LayoutNode.NotPlacedPlaceOrder)) != Integer.MAX_VALUE && TextUtils.isEmpty(this.f14773e)) {
            Log.e("PreferenceGroup", getClass().getSimpleName().concat(" should have a key defined if it contains an expandable preference"));
        }
        typedArrayObtainStyledAttributes.recycle();
    }

    @Override // androidx.preference.Preference
    public final void d(boolean z11) {
        super.d(z11);
        int size = this.f14810m.size();
        for (int i5 = 0; i5 < size; i5++) {
            Preference preference = (Preference) this.f14810m.get(i5);
            if (preference.f14779k == z11) {
                preference.f14779k = !z11;
                preference.d(preference.k());
                preference.c();
            }
        }
    }

    public PreferenceGroup(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0, 0);
    }
}
