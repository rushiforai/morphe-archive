package com.android.launcher3.folder;

import android.content.Context;
import android.util.AttributeSet;
import android.view.inputmethod.CompletionInfo;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import c5.b;
import com.android.launcher3.ExtendedEditText;

/* loaded from: classes.dex */
public class FolderNameEditText extends ExtendedEditText {

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ int f21133e = 0;

    public FolderNameEditText(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // android.widget.TextView
    public final void onCommitCompletion(CompletionInfo completionInfo) {
        setText(completionInfo.getText());
        setSelection(completionInfo.getText().length());
    }

    @Override // android.widget.TextView, android.view.View
    public final InputConnection onCreateInputConnection(EditorInfo editorInfo) {
        return new b(this, super.onCreateInputConnection(editorInfo));
    }

    @Override // android.widget.TextView
    public final void onTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
    }
}
