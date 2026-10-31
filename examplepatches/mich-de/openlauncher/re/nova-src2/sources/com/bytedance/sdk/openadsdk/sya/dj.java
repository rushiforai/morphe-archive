package com.bytedance.sdk.openadsdk.sya;

import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.FilterWord;
import com.bytedance.sdk.openadsdk.TTDislikeDialogAbstract;
import com.bytedance.sdk.openadsdk.utils.dc;
import java.util.List;

/* loaded from: classes2.dex */
public class dj extends TTDislikeDialogAbstract {

    /* renamed from: dj, reason: collision with root package name */
    private ycx f26992dj;

    public interface ycx {
        void ycx();

        void ycx(int i5, FilterWord filterWord);

        void zb();
    }

    public dj(Context context, String str, List<FilterWord> list) {
        super(context, wwx.lt(context, "tt_dislikeDialog"));
        this.ycx = str;
        this.f24272zb = list;
    }

    private void zb() {
        setOnShowListener(new DialogInterface.OnShowListener() { // from class: com.bytedance.sdk.openadsdk.sya.dj.1
            @Override // android.content.DialogInterface.OnShowListener
            public void onShow(DialogInterface dialogInterface) {
                if (dj.this.f26992dj != null) {
                    ycx unused = dj.this.f26992dj;
                }
            }
        });
        setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.bytedance.sdk.openadsdk.sya.dj.2
            @Override // android.content.DialogInterface.OnDismissListener
            public void onDismiss(DialogInterface dialogInterface) {
                if (dj.this.f26992dj != null) {
                    dj.this.f26992dj.zb();
                }
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.TTDislikeDialogAbstract
    public ViewGroup.LayoutParams getLayoutParams() {
        return new ViewGroup.LayoutParams(dc.dj(getContext()) - 120, -2);
    }

    @Override // com.bytedance.sdk.openadsdk.TTDislikeDialogAbstract
    public View getLayoutView() {
        return new jw(getContext(), this.sya, this.f24272zb);
    }

    @Override // com.bytedance.sdk.openadsdk.TTDislikeDialogAbstract, android.app.Dialog
    public void onCreate(Bundle bundle) {
        try {
            super.onCreate(bundle);
            setCanceledOnTouchOutside(true);
            setCancelable(true);
            ycx();
            zb();
            setMaterialMeta(this.ycx, this.f24272zb);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4gYsyRS5Sg=", "b9oJnBCwYMyFbt5cgB6nDF7oLIAPqA==", "VOAOhwa9fcI=", 47);
            dismiss();
        }
    }

    @Override // android.app.Dialog
    public void show() {
        try {
            super.show();
        } catch (WindowManager.BadTokenException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4gYsyRS5Sg=", "b9oJnBCwYMyFbt5cgB6nDF7oLIAPqA==", "SOYigg==", 101);
        }
    }

    public void ycx(ycx ycxVar) {
        this.f26992dj = ycxVar;
    }

    @Override // com.bytedance.sdk.openadsdk.sya.jc.zb
    public void ycx(int i5) {
        FilterWord filterWordZb;
        if (jc.sya == i5) {
            dismiss();
            return;
        }
        if (jc.lud == i5) {
            ycx ycxVar = this.f26992dj;
            if (ycxVar != null) {
                ycxVar.ycx();
                return;
            }
            return;
        }
        if (jc.f26994zb != i5 || (filterWordZb = this.sya.zb()) == null || jc.ycx.equals(filterWordZb)) {
            return;
        }
        ycx ycxVar2 = this.f26992dj;
        if (ycxVar2 != null) {
            try {
                ycxVar2.ycx(0, filterWordZb);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4gYsyRS5Sg=", "b9oJnBCwYMyFbt5cgB6nDF7oLIAPqA==", "VOAEmxe5e8aDXt5LiQ==", 90);
            }
        }
        dismiss();
    }

    private void ycx() {
        Window window = getWindow();
        if (window == null || window.getAttributes() == null) {
            return;
        }
        window.getAttributes().windowAnimations = 0;
    }
}
