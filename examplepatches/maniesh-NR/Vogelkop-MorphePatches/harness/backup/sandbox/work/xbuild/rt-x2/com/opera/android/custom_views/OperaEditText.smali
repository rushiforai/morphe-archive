.class public Lcom/opera/android/custom_views/OperaEditText;
.super Lbq1;
.source "SourceFile"

# interfaces
.implements Lk2c;
.implements Llgl;


# static fields
.field public static final synthetic r:I


# instance fields
.field public final g:Z

.field public final h:Lvr3;

.field public final i:Lzg;

.field public final j:Ll2c;

.field public final k:Lfr;

.field public l:Z

.field public m:Ljava/lang/String;

.field public final n:I

.field public o:Z

.field public p:Z

.field public q:Luk7;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 160
    invoke-direct {p0, p1, v0, v1}, Lbq1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 161
    new-instance p1, Lvr3;

    invoke-direct {p1, p0}, Lvr3;-><init>(Landroid/widget/TextView;)V

    .line 162
    iput-object p1, p0, Lcom/opera/android/custom_views/OperaEditText;->h:Lvr3;

    .line 163
    new-instance p1, Lzg;

    invoke-direct {p1, p0}, Lzg;-><init>(Landroid/widget/TextView;)V

    iput-object p1, p0, Lcom/opera/android/custom_views/OperaEditText;->i:Lzg;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 9

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lbq1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v1, Lvr3;

    invoke-direct {v1, p0}, Lvr3;-><init>(Landroid/widget/TextView;)V

    iput-object v1, p0, Lcom/opera/android/custom_views/OperaEditText;->h:Lvr3;

    new-instance v2, Lzg;

    invoke-direct {v2, p0}, Lzg;-><init>(Landroid/widget/TextView;)V

    iput-object v2, p0, Lcom/opera/android/custom_views/OperaEditText;->i:Lzg;

    if-eqz p2, :cond_96

    invoke-virtual {v1, p2, v0}, Lvr3;->g(Landroid/util/AttributeSet;I)V

    new-instance v1, Ll2c;

    invoke-direct {v1, p0, p0, p2}, Ll2c;-><init>(Landroid/view/View;Lk2c;Landroid/util/AttributeSet;)V

    iput-object v1, p0, Lcom/opera/android/custom_views/OperaEditText;->j:Ll2c;

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    sget-object v3, Lkhh;->u:[I

    invoke-virtual {v1, p2, v3, v0, v0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    const/4 v4, 0x1

    const/4 v5, 0x3

    :try_start_2a
    invoke-virtual {v1, v5, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5
    :try_end_2e
    .catchall {:try_start_2a .. :try_end_2e} :catchall_9b

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    iput-boolean v5, p0, Lcom/opera/android/custom_views/OperaEditText;->g:Z

    invoke-virtual {p1, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    const/4 v3, 0x2

    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    iput-boolean v3, p0, Lcom/opera/android/custom_views/OperaEditText;->l:Z

    invoke-virtual {v1, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/opera/android/custom_views/OperaEditText;->m:Ljava/lang/String;

    const v3, 0x7fffffff

    invoke-virtual {v1, v4, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    iput v3, p0, Lcom/opera/android/custom_views/OperaEditText;->n:I

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    iget-object v1, p0, Lcom/opera/android/custom_views/OperaEditText;->m:Ljava/lang/String;

    if-eqz v1, :cond_77

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    if-eqz v1, :cond_64

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-nez v1, :cond_77

    :cond_64
    iget-boolean v1, p0, Lcom/opera/android/custom_views/OperaEditText;->o:Z

    if-nez v1, :cond_77

    iput-boolean v4, p0, Lcom/opera/android/custom_views/OperaEditText;->o:Z

    iget-object v1, p0, Lcom/opera/android/custom_views/OperaEditText;->m:Ljava/lang/String;

    invoke-super {p0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    :cond_77
    invoke-virtual {v2, p1, p2, v0}, Lzg;->u(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {p1, p2}, Lfr;->f(Landroid/content/Context;Landroid/util/AttributeSet;)Lfr;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/custom_views/OperaEditText;->k:Lfr;

    if-eqz p1, :cond_85

    invoke-virtual {p1, p0}, Lfr;->e(Landroid/view/View;)V

    :cond_85
    new-instance p1, Lkkf;

    invoke-direct {p1, p0, v0}, Lkkf;-><init>(Ljava/lang/Object;B)V

    sget-object p2, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p2

    if-nez p2, :cond_97

    :cond_96
    return-void

    :cond_97
    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void

    :catchall_9b
    move-exception p0

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    throw p0
.end method

.method public static h(Landroid/text/Editable;)V
    .registers 5

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const-class v1, Landroid/text/style/CharacterStyle;

    const/4 v2, 0x0

    invoke-interface {p0, v2, v0, v1}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/text/style/CharacterStyle;

    :goto_d
    array-length v1, v0

    if-ge v2, v1, :cond_18

    aget-object v1, v0, v2

    invoke-interface {p0, v1}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    :cond_18
    invoke-static {}, Landroid/icu/text/Normalizer2;->getNFKDInstance()Landroid/icu/text/Normalizer2;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/icu/text/Normalizer2;->spanQuickCheckYes(Ljava/lang/CharSequence;)I

    move-result v1

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-ne v1, v2, :cond_27

    return-void

    :cond_27
    invoke-interface {p0, v1, v2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/icu/text/Normalizer2;->normalize(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v1, v2, v0}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    return-void
.end method


# virtual methods
.method public final b()Ll2c;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/custom_views/OperaEditText;->j:Ll2c;

    return-object p0
.end method

.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7

    iget-object v0, p0, Lcom/opera/android/custom_views/OperaEditText;->q:Luk7;

    if-eqz v0, :cond_60

    iget-object v1, v0, Luk7;->b:Lmgf;

    if-eqz v1, :cond_60

    iget-object v1, v0, Luk7;->c:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_13

    iget v2, v0, Luk7;->d:I

    if-eqz v2, :cond_13

    invoke-virtual {v0, p1, v1, v2}, Luk7;->a(Landroid/view/MotionEvent;Landroid/graphics/drawable/Drawable;I)Z

    :cond_13
    iget-object v1, v0, Luk7;->c:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1b

    iget v1, v0, Luk7;->d:I

    if-nez v1, :cond_39

    :cond_1b
    iget-object v1, v0, Luk7;->a:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const/4 v2, 0x0

    :goto_22
    array-length v3, v1

    if-ge v2, v3, :cond_39

    aget-object v3, v1, v2

    const/4 v4, 0x4

    invoke-static {v4}, Lvep;->B(I)[I

    move-result-object v4

    aget v4, v4, v2

    if-eqz v3, :cond_36

    invoke-virtual {v0, p1, v3, v4}, Luk7;->a(Landroid/view/MotionEvent;Landroid/graphics/drawable/Drawable;I)Z

    move-result v3

    if-nez v3, :cond_39

    :cond_36
    add-int/lit8 v2, v2, 0x1

    goto :goto_22

    :cond_39
    iget-object v1, v0, Luk7;->c:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_60

    iget v1, v0, Luk7;->d:I

    if-eqz v1, :cond_60

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p0

    const/4 p1, 0x1

    if-ne p0, p1, :cond_5f

    iget-object p0, v0, Luk7;->b:Lmgf;

    iget-object v0, p0, Lmgf;->b:Ljava/lang/Object;

    check-cast v0, Liji;

    iget-object p0, p0, Lmgf;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/downloads/SaveSheet$FilenameEditText;

    iget-boolean v1, v0, Liji;->v:Z

    if-eqz v1, :cond_5c

    const-string v0, ""

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return p1

    :cond_5c
    invoke-virtual {v0}, Liji;->f()V

    :cond_5f
    return p1

    :cond_60
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final f(I)Z
    .registers 16

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v0

    int-to-long v0, v0

    sub-long v0, v2, v0

    const-wide/16 v4, 0x1

    sub-long/2addr v0, v4

    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionStart()I

    move-result v4

    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result v5

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v6

    int-to-float v6, v6

    const/high16 v7, 0x40000000    # 2.0f

    div-float v11, v6, v7

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v6, v7

    const/4 v10, 0x0

    const/4 v13, 0x0

    move-wide v8, v0

    move v12, v6

    move-wide v6, v0

    invoke-static/range {v6 .. v13}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/MotionEvent;->setSource(I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v8

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    if-eq v4, v5, :cond_3d

    invoke-virtual {p0, v4, v5}, Landroid/widget/EditText;->setSelection(II)V

    :cond_3d
    if-eqz v8, :cond_5a

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/custom_views/OperaEditText;->p:Z

    invoke-virtual {p0}, Lcom/opera/android/custom_views/OperaEditText;->performLongClick()Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/custom_views/OperaEditText;->p:Z

    const/4 v4, 0x1

    move-wide v0, v6

    const/4 v7, 0x0

    move v5, v11

    move v6, v12

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/MotionEvent;->setSource(I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    :cond_5a
    return v8
.end method

.method public final g(Ljava/lang/String;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    iput-object p1, p0, Lcom/opera/android/custom_views/OperaEditText;->m:Ljava/lang/String;

    return-void
.end method

.method public final i(I)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/custom_views/OperaEditText;->i:Lzg;

    if-eqz v0, :cond_18

    iget-object v1, v0, Lzg;->c:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_10

    iget-object v1, v0, Lzg;->d:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_18

    :cond_10
    iget v1, v0, Lzg;->a:I

    if-eq v1, p1, :cond_18

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lzg;->L(IZ)V

    :cond_18
    iget-object p1, p0, Lcom/opera/android/custom_views/OperaEditText;->k:Lfr;

    if-eqz p1, :cond_1f

    invoke-virtual {p1, p0}, Lfr;->e(Landroid/view/View;)V

    :cond_1f
    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    iget-object p1, p0, Lcom/opera/android/custom_views/OperaEditText;->h:Lvr3;

    invoke-virtual {p1}, Lvr3;->c()V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/OperaEditText;->k()V

    return-void
.end method

.method public final j()V
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f040573

    filled-new-array {v1}, [I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    const/4 v1, 0x0

    :try_start_10
    invoke-virtual {v0, v1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1
    :try_end_14
    .catchall {:try_start_10 .. :try_end_14} :catchall_30

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    if-nez v1, :cond_25

    invoke-virtual {p0}, Landroid/widget/TextView;->getImeOptions()I

    move-result v0

    const v1, -0x1000001

    and-int/2addr v0, v1

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setImeOptions(I)V

    return-void

    :cond_25
    invoke-virtual {p0}, Landroid/widget/TextView;->getImeOptions()I

    move-result v0

    const/high16 v1, 0x1000000

    or-int/2addr v0, v1

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setImeOptions(I)V

    return-void

    :catchall_30
    move-exception p0

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw p0
.end method

.method public final k()V
    .registers 5

    iget v0, p0, Lcom/opera/android/custom_views/OperaEditText;->n:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_6

    return-void

    :cond_6
    invoke-virtual {p0}, Landroid/widget/TextView;->getGravity()I

    move-result v0

    const/4 v2, 0x5

    and-int/2addr v0, v2

    const/4 v3, 0x0

    if-ne v0, v2, :cond_11

    move v0, v1

    goto :goto_12

    :cond_11
    move v0, v3

    :goto_12
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1f

    if-eqz v0, :cond_1f

    move v1, v3

    :cond_1f
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    return-void
.end method

.method public final l()Z
    .registers 1

    iget-object p0, p0, Lcom/opera/android/custom_views/OperaEditText;->j:Ll2c;

    if-nez p0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    invoke-virtual {p0}, Ll2c;->b()Z

    move-result p0

    return p0
.end method

.method public final onAttachedToWindow()V
    .registers 1

    invoke-virtual {p0}, Lcom/opera/android/custom_views/OperaEditText;->j()V

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    return-void
.end method

.method public onFocusChanged(ZILandroid/graphics/Rect;)V
    .registers 4

    invoke-super {p0, p1, p2, p3}, Landroid/view/View;->onFocusChanged(ZILandroid/graphics/Rect;)V

    iget-boolean p2, p0, Lcom/opera/android/custom_views/OperaEditText;->l:Z

    if-eqz p2, :cond_15

    if-eqz p1, :cond_15

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/opera/android/custom_views/OperaEditText;->l:Z

    new-instance p1, Lvdf;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Lvdf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_15
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->onTextChanged(Ljava/lang/CharSequence;III)V

    iget-object p2, p0, Lcom/opera/android/custom_views/OperaEditText;->m:Ljava/lang/String;

    if-eqz p2, :cond_30

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    iget-boolean p2, p0, Lcom/opera/android/custom_views/OperaEditText;->o:Z

    if-nez p1, :cond_22

    if-nez p2, :cond_30

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/custom_views/OperaEditText;->o:Z

    iget-object p2, p0, Lcom/opera/android/custom_views/OperaEditText;->m:Ljava/lang/String;

    invoke-super {p0, p2}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object p1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto :goto_30

    :cond_22
    if-eqz p2, :cond_30

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/opera/android/custom_views/OperaEditText;->o:Z

    const/4 p1, 0x0

    invoke-super {p0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    iget p1, p0, Lcom/opera/android/custom_views/OperaEditText;->n:I

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    :cond_30
    :goto_30
    iget-object p1, p0, Lcom/opera/android/custom_views/OperaEditText;->h:Lvr3;

    if-eqz p1, :cond_37

    invoke-virtual {p1}, Lvr3;->k()V

    :cond_37
    invoke-virtual {p0}, Lcom/opera/android/custom_views/OperaEditText;->k()V

    return-void
.end method

.method public onTextContextMenuItem(I)Z
    .registers 4

    invoke-super {p0, p1}, Lbq1;->onTextContextMenuItem(I)Z

    move-result v0

    const v1, 0x1020022

    if-ne p1, v1, :cond_14

    iget-boolean p1, p0, Lcom/opera/android/custom_views/OperaEditText;->g:Z

    if-eqz p1, :cond_14

    invoke-virtual {p0}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/custom_views/OperaEditText;->h(Landroid/text/Editable;)V

    :cond_14
    return v0
.end method

.method public final performHapticFeedback(II)Z
    .registers 4

    iget-boolean v0, p0, Lcom/opera/android/custom_views/OperaEditText;->p:Z

    if-nez v0, :cond_c

    invoke-super {p0, p1, p2}, Landroid/view/View;->performHapticFeedback(II)Z

    move-result p0

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public final performLongClick()Z
    .registers 1

    :try_start_0
    invoke-super {p0}, Landroid/view/View;->performLongClick()Z

    move-result p0
    :try_end_4
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_4} :catch_5

    return p0

    :catch_5
    const/4 p0, 0x1

    return p0
.end method
