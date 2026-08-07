.class public Ll/i2j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/a2j;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

.field public c:Lv/VLinear;

.field public d:Lv/VEditText;

.field public e:Lv/VCheckBox;

.field public f:Lv/VText;

.field public g:Landroid/view/View;

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:Ll/a2j;

.field public j:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/material/bottomsheet/BottomSheetBehavior<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public k:Z

.field public l:Landroid/view/animation/Interpolator;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xjg;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/xjg;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/i2j;->l:Landroid/view/animation/Interpolator;

    .line 10
    .line 11
    iput-object p1, p0, Ll/i2j;->h:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/i2j;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i2j;->l(Ljava/lang/Boolean;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic b(Ll/i2j;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i2j;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/i2j;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i2j;->q(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic d(Ll/i2j;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i2j;->s(I)V

    return-void
.end method

.method public static synthetic e(Ll/i2j;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i2j;->v(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic f(Ll/i2j;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i2j;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/i2j;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/i2j;->u()V

    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/i2j;->k:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/i2j;->h:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->alwaysHideInput()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/i2j;->m()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic x(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/i2j;->d:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    :goto_0
    const-string p1, ""

    .line 26
    .line 27
    :goto_1
    iget-object v0, p0, Ll/i2j;->i:Ll/a2j;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ll/a2j;->y0(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/pf60;

    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    xor-int/lit8 p1, p1, 0x1

    .line 47
    .line 48
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-string v1, "carry_text"

    .line 53
    .line 54
    invoke-direct {v0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    filled-new-array {v0}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object p0, p0, Ll/i2j;->h:Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string v0, "e_forwarding_send"

    .line 68
    .line 69
    invoke-static {v0, p0, p1}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/i2j;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/i2j;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/a2j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i2j;->k(Ll/a2j;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i2j;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/i2j;->r()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/i2j;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    new-instance v0, Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/i2j;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Ll/b2j;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/b2j;-><init>(Ll/i2j;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2, p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/z20;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/j2j;->b(Ll/i2j;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Ll/a2j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i2j;->i:Ll/a2j;

    .line 2
    .line 3
    return-void
.end method

.method public final l(Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/i2j;->k:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    move p1, v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    :goto_0
    iget-boolean v1, p0, Ll/i2j;->k:Z

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    :cond_1
    iget-boolean p2, p0, Ll/i2j;->k:Z

    .line 25
    .line 26
    if-eqz p2, :cond_2

    .line 27
    .line 28
    const-wide/16 v1, 0x12c

    .line 29
    .line 30
    :goto_1
    move-wide v7, v1

    .line 31
    goto :goto_2

    .line 32
    :cond_2
    const-wide/16 v1, 0xc8

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :goto_2
    filled-new-array {p1, v0}, [I

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    iget-object v4, p0, Ll/i2j;->l:Landroid/view/animation/Interpolator;

    .line 44
    .line 45
    const-wide/16 v5, 0x0

    .line 46
    .line 47
    invoke-static/range {v3 .. v8}, Ll/gt0;->k(Landroid/animation/Animator;Landroid/view/animation/Interpolator;JJ)Landroid/animation/Animator;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    move-object p2, p1

    .line 52
    check-cast p2, Landroid/animation/ValueAnimator;

    .line 53
    .line 54
    new-instance v1, Ll/f2j;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/f2j;-><init>(Ll/i2j;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 60
    .line 61
    .line 62
    new-instance p2, Ll/g2j;

    .line 63
    .line 64
    invoke-direct {p2, p0, v0}, Ll/g2j;-><init>(Ll/i2j;I)V

    .line 65
    .line 66
    .line 67
    invoke-static {p1, p2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i2j;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->alwaysHideInput()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/i2j;->h:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public n()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/i2j;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v1, Ll/h2j;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/h2j;-><init>(Ll/i2j;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v2, 0xc8

    .line 9
    .line 10
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i2j;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->alwaysHideInput()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic q(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Ll/i2j;->g:Landroid/view/View;

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i2j;->e:Lv/VCheckBox;

    .line 2
    .line 3
    iget-object v1, p0, Ll/i2j;->i:Ll/a2j;

    .line 4
    .line 5
    iget-boolean v1, v1, Ll/a2j;->d:Z

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/i2j;->e:Lv/VCheckBox;

    .line 11
    .line 12
    new-instance v1, Ll/c2j;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/c2j;-><init>(Ll/i2j;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/i2j;->c:Lv/VLinear;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/i2j;->j:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 27
    .line 28
    new-instance v1, Ll/i2j$a;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/i2j$a;-><init>(Ll/i2j;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->addBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/i2j;->b:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 37
    .line 38
    new-instance v1, Ll/d2j;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/d2j;-><init>(Ll/i2j;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/i2j;->f:Lv/VText;

    .line 47
    .line 48
    new-instance v1, Ll/e2j;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/e2j;-><init>(Ll/i2j;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic s(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i2j;->g:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic u()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/i2j;->y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic v(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/i2j;->i:Ll/a2j;

    .line 2
    .line 3
    iput-boolean p2, p1, Ll/a2j;->d:Z

    .line 4
    .line 5
    new-instance p1, Ll/pf60;

    .line 6
    .line 7
    const-string v0, "selection_situation"

    .line 8
    .line 9
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-direct {p1, v0, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    filled-new-array {p1}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p0, p0, Ll/i2j;->h:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p2, "e_comment_together"

    .line 27
    .line 28
    invoke-static {p2, p0, p1}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i2j;->d:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/i2j;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Ll/i2j;->d:Lv/VEditText;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method
