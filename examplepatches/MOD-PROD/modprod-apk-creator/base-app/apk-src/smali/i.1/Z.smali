.class public final Li/Z;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/widget/TextView;

.field public b:Li/U0;

.field public c:Li/U0;

.field public d:Li/U0;

.field public e:Li/U0;

.field public f:Li/U0;

.field public g:Li/U0;

.field public h:Li/U0;

.field public final i:Li/i0;

.field public j:I

.field public k:I

.field public l:Landroid/graphics/Typeface;

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Li/Z;->j:I

    const/4 v0, -0x1

    iput v0, p0, Li/Z;->k:I

    iput-object p1, p0, Li/Z;->a:Landroid/widget/TextView;

    new-instance v0, Li/i0;

    invoke-direct {v0, p1}, Li/i0;-><init>(Landroid/widget/TextView;)V

    iput-object v0, p0, Li/Z;->i:Li/i0;

    return-void
.end method

.method public static c(Landroid/content/Context;Li/v;I)Li/U0;
    .locals 1

    monitor-enter p1

    :try_start_0
    iget-object v0, p1, Li/v;->a:Li/N0;

    invoke-virtual {v0, p0, p2}, Li/N0;->f(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p1

    if-eqz p0, :cond_0

    new-instance p1, Li/U0;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x1

    iput-boolean p2, p1, Li/U0;->d:Z

    iput-object p0, p1, Li/U0;->a:Landroid/content/res/ColorStateList;

    return-object p1

    :cond_0
    const/4 p0, 0x0

    return-object p0

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static h(Landroid/view/inputmethod/EditorInfo;Landroid/view/inputmethod/InputConnection;Landroid/widget/TextView;)V
    .locals 11

    const/16 v0, 0x800

    const/4 v1, 0x0

    const/4 v2, 0x1

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1e

    if-ge v3, v4, :cond_d

    if-eqz p1, :cond_d

    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    if-lt v3, v4, :cond_0

    invoke-static {p0, p1}, LC/b;->a(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-lt v3, v4, :cond_1

    invoke-static {p0, p1}, LC/b;->a(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    iget p2, p0, Landroid/view/inputmethod/EditorInfo;->initialSelStart:I

    iget v3, p0, Landroid/view/inputmethod/EditorInfo;->initialSelEnd:I

    if-le p2, v3, :cond_2

    move v4, v3

    goto :goto_0

    :cond_2
    move v4, p2

    :goto_0
    if-le p2, v3, :cond_3

    goto :goto_1

    :cond_3
    move p2, v3

    :goto_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    const/4 v5, 0x0

    if-ltz v4, :cond_c

    if-le p2, v3, :cond_4

    goto/16 :goto_5

    :cond_4
    iget v6, p0, Landroid/view/inputmethod/EditorInfo;->inputType:I

    and-int/lit16 v6, v6, 0xfff

    const/16 v7, 0x81

    if-eq v6, v7, :cond_b

    const/16 v7, 0xe1

    if-eq v6, v7, :cond_b

    const/16 v7, 0x12

    if-ne v6, v7, :cond_5

    goto :goto_4

    :cond_5
    if-gt v3, v0, :cond_6

    invoke-static {p0, p1, v4, p2}, LC/c;->a(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;II)V

    return-void

    :cond_6
    sub-int v3, p2, v4

    const/16 v5, 0x400

    if-le v3, v5, :cond_7

    move v5, v1

    goto :goto_2

    :cond_7
    move v5, v3

    :goto_2
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v6

    sub-int/2addr v6, p2

    sub-int/2addr v0, v5

    const-wide v7, 0x3fe999999999999aL    # 0.8

    int-to-double v9, v0

    mul-double/2addr v9, v7

    double-to-int v7, v9

    invoke-static {v4, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    sub-int v7, v0, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    sub-int/2addr v0, v6

    invoke-static {v4, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    sub-int/2addr v4, v0

    invoke-interface {p1, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result v7

    if-eqz v7, :cond_8

    add-int/2addr v4, v2

    sub-int/2addr v0, v2

    :cond_8
    add-int v7, p2, v6

    sub-int/2addr v7, v2

    invoke-interface {p1, v7}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v7

    if-eqz v7, :cond_9

    sub-int/2addr v6, v2

    :cond_9
    add-int v7, v0, v5

    add-int v8, v7, v6

    if-eq v5, v3, :cond_a

    add-int v3, v4, v0

    invoke-interface {p1, v4, v3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    add-int/2addr v6, p2

    invoke-interface {p1, p2, v6}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    const/4 p2, 0x2

    new-array p2, p2, [Ljava/lang/CharSequence;

    aput-object v3, p2, v1

    aput-object p1, p2, v2

    invoke-static {p2}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    goto :goto_3

    :cond_a
    add-int/2addr v8, v4

    invoke-interface {p1, v4, v8}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    :goto_3
    invoke-static {p0, p1, v0, v7}, LC/c;->a(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;II)V

    return-void

    :cond_b
    :goto_4
    invoke-static {p0, v5, v1, v1}, LC/c;->a(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;II)V

    return-void

    :cond_c
    :goto_5
    invoke-static {p0, v5, v1, v1}, LC/c;->a(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;II)V

    :cond_d
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/drawable/Drawable;Li/U0;)V
    .locals 1

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    iget-object v0, p0, Li/Z;->a:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v0

    invoke-static {p1, p2, v0}, Li/v;->d(Landroid/graphics/drawable/Drawable;Li/U0;[I)V

    :cond_0
    return-void
.end method

.method public final b()V
    .locals 6

    iget-object v0, p0, Li/Z;->b:Li/U0;

    const/4 v1, 0x2

    const/4 v2, 0x0

    iget-object v3, p0, Li/Z;->a:Landroid/widget/TextView;

    if-nez v0, :cond_0

    iget-object v0, p0, Li/Z;->c:Li/U0;

    if-nez v0, :cond_0

    iget-object v0, p0, Li/Z;->d:Li/U0;

    if-nez v0, :cond_0

    iget-object v0, p0, Li/Z;->e:Li/U0;

    if-eqz v0, :cond_1

    :cond_0
    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    aget-object v4, v0, v2

    iget-object v5, p0, Li/Z;->b:Li/U0;

    invoke-virtual {p0, v4, v5}, Li/Z;->a(Landroid/graphics/drawable/Drawable;Li/U0;)V

    const/4 v4, 0x1

    aget-object v4, v0, v4

    iget-object v5, p0, Li/Z;->c:Li/U0;

    invoke-virtual {p0, v4, v5}, Li/Z;->a(Landroid/graphics/drawable/Drawable;Li/U0;)V

    aget-object v4, v0, v1

    iget-object v5, p0, Li/Z;->d:Li/U0;

    invoke-virtual {p0, v4, v5}, Li/Z;->a(Landroid/graphics/drawable/Drawable;Li/U0;)V

    const/4 v4, 0x3

    aget-object v0, v0, v4

    iget-object v4, p0, Li/Z;->e:Li/U0;

    invoke-virtual {p0, v0, v4}, Li/Z;->a(Landroid/graphics/drawable/Drawable;Li/U0;)V

    :cond_1
    iget-object v0, p0, Li/Z;->f:Li/U0;

    if-nez v0, :cond_3

    iget-object v0, p0, Li/Z;->g:Li/U0;

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    return-void

    :cond_3
    :goto_0
    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    aget-object v2, v0, v2

    iget-object v3, p0, Li/Z;->f:Li/U0;

    invoke-virtual {p0, v2, v3}, Li/Z;->a(Landroid/graphics/drawable/Drawable;Li/U0;)V

    aget-object v0, v0, v1

    iget-object v1, p0, Li/Z;->g:Li/U0;

    invoke-virtual {p0, v0, v1}, Li/Z;->a(Landroid/graphics/drawable/Drawable;Li/U0;)V

    return-void
.end method

.method public final d()Landroid/content/res/ColorStateList;
    .locals 1

    iget-object v0, p0, Li/Z;->h:Li/U0;

    if-eqz v0, :cond_0

    iget-object v0, v0, Li/U0;->a:Landroid/content/res/ColorStateList;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public final e()Landroid/graphics/PorterDuff$Mode;
    .locals 1

    iget-object v0, p0, Li/Z;->h:Li/U0;

    if-eqz v0, :cond_0

    iget-object v0, v0, Li/U0;->b:Landroid/graphics/PorterDuff$Mode;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public final f(Landroid/util/AttributeSet;I)V
    .locals 23

    move-object/from16 v0, p0

    move-object/from16 v4, p1

    move/from16 v6, p2

    iget-object v1, v0, Li/Z;->a:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {}, Li/v;->a()Li/v;

    move-result-object v8

    sget-object v3, Ld/a;->h:[I

    invoke-static {v7, v4, v3, v6}, LC/h;->m(Landroid/content/Context;Landroid/util/AttributeSet;[II)LC/h;

    move-result-object v9

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v5, v9, LC/h;->b:Ljava/lang/Object;

    check-cast v5, Landroid/content/res/TypedArray;

    invoke-static/range {v1 .. v6}, Ly/K;->g(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;I)V

    move-object v10, v1

    iget-object v1, v9, LC/h;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/res/TypedArray;

    const/4 v11, 0x0

    const/4 v12, -0x1

    invoke-virtual {v1, v11, v12}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    const/4 v13, 0x3

    invoke-virtual {v1, v13}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v1, v13, v11}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    invoke-static {v7, v8, v3}, Li/Z;->c(Landroid/content/Context;Li/v;I)Li/U0;

    move-result-object v3

    iput-object v3, v0, Li/Z;->b:Li/U0;

    :cond_0
    const/4 v14, 0x1

    invoke-virtual {v1, v14}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v1, v14, v11}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    invoke-static {v7, v8, v3}, Li/Z;->c(Landroid/content/Context;Li/v;I)Li/U0;

    move-result-object v3

    iput-object v3, v0, Li/Z;->c:Li/U0;

    :cond_1
    const/4 v15, 0x4

    invoke-virtual {v1, v15}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v1, v15, v11}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    invoke-static {v7, v8, v3}, Li/Z;->c(Landroid/content/Context;Li/v;I)Li/U0;

    move-result-object v3

    iput-object v3, v0, Li/Z;->d:Li/U0;

    :cond_2
    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v1, v3, v11}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    invoke-static {v7, v8, v5}, Li/Z;->c(Landroid/content/Context;Li/v;I)Li/U0;

    move-result-object v5

    iput-object v5, v0, Li/Z;->e:Li/U0;

    :cond_3
    const/4 v5, 0x5

    invoke-virtual {v1, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v16

    if-eqz v16, :cond_4

    invoke-virtual {v1, v5, v11}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    invoke-static {v7, v8, v3}, Li/Z;->c(Landroid/content/Context;Li/v;I)Li/U0;

    move-result-object v3

    iput-object v3, v0, Li/Z;->f:Li/U0;

    :cond_4
    const/4 v3, 0x6

    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v17

    if-eqz v17, :cond_5

    invoke-virtual {v1, v3, v11}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    invoke-static {v7, v8, v1}, Li/Z;->c(Landroid/content/Context;Li/v;I)Li/U0;

    move-result-object v1

    iput-object v1, v0, Li/Z;->g:Li/U0;

    :cond_5
    invoke-virtual {v9}, LC/h;->r()V

    invoke-virtual {v10}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object v1

    instance-of v1, v1, Landroid/text/method/PasswordTransformationMethod;

    sget-object v9, Ld/a;->v:[I

    const/16 v13, 0xf

    const/16 v3, 0x1a

    const/16 v5, 0xe

    const/16 v14, 0xd

    if-eq v2, v12, :cond_9

    new-instance v15, LC/h;

    invoke-virtual {v7, v2, v9}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v2

    invoke-direct {v15, v7, v2}, LC/h;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    if-nez v1, :cond_6

    invoke-virtual {v2, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v20

    if-eqz v20, :cond_6

    invoke-virtual {v2, v5, v11}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v20

    move/from16 v21, v20

    const/16 v20, 0x1

    goto :goto_0

    :cond_6
    move/from16 v20, v11

    move/from16 v21, v20

    :goto_0
    invoke-virtual {v0, v7, v15}, Li/Z;->n(Landroid/content/Context;LC/h;)V

    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v2, v13}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v22

    if-eqz v22, :cond_7

    invoke-virtual {v2, v13}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v22

    goto :goto_1

    :cond_7
    const/16 v22, 0x0

    :goto_1
    if-lt v12, v3, :cond_8

    invoke-virtual {v2, v14}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v12

    if-eqz v12, :cond_8

    invoke-virtual {v2, v14}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_8
    const/4 v2, 0x0

    :goto_2
    invoke-virtual {v15}, LC/h;->r()V

    goto :goto_3

    :cond_9
    move/from16 v20, v11

    move/from16 v21, v20

    const/4 v2, 0x0

    const/16 v22, 0x0

    :goto_3
    new-instance v12, LC/h;

    invoke-virtual {v7, v4, v9, v6, v11}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v9

    invoke-direct {v12, v7, v9}, LC/h;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    if-nez v1, :cond_a

    invoke-virtual {v9, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v15

    if-eqz v15, :cond_a

    invoke-virtual {v9, v5, v11}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v21

    const/16 v20, 0x1

    :cond_a
    move/from16 v5, v21

    sget v15, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v9, v13}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v21

    if-eqz v21, :cond_b

    invoke-virtual {v9, v13}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v22

    :cond_b
    if-lt v15, v3, :cond_c

    invoke-virtual {v9, v14}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-virtual {v9, v14}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    :cond_c
    const/16 v3, 0x1c

    if-lt v15, v3, :cond_d

    invoke-virtual {v9, v11}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_d

    const/4 v3, -0x1

    invoke-virtual {v9, v11, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v9

    if-nez v9, :cond_d

    const/4 v3, 0x0

    invoke-virtual {v10, v11, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    :cond_d
    invoke-virtual {v0, v7, v12}, Li/Z;->n(Landroid/content/Context;LC/h;)V

    invoke-virtual {v12}, LC/h;->r()V

    if-nez v1, :cond_e

    if-eqz v20, :cond_e

    invoke-virtual {v10, v5}, Landroid/widget/TextView;->setAllCaps(Z)V

    :cond_e
    iget-object v1, v0, Li/Z;->l:Landroid/graphics/Typeface;

    if-eqz v1, :cond_10

    iget v3, v0, Li/Z;->k:I

    const/4 v5, -0x1

    if-ne v3, v5, :cond_f

    iget v3, v0, Li/Z;->j:I

    invoke-virtual {v10, v1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    goto :goto_4

    :cond_f
    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_10
    :goto_4
    if-eqz v2, :cond_11

    invoke-static {v10, v2}, Li/X;->d(Landroid/widget/TextView;Ljava/lang/String;)Z

    :cond_11
    if-eqz v22, :cond_12

    invoke-static/range {v22 .. v22}, Li/W;->a(Ljava/lang/String;)Landroid/os/LocaleList;

    move-result-object v1

    invoke-static {v10, v1}, Li/W;->b(Landroid/widget/TextView;Landroid/os/LocaleList;)V

    :cond_12
    sget-object v3, Ld/a;->i:[I

    iget-object v9, v0, Li/Z;->i:Li/i0;

    iget-object v12, v9, Li/i0;->j:Landroid/content/Context;

    invoke-virtual {v12, v4, v3, v6, v11}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v5

    iget-object v1, v9, Li/i0;->i:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v13, 0x5

    const/4 v15, 0x2

    invoke-static/range {v1 .. v6}, Ly/K;->g(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;I)V

    invoke-virtual {v5, v13}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_13

    invoke-virtual {v5, v13, v11}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, v9, Li/i0;->a:I

    :cond_13
    const/4 v1, 0x4

    invoke-virtual {v5, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    const/high16 v6, -0x40800000    # -1.0f

    if-eqz v2, :cond_14

    invoke-virtual {v5, v1, v6}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    goto :goto_5

    :cond_14
    move v1, v6

    :goto_5
    invoke-virtual {v5, v15}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_15

    invoke-virtual {v5, v15, v6}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    :goto_6
    const/4 v13, 0x1

    goto :goto_7

    :cond_15
    move v2, v6

    goto :goto_6

    :goto_7
    invoke-virtual {v5, v13}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v18

    if-eqz v18, :cond_16

    invoke-virtual {v5, v13, v6}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v18

    :goto_8
    const/4 v13, 0x3

    goto :goto_9

    :cond_16
    move/from16 v18, v6

    goto :goto_8

    :goto_9
    invoke-virtual {v5, v13}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v17

    move/from16 p2, v6

    if-eqz v17, :cond_19

    invoke-virtual {v5, v13, v11}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    if-lez v6, :cond_19

    invoke-virtual {v5}, Landroid/content/res/TypedArray;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    invoke-virtual {v13, v6}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/TypedArray;->length()I

    move-result v13

    new-array v14, v13, [I

    if-lez v13, :cond_18

    :goto_a
    if-ge v11, v13, :cond_17

    const/4 v15, -0x1

    invoke-virtual {v6, v11, v15}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v22

    aput v22, v14, v11

    add-int/lit8 v11, v11, 0x1

    const/4 v15, 0x2

    goto :goto_a

    :cond_17
    invoke-static {v14}, Li/i0;->b([I)[I

    move-result-object v11

    iput-object v11, v9, Li/i0;->f:[I

    invoke-virtual {v9}, Li/i0;->i()Z

    :cond_18
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->recycle()V

    :cond_19
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {v9}, Li/i0;->j()Z

    move-result v5

    if-eqz v5, :cond_1e

    iget v5, v9, Li/i0;->a:I

    const/4 v13, 0x1

    if-ne v5, v13, :cond_1f

    iget-boolean v5, v9, Li/i0;->g:Z

    if-nez v5, :cond_1d

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    cmpl-float v6, v2, p2

    if-nez v6, :cond_1a

    const/high16 v2, 0x41400000    # 12.0f

    const/4 v15, 0x2

    invoke-static {v15, v2, v5}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    goto :goto_b

    :cond_1a
    const/4 v15, 0x2

    :goto_b
    cmpl-float v6, v18, p2

    if-nez v6, :cond_1b

    const/high16 v6, 0x42e00000    # 112.0f

    invoke-static {v15, v6, v5}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v18

    :cond_1b
    move/from16 v5, v18

    cmpl-float v6, v1, p2

    if-nez v6, :cond_1c

    const/high16 v1, 0x3f800000    # 1.0f

    :cond_1c
    invoke-virtual {v9, v2, v5, v1}, Li/i0;->k(FFF)V

    :cond_1d
    invoke-virtual {v9}, Li/i0;->h()Z

    goto :goto_c

    :cond_1e
    const/4 v1, 0x0

    iput v1, v9, Li/i0;->a:I

    :cond_1f
    :goto_c
    sget-boolean v1, Li/m1;->c:Z

    if-eqz v1, :cond_21

    iget v1, v9, Li/i0;->a:I

    if-eqz v1, :cond_21

    iget-object v1, v9, Li/i0;->f:[I

    array-length v2, v1

    if-lez v2, :cond_21

    invoke-static {v10}, Li/X;->a(Landroid/widget/TextView;)I

    move-result v2

    int-to-float v2, v2

    cmpl-float v2, v2, p2

    if-eqz v2, :cond_20

    iget v1, v9, Li/i0;->d:F

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iget v2, v9, Li/i0;->e:F

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iget v5, v9, Li/i0;->c:F

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    const/4 v6, 0x0

    invoke-static {v10, v1, v2, v5, v6}, Li/X;->b(Landroid/widget/TextView;IIII)V

    goto :goto_d

    :cond_20
    const/4 v6, 0x0

    invoke-static {v10, v1, v6}, Li/X;->c(Landroid/widget/TextView;[II)V

    :cond_21
    :goto_d
    invoke-virtual {v7, v4, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    const/16 v2, 0x8

    const/4 v15, -0x1

    invoke-virtual {v1, v2, v15}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    if-eq v2, v15, :cond_22

    invoke-virtual {v8, v7, v2}, Li/v;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    :goto_e
    const/16 v3, 0xd

    goto :goto_f

    :cond_22
    const/4 v2, 0x0

    goto :goto_e

    :goto_f
    invoke-virtual {v1, v3, v15}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    if-eq v3, v15, :cond_23

    invoke-virtual {v8, v7, v3}, Li/v;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    goto :goto_10

    :cond_23
    const/4 v3, 0x0

    :goto_10
    const/16 v4, 0x9

    invoke-virtual {v1, v4, v15}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    if-eq v4, v15, :cond_24

    invoke-virtual {v8, v7, v4}, Li/v;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    :goto_11
    const/4 v5, 0x6

    goto :goto_12

    :cond_24
    const/4 v4, 0x0

    goto :goto_11

    :goto_12
    invoke-virtual {v1, v5, v15}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    if-eq v5, v15, :cond_25

    invoke-virtual {v8, v7, v5}, Li/v;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    goto :goto_13

    :cond_25
    const/4 v5, 0x0

    :goto_13
    const/16 v6, 0xa

    invoke-virtual {v1, v6, v15}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    if-eq v6, v15, :cond_26

    invoke-virtual {v8, v7, v6}, Li/v;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    goto :goto_14

    :cond_26
    const/4 v6, 0x0

    :goto_14
    const/4 v9, 0x7

    invoke-virtual {v1, v9, v15}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v9

    if-eq v9, v15, :cond_27

    invoke-virtual {v8, v7, v9}, Li/v;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    goto :goto_15

    :cond_27
    const/4 v8, 0x0

    :goto_15
    if-nez v6, :cond_32

    if-eqz v8, :cond_28

    goto :goto_1e

    :cond_28
    if-nez v2, :cond_29

    if-nez v3, :cond_29

    if-nez v4, :cond_29

    if-eqz v5, :cond_37

    :cond_29
    invoke-virtual {v10}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v6

    const/16 v20, 0x0

    aget-object v8, v6, v20

    if-nez v8, :cond_2a

    const/16 v21, 0x2

    aget-object v9, v6, v21

    if-eqz v9, :cond_2b

    :cond_2a
    const/16 v17, 0x3

    goto :goto_1a

    :cond_2b
    invoke-virtual {v10}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v6

    if-eqz v2, :cond_2c

    goto :goto_16

    :cond_2c
    aget-object v2, v6, v20

    :goto_16
    if-eqz v3, :cond_2d

    goto :goto_17

    :cond_2d
    const/16 v19, 0x1

    aget-object v3, v6, v19

    :goto_17
    if-eqz v4, :cond_2e

    goto :goto_18

    :cond_2e
    const/16 v21, 0x2

    aget-object v4, v6, v21

    :goto_18
    if-eqz v5, :cond_2f

    goto :goto_19

    :cond_2f
    const/16 v17, 0x3

    aget-object v5, v6, v17

    :goto_19
    invoke-virtual {v10, v2, v3, v4, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_23

    :goto_1a
    if-eqz v3, :cond_30

    goto :goto_1b

    :cond_30
    const/16 v19, 0x1

    aget-object v3, v6, v19

    :goto_1b
    if-eqz v5, :cond_31

    :goto_1c
    const/16 v21, 0x2

    goto :goto_1d

    :cond_31
    aget-object v5, v6, v17

    goto :goto_1c

    :goto_1d
    aget-object v2, v6, v21

    invoke-virtual {v10, v8, v3, v2, v5}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_23

    :cond_32
    :goto_1e
    invoke-virtual {v10}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v6, :cond_33

    goto :goto_1f

    :cond_33
    const/16 v20, 0x0

    aget-object v6, v2, v20

    :goto_1f
    if-eqz v3, :cond_34

    goto :goto_20

    :cond_34
    const/16 v19, 0x1

    aget-object v3, v2, v19

    :goto_20
    if-eqz v8, :cond_35

    goto :goto_21

    :cond_35
    const/16 v21, 0x2

    aget-object v8, v2, v21

    :goto_21
    if-eqz v5, :cond_36

    goto :goto_22

    :cond_36
    const/16 v17, 0x3

    aget-object v5, v2, v17

    :goto_22
    invoke-virtual {v10, v6, v3, v8, v5}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_37
    :goto_23
    const/16 v2, 0xb

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_39

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_38

    const/4 v6, 0x0

    invoke-virtual {v1, v2, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    if-eqz v3, :cond_38

    invoke-static {v7, v3}, LD/g;->q(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    if-eqz v3, :cond_38

    goto :goto_24

    :cond_38
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    :goto_24
    invoke-static {v10, v3}, LD/p;->f(Landroid/widget/TextView;Landroid/content/res/ColorStateList;)V

    :cond_39
    const/16 v2, 0xc

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    const/4 v15, -0x1

    if-eqz v3, :cond_3a

    invoke-virtual {v1, v2, v15}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Li/n0;->b(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v2

    invoke-static {v10, v2}, LD/p;->g(Landroid/widget/TextView;Landroid/graphics/PorterDuff$Mode;)V

    :cond_3a
    const/16 v2, 0xf

    invoke-virtual {v1, v2, v15}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    const/16 v3, 0x12

    invoke-virtual {v1, v3, v15}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    const/16 v4, 0x13

    invoke-virtual {v1, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v5

    if-eqz v5, :cond_3c

    invoke-virtual {v1, v4}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v5

    if-eqz v5, :cond_3b

    iget v6, v5, Landroid/util/TypedValue;->type:I

    const/4 v13, 0x5

    if-ne v6, v13, :cond_3b

    iget v4, v5, Landroid/util/TypedValue;->data:I

    and-int/lit8 v5, v4, 0xf

    invoke-static {v4}, Landroid/util/TypedValue;->complexToFloat(I)F

    move-result v4

    const/4 v15, -0x1

    goto :goto_26

    :cond_3b
    const/4 v15, -0x1

    invoke-virtual {v1, v4, v15}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    int-to-float v4, v4

    :goto_25
    move v5, v15

    goto :goto_26

    :cond_3c
    const/4 v15, -0x1

    move/from16 v4, p2

    goto :goto_25

    :goto_26
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    if-eq v2, v15, :cond_3d

    invoke-static {v10, v2}, LD/g;->P(Landroid/widget/TextView;I)V

    :cond_3d
    if-eq v3, v15, :cond_3e

    invoke-static {v10, v3}, LD/g;->Q(Landroid/widget/TextView;I)V

    :cond_3e
    cmpl-float v1, v4, p2

    if-eqz v1, :cond_41

    if-ne v5, v15, :cond_3f

    float-to-int v1, v4

    invoke-static {v10, v1}, LD/g;->R(Landroid/widget/TextView;I)V

    return-void

    :cond_3f
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x22

    if-lt v1, v2, :cond_40

    invoke-static {v10, v5, v4}, LD/s;->a(Landroid/widget/TextView;IF)V

    return-void

    :cond_40
    invoke-virtual {v10}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-static {v5, v4, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v10, v1}, LD/g;->R(Landroid/widget/TextView;I)V

    :cond_41
    return-void
.end method

.method public final g(Landroid/content/Context;I)V
    .locals 5

    sget-object v0, Ld/a;->v:[I

    new-instance v1, LC/h;

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p2

    invoke-direct {v1, p1, p2}, LC/h;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    const/16 v0, 0xe

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    iget-object v3, p0, Li/Z;->a:Landroid/widget/TextView;

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    invoke-virtual {p2, v0, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setAllCaps(Z)V

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {p2, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    invoke-virtual {p2, v4, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x0

    invoke-virtual {v3, v4, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    :cond_1
    invoke-virtual {p0, p1, v1}, Li/Z;->n(Landroid/content/Context;LC/h;)V

    const/16 p1, 0x1a

    if-lt v0, p1, :cond_2

    const/16 p1, 0xd

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-static {v3, p1}, Li/X;->d(Landroid/widget/TextView;Ljava/lang/String;)Z

    :cond_2
    invoke-virtual {v1}, LC/h;->r()V

    iget-object p1, p0, Li/Z;->l:Landroid/graphics/Typeface;

    if-eqz p1, :cond_3

    iget p2, p0, Li/Z;->j:I

    invoke-virtual {v3, p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :cond_3
    return-void
.end method

.method public final i(IIII)V
    .locals 2

    iget-object v0, p0, Li/Z;->i:Li/i0;

    invoke-virtual {v0}, Li/i0;->j()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Li/i0;->j:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    int-to-float p1, p1

    invoke-static {p4, p1, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    int-to-float p2, p2

    invoke-static {p4, p2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p2

    int-to-float p3, p3

    invoke-static {p4, p3, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p3

    invoke-virtual {v0, p1, p2, p3}, Li/i0;->k(FFF)V

    invoke-virtual {v0}, Li/i0;->h()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {v0}, Li/i0;->a()V

    :cond_0
    return-void
.end method

.method public final j([II)V
    .locals 6

    iget-object v0, p0, Li/Z;->i:Li/i0;

    invoke-virtual {v0}, Li/i0;->j()Z

    move-result v1

    if-eqz v1, :cond_4

    array-length v1, p1

    const/4 v2, 0x0

    if-lez v1, :cond_3

    new-array v3, v1, [I

    if-nez p2, :cond_0

    invoke-static {p1, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v3

    goto :goto_1

    :cond_0
    iget-object v4, v0, Li/i0;->j:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    :goto_0
    if-ge v2, v1, :cond_1

    aget v5, p1, v2

    int-to-float v5, v5

    invoke-static {p2, v5, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    aput v5, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    invoke-static {v3}, Li/i0;->b([I)[I

    move-result-object p2

    iput-object p2, v0, Li/i0;->f:[I

    invoke-virtual {v0}, Li/i0;->i()Z

    move-result p2

    if-eqz p2, :cond_2

    goto :goto_2

    :cond_2
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "None of the preset sizes is valid: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_3
    iput-boolean v2, v0, Li/i0;->g:Z

    :goto_2
    invoke-virtual {v0}, Li/i0;->h()Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-virtual {v0}, Li/i0;->a()V

    :cond_4
    return-void
.end method

.method public final k(I)V
    .locals 4

    iget-object v0, p0, Li/Z;->i:Li/i0;

    invoke-virtual {v0}, Li/i0;->j()Z

    move-result v1

    if-eqz v1, :cond_2

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    iget-object p1, v0, Li/i0;->j:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/high16 v1, 0x41400000    # 12.0f

    const/4 v2, 0x2

    invoke-static {v2, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    const/high16 v3, 0x42e00000    # 112.0f

    invoke-static {v2, v3, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1, p1, v2}, Li/i0;->k(FFF)V

    invoke-virtual {v0}, Li/i0;->h()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {v0}, Li/i0;->a()V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown auto-size text type: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const/4 p1, 0x0

    iput p1, v0, Li/i0;->a:I

    const/high16 v1, -0x40800000    # -1.0f

    iput v1, v0, Li/i0;->d:F

    iput v1, v0, Li/i0;->e:F

    iput v1, v0, Li/i0;->c:F

    new-array v1, p1, [I

    iput-object v1, v0, Li/i0;->f:[I

    iput-boolean p1, v0, Li/i0;->b:Z

    :cond_2
    return-void
.end method

.method public final l(Landroid/content/res/ColorStateList;)V
    .locals 1

    iget-object v0, p0, Li/Z;->h:Li/U0;

    if-nez v0, :cond_0

    new-instance v0, Li/U0;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Li/Z;->h:Li/U0;

    :cond_0
    iget-object v0, p0, Li/Z;->h:Li/U0;

    iput-object p1, v0, Li/U0;->a:Landroid/content/res/ColorStateList;

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, v0, Li/U0;->d:Z

    iput-object v0, p0, Li/Z;->b:Li/U0;

    iput-object v0, p0, Li/Z;->c:Li/U0;

    iput-object v0, p0, Li/Z;->d:Li/U0;

    iput-object v0, p0, Li/Z;->e:Li/U0;

    iput-object v0, p0, Li/Z;->f:Li/U0;

    iput-object v0, p0, Li/Z;->g:Li/U0;

    return-void
.end method

.method public final m(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    iget-object v0, p0, Li/Z;->h:Li/U0;

    if-nez v0, :cond_0

    new-instance v0, Li/U0;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Li/Z;->h:Li/U0;

    :cond_0
    iget-object v0, p0, Li/Z;->h:Li/U0;

    iput-object p1, v0, Li/U0;->b:Landroid/graphics/PorterDuff$Mode;

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, v0, Li/U0;->c:Z

    iput-object v0, p0, Li/Z;->b:Li/U0;

    iput-object v0, p0, Li/Z;->c:Li/U0;

    iput-object v0, p0, Li/Z;->d:Li/U0;

    iput-object v0, p0, Li/Z;->e:Li/U0;

    iput-object v0, p0, Li/Z;->f:Li/U0;

    iput-object v0, p0, Li/Z;->g:Li/U0;

    return-void
.end method

.method public final n(Landroid/content/Context;LC/h;)V
    .locals 11

    iget v0, p0, Li/Z;->j:I

    iget-object v1, p2, LC/h;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/res/TypedArray;

    const/4 v2, 0x2

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Li/Z;->j:I

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    const/4 v4, -0x1

    if-lt v0, v3, :cond_0

    const/16 v5, 0xb

    invoke-virtual {v1, v5, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Li/Z;->k:I

    if-eq v5, v4, :cond_0

    iget v5, p0, Li/Z;->j:I

    and-int/2addr v5, v2

    iput v5, p0, Li/Z;->j:I

    :cond_0
    const/16 v5, 0xa

    invoke-virtual {v1, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    const/16 v7, 0xc

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-nez v6, :cond_5

    invoke-virtual {v1, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v1, v9}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_e

    iput-boolean v8, p0, Li/Z;->m:Z

    invoke-virtual {v1, v9, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p1

    if-eq p1, v9, :cond_4

    if-eq p1, v2, :cond_3

    const/4 p2, 0x3

    if-eq p1, p2, :cond_2

    goto/16 :goto_4

    :cond_2
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    iput-object p1, p0, Li/Z;->l:Landroid/graphics/Typeface;

    return-void

    :cond_3
    sget-object p1, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    iput-object p1, p0, Li/Z;->l:Landroid/graphics/Typeface;

    return-void

    :cond_4
    sget-object p1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    iput-object p1, p0, Li/Z;->l:Landroid/graphics/Typeface;

    return-void

    :cond_5
    :goto_0
    const/4 v6, 0x0

    iput-object v6, p0, Li/Z;->l:Landroid/graphics/Typeface;

    invoke-virtual {v1, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_6

    move v5, v7

    :cond_6
    iget v6, p0, Li/Z;->k:I

    iget v7, p0, Li/Z;->j:I

    invoke-virtual {p1}, Landroid/content/Context;->isRestricted()Z

    move-result p1

    if-nez p1, :cond_b

    new-instance p1, Ljava/lang/ref/WeakReference;

    iget-object v10, p0, Li/Z;->a:Landroid/widget/TextView;

    invoke-direct {p1, v10}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    new-instance v10, Li/U;

    invoke-direct {v10, p0, v6, v7, p1}, Li/U;-><init>(Li/Z;IILjava/lang/ref/WeakReference;)V

    :try_start_0
    iget p1, p0, Li/Z;->j:I

    invoke-virtual {p2, v5, p1, v10}, LC/h;->k(IILi/U;)Landroid/graphics/Typeface;

    move-result-object p1

    if-eqz p1, :cond_9

    if-lt v0, v3, :cond_8

    iget p2, p0, Li/Z;->k:I

    if-eq p2, v4, :cond_8

    invoke-static {p1, v8}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p1

    iget p2, p0, Li/Z;->k:I

    iget v0, p0, Li/Z;->j:I

    and-int/2addr v0, v2

    if-eqz v0, :cond_7

    move v0, v9

    goto :goto_1

    :cond_7
    move v0, v8

    :goto_1
    invoke-static {p1, p2, v0}, Li/Y;->a(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, p0, Li/Z;->l:Landroid/graphics/Typeface;

    goto :goto_2

    :cond_8
    iput-object p1, p0, Li/Z;->l:Landroid/graphics/Typeface;

    :cond_9
    :goto_2
    iget-object p1, p0, Li/Z;->l:Landroid/graphics/Typeface;

    if-nez p1, :cond_a

    move p1, v9

    goto :goto_3

    :cond_a
    move p1, v8

    :goto_3
    iput-boolean p1, p0, Li/Z;->m:Z
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_b
    iget-object p1, p0, Li/Z;->l:Landroid/graphics/Typeface;

    if-nez p1, :cond_e

    invoke-virtual {v1, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_e

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p2, v3, :cond_d

    iget p2, p0, Li/Z;->k:I

    if-eq p2, v4, :cond_d

    invoke-static {p1, v8}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p1

    iget p2, p0, Li/Z;->k:I

    iget v0, p0, Li/Z;->j:I

    and-int/2addr v0, v2

    if-eqz v0, :cond_c

    move v8, v9

    :cond_c
    invoke-static {p1, p2, v8}, Li/Y;->a(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, p0, Li/Z;->l:Landroid/graphics/Typeface;

    goto :goto_4

    :cond_d
    iget p2, p0, Li/Z;->j:I

    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, p0, Li/Z;->l:Landroid/graphics/Typeface;

    :cond_e
    :goto_4
    return-void
.end method
