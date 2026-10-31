package com.bytedance.sdk.openadsdk;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import com.bytedance.sdk.openadsdk.sya.jc;
import java.util.List;

/* loaded from: classes2.dex */
public abstract class TTDislikeDialogAbstract extends Dialog implements jc.zb {

    /* renamed from: dj, reason: collision with root package name */
    private View f24271dj;
    protected final jc sya;
    protected String ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected List<FilterWord> f24272zb;

    public TTDislikeDialogAbstract(Context context) {
        super(context);
        jc jcVar = new jc();
        this.sya = jcVar;
        jcVar.ycx(this);
    }

    public void destroy() {
        jc jcVar = this.sya;
        if (jcVar != null) {
            jcVar.ycx();
        }
    }

    public jc getDislikeManager() {
        return this.sya;
    }

    public abstract ViewGroup.LayoutParams getLayoutParams();

    public abstract View getLayoutView();

    @Override // android.app.Dialog
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.f24271dj = getLayoutView();
        ViewGroup.LayoutParams layoutParams = getLayoutParams();
        View view = this.f24271dj;
        if (layoutParams == null) {
            layoutParams = new ViewGroup.LayoutParams(-1, -1);
        }
        setContentView(view, layoutParams);
    }

    public void onSuggestionSubmit(String str) {
        jc jcVar = this.sya;
        if (jcVar != null) {
            jcVar.sya(str);
        }
    }

    public void setMaterialMeta(String str, List<FilterWord> list) {
        this.ycx = str;
        this.f24272zb = list;
        this.sya.ycx(str);
        this.sya.ycx(this.f24272zb);
    }

    public TTDislikeDialogAbstract(Context context, int i5) {
        super(context, i5);
        jc jcVar = new jc();
        this.sya = jcVar;
        jcVar.ycx(this);
    }
}
