package c5;

import a5.a1;
import a5.d;
import a5.e;
import a5.f;
import ae.i;
import android.content.ClipData;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputConnectionWrapper;
import android.view.inputmethod.InputContentInfo;
import b6.c;
import com.android.launcher3.folder.FolderNameEditText;
import r.q;
import t5.d0;

/* loaded from: classes2.dex */
public final class b extends InputConnectionWrapper {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19666a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final Object f19667b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(FolderNameEditText folderNameEditText, InputConnection inputConnection) {
        super(inputConnection, true);
        this.f19667b = folderNameEditText;
    }

    @Override // android.view.inputmethod.InputConnectionWrapper, android.view.inputmethod.InputConnection
    public boolean commitContent(InputContentInfo inputContentInfo, int i5, Bundle bundle) {
        Bundle bundle2;
        e dVar;
        switch (this.f19666a) {
            case 0:
                i iVar = (i) this.f19667b;
                d dVar2 = inputContentInfo == null ? null : new d(new d(inputContentInfo, 28), 29);
                q qVar = (q) iVar.f12762b;
                if ((i5 & 1) != 0) {
                    try {
                        ((InputContentInfo) ((d) dVar2.f267b).f267b).requestPermission();
                        InputContentInfo inputContentInfo2 = (InputContentInfo) ((d) dVar2.f267b).f267b;
                        bundle2 = bundle == null ? new Bundle() : new Bundle(bundle);
                        bundle2.putParcelable("androidx.core.view.extra.INPUT_CONTENT_INFO", inputContentInfo2);
                    } catch (Exception e3) {
                        Log.w("InputConnectionCompat", "Can't insert content from IME; requestPermission() failed", e3);
                    }
                } else {
                    bundle2 = bundle;
                }
                InputContentInfo inputContentInfo3 = (InputContentInfo) ((d) dVar2.f267b).f267b;
                ClipData clipData = new ClipData(inputContentInfo3.getDescription(), new ClipData.Item(inputContentInfo3.getContentUri()));
                if (Build.VERSION.SDK_INT >= 31) {
                    dVar = new d(clipData, 2);
                } else {
                    f fVar = new f();
                    fVar.f279b = clipData;
                    fVar.f280c = 2;
                    dVar = fVar;
                }
                dVar.f(inputContentInfo3.getLinkUri());
                dVar.setExtras(bundle2);
                if (a1.g(qVar, dVar.build()) == null) {
                }
                break;
        }
        return super.commitContent(inputContentInfo, i5, bundle);
    }

    @Override // android.view.inputmethod.InputConnectionWrapper, android.view.inputmethod.InputConnection
    public boolean deleteSurroundingText(int i5, int i11) {
        d0 d0Var;
        switch (this.f19666a) {
            case 1:
                CharSequence textBeforeCursor = getTextBeforeCursor(1, 0);
                if (textBeforeCursor != null && textBeforeCursor.length() == 0 && (d0Var = (d0) this.f19667b) != null) {
                    d0Var.C();
                }
                break;
        }
        return super.deleteSurroundingText(i5, i11);
    }

    @Override // android.view.inputmethod.InputConnectionWrapper, android.view.inputmethod.InputConnection
    public boolean setComposingText(CharSequence charSequence, int i5) {
        switch (this.f19666a) {
            case 2:
                FolderNameEditText folderNameEditText = (FolderNameEditText) this.f19667b;
                int i11 = FolderNameEditText.f21133e;
                folderNameEditText.getClass();
                break;
        }
        return super.setComposingText(charSequence, i5);
    }

    public b(c cVar, d0 d0Var) {
        super(cVar, true);
        this.f19667b = d0Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(InputConnection inputConnection, i iVar) {
        super(inputConnection, false);
        this.f19667b = iVar;
    }
}
