.class public Ll/jh5;
.super Lcom/google/android/material/bottomsheet/BottomSheetDialog;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/view/View;

.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VEditText;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/PopupWindow;

.field public h:Z

.field public i:Landroid/view/animation/Interpolator;

.field public j:Landroid/animation/Animator;

.field public k:I

.field public l:I

.field public m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Ll/jh5;->h:Z

    .line 6
    .line 7
    new-instance p2, Ll/xjg;

    .line 8
    .line 9
    invoke-direct {p2}, Ll/xjg;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Ll/jh5;->i:Landroid/view/animation/Interpolator;

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    iput-object p2, p0, Ll/jh5;->j:Landroid/animation/Animator;

    .line 16
    .line 17
    new-instance p2, Ll/jh5$a;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Ll/jh5$a;-><init>(Ll/jh5;)V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Ll/jh5;->n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/jh5;->K(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic A(Ll/jh5;Ll/x20;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/jh5;->S(Ll/x20;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method

.method public static synthetic C(Ll/jh5;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jh5;->V(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic D(Ll/jh5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jh5;->M()V

    return-void
.end method

.method public static bridge synthetic E(Ll/jh5;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jh5;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method private H(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 2
    .line 3
    const-string v1, "p_user_passive_show_nearby"

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Ll/a4j;->Q(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/hh5;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/hh5;-><init>(Ll/jh5;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/ih5;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/ih5;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private J()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/jh5;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/jh5;->j:Landroid/animation/Animator;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/jh5;->j:Landroid/animation/Animator;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/jh5;->h:Z

    .line 20
    .line 21
    invoke-direct {p0, v0}, Ll/jh5;->c0(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private synthetic M()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jh5;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c0(I)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/jh5;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    iget-object v6, p0, Ll/jh5;->i:Landroid/view/animation/Interpolator;

    .line 4
    .line 5
    neg-int p1, p1

    .line 6
    int-to-float p1, p1

    .line 7
    const/4 v1, 0x1

    .line 8
    new-array v7, v1, [F

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    aput p1, v7, v1

    .line 12
    .line 13
    const-string v1, "translationY"

    .line 14
    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    const-wide/16 v4, 0xfa

    .line 18
    .line 19
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Ll/jh5;->j:Landroid/animation/Animator;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic q(Ll/jh5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jh5;->U()V

    return-void
.end method

.method public static synthetic r(Ll/jh5;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jh5;->N(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic s(Ll/jh5;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/jh5;->X(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t(Ll/jh5;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/jh5;->R(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic u(Ll/jh5;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/jh5;->T(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic v(Ll/jh5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jh5;->Q()V

    return-void
.end method

.method public static synthetic w(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic x(Ll/jh5;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jh5;->O(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic y(Ll/jh5;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/jh5;->W(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ll/x20;)V

    return-void
.end method

.method public static synthetic z(Ll/jh5;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jh5;->P(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final F(Landroid/graphics/Paint;Ljava/lang/String;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/jh5;->c:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->a3:I

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, " "

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-static {}, Ll/bnl0;->y0()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    int-to-float v2, v2

    .line 35
    invoke-virtual {p0}, Ll/jh5;->G()F

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    sub-float/2addr v2, v3

    .line 40
    sub-float/2addr v2, v1

    .line 41
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    cmpg-float v1, v1, v2

    .line 46
    .line 47
    if-gez v1, :cond_0

    .line 48
    .line 49
    iget-object p0, p0, Ll/jh5;->e:Lv/VEditText;

    .line 50
    .line 51
    new-instance p1, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    add-int/lit8 v1, v1, -0x2

    .line 75
    .line 76
    :goto_0
    const/4 v3, 0x1

    .line 77
    if-le v1, v3, :cond_2

    .line 78
    .line 79
    const/4 v3, 0x0

    .line 80
    invoke-virtual {p2, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    const-string v4, "..."

    .line 85
    .line 86
    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    cmpg-float v4, v4, v2

    .line 95
    .line 96
    if-gez v4, :cond_1

    .line 97
    .line 98
    iget-object p0, p0, Ll/jh5;->e:Lv/VEditText;

    .line 99
    .line 100
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    return-void
.end method

.method public G()F
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jh5;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/jh5;->f:Landroid/widget/TextView;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    int-to-float p0, p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/high16 v0, 0x42000000    # 32.0f

    .line 18
    .line 19
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    int-to-float v0, v0

    .line 24
    iget-object v1, p0, Ll/jh5;->f:Landroid/widget/TextView;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object p0, p0, Ll/jh5;->c:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->t3:I

    .line 33
    .line 34
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v1, p0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    add-float/2addr p0, v0

    .line 43
    :goto_0
    const/high16 v0, 0x41c00000    # 24.0f

    .line 44
    .line 45
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    int-to-float v0, v0

    .line 50
    add-float/2addr v0, p0

    .line 51
    return v0
.end method

.method public final I()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/jh5;->a:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    iget v1, p0, Ll/jh5;->k:I

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 16
    .line 17
    iput v1, p0, Ll/jh5;->k:I

    .line 18
    .line 19
    :cond_0
    iget v1, p0, Ll/jh5;->l:I

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 24
    .line 25
    iput v1, p0, Ll/jh5;->l:I

    .line 26
    .line 27
    :cond_1
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 28
    .line 29
    iget v2, p0, Ll/jh5;->l:I

    .line 30
    .line 31
    if-le v1, v2, :cond_2

    .line 32
    .line 33
    iget v2, p0, Ll/jh5;->k:I

    .line 34
    .line 35
    if-eq v1, v2, :cond_2

    .line 36
    .line 37
    invoke-direct {p0}, Ll/jh5;->J()V

    .line 38
    .line 39
    .line 40
    iget v1, p0, Ll/jh5;->k:I

    .line 41
    .line 42
    iput v1, p0, Ll/jh5;->l:I

    .line 43
    .line 44
    :cond_2
    iget v1, p0, Ll/jh5;->l:I

    .line 45
    .line 46
    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 47
    .line 48
    sub-int/2addr v1, v2

    .line 49
    if-lez v1, :cond_4

    .line 50
    .line 51
    iget-boolean v2, p0, Ll/jh5;->h:Z

    .line 52
    .line 53
    if-eqz v2, :cond_3

    .line 54
    .line 55
    iget-object v2, p0, Ll/jh5;->j:Landroid/animation/Animator;

    .line 56
    .line 57
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_3

    .line 62
    .line 63
    iget-object v2, p0, Ll/jh5;->j:Landroid/animation/Animator;

    .line 64
    .line 65
    invoke-virtual {v2}, Landroid/animation/Animator;->cancel()V

    .line 66
    .line 67
    .line 68
    :cond_3
    const/4 v2, 0x1

    .line 69
    iput-boolean v2, p0, Ll/jh5;->h:Z

    .line 70
    .line 71
    invoke-direct {p0, v1}, Ll/jh5;->c0(I)V

    .line 72
    .line 73
    .line 74
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 75
    .line 76
    iput v0, p0, Ll/jh5;->l:I

    .line 77
    .line 78
    return-void

    .line 79
    :cond_4
    if-gez v1, :cond_5

    .line 80
    .line 81
    invoke-direct {p0}, Ll/jh5;->J()V

    .line 82
    .line 83
    .line 84
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 85
    .line 86
    iput v0, p0, Ll/jh5;->l:I

    .line 87
    .line 88
    :cond_5
    return-void
.end method

.method public final K(Landroid/content/Context;)V
    .locals 3

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 3
    .line 4
    iput-object v0, p0, Ll/jh5;->c:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget v0, Ll/tec0;->l:I

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    sget v0, Ll/hdc0;->H1:I

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget v1, Ll/hdc0;->v0:I

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Landroid/widget/LinearLayout;

    .line 33
    .line 34
    iput-object v1, p0, Ll/jh5;->d:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    sget v1, Ll/hdc0;->Q1:I

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lv/VEditText;

    .line 43
    .line 44
    iput-object v1, p0, Ll/jh5;->e:Lv/VEditText;

    .line 45
    .line 46
    sget v1, Ll/hdc0;->E1:I

    .line 47
    .line 48
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Landroid/widget/TextView;

    .line 53
    .line 54
    iput-object p1, p0, Ll/jh5;->f:Landroid/widget/TextView;

    .line 55
    .line 56
    iget-object p1, p0, Ll/jh5;->e:Lv/VEditText;

    .line 57
    .line 58
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->D:I

    .line 59
    .line 60
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setHint(I)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/jh5;->c:Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    iget-object v1, p0, Ll/jh5;->e:Lv/VEditText;

    .line 66
    .line 67
    const/4 v2, 0x1

    .line 68
    invoke-virtual {v1, v2}, Lv/VEditText;->i(Z)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    new-instance v1, Ll/bh5;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/bh5;-><init>(Ll/jh5;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    new-instance p1, Ll/ch5;

    .line 89
    .line 90
    invoke-direct {p1, p0}, Ll/ch5;-><init>(Ll/jh5;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ll/jh5;->L()V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final L()V
    .locals 4

    .line 1
    new-instance v0, Landroid/widget/PopupWindow;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jh5;->c:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/jh5;->g:Landroid/widget/PopupWindow;

    .line 9
    .line 10
    iget-object v0, p0, Ll/jh5;->c:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    const-string v1, "layout_inflater"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroid/view/LayoutInflater;

    .line 19
    .line 20
    sget v1, Ll/jec0;->u:I

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/jh5;->a:Landroid/view/View;

    .line 29
    .line 30
    iget-object v1, p0, Ll/jh5;->g:Landroid/widget/PopupWindow;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/jh5;->g:Landroid/widget/PopupWindow;

    .line 36
    .line 37
    const/16 v1, 0x15

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setSoftInputMode(I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/jh5;->g:Landroid/widget/PopupWindow;

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/jh5;->c:Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    const v1, 0x1020002

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Ll/jh5;->b:Landroid/view/View;

    .line 58
    .line 59
    iget-object v0, p0, Ll/jh5;->g:Landroid/widget/PopupWindow;

    .line 60
    .line 61
    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/jh5;->g:Landroid/widget/PopupWindow;

    .line 65
    .line 66
    const/4 v1, -0x1

    .line 67
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/jh5;->a:Landroid/view/View;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/eh5;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/eh5;-><init>(Ll/jh5;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final synthetic N(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/jh5;->c:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/k3h;->J0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic O(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/jh5;->e:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/jh5;->f:Landroid/widget/TextView;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p1, 0x0

    .line 28
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic Q()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jh5;->a:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jh5;->I()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic R(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;Ljava/lang/String;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/jh5;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v1, v2, p2}, Ll/jka;->N6(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/yg5;

    .line 16
    .line 17
    move-object v2, p0

    .line 18
    move-object v4, p1

    .line 19
    move-object v5, p2

    .line 20
    move-object v3, p3

    .line 21
    move-object v6, p4

    .line 22
    invoke-direct/range {v1 .. v6}, Ll/yg5;-><init>(Ll/jh5;Ll/x20;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/zg5;

    .line 26
    .line 27
    invoke-direct {p0, v2, v4, v5, v6}, Ll/zg5;-><init>(Ll/jh5;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic S(Ll/x20;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 6

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->J3:I

    .line 11
    .line 12
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 13
    .line 14
    .line 15
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    const/4 v5, 0x0

    .line 23
    move-object v0, p0

    .line 24
    move-object v4, p2

    .line 25
    move-object v1, p3

    .line 26
    move-object v3, p4

    .line 27
    invoke-virtual/range {v0 .. v5}, Ll/jh5;->Z(Lcom/p1/mobile/putong/feed/data/MomentMessage;ZLjava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    move-object v1, p0

    .line 9
    move-object v5, p1

    .line 10
    move-object v2, p2

    .line 11
    move-object v4, p3

    .line 12
    move-object v6, p4

    .line 13
    invoke-virtual/range {v1 .. v6}, Ll/jh5;->Z(Lcom/p1/mobile/putong/feed/data/MomentMessage;ZLjava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move-object v6, p4

    .line 18
    :goto_0
    sget-object p0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 19
    .line 20
    invoke-virtual {p0, v6}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v6}, Ll/i4h;->e(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic U()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jh5;->e:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/jh5;->c:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object p0, p0, Ll/jh5;->e:Lv/VEditText;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic V(Landroid/content/DialogInterface;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/jh5;->g:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/jh5;->b:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/jh5;->g:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/jh5;->g:Landroid/widget/PopupWindow;

    .line 29
    .line 30
    iget-object v0, p0, Ll/jh5;->b:Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {p1, v0, v1, v1, v1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object p1, p0, Ll/jh5;->c:Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    new-instance v0, Ll/gh5;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/gh5;-><init>(Ll/jh5;)V

    .line 40
    .line 41
    .line 42
    const-wide/16 v1, 0x64

    .line 43
    .line 44
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic W(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/jh5;->Y(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic X(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    move-object p7, p4

    .line 2
    move-object p4, p3

    .line 3
    new-instance p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 4
    .line 5
    invoke-direct {p3}, Lcom/p1/mobile/putong/feed/data/MomentMessage;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/jh5;->e:Lv/VEditText;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 33
    .line 34
    iput-object p2, p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 37
    .line 38
    .line 39
    invoke-static {p4}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    iput-object p2, p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->momentShowFromType:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/CommentInfo;->new_()Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    iput-object p7, p2, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 50
    .line 51
    iput-object p5, p2, Lcom/p1/mobile/putong/feed/data/CommentInfo;->replyMessageId:Ljava/lang/String;

    .line 52
    .line 53
    iput-object p2, p3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 54
    .line 55
    iget-object p2, p0, Ll/jh5;->e:Lv/VEditText;

    .line 56
    .line 57
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    sget-object p5, Ll/uqb0;->Z:Ll/a4j;

    .line 70
    .line 71
    invoke-virtual {p5, p2}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result p5

    .line 75
    if-eqz p5, :cond_0

    .line 76
    .line 77
    iget-object p7, p0, Ll/jh5;->c:Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    move-object p2, p1

    .line 80
    move-object p1, p0

    .line 81
    new-instance p0, Ll/fh5;

    .line 82
    .line 83
    move-object p5, p6

    .line 84
    invoke-direct/range {p0 .. p5}, Ll/fh5;-><init>(Ll/jh5;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ll/x20;)V

    .line 85
    .line 86
    .line 87
    const/4 p2, 0x0

    .line 88
    invoke-static {p7, p0, p2}, Ll/k3h;->A0(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_0
    move-object p5, p1

    .line 93
    move-object p1, p0

    .line 94
    move-object p0, p5

    .line 95
    move-object p5, p6

    .line 96
    invoke-virtual {p1, p0, p3, p4, p5}, Ll/jh5;->Y(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ll/x20;)V

    .line 97
    .line 98
    .line 99
    invoke-direct {p1, p2}, Ll/jh5;->H(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :goto_0
    invoke-virtual {p1}, Ll/jh5;->dismiss()V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final Y(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ll/x20;)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/jh5;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "comment"

    .line 6
    .line 7
    invoke-static {v2}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-static {p3, v3}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    new-instance v5, Ll/xg5;

    .line 17
    .line 18
    move-object v6, p0

    .line 19
    move-object v7, p1

    .line 20
    move-object v8, p2

    .line 21
    move-object v10, p3

    .line 22
    move-object v9, p4

    .line 23
    invoke-direct/range {v5 .. v10}, Ll/xg5;-><init>(Ll/jh5;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v3, "comment"

    .line 27
    .line 28
    invoke-static/range {v0 .. v5}, Ll/ksg;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final Z(Lcom/p1/mobile/putong/feed/data/MomentMessage;ZLjava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Throwable;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-static {p3, p1}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string p3, "moment_id"

    .line 11
    .line 12
    iget-object v0, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p3, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string p3, "owner_id"

    .line 19
    .line 20
    iget-object p4, p4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p3, p4}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    invoke-interface {p3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    const-string p4, "comment_user_id"

    .line 35
    .line 36
    invoke-static {p4, p3}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    if-eqz p2, :cond_0

    .line 41
    .line 42
    const-string p2, "success"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const-string p2, "fail"

    .line 46
    .line 47
    :goto_0
    const-string p3, "comment_state"

    .line 48
    .line 49
    invoke-static {p3, p2}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    if-eqz p0, :cond_1

    .line 54
    .line 55
    const-string p0, "reply"

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    const-string p0, "comment"

    .line 59
    .line 60
    :goto_1
    const-string p2, "comment_detail"

    .line 61
    .line 62
    invoke-static {p2, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    if-nez p5, :cond_2

    .line 67
    .line 68
    const/4 p0, 0x0

    .line 69
    :goto_2
    move-object v6, p0

    .line 70
    goto :goto_3

    .line 71
    :cond_2
    const-string p0, "error"

    .line 72
    .line 73
    invoke-virtual {p5}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-static {p0, p2}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    goto :goto_2

    .line 82
    :goto_3
    filled-new-array/range {v1 .. v6}, [Ll/tfj0$a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    const-string p2, "e_comment_send"

    .line 87
    .line 88
    invoke-static {p2, p1, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/wg5;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wg5;-><init>(Ll/jh5;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b0(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/jh5;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    new-instance v1, Ll/ah5;

    .line 4
    .line 5
    move-object v2, p0

    .line 6
    move-object v3, p1

    .line 7
    move-object v5, p2

    .line 8
    move-object v6, p3

    .line 9
    move-object v4, p4

    .line 10
    move-object v7, p5

    .line 11
    move-object v8, p6

    .line 12
    invoke-direct/range {v1 .. v8}, Ll/ah5;-><init>(Ll/jh5;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public d0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jh5;->e:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0, p1}, Ll/jh5;->F(Landroid/graphics/Paint;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public dismiss()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jh5;->e:Lv/VEditText;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/jh5;->c:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    iget-object v1, p0, Ll/jh5;->e:Lv/VEditText;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/jh5;->c:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    new-instance v1, Ll/dh5;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/dh5;-><init>(Ll/jh5;)V

    .line 20
    .line 21
    .line 22
    const-wide/16 v2, 0xc8

    .line 23
    .line 24
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public show()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/vcc0;->E:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, -0x1

    .line 17
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/jh5;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/jh5;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 37
    .line 38
    iget-object p0, p0, Ll/jh5;->n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
