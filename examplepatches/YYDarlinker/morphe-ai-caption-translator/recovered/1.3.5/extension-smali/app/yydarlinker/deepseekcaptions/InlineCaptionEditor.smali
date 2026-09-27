.class public final Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;
.super Landroid/widget/EditText;
.source "InlineCaptionEditor.java"


# instance fields
.field private actions:Landroid/view/ActionMode;

.field private downX:F

.field private downY:F

.field private dragged:Z

.field private pendingKeyboard:Z

.field private sensitive:Z

.field private viewport:Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;


# direct methods
.method public static synthetic $r8$lambda$D9tYIvstzyGocMTacjsadPwrAQU(Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;)V
    .registers 1

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->showKeyboardWhenReady()V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetsensitive(Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;)Z
    .registers 1

    iget-boolean p0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->sensitive:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fputactions(Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;Landroid/view/ActionMode;)V
    .registers 2

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->actions:Landroid/view/ActionMode;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 12
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->setFocusable(Z)V

    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->setFocusableInTouchMode(Z)V

    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->setLongClickable(Z)V

    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->setCursorVisible(Z)V

    .line 13
    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->setShowSoftInputOnFocus(Z)V

    const/4 p1, 0x2

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;I)V

    return-void
.end method

.method private showKeyboardWhenReady()V
    .registers 3

    .line 39
    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->pendingKeyboard:Z

    if-eqz v0, :cond_58

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_58

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_58

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->hasWindowFocus()Z

    move-result v0

    if-nez v0, :cond_17

    goto :goto_58

    :cond_17
    const/4 v0, 0x0

    .line 40
    iput-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->pendingKeyboard:Z

    .line 41
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    if-eqz v0, :cond_35

    .line 43
    invoke-virtual {v0, p0}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    move-result v1

    if-nez v1, :cond_31

    invoke-virtual {v0, p0}, Landroid/view/inputmethod/InputMethodManager;->restartInput(Landroid/view/View;)V

    :cond_31
    const/4 v1, 0x1

    .line 44
    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 46
    :cond_35
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_4c

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;)Landroid/view/WindowInsetsController;

    move-result-object v0

    if-eqz v0, :cond_4c

    .line 47
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;)Landroid/view/WindowInsetsController;

    move-result-object v0

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m()I

    move-result v1

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsetsController;I)V

    .line 48
    :cond_4c
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->viewport:Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;

    if-eqz v0, :cond_58

    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->onGlobalLayout()V

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->viewport:Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->reveal()V

    :cond_58
    :goto_58
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .registers 2

    .line 73
    invoke-super {p0}, Landroid/widget/EditText;->onAttachedToWindow()V

    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;-><init>(Landroid/widget/EditText;)V

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->viewport:Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;

    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->attach()V

    return-void
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .registers 4

    .line 15
    invoke-super {p0, p1}, Landroid/widget/EditText;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object p0

    .line 16
    iget v0, p1, Landroid/view/inputmethod/EditorInfo;->imeOptions:I

    const/high16 v1, 0x10000000

    or-int/2addr v0, v1

    iput v0, p1, Landroid/view/inputmethod/EditorInfo;->imeOptions:I

    return-object p0
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    const/4 v0, 0x0

    .line 82
    iput-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->pendingKeyboard:Z

    .line 83
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->viewport:Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;

    if-eqz v0, :cond_d

    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->detach()V

    const/4 v0, 0x0

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->viewport:Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;

    .line 84
    :cond_d
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->actions:Landroid/view/ActionMode;

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Landroid/view/ActionMode;->finish()V

    :cond_14
    invoke-super {p0}, Landroid/widget/EditText;->onDetachedFromWindow()V

    return-void
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .registers 4

    .line 76
    invoke-super {p0, p1, p2, p3}, Landroid/widget/EditText;->onFocusChanged(ZILandroid/graphics/Rect;)V

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->viewport:Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;

    if-eqz p0, :cond_a

    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->focus(Z)V

    :cond_a
    return-void
.end method

.method protected onSelectionChanged(II)V
    .registers 3

    .line 79
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onSelectionChanged(II)V

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->viewport:Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionEditorViewport;->reveal()V

    :cond_a
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8

    .line 21
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_23

    .line 23
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iput v3, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->downX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iput v3, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->downY:F

    iput-boolean v1, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->dragged:Z

    .line 24
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-eqz v3, :cond_23

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    invoke-interface {v3, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_23
    const/4 v3, 0x2

    if-ne v0, v3, :cond_6f

    .line 26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iget v4, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->downY:F

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v4

    int-to-float v4, v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_6f

    .line 27
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iget v4, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->downY:F

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    iget v5, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->downX:F

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_6f

    .line 28
    iput-boolean v2, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->dragged:Z

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->actions:Landroid/view/ActionMode;

    if-nez v3, :cond_6f

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-eqz v3, :cond_6f

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    invoke-interface {v3, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 31
    :cond_6f
    invoke-super {p0, p1}, Landroid/widget/EditText;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-ne v0, v2, :cond_86

    .line 32
    iget-boolean v3, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->dragged:Z

    if-nez v3, :cond_86

    .line 33
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->requestFocus()Z

    iput-boolean v2, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->pendingKeyboard:Z

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor$$ExternalSyntheticLambda3;-><init>(Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;)V

    invoke-virtual {p0, v2}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->post(Ljava/lang/Runnable;)Z

    :cond_86
    const/4 v2, 0x3

    if-ne v0, v2, :cond_8b

    .line 35
    iput-boolean v1, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->pendingKeyboard:Z

    :cond_8b
    return p1
.end method

.method public onWindowFocusChanged(Z)V
    .registers 2

    .line 51
    invoke-super {p0, p1}, Landroid/widget/EditText;->onWindowFocusChanged(Z)V

    if-eqz p1, :cond_11

    iget-boolean p1, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->pendingKeyboard:Z

    if-eqz p1, :cond_11

    new-instance p1, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor$$ExternalSyntheticLambda3;

    invoke-direct {p1, p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor$$ExternalSyntheticLambda3;-><init>(Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;)V

    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->post(Ljava/lang/Runnable;)Z

    :cond_11
    return-void
.end method

.method public performLongClick()Z
    .registers 3

    .line 54
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->requestFocus()Z

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->getSelectionStart()I

    move-result v0

    if-gez v0, :cond_10

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->setSelection(I)V

    .line 55
    :cond_10
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->actions:Landroid/view/ActionMode;

    if-eqz v0, :cond_1a

    invoke-virtual {v0}, Landroid/view/ActionMode;->finish()V

    const/4 v0, 0x0

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->actions:Landroid/view/ActionMode;

    .line 56
    :cond_1a
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor$1;

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor$1;-><init>(Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;)V

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->startActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;

    move-result-object v0

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->actions:Landroid/view/ActionMode;

    if-nez v0, :cond_31

    .line 70
    invoke-super {p0}, Landroid/widget/EditText;->performLongClick()Z

    move-result p0

    if-eqz p0, :cond_2f

    goto :goto_31

    :cond_2f
    const/4 p0, 0x0

    return p0

    :cond_31
    :goto_31
    return v1
.end method

.method public sensitive(Z)V
    .registers 2

    .line 19
    iput-boolean p1, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->sensitive:Z

    return-void
.end method
