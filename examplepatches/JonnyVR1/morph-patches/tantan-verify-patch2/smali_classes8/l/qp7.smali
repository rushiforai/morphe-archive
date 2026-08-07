.class public Ll/qp7;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Z

.field public h:Landroid/view/animation/Interpolator;

.field public i:Landroid/animation/ValueAnimator;

.field public j:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

.field public l:Lv/VImage;

.field public m:Lv/VLinear;

.field public n:Z

.field public o:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public p:Z

.field public q:Z

.field public r:Lv/VLinear;

.field public s:Lv/VImage;

.field public t:Lv/VText;

.field public u:Ljava/lang/String;

.field public v:Ljava/lang/String;

.field public w:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public x:Ljava/lang/Runnable;

.field public y:Z

.field public z:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZILandroid/content/Context;IZLl/a30;)V
    .locals 1
    .param p4    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param
    .param p5    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZI",
            "Landroid/content/Context;",
            "IZ",
            "Ll/a30<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p5, p6}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    const/4 p6, 0x0

    .line 5
    iput-boolean p6, p0, Ll/qp7;->g:Z

    .line 6
    .line 7
    new-instance v0, Ll/xjg;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/xjg;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/qp7;->h:Landroid/view/animation/Interpolator;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/qp7;->i:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/qp7;->w:Ljava/util/List;

    .line 23
    .line 24
    new-instance v0, Ll/qp7$a;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/qp7$a;-><init>(Ll/qp7;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/qp7;->x:Ljava/lang/Runnable;

    .line 30
    .line 31
    iput-boolean p6, p0, Ll/qp7;->y:Z

    .line 32
    .line 33
    new-instance p6, Ll/qp7$b;

    .line 34
    .line 35
    invoke-direct {p6, p0}, Ll/qp7$b;-><init>(Ll/qp7;)V

    .line 36
    .line 37
    .line 38
    iput-object p6, p0, Ll/qp7;->z:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 39
    .line 40
    iput-object p1, p0, Ll/qp7;->v:Ljava/lang/String;

    .line 41
    .line 42
    iput-object p2, p0, Ll/qp7;->u:Ljava/lang/String;

    .line 43
    .line 44
    iput-boolean p3, p0, Ll/qp7;->q:Z

    .line 45
    .line 46
    iput-boolean p7, p0, Ll/qp7;->n:Z

    .line 47
    .line 48
    iput-object p8, p0, Ll/qp7;->o:Ll/a30;

    .line 49
    .line 50
    invoke-virtual {p0, p4, p5, p7}, Ll/qp7;->Q(ILandroid/content/Context;Z)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static synthetic A(Ll/qp7;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qp7;->T(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Ll/qp7;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qp7;->Z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic D(Ll/qp7;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qp7;->R()V

    return-void
.end method

.method public static synthetic E(Ll/qp7;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qp7;->c0()V

    return-void
.end method

.method public static synthetic F(Ll/qp7;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qp7;->V()V

    return-void
.end method

.method public static synthetic G(Ll/qp7;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qp7;->a0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic H(Ll/qp7;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qp7;->b0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/qp7;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qp7;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Ll/qp7;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qp7;->U(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic K(Ll/qp7;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qp7;->d0(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic L(Ll/qp7;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qp7;->X(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic M(Ll/qp7;)Lv/VLinear;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qp7;->m:Lv/VLinear;

    return-object p0
.end method

.method public static bridge synthetic N(Ll/qp7;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qp7;->j:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method private O()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/qp7;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/qp7;->i:Landroid/animation/ValueAnimator;

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
    iget-object v0, p0, Ll/qp7;->i:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/qp7;->g:Z

    .line 20
    .line 21
    invoke-direct {p0, v0}, Ll/qp7;->g0(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static P(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "input_method"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic S(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/qp7;->x:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/qp7;->f:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->alwaysHideInput()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/qp7;->s:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/qp7;->j0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private g0(I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Ll/qp7;->m:Lv/VLinear;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 11
    .line 12
    filled-new-array {p1, v0}, [I

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/qp7;->i:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    const-wide/16 v0, 0x96

    .line 23
    .line 24
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    filled-new-array {v0, p1}, [I

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Ll/qp7;->i:Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    const-wide/16 v0, 0x64

    .line 39
    .line 40
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    .line 43
    :goto_0
    iget-object p1, p0, Ll/qp7;->i:Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    iget-object v0, p0, Ll/qp7;->h:Landroid/view/animation/Interpolator;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/qp7;->i:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    new-instance v0, Ll/gp7;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/gp7;-><init>(Ll/qp7;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/qp7;->i:Landroid/animation/ValueAnimator;

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static synthetic x(Ll/qp7;Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qp7;->W(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic y(Ll/qp7;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qp7;->S(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic z(Ll/qp7;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qp7;->e0(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public final Q(ILandroid/content/Context;Z)V
    .locals 6
    .param p1    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    move-object p1, p2

    .line 2
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 3
    .line 4
    iput-object p1, p0, Ll/qp7;->f:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-static {p2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget p2, Ll/kec0;->u1:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    new-instance p2, Ll/hp7;

    .line 21
    .line 22
    invoke-direct {p2, p0}, Ll/hp7;-><init>(Ll/qp7;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 26
    .line 27
    .line 28
    sget p2, Ll/adc0;->Sd:I

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    check-cast p2, Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 35
    .line 36
    iput-object p2, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 37
    .line 38
    sget p2, Ll/adc0;->Zb:I

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    check-cast p2, Landroid/widget/TextView;

    .line 45
    .line 46
    iget-object v1, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 47
    .line 48
    sget v2, Lcom/p1/mobile/putong/core/R$string;->T1:I

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setHint(I)V

    .line 51
    .line 52
    .line 53
    sget v1, Ll/adc0;->u3:I

    .line 54
    .line 55
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Lv/VLinear;

    .line 60
    .line 61
    iput-object v1, p0, Ll/qp7;->m:Lv/VLinear;

    .line 62
    .line 63
    sget v1, Ll/adc0;->Re:I

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Lv/VLinear;

    .line 70
    .line 71
    iput-object v1, p0, Ll/qp7;->r:Lv/VLinear;

    .line 72
    .line 73
    sget v1, Ll/adc0;->Q4:I

    .line 74
    .line 75
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    check-cast v1, Lv/VImage;

    .line 80
    .line 81
    iput-object v1, p0, Ll/qp7;->s:Lv/VImage;

    .line 82
    .line 83
    sget v1, Ll/adc0;->S4:I

    .line 84
    .line 85
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Lv/VText;

    .line 90
    .line 91
    iput-object v1, p0, Ll/qp7;->t:Lv/VText;

    .line 92
    .line 93
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ua()Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    const/4 v2, 0x1

    .line 102
    if-eqz v1, :cond_0

    .line 103
    .line 104
    iget-object v1, p0, Ll/qp7;->s:Lv/VImage;

    .line 105
    .line 106
    invoke-virtual {p0}, Ll/qp7;->h0()Z

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    xor-int/2addr v3, v2

    .line 111
    invoke-virtual {v1, v3}, Landroid/view/View;->setSelected(Z)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Ll/qp7;->j0()V

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Ll/qp7;->s:Lv/VImage;

    .line 118
    .line 119
    new-instance v3, Ll/ip7;

    .line 120
    .line 121
    invoke-direct {v3, p0}, Ll/ip7;-><init>(Ll/qp7;)V

    .line 122
    .line 123
    .line 124
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 125
    .line 126
    .line 127
    :cond_0
    iget-object v1, p0, Ll/qp7;->f:Lcom/p1/mobile/android/app/Act;

    .line 128
    .line 129
    sget v3, Ll/kec0;->H7:I

    .line 130
    .line 131
    invoke-static {v1, v3, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    check-cast v0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;

    .line 136
    .line 137
    iget-object v1, p0, Ll/qp7;->f:Lcom/p1/mobile/android/app/Act;

    .line 138
    .line 139
    new-instance v3, Ll/jp7;

    .line 140
    .line 141
    invoke-direct {v3, p0}, Ll/jp7;-><init>(Ll/qp7;)V

    .line 142
    .line 143
    .line 144
    new-instance v4, Ll/kp7;

    .line 145
    .line 146
    invoke-direct {v4, p0}, Ll/kp7;-><init>(Ll/qp7;)V

    .line 147
    .line 148
    .line 149
    iget-object v5, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 150
    .line 151
    invoke-virtual {v0, v1, v3, v4, v5}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->s(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/x20;Lcom/p1/mobile/putong/newui/view/MessageInputEditView;)V

    .line 152
    .line 153
    .line 154
    iget-object v1, p0, Ll/qp7;->m:Lv/VLinear;

    .line 155
    .line 156
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 157
    .line 158
    .line 159
    sget v0, Ll/adc0;->t3:I

    .line 160
    .line 161
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    check-cast v0, Lv/VImage;

    .line 166
    .line 167
    iput-object v0, p0, Ll/qp7;->l:Lv/VImage;

    .line 168
    .line 169
    invoke-static {}, Ll/gra;->z()Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-eqz v0, :cond_1

    .line 174
    .line 175
    iget-object v0, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 176
    .line 177
    invoke-static {v0}, Ll/wpe;->a(Lv/VEditText;)V

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 181
    .line 182
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    sget v3, Ll/c9c0;->x:I

    .line 191
    .line 192
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 200
    .line 201
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    sget v3, Ll/c9c0;->z:I

    .line 210
    .line 211
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 216
    .line 217
    .line 218
    iget-object v0, p0, Ll/qp7;->t:Lv/VText;

    .line 219
    .line 220
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    sget v3, Ll/c9c0;->z:I

    .line 229
    .line 230
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 235
    .line 236
    .line 237
    iget-object v0, p0, Ll/qp7;->l:Lv/VImage;

    .line 238
    .line 239
    sget v1, Ll/dbc0;->K6:I

    .line 240
    .line 241
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 242
    .line 243
    .line 244
    sget v0, Ll/dbc0;->C5:I

    .line 245
    .line 246
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 247
    .line 248
    .line 249
    :cond_1
    if-eqz p3, :cond_2

    .line 250
    .line 251
    invoke-virtual {p0, v2}, Ll/qp7;->i0(Z)V

    .line 252
    .line 253
    .line 254
    iget-object p3, p0, Ll/qp7;->m:Lv/VLinear;

    .line 255
    .line 256
    invoke-static {p3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 257
    .line 258
    .line 259
    iget-object p3, p0, Ll/qp7;->m:Lv/VLinear;

    .line 260
    .line 261
    sget-object v0, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 262
    .line 263
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    check-cast v0, Ljava/lang/Integer;

    .line 268
    .line 269
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    sget-object v1, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 274
    .line 275
    invoke-virtual {v1}, Ll/vxd0;->defaultValue()Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    check-cast v1, Ljava/lang/Integer;

    .line 280
    .line 281
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 286
    .line 287
    .line 288
    move-result v0

    .line 289
    invoke-static {p3, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 290
    .line 291
    .line 292
    iget-boolean p3, p0, Ll/qp7;->q:Z

    .line 293
    .line 294
    if-eqz p3, :cond_2

    .line 295
    .line 296
    iget-object p3, p0, Ll/qp7;->v:Ljava/lang/String;

    .line 297
    .line 298
    const-string v0, "moments_user_id"

    .line 299
    .line 300
    iget-object v1, p0, Ll/qp7;->u:Ljava/lang/String;

    .line 301
    .line 302
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    filled-new-array {v0}, [Ll/pf60;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    const-string v1, "e_greet_together"

    .line 311
    .line 312
    invoke-static {v1, p3, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 313
    .line 314
    .line 315
    iget-object p3, p0, Ll/qp7;->r:Lv/VLinear;

    .line 316
    .line 317
    invoke-static {p3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 318
    .line 319
    .line 320
    :cond_2
    iget-object p3, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 321
    .line 322
    new-instance v0, Ll/yp8;

    .line 323
    .line 324
    const/16 v1, 0xb4

    .line 325
    .line 326
    invoke-direct {v0, v1}, Ll/yp8;-><init>(I)V

    .line 327
    .line 328
    .line 329
    new-array v1, v2, [Landroid/text/InputFilter;

    .line 330
    .line 331
    const/4 v3, 0x0

    .line 332
    aput-object v0, v1, v3

    .line 333
    .line 334
    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 335
    .line 336
    .line 337
    iget-object p3, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 338
    .line 339
    invoke-virtual {p3, v2}, Lv/VEditText;->i(Z)Lrx/c;

    .line 340
    .line 341
    .line 342
    move-result-object p3

    .line 343
    invoke-virtual {p0, p3}, Ll/pej0;->duringCreated(Lrx/c;)Lrx/c;

    .line 344
    .line 345
    .line 346
    move-result-object p3

    .line 347
    new-instance v0, Ll/lp7;

    .line 348
    .line 349
    invoke-direct {v0, p0, p2}, Ll/lp7;-><init>(Ll/qp7;Landroid/widget/TextView;)V

    .line 350
    .line 351
    .line 352
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    invoke-virtual {p3, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 357
    .line 358
    .line 359
    new-instance p3, Ll/mp7;

    .line 360
    .line 361
    invoke-direct {p3, p0}, Ll/mp7;-><init>(Ll/qp7;)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 365
    .line 366
    .line 367
    iget-object p2, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 368
    .line 369
    new-instance p3, Ll/np7;

    .line 370
    .line 371
    invoke-direct {p3, p0}, Ll/np7;-><init>(Ll/qp7;)V

    .line 372
    .line 373
    .line 374
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 375
    .line 376
    .line 377
    iget-object p2, p0, Ll/qp7;->l:Lv/VImage;

    .line 378
    .line 379
    new-instance p3, Ll/op7;

    .line 380
    .line 381
    invoke-direct {p3, p0}, Ll/op7;-><init>(Ll/qp7;)V

    .line 382
    .line 383
    .line 384
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 385
    .line 386
    .line 387
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 388
    .line 389
    .line 390
    move-result-object p2

    .line 391
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->u7()Lrx/subjects/b;

    .line 392
    .line 393
    .line 394
    move-result-object p2

    .line 395
    invoke-virtual {p0, p2}, Ll/pej0;->duringCreated(Lrx/c;)Lrx/c;

    .line 396
    .line 397
    .line 398
    move-result-object p2

    .line 399
    invoke-virtual {p2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 400
    .line 401
    .line 402
    move-result-object p2

    .line 403
    new-instance p3, Ll/pp7;

    .line 404
    .line 405
    invoke-direct {p3, p0}, Ll/pp7;-><init>(Ll/qp7;)V

    .line 406
    .line 407
    .line 408
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 409
    .line 410
    .line 411
    move-result-object p3

    .line 412
    invoke-virtual {p2, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 413
    .line 414
    .line 415
    sget p2, Ll/adc0;->ic:I

    .line 416
    .line 417
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 418
    .line 419
    .line 420
    move-result-object p1

    .line 421
    new-instance p2, Ll/dp7;

    .line 422
    .line 423
    invoke-direct {p2, p0}, Ll/dp7;-><init>(Ll/qp7;)V

    .line 424
    .line 425
    .line 426
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 427
    .line 428
    .line 429
    return-void
.end method

.method public final synthetic R()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic U(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    add-int/2addr v0, v1

    .line 20
    const/16 v1, 0xb4

    .line 21
    .line 22
    if-le v0, v1, :cond_0

    .line 23
    .line 24
    const-string p0, "\u6700\u591a\u53ef\u8f93\u5165180\u5b57"

    .line 25
    .line 26
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Ll/qp7;->w:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Ll/qp7;->w:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/widget/TextView;->getSelectionStart()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget-object p0, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {p0, v0, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic V()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/qp7;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/qp7;->s:Lv/VImage;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->isSelected()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->S6()Ll/byd0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Ll/pzi0;->o()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ua()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    iget-boolean v0, p0, Ll/qp7;->q:Z

    .line 43
    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    iget-object v0, p0, Ll/qp7;->v:Ljava/lang/String;

    .line 47
    .line 48
    const-string v1, "moments_user_id"

    .line 49
    .line 50
    iget-object v2, p0, Ll/qp7;->u:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object v2, p0, Ll/qp7;->s:Lv/VImage;

    .line 57
    .line 58
    invoke-virtual {v2}, Landroid/view/View;->isSelected()Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_1

    .line 63
    .line 64
    const-string v2, "1"

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    const-string v2, "0"

    .line 68
    .line 69
    :goto_0
    const-string v3, "selection_situation"

    .line 70
    .line 71
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    const-string v2, "e_greet_together"

    .line 80
    .line 81
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    iget-object v0, p0, Ll/qp7;->f:Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    iget-object v1, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 87
    .line 88
    invoke-static {v0, v1}, Ll/qp7;->P(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/qp7;->o:Ll/a30;

    .line 92
    .line 93
    iget-object v1, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 94
    .line 95
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iget-object v2, p0, Ll/qp7;->w:Ljava/util/List;

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-interface {v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ua()Z

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    if-eqz v3, :cond_3

    .line 114
    .line 115
    iget-boolean v3, p0, Ll/qp7;->q:Z

    .line 116
    .line 117
    if-eqz v3, :cond_3

    .line 118
    .line 119
    iget-object p0, p0, Ll/qp7;->s:Lv/VImage;

    .line 120
    .line 121
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    if-eqz p0, :cond_3

    .line 126
    .line 127
    const/4 p0, 0x1

    .line 128
    goto :goto_1

    .line 129
    :cond_3
    const/4 p0, 0x0

    .line 130
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-interface {v0, v1, v2, p0}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public final synthetic W(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    :goto_0
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic X(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-boolean p1, p0, Ll/qp7;->q:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/qp7;->s:Lv/VImage;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->S6()Ll/byd0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {}, Ll/pzi0;->o()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ua()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    iget-boolean p1, p0, Ll/qp7;->q:Z

    .line 43
    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    iget-object p1, p0, Ll/qp7;->v:Ljava/lang/String;

    .line 47
    .line 48
    const-string v0, "moments_user_id"

    .line 49
    .line 50
    iget-object v1, p0, Ll/qp7;->u:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v1, p0, Ll/qp7;->s:Lv/VImage;

    .line 57
    .line 58
    invoke-virtual {v1}, Landroid/view/View;->isSelected()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_1

    .line 63
    .line 64
    const-string v1, "1"

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    const-string v1, "0"

    .line 68
    .line 69
    :goto_0
    const-string v2, "selection_situation"

    .line 70
    .line 71
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-string v1, "e_greet_together"

    .line 80
    .line 81
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    iget-object p1, p0, Ll/qp7;->f:Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    iget-object v0, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 87
    .line 88
    invoke-static {p1, v0}, Ll/qp7;->P(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Ll/qp7;->o:Ll/a30;

    .line 92
    .line 93
    iget-object v0, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 94
    .line 95
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget-object v1, p0, Ll/qp7;->w:Ljava/util/List;

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-interface {v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ua()Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-eqz v2, :cond_3

    .line 114
    .line 115
    iget-boolean v2, p0, Ll/qp7;->q:Z

    .line 116
    .line 117
    if-eqz v2, :cond_3

    .line 118
    .line 119
    iget-object p0, p0, Ll/qp7;->s:Lv/VImage;

    .line 120
    .line 121
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    if-eqz p0, :cond_3

    .line 126
    .line 127
    const/4 p0, 0x1

    .line 128
    goto :goto_1

    .line 129
    :cond_3
    const/4 p0, 0x0

    .line 130
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-interface {p1, v0, v1, p0}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public final synthetic Y(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setCursorVisible(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic Z(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/qp7;->m:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ljava/lang/Integer;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    sget-object v1, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/vxd0;->defaultValue()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-direct {p0, p1}, Ll/qp7;->g0(I)V

    .line 41
    .line 42
    .line 43
    iget-boolean p1, p0, Ll/qp7;->q:Z

    .line 44
    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    iget-object p1, p0, Ll/qp7;->v:Ljava/lang/String;

    .line 48
    .line 49
    const-string v1, "moments_user_id"

    .line 50
    .line 51
    iget-object v2, p0, Ll/qp7;->u:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    filled-new-array {v1}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const-string v2, "e_greet_together"

    .line 62
    .line 63
    invoke-static {v2, p1, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/qp7;->r:Lv/VLinear;

    .line 67
    .line 68
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    :cond_0
    iget-object p1, p0, Ll/qp7;->x:Ljava/lang/Runnable;

    .line 72
    .line 73
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 77
    .line 78
    const/4 v1, 0x0

    .line 79
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setCursorVisible(Z)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v0}, Ll/qp7;->i0(Z)V

    .line 83
    .line 84
    .line 85
    iput-boolean v0, p0, Ll/qp7;->y:Z

    .line 86
    .line 87
    iget-object p1, p0, Ll/qp7;->m:Lv/VLinear;

    .line 88
    .line 89
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/qp7;->f:Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    iget-object p0, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 95
    .line 96
    invoke-static {p1, p0}, Ll/qp7;->P(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final synthetic a0(Ll/pf60;)V
    .locals 5

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-boolean v0, p0, Ll/qp7;->q:Z

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/qp7;->v:Ljava/lang/String;

    .line 18
    .line 19
    const-string v3, "moments_user_id"

    .line 20
    .line 21
    iget-object v4, p0, Ll/qp7;->u:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    filled-new-array {v3}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string v4, "e_greet_together"

    .line 32
    .line 33
    invoke-static {v4, v0, v3}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/qp7;->r:Lv/VLinear;

    .line 37
    .line 38
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    :cond_0
    iput-boolean v2, p0, Ll/qp7;->p:Z

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Ll/qp7;->i0(Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/qp7;->f:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    iget-object v1, p0, Ll/qp7;->x:Ljava/lang/Runnable;

    .line 49
    .line 50
    const-wide/16 v3, 0x190

    .line 51
    .line 52
    invoke-static {v0, v1, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/qp7;->m:Lv/VLinear;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 62
    .line 63
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v1, Ljava/lang/Integer;

    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-ne v0, v1, :cond_1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    iput-boolean v2, p0, Ll/qp7;->g:Z

    .line 75
    .line 76
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast p1, Ljava/lang/Integer;

    .line 79
    .line 80
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    invoke-direct {p0, p1}, Ll/qp7;->g0(I)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    iget-boolean p1, p0, Ll/qp7;->p:Z

    .line 89
    .line 90
    if-nez p1, :cond_3

    .line 91
    .line 92
    :goto_0
    return-void

    .line 93
    :cond_3
    iget-object p1, p0, Ll/qp7;->m:Lv/VLinear;

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 100
    .line 101
    if-nez p1, :cond_4

    .line 102
    .line 103
    invoke-virtual {p0, v1}, Ll/qp7;->i0(Z)V

    .line 104
    .line 105
    .line 106
    :cond_4
    iget-boolean p1, p0, Ll/qp7;->y:Z

    .line 107
    .line 108
    if-eqz p1, :cond_5

    .line 109
    .line 110
    iput-boolean v1, p0, Ll/qp7;->y:Z

    .line 111
    .line 112
    return-void

    .line 113
    :cond_5
    iget-object p1, p0, Ll/qp7;->r:Lv/VLinear;

    .line 114
    .line 115
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    if-nez p1, :cond_6

    .line 120
    .line 121
    iget-object p1, p0, Ll/qp7;->r:Lv/VLinear;

    .line 122
    .line 123
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    :cond_6
    iget-object p1, p0, Ll/qp7;->m:Lv/VLinear;

    .line 127
    .line 128
    const/4 v0, 0x4

    .line 129
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 130
    .line 131
    .line 132
    invoke-direct {p0}, Ll/qp7;->O()V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public final synthetic b0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/qp7;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v0, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/qp7;->P(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/qp7;->dismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic c0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/qp7;->f:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object p0, p0, Ll/qp7;->k:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 9
    .line 10
    const/4 v1, 0x2

    .line 11
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic d0(Landroid/content/DialogInterface;)V
    .locals 3

    .line 1
    iget-boolean p1, p0, Ll/qp7;->n:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/qp7;->f:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    new-instance v0, Ll/fp7;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/fp7;-><init>(Ll/qp7;)V

    .line 10
    .line 11
    .line 12
    const-wide/16 v1, 0x64

    .line 13
    .line 14
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public dismiss()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/qp7;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v1, Ll/ep7;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ep7;-><init>(Ll/qp7;)V

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

.method public final synthetic e0(Landroid/animation/ValueAnimator;)V
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
    iget-object p0, p0, Ll/qp7;->m:Lv/VLinear;

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public f0()V
    .locals 1

    .line 1
    new-instance v0, Ll/cp7;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cp7;-><init>(Ll/qp7;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public h0()Z
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->S6()Ll/byd0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/lang/Long;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long p0, v0, v2

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->S6()Ll/byd0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/lang/Long;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    invoke-static {}, Ll/pzi0;->o()J

    .line 44
    .line 45
    .line 46
    move-result-wide v2

    .line 47
    invoke-static {v0, v1, v2, v3}, Ll/pzi0;->C(JJ)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_0

    .line 52
    .line 53
    const/4 p0, 0x1

    .line 54
    return p0

    .line 55
    :cond_0
    const/4 p0, 0x0

    .line 56
    return p0
.end method

.method public final i0(Z)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Ll/qp7;->l:Lv/VImage;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget p1, Ll/dbc0;->I6:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget p1, Ll/dbc0;->K6:I

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    if-eqz p1, :cond_2

    .line 21
    .line 22
    sget p1, Ll/dbc0;->H6:I

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_2
    sget p1, Ll/dbc0;->J6:I

    .line 26
    .line 27
    :goto_1
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final j0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/qp7;->t:Lv/VText;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/qp7;->s:Lv/VImage;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->isSelected()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p0, p0, Ll/qp7;->f:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget v0, Ll/c9c0;->y:I

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget v0, Ll/c9c0;->z:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    :goto_0
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-object p0, p0, Ll/qp7;->s:Lv/VImage;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    const-string p0, "#cc000000"

    .line 53
    .line 54
    :goto_1
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    goto :goto_2

    .line 59
    :cond_2
    const-string p0, "#33000000"

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :goto_2
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 63
    .line 64
    .line 65
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
    iput-object v0, p0, Ll/qp7;->j:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/qp7;->j:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 37
    .line 38
    iget-object p0, p0, Ll/qp7;->z:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
