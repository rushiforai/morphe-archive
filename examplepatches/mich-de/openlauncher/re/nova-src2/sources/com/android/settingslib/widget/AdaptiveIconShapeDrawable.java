package com.android.settingslib.widget;

import android.content.res.Resources;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.PathShape;
import android.util.AttributeSet;
import androidx.annotation.Keep;
import fz.d;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

@Keep
/* loaded from: classes2.dex */
public class AdaptiveIconShapeDrawable extends ShapeDrawable {
    public AdaptiveIconShapeDrawable() {
    }

    private void init(Resources resources) {
        setShape(new PathShape(d.f56191l.e(), 100.0f, 100.0f));
    }

    @Override // android.graphics.drawable.ShapeDrawable, android.graphics.drawable.Drawable
    public void inflate(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Resources.Theme theme) throws XmlPullParserException, IOException {
        super.inflate(resources, xmlPullParser, attributeSet, theme);
        init(resources);
    }

    public AdaptiveIconShapeDrawable(Resources resources) {
        init(resources);
    }
}
