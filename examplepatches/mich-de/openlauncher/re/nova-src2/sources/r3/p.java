package r3;

import android.os.Bundle;
import android.os.Handler;
import android.view.KeyEvent;
import android.view.inputmethod.CompletionInfo;
import android.view.inputmethod.CorrectionInfo;
import android.view.inputmethod.ExtractedText;
import android.view.inputmethod.ExtractedTextRequest;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputContentInfo;

/* loaded from: classes2.dex */
public class p implements InputConnection {

    /* renamed from: a, reason: collision with root package name */
    public final androidx.fragment.app.p f85454a;

    /* renamed from: b, reason: collision with root package name */
    public c1.s f85455b;

    public p(c1.s sVar, androidx.fragment.app.p pVar) {
        this.f85454a = pVar;
        this.f85455b = sVar;
    }

    public final void a(c1.s sVar) {
        sVar.closeConnection();
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean beginBatchEdit() {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.beginBatchEdit();
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean clearMetaKeyStates(int i5) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.clearMetaKeyStates(i5);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final void closeConnection() {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            if (sVar != null) {
                a(sVar);
                this.f85455b = null;
            }
            this.f85454a.invoke(this);
        }
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean commitCompletion(CompletionInfo completionInfo) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.commitCompletion(completionInfo);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean commitContent(InputContentInfo inputContentInfo, int i5, Bundle bundle) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.commitContent(inputContentInfo, i5, bundle);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean commitCorrection(CorrectionInfo correctionInfo) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.commitCorrection(correctionInfo);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean commitText(CharSequence charSequence, int i5) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.commitText(charSequence, i5);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean deleteSurroundingText(int i5, int i11) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.deleteSurroundingText(i5, i11);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean deleteSurroundingTextInCodePoints(int i5, int i11) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.deleteSurroundingTextInCodePoints(i5, i11);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean endBatchEdit() {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.b();
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean finishComposingText() {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.finishComposingText();
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final int getCursorCapsMode(int i5) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.getCursorCapsMode(i5);
        }
        return 0;
    }

    @Override // android.view.inputmethod.InputConnection
    public final ExtractedText getExtractedText(ExtractedTextRequest extractedTextRequest, int i5) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.getExtractedText(extractedTextRequest, i5);
        }
        return null;
    }

    @Override // android.view.inputmethod.InputConnection
    public final Handler getHandler() {
        return null;
    }

    @Override // android.view.inputmethod.InputConnection
    public final CharSequence getSelectedText(int i5) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.getSelectedText(i5);
        }
        return null;
    }

    @Override // android.view.inputmethod.InputConnection
    public final CharSequence getTextAfterCursor(int i5, int i11) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.getTextAfterCursor(i5, i11);
        }
        return null;
    }

    @Override // android.view.inputmethod.InputConnection
    public final CharSequence getTextBeforeCursor(int i5, int i11) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.getTextBeforeCursor(i5, i11);
        }
        return null;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean performContextMenuAction(int i5) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.performContextMenuAction(i5);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean performEditorAction(int i5) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.performEditorAction(i5);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean performPrivateCommand(String str, Bundle bundle) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.performPrivateCommand(str, bundle);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean reportFullscreenMode(boolean z11) {
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean requestCursorUpdates(int i5) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.requestCursorUpdates(i5);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean sendKeyEvent(KeyEvent keyEvent) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.sendKeyEvent(keyEvent);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean setComposingRegion(int i5, int i11) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.setComposingRegion(i5, i11);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean setComposingText(CharSequence charSequence, int i5) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.setComposingText(charSequence, i5);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean setSelection(int i5, int i11) {
        c1.s sVar = this.f85455b;
        if (sVar != null) {
            return sVar.setSelection(i5, i11);
        }
        return false;
    }
}
