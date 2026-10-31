package com.android.systemui.plugins;

import android.appwidget.AppWidgetHostView;
import com.android.systemui.plugins.annotations.ProvidesInterface;

@ProvidesInterface(action = CustomWidgetPlugin.ACTION, version = 1)
/* loaded from: classes.dex */
public interface CustomWidgetPlugin extends Plugin {
    public static final String ACTION = "com.android.systemui.action.PLUGIN_CUSTOM_WIDGET";
    public static final int VERSION = 1;

    String getLabel();

    int getMinSpanX();

    int getMinSpanY();

    int getPreviewImageResourceId();

    int getResizeMode();

    int getSpanX();

    int getSpanY();

    void onViewCreated(AppWidgetHostView appWidgetHostView);
}
