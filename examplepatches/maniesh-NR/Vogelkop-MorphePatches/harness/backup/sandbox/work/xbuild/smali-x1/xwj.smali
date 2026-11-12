.class public final Lxwj;
.super Landroid/view/inputmethod/InputConnectionWrapper;
.source "SourceFile"


# instance fields
.field public final a:Lip2;

.field public b:J

.field public c:Z

.field public d:Z

.field public final synthetic e:Lywj;


# direct methods
.method public constructor <init>(Lywj;)V
    .registers 4

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lxwj;->e:Lywj;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Landroid/view/inputmethod/InputConnectionWrapper;-><init>(Landroid/view/inputmethod/InputConnection;Z)V

    new-instance v0, Lip2;

    iget-object p1, p1, Lywj;->c:Lip2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, p1}, Lip2;->a(Lip2;)V

    iput-object v0, p0, Lxwj;->a:Lip2;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 7

    iget-object v0, p0, Lxwj;->e:Lywj;

    iget-object v1, v0, Lywj;->c:Lip2;

    iget-object v2, v0, Lywj;->c:Lip2;

    invoke-virtual {v1}, Lip2;->c()Z

    move-result v1

    if-nez v1, :cond_d

    return-void

    :cond_d
    iget-object v1, v2, Lip2;->b:Ljava/lang/CharSequence;

    iget-object v3, v2, Lip2;->a:Ljava/lang/CharSequence;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/CharSequence;

    const/4 v5, 0x0

    aput-object v3, v4, v5

    const/4 v3, 0x1

    aput-object v1, v4, v3

    invoke-static {v4}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    iput-object v4, v2, Lip2;->a:Ljava/lang/CharSequence;

    const-string v4, ""

    iput-object v4, v2, Lip2;->b:Ljava/lang/CharSequence;

    iget-object v4, v0, Lywj;->e:Lip2;

    invoke-virtual {v4, v2}, Lip2;->a(Lip2;)V

    iput-boolean v5, v0, Lywj;->h:Z

    iget v2, v0, Lywj;->j:I

    if-nez v2, :cond_53

    invoke-virtual {p0}, Lxwj;->c()Z

    invoke-super {p0}, Landroid/view/inputmethod/InputConnectionWrapper;->finishComposingText()Z

    iget-object v0, v0, Lywj;->f:Lrgh;

    iget-object v1, v0, Lrgh;->a:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    move-result-object v2

    iget-object v0, v0, Lrgh;->b:Ljava/lang/Object;

    check-cast v0, Landroid/text/style/BackgroundColorSpan;

    invoke-interface {v2, v0}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    invoke-virtual {v1}, Landroid/view/View;->isFocused()Z

    move-result v0

    if-eqz v0, :cond_4f

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setCursorVisible(Z)V

    :cond_4f
    invoke-virtual {p0}, Lxwj;->b()Z

    return-void

    :cond_53
    iget-object p0, v0, Lywj;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final b()Z
    .registers 9

    iget-object v0, p0, Lxwj;->e:Lywj;

    iget v1, v0, Lywj;->j:I

    iget-object v2, v0, Lywj;->b:Lx5f;

    const/4 v3, 0x1

    sub-int/2addr v1, v3

    iput v1, v0, Lywj;->j:I

    invoke-super {p0}, Landroid/view/inputmethod/InputConnectionWrapper;->endBatchEdit()Z

    move-result v1

    iget v4, v0, Lywj;->j:I

    if-nez v4, :cond_3c

    invoke-virtual {v0}, Lywj;->e()V

    iget-boolean v4, p0, Lxwj;->c:Z

    if-nez v4, :cond_3c

    if-eqz v2, :cond_3c

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lxwj;->b:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0xc8

    cmp-long v6, v4, v6

    if-lez v6, :cond_3c

    iput-boolean v3, p0, Lxwj;->c:Z

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    const-string v6, "batch edit time: <"

    const-string v7, "s"

    invoke-static {v4, v5, v6, v7}, Lz1m;->j(JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x19

    invoke-virtual {v2, v5, v4}, Lx5f;->R(ILjava/lang/String;)V

    :cond_3c
    iget-boolean v4, p0, Lxwj;->d:Z

    if-nez v4, :cond_4e

    if-eqz v2, :cond_4e

    iget v0, v0, Lywj;->j:I

    if-gez v0, :cond_4e

    iput-boolean v3, p0, Lxwj;->d:Z

    const/16 p0, 0x1a

    const/4 v0, 0x0

    invoke-virtual {v2, p0, v0}, Lx5f;->R(ILjava/lang/String;)V

    :cond_4e
    return v1
.end method

.method public final beginBatchEdit()Z
    .registers 1

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-virtual {p0}, Lxwj;->c()Z

    invoke-virtual {p0}, Lxwj;->e()Z

    move-result p0

    return p0
.end method

.method public final c()Z
    .registers 4

    iget-object v0, p0, Lxwj;->e:Lywj;

    iget v1, v0, Lywj;->j:I

    if-nez v1, :cond_c

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lxwj;->b:J

    :cond_c
    iget v1, v0, Lywj;->j:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lywj;->j:I

    invoke-super {p0}, Landroid/view/inputmethod/InputConnectionWrapper;->beginBatchEdit()Z

    move-result p0

    return p0
.end method

.method public final clearMetaKeyStates(I)Z
    .registers 2

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1}, Landroid/view/inputmethod/InputConnectionWrapper;->clearMetaKeyStates(I)Z

    move-result p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return p1
.end method

.method public final commitCompletion(Landroid/view/inputmethod/CompletionInfo;)Z
    .registers 2

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1}, Landroid/view/inputmethod/InputConnectionWrapper;->commitCompletion(Landroid/view/inputmethod/CompletionInfo;)Z

    move-result p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return p1
.end method

.method public final commitContent(Landroid/view/inputmethod/InputContentInfo;ILandroid/os/Bundle;)Z
    .registers 4

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1, p2, p3}, Landroid/view/inputmethod/InputConnectionWrapper;->commitContent(Landroid/view/inputmethod/InputContentInfo;ILandroid/os/Bundle;)Z

    move-result p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return p1
.end method

.method public final commitCorrection(Landroid/view/inputmethod/CorrectionInfo;)Z
    .registers 2

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1}, Landroid/view/inputmethod/InputConnectionWrapper;->commitCorrection(Landroid/view/inputmethod/CorrectionInfo;)Z

    move-result p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return p1
.end method

.method public final commitText(Ljava/lang/CharSequence;I)Z
    .registers 3

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->commitText(Ljava/lang/CharSequence;I)Z

    move-result p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return p1
.end method

.method public final d()V
    .registers 5

    invoke-virtual {p0}, Lxwj;->c()Z

    iget-object v0, p0, Lxwj;->e:Lywj;

    iget v1, v0, Lywj;->j:I

    iget-object v2, v0, Lywj;->a:Lcom/opera/android/widget/UrlFieldEditText;

    const/4 v3, 0x1

    if-ne v1, v3, :cond_14

    iget-object p0, p0, Lxwj;->a:Lip2;

    iget-object v1, v0, Lywj;->c:Lip2;

    invoke-virtual {p0, v1}, Lip2;->a(Lip2;)V

    goto :goto_2b

    :cond_14
    iget p0, v0, Lywj;->k:I

    if-lez p0, :cond_2b

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    iget v2, v0, Lywj;->k:I

    sub-int v2, p0, v2

    invoke-interface {v1, v2, p0}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    :cond_2b
    :goto_2b
    const/4 p0, 0x0

    iput p0, v0, Lywj;->k:I

    iget-object p0, v0, Lywj;->f:Lrgh;

    invoke-virtual {p0}, Lrgh;->s()V

    return-void
.end method

.method public final deleteSurroundingText(II)Z
    .registers 3

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->deleteSurroundingText(II)Z

    move-result p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return p1
.end method

.method public final deleteSurroundingTextInCodePoints(II)Z
    .registers 3

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->deleteSurroundingTextInCodePoints(II)Z

    move-result p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return p1
.end method

.method public final e()Z
    .registers 11

    iget-object v0, p0, Lxwj;->e:Lywj;

    iget-object v1, v0, Lywj;->c:Lip2;

    iget-object v2, v0, Lywj;->f:Lrgh;

    iget-object v3, v0, Lywj;->e:Lip2;

    iget-object v4, v0, Lywj;->c:Lip2;

    invoke-virtual {v1}, Lip2;->d()Z

    move-result v5

    iget-object v6, p0, Lxwj;->a:Lip2;

    if-eqz v5, :cond_35

    invoke-virtual {v6}, Lip2;->d()Z

    move-result v5

    if-eqz v5, :cond_35

    iget-object v5, v1, Lip2;->a:Ljava/lang/CharSequence;

    iget-object v7, v6, Lip2;->a:Ljava/lang/CharSequence;

    invoke-static {v5, v7}, Lip2;->e(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_35

    iget-object v5, v6, Lip2;->a:Ljava/lang/CharSequence;

    iget-object v1, v1, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    iget-object v7, v6, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v7

    invoke-interface {v5, v1, v7}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    goto :goto_36

    :cond_35
    const/4 v1, 0x0

    :goto_36
    const-string v5, ""

    const/4 v7, 0x0

    if-eqz v1, :cond_90

    invoke-virtual {p0}, Lxwj;->b()Z

    move-result v2

    invoke-virtual {v6}, Lip2;->c()Z

    move-result v6

    if-eqz v6, :cond_86

    iget v6, v0, Lywj;->j:I

    iget-object v8, v0, Lywj;->a:Lcom/opera/android/widget/UrlFieldEditText;

    if-lez v6, :cond_51

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v6

    iput v6, v0, Lywj;->k:I

    :cond_51
    iget v6, v0, Lywj;->j:I

    if-nez v6, :cond_79

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v9, "default_input_method"

    invoke-static {v6, v9}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_66

    move-object v6, v5

    :cond_66
    const-string v9, "com.sec.android.inputmethod"

    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_79

    const-string v9, "com.lge.ime"

    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_79

    invoke-super {p0}, Landroid/view/inputmethod/InputConnectionWrapper;->finishComposingText()Z

    :cond_79
    invoke-virtual {p0}, Lxwj;->c()Z

    invoke-virtual {v8}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    move-result-object v6

    invoke-interface {v6, v1}, Landroid/text/Editable;->append(Ljava/lang/CharSequence;)Landroid/text/Editable;

    invoke-virtual {p0}, Lxwj;->b()Z

    :cond_86
    iput-boolean v7, v0, Lywj;->h:Z

    iput-object v5, v3, Lip2;->b:Ljava/lang/CharSequence;

    iput-object v5, v4, Lip2;->b:Ljava/lang/CharSequence;

    invoke-virtual {v0}, Lywj;->a()V

    return v2

    :cond_90
    invoke-virtual {v2}, Lrgh;->s()V

    invoke-virtual {v4}, Lip2;->d()Z

    move-result v1

    if-eqz v1, :cond_b4

    iget-object v1, v4, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    iget-object v8, v3, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v8}, Ljava/lang/CharSequence;->length()I

    move-result v8

    sub-int/2addr v1, v8

    if-ltz v1, :cond_b4

    iget-object v8, v4, Lip2;->a:Ljava/lang/CharSequence;

    invoke-virtual {v3}, Lip2;->b()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lip2;->e(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_b9

    :cond_b4
    iput-object v5, v3, Lip2;->b:Ljava/lang/CharSequence;

    iput-object v5, v4, Lip2;->b:Ljava/lang/CharSequence;

    goto :goto_105

    :cond_b9
    iget-object v3, v3, Lip2;->b:Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-interface {v3, v1, v5}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, v4, Lip2;->b:Ljava/lang/CharSequence;

    iget-object v1, v2, Lrgh;->a:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/UrlFieldEditText;

    iget v3, v4, Lip2;->c:I

    iget-object v5, v2, Lrgh;->b:Ljava/lang/Object;

    check-cast v5, Landroid/text/style/BackgroundColorSpan;

    if-nez v5, :cond_dc

    new-instance v5, Landroid/text/style/BackgroundColorSpan;

    invoke-virtual {v1}, Landroid/widget/TextView;->getHighlightColor()I

    move-result v8

    invoke-direct {v5, v8}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    iput-object v5, v2, Lrgh;->b:Ljava/lang/Object;

    :cond_dc
    new-instance v5, Landroid/text/SpannableString;

    iget-object v8, v4, Lip2;->b:Ljava/lang/CharSequence;

    invoke-direct {v5, v8}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    iget-object v2, v2, Lrgh;->b:Ljava/lang/Object;

    check-cast v2, Landroid/text/style/BackgroundColorSpan;

    iget-object v8, v4, Lip2;->b:Ljava/lang/CharSequence;

    invoke-interface {v8}, Ljava/lang/CharSequence;->length()I

    move-result v8

    const/16 v9, 0x21

    invoke-virtual {v5, v2, v7, v8, v9}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    invoke-virtual {v1}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2, v5}, Landroid/text/Editable;->append(Ljava/lang/CharSequence;)Landroid/text/Editable;

    invoke-static {v2, v3, v3}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;II)V

    invoke-virtual {v1}, Landroid/view/View;->isFocused()Z

    move-result v2

    if-eqz v2, :cond_105

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setCursorVisible(Z)V

    :cond_105
    :goto_105
    invoke-virtual {p0}, Lxwj;->b()Z

    move-result p0

    invoke-virtual {v4}, Lip2;->d()Z

    move-result v1

    if-eqz v1, :cond_11f

    invoke-virtual {v6}, Lip2;->d()Z

    move-result v1

    if-eqz v1, :cond_11f

    iget-object v1, v6, Lip2;->a:Ljava/lang/CharSequence;

    iget-object v2, v4, Lip2;->a:Ljava/lang/CharSequence;

    invoke-static {v1, v2}, Lip2;->e(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_13b

    :cond_11f
    iget v1, v6, Lip2;->c:I

    if-nez v1, :cond_13e

    iget v1, v6, Lip2;->d:I

    iget-object v2, v6, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-ne v1, v2, :cond_13e

    iget-object v1, v4, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lez v1, :cond_13e

    invoke-virtual {v4}, Lip2;->d()Z

    move-result v1

    if-eqz v1, :cond_13e

    :cond_13b
    const/4 v1, 0x1

    iput-boolean v1, v0, Lywj;->h:Z

    :cond_13e
    invoke-virtual {v0}, Lywj;->a()V

    return p0
.end method

.method public final endBatchEdit()Z
    .registers 1

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-virtual {p0}, Lxwj;->b()Z

    invoke-virtual {p0}, Lxwj;->e()Z

    move-result p0

    return p0
.end method

.method public final finishComposingText()Z
    .registers 2

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0}, Landroid/view/inputmethod/InputConnectionWrapper;->finishComposingText()Z

    move-result v0

    invoke-virtual {p0}, Lxwj;->e()Z

    return v0
.end method

.method public final getCursorCapsMode(I)I
    .registers 2

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1}, Landroid/view/inputmethod/InputConnectionWrapper;->getCursorCapsMode(I)I

    move-result p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return p1
.end method

.method public final getExtractedText(Landroid/view/inputmethod/ExtractedTextRequest;I)Landroid/view/inputmethod/ExtractedText;
    .registers 3

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->getExtractedText(Landroid/view/inputmethod/ExtractedTextRequest;I)Landroid/view/inputmethod/ExtractedText;

    move-result-object p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return-object p1
.end method

.method public final getSelectedText(I)Ljava/lang/CharSequence;
    .registers 2

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1}, Landroid/view/inputmethod/InputConnectionWrapper;->getSelectedText(I)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return-object p1
.end method

.method public final getTextAfterCursor(II)Ljava/lang/CharSequence;
    .registers 3

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->getTextAfterCursor(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return-object p1
.end method

.method public final getTextBeforeCursor(II)Ljava/lang/CharSequence;
    .registers 3

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->getTextBeforeCursor(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return-object p1
.end method

.method public final performEditorAction(I)Z
    .registers 2

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-virtual {p0}, Lxwj;->a()V

    invoke-super {p0, p1}, Landroid/view/inputmethod/InputConnectionWrapper;->performEditorAction(I)Z

    move-result p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return p1
.end method

.method public final requestCursorUpdates(I)Z
    .registers 2

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1}, Landroid/view/inputmethod/InputConnectionWrapper;->requestCursorUpdates(I)Z

    move-result p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return p1
.end method

.method public final sendKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 2

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1}, Landroid/view/inputmethod/InputConnectionWrapper;->sendKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return p1
.end method

.method public final setComposingRegion(II)Z
    .registers 3

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->setComposingRegion(II)Z

    move-result p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return p1
.end method

.method public final setComposingText(Ljava/lang/CharSequence;I)Z
    .registers 3

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->setComposingText(Ljava/lang/CharSequence;I)Z

    move-result p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return p1
.end method

.method public final setSelection(II)Z
    .registers 3

    invoke-virtual {p0}, Lxwj;->d()V

    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->setSelection(II)Z

    move-result p1

    invoke-virtual {p0}, Lxwj;->e()Z

    return p1
.end method
