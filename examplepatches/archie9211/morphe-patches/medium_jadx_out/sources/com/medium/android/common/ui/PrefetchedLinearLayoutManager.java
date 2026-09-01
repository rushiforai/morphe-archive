package com.medium.android.common.ui;

import android.content.Context;
import android.util.AttributeSet;
import androidx.recyclerview.widget.LinearLayoutManager;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import defpackage.eya;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PrefetchedLinearLayoutManager extends LinearLayoutManager {
    public PrefetchedLinearLayoutManager(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager
    public final int V0(eya eyaVar) {
        return PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE;
    }
}
