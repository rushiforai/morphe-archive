package com.teslacoilsw.launcher.widget;

import androidx.recyclerview.widget.LinearLayoutManager;

/* loaded from: classes4.dex */
public class NoAutoLinearLayoutManager extends LinearLayoutManager {
    @Override // androidx.recyclerview.widget.LinearLayoutManager, androidx.recyclerview.widget.z1
    public final boolean isAutoMeasureEnabled() {
        return false;
    }
}
