.class public abstract Lq9n;
.super Lfan;
.source "SourceFile"


# static fields
.field public static final c:Ll5b;

.field public static final d:Ll5b;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Ll5b;

    const/4 v1, 0x1

    const/16 v2, 0xb

    invoke-direct {v0, v2, v1}, Ll5b;-><init>(BZ)V

    sput-object v0, Lq9n;->c:Ll5b;

    new-instance v0, Ll5b;

    const/4 v1, 0x0

    invoke-direct {v0, v2, v1}, Ll5b;-><init>(BZ)V

    sput-object v0, Lq9n;->d:Ll5b;

    return-void
.end method

.method public static A(Landroid/view/View;Ljava/lang/Runnable;)V
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->isLaidOut()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_a
    new-instance v0, Lqj;

    const/16 v1, 0x9

    invoke-direct {v0, p1, v1}, Lqj;-><init>(Ljava/lang/Runnable;B)V

    invoke-static {v0, p0}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    return-void
.end method

.method public static B(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .registers 8

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    if-eqz v4, :cond_2c

    if-eqz p1, :cond_2c

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v5

    if-eqz v5, :cond_2c

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    :cond_2c
    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method public static C(ILandroid/view/View;)V
    .registers 4

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_17

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-eq v1, p0, :cond_17

    iput p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_17
    return-void
.end method

.method public static D(Landroid/view/View;IIII)V
    .registers 7

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-ne v1, p1, :cond_1e

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-ne v1, p2, :cond_1e

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-ne v1, p3, :cond_1e

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-eq v1, p4, :cond_24

    :cond_1e
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_24
    return-void
.end method

.method public static E(Landroid/view/View;II)V
    .registers 5

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_1d

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-ne v1, p1, :cond_16

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-eq v1, p2, :cond_1d

    :cond_16
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1d
    return-void
.end method

.method public static F(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V
    .registers 6

    iget-boolean v0, p0, Lcom/google/android/material/textfield/TextInputLayout;->x0:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    iput-boolean v1, p0, Lcom/google/android/material/textfield/TextInputLayout;->x0:Z

    :cond_7
    iget-object v2, p0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    instance-of v3, v2, Landroid/widget/AutoCompleteTextView;

    if-eqz v3, :cond_13

    check-cast v2, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v2, p1, v1}, Landroid/widget/AutoCompleteTextView;->setText(Ljava/lang/CharSequence;Z)V

    goto :goto_16

    :cond_13
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_16
    if-eqz v0, :cond_1b

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/material/textfield/TextInputLayout;->x0:Z

    :cond_1b
    return-void
.end method

.method public static G(Landroid/content/Context;Landroid/view/View;)Z
    .registers 3

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    invoke-virtual {p1}, Landroid/view/View;->hasWindowFocus()Z

    move-result v0

    if-nez v0, :cond_17

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p0

    new-instance v0, Lk9n;

    invoke-direct {v0, p1}, Lk9n;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/view/ViewTreeObserver;->addOnWindowFocusChangeListener(Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    const/4 p0, 0x1

    return p0

    :cond_17
    const-string v0, "input_method"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    move-result p0

    return p0
.end method

.method public static H(Landroid/view/View;)Z
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lq9n;->G(Landroid/content/Context;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static I(Landroid/view/View;Lp9n;)V
    .registers 3

    const-class v0, Landroid/view/View;

    invoke-static {p0, v0, p1}, Lq9n;->J(Landroid/view/View;Ljava/lang/Class;Lp9n;)V

    return-void
.end method

.method public static J(Landroid/view/View;Ljava/lang/Class;Lp9n;)V
    .registers 6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-interface {p2, p0}, Lp9n;->m(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_27

    :cond_10
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_27

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_1b
    if-ge v1, v0, :cond_27

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2, p1, p2}, Lq9n;->J(Landroid/view/View;Ljava/lang/Class;Lp9n;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    :cond_27
    return-void
.end method

.method public static d(Lm9n;Landroid/view/View;)V
    .registers 3

    new-instance v0, Lj9n;

    invoke-direct {v0, p0, p1}, Lj9n;-><init>(Lm9n;Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method

.method public static e(Landroid/view/View;Lr8n;)V
    .registers 3

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-static {v0, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method

.method public static f(Landroid/view/View;Lr8n;)V
    .registers 2

    invoke-static {p0, p1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-interface {p1, p0}, Lr8n;->a(Landroid/view/View;)V

    return-void
.end method

.method public static g(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V
    .registers 3

    invoke-virtual {p0, p1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-interface {p1, p0}, Landroid/view/View$OnAttachStateChangeListener;->onViewAttachedToWindow(Landroid/view/View;)V

    :cond_c
    return-void
.end method

.method public static h(Landroid/content/Context;)V
    .registers 1

    if-eqz p0, :cond_15

    invoke-static {p0}, Lt8;->d(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object p0

    if-eqz p0, :cond_15

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_15

    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    :cond_15
    return-void
.end method

.method public static i(Landroid/view/View;)V
    .registers 3

    invoke-static {}, Li0l;->g()Z

    move-result v0

    if-nez v0, :cond_16

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-ne v0, v1, :cond_1b

    const-string v0, "Xiaomi"

    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1b

    :cond_16
    const/16 v0, 0x8

    invoke-static {p0, v0}, Lr5n;->n(Landroid/view/View;I)V

    :cond_1b
    return-void
.end method

.method public static j(Landroid/view/View;)Landroid/view/View;
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->isVerticalScrollBarEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_b

    invoke-virtual {p0, v1}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    return-object p0

    :cond_b
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_25

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    :goto_15
    if-ge v1, v0, :cond_25

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Lq9n;->j(Landroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_22

    return-object v2

    :cond_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_15

    :cond_25
    const/4 p0, 0x0

    return-object p0
.end method

.method public static k(Ljava/util/List;Ljava/util/List;)Z
    .registers 7

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_29

    move v0, v2

    :goto_c
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v3, 0x1

    if-ge v0, v1, :cond_2d

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-eq v1, v4, :cond_27

    if-eqz v1, :cond_26

    if-eqz v4, :cond_26

    invoke-virtual {v1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_27

    :cond_26
    move v3, v2

    :cond_27
    :goto_27
    if-nez v3, :cond_2a

    :cond_29
    return v2

    :cond_2a
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    :cond_2d
    return v3
.end method

.method public static l(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Context;
    .registers 4

    move-object v0, p0

    :goto_1
    instance-of v1, v0, Landroid/content/ContextWrapper;

    if-eqz v1, :cond_17

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_10

    return-object v0

    :cond_10
    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    goto :goto_1

    :cond_17
    if-eqz v0, :cond_24

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_24

    return-object v0

    :cond_24
    const-string v0, "Could not unwrap "

    const-string v1, " from "

    invoke-static {v0, p1, v1, p0}, Lkp5;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static m(Lim7;)Landroid/view/View;
    .registers 2

    :goto_0
    if-eqz p0, :cond_18

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_9

    return-object p0

    :cond_9
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    goto :goto_0

    :cond_18
    const/4 p0, 0x0

    return-object p0
.end method

.method public static n(Landroid/view/View;)Landroid/graphics/Rect;
    .registers 6

    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lq9n;->t(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v1

    invoke-static {p0, v1}, Lg3o;->g(Landroid/view/View;Landroid/view/WindowInsets;)Lg3o;

    move-result-object p0

    iget-object p0, p0, Lg3o;->a:Ld3o;

    const/16 v1, 0x207

    invoke-virtual {p0, v1}, Ld3o;->i(I)Lr9b;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {p0, v2}, Ld3o;->i(I)Lr9b;

    move-result-object p0

    iget v2, v0, Landroid/graphics/Rect;->left:I

    iget v3, v1, Lr9b;->a:I

    iget v4, p0, Lr9b;->a:I

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    add-int/2addr v3, v2

    iput v3, v0, Landroid/graphics/Rect;->left:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    iget v3, v1, Lr9b;->b:I

    iget v4, p0, Lr9b;->b:I

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    add-int/2addr v3, v2

    iput v3, v0, Landroid/graphics/Rect;->top:I

    iget v2, v0, Landroid/graphics/Rect;->right:I

    iget v3, v1, Lr9b;->c:I

    iget v4, p0, Lr9b;->c:I

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, v0, Landroid/graphics/Rect;->right:I

    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    iget v1, v1, Lr9b;->d:I

    iget p0, p0, Lr9b;->d:I

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    sub-int/2addr v2, p0

    iput v2, v0, Landroid/graphics/Rect;->bottom:I

    return-object v0
.end method

.method public static o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;
    .registers 2

    :goto_0
    instance-of v0, p0, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_12

    instance-of v0, p0, Lcom/opera/android/BrowserActivity;

    if-eqz v0, :cond_b

    check-cast p0, Lcom/opera/android/BrowserActivity;

    return-object p0

    :cond_b
    check-cast p0, Landroid/content/ContextWrapper;

    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    goto :goto_0

    :cond_12
    const/4 p0, 0x0

    return-object p0
.end method

.method public static p(Landroid/content/Context;)Ldx3;
    .registers 2

    :try_start_0
    const-class v0, Ldx3;

    invoke-static {p0, v0}, Lq9n;->l(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Context;

    move-result-object p0

    check-cast p0, Ldx3;
    :try_end_8
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_8} :catch_9

    return-object p0

    :catch_9
    const/4 p0, 0x0

    return-object p0
.end method

.method public static q(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Point;
    .registers 6

    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    iget v2, v0, Landroid/graphics/Point;->x:I

    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v3

    add-int/2addr v3, v2

    iput v3, v0, Landroid/graphics/Point;->x:I

    iget v2, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result p0

    add-int/2addr p0, v2

    iput p0, v0, Landroid/graphics/Point;->y:I

    :goto_1d
    if-eq v1, p1, :cond_43

    iget p0, v0, Landroid/graphics/Point;->x:I

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v2

    invoke-virtual {v1}, Landroid/view/View;->getScrollX()I

    move-result v3

    sub-int/2addr v2, v3

    add-int/2addr v2, p0

    iput v2, v0, Landroid/graphics/Point;->x:I

    iget p0, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v2

    invoke-virtual {v1}, Landroid/view/View;->getScrollY()I

    move-result v3

    sub-int/2addr v2, v3

    add-int/2addr v2, p0

    iput v2, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Landroid/view/View;

    goto :goto_1d

    :cond_43
    return-object v0
.end method

.method public static r(Landroid/view/View;)Landroid/graphics/Rect;
    .registers 7

    const/4 v0, 0x2

    new-array v0, v0, [I

    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    new-instance v1, Landroid/graphics/Rect;

    const/4 v2, 0x0

    aget v2, v0, v2

    const/4 v3, 0x1

    aget v4, v0, v3

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v5

    add-int/2addr v5, v2

    aget v0, v0, v3

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    add-int/2addr p0, v0

    invoke-direct {v1, v2, v4, v5, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v1
.end method

.method public static s(Landroid/view/View;)Ldll;
    .registers 1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p0

    return-object p0
.end method

.method public static t(Landroid/view/View;)Landroid/graphics/Rect;
    .registers 7

    const/4 v0, 0x2

    new-array v0, v0, [I

    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationInWindow([I)V

    new-instance v1, Landroid/graphics/Rect;

    const/4 v2, 0x0

    aget v2, v0, v2

    const/4 v3, 0x1

    aget v4, v0, v3

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v5

    add-int/2addr v5, v2

    aget v0, v0, v3

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    add-int/2addr p0, v0

    invoke-direct {v1, v2, v4, v5, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v1
.end method

.method public static u(Landroid/view/View;)Z
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string v2, "input_method"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {p0, v0, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    move-result p0

    return p0

    :cond_18
    return v1
.end method

.method public static v(Landroid/view/Window;)Z
    .registers 1

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lq9n;->u(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static w(Landroid/view/ViewGroup;Landroid/view/View;)Z
    .registers 2

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    :goto_4
    if-eqz p1, :cond_f

    if-ne p1, p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    goto :goto_4

    :cond_f
    const/4 p0, 0x0

    return p0
.end method

.method public static x(Landroid/view/View;)Z
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_1b

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-static {p0}, Lq9n;->x(Landroid/view/View;)Z

    move-result p0

    return p0

    :cond_1b
    const/4 p0, 0x1

    return p0
.end method

.method public static y(ILandroid/view/View;)Landroid/view/View;
    .registers 2

    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public static z(Lcom/opera/android/BrowserActivity;)Landroid/view/View;
    .registers 2

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    const v0, 0x7f0a062d

    invoke-static {v0, p0}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method
