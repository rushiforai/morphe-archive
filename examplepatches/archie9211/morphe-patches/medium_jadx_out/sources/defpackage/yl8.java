package defpackage;

import android.os.Bundle;
import android.os.Handler;
import android.view.KeyEvent;
import android.view.inputmethod.CompletionInfo;
import android.view.inputmethod.CorrectionInfo;
import android.view.inputmethod.ExtractedText;
import android.view.inputmethod.ExtractedTextRequest;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputContentInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class yl8 implements InputConnection {
    public final ce a;
    public xwa b;

    public yl8(xwa xwaVar, ce ceVar) {
        this.a = ceVar;
        this.b = xwaVar;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean beginBatchEdit() {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.beginBatchEdit();
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean clearMetaKeyStates(int i) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.clearMetaKeyStates(i);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final void closeConnection() {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            if (xwaVar != null) {
                a(xwaVar);
                this.b = null;
            }
            this.a.invoke(this);
        }
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean commitCompletion(CompletionInfo completionInfo) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.commitCompletion(completionInfo);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public boolean commitContent(InputContentInfo inputContentInfo, int i, Bundle bundle) {
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean commitCorrection(CorrectionInfo correctionInfo) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.commitCorrection(correctionInfo);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean commitText(CharSequence charSequence, int i) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.commitText(charSequence, i);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean deleteSurroundingText(int i, int i2) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.deleteSurroundingText(i, i2);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public boolean deleteSurroundingTextInCodePoints(int i, int i2) {
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean endBatchEdit() {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.b();
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean finishComposingText() {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.finishComposingText();
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final int getCursorCapsMode(int i) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.getCursorCapsMode(i);
        }
        return 0;
    }

    @Override // android.view.inputmethod.InputConnection
    public final ExtractedText getExtractedText(ExtractedTextRequest extractedTextRequest, int i) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.getExtractedText(extractedTextRequest, i);
        }
        return null;
    }

    @Override // android.view.inputmethod.InputConnection
    public Handler getHandler() {
        return null;
    }

    @Override // android.view.inputmethod.InputConnection
    public final CharSequence getSelectedText(int i) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.getSelectedText(i);
        }
        return null;
    }

    @Override // android.view.inputmethod.InputConnection
    public final CharSequence getTextAfterCursor(int i, int i2) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.getTextAfterCursor(i, i2);
        }
        return null;
    }

    @Override // android.view.inputmethod.InputConnection
    public final CharSequence getTextBeforeCursor(int i, int i2) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.getTextBeforeCursor(i, i2);
        }
        return null;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean performContextMenuAction(int i) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.performContextMenuAction(i);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean performEditorAction(int i) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.performEditorAction(i);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean performPrivateCommand(String str, Bundle bundle) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.performPrivateCommand(str, bundle);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean reportFullscreenMode(boolean z) {
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean requestCursorUpdates(int i) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.requestCursorUpdates(i);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean sendKeyEvent(KeyEvent keyEvent) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.sendKeyEvent(keyEvent);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean setComposingRegion(int i, int i2) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.setComposingRegion(i, i2);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean setComposingText(CharSequence charSequence, int i) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.setComposingText(charSequence, i);
        }
        return false;
    }

    @Override // android.view.inputmethod.InputConnection
    public final boolean setSelection(int i, int i2) {
        xwa xwaVar = this.b;
        if (xwaVar != null) {
            return xwaVar.setSelection(i, i2);
        }
        return false;
    }

    public void a(xwa xwaVar) {
    }
}
