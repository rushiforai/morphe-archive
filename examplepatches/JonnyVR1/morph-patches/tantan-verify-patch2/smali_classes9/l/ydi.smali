.class public Ll/ydi;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Landroid/widget/PopupWindow;

.field public static b:Z

.field public static c:J

.field public static d:Lcom/p1/mobile/putong/data/User;

.field public static e:Landroid/view/GestureDetector;

.field public static final f:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/tdi;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/tdi;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ydi;->f:Ljava/lang/Runnable;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_quickchat_successpopup_reject"

    .line 5
    .line 6
    const-string v1, "p_quickchat_successpopup"

    .line 7
    .line 8
    invoke-static {v0, v1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Ll/ydi;->f:Ljava/lang/Runnable;

    .line 12
    .line 13
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, ""

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, p1, v0}, Ll/ydi;->n(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic c(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/ydi;->e:Landroid/view/GestureDetector;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static synthetic d()V
    .locals 2

    .line 1
    sget-object v0, Ll/ydi;->a:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 7
    .line 8
    .line 9
    sput-object v1, Ll/ydi;->a:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    sput-boolean v0, Ll/ydi;->b:Z

    .line 13
    .line 14
    sput-object v1, Ll/ydi;->e:Landroid/view/GestureDetector;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic e()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/ydi;->l(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic f(Landroid/view/View;Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    sget v1, Ll/adc0;->d0:I

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 10
    .line 11
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    sget v0, Ll/adc0;->O:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const/4 v0, 0x0

    .line 51
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->x(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static bridge synthetic g()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/ydi;->b:Z

    return v0
.end method

.method public static bridge synthetic h()Ljava/lang/Runnable;
    .locals 1

    .line 1
    sget-object v0, Ll/ydi;->f:Ljava/lang/Runnable;

    return-object v0
.end method

.method public static bridge synthetic i(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Ll/ydi;->b:Z

    return-void
.end method

.method public static bridge synthetic j()V
    .locals 0

    .line 1
    invoke-static {}, Ll/ydi;->m()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ydi;->n(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    return-void
.end method

.method public static l(Z)V
    .locals 4

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    sget-wide v2, Ll/ydi;->c:J

    .line 8
    .line 9
    sub-long/2addr v0, v2

    .line 10
    const-wide/16 v2, 0xed8

    .line 11
    .line 12
    cmp-long p0, v0, v2

    .line 13
    .line 14
    if-gez p0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object p0, Ll/ydi;->f:Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static m()V
    .locals 5

    .line 1
    sget-object v0, Ll/ydi;->f:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/ydi;->a:Landroid/widget/PopupWindow;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/high16 v1, 0x437a0000    # 250.0f

    .line 13
    .line 14
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    neg-int v1, v1

    .line 19
    int-to-float v1, v1

    .line 20
    const/4 v2, 0x2

    .line 21
    new-array v2, v2, [F

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    const/4 v4, 0x0

    .line 25
    aput v3, v2, v4

    .line 26
    .line 27
    const/4 v3, 0x1

    .line 28
    aput v1, v2, v3

    .line 29
    .line 30
    const-string v1, "translationY"

    .line 31
    .line 32
    invoke-static {v0, v1, v2}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-wide/16 v1, 0xc8

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    .line 42
    .line 43
    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 47
    .line 48
    .line 49
    new-instance v1, Ll/ydi$c;

    .line 50
    .line 51
    invoke-direct {v1, v0}, Ll/ydi$c;-><init>(Landroid/animation/Animator;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static n(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 10

    .line 1
    sget-object v0, Ll/ydi;->d:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v7, 0x0

    .line 6
    const/4 v8, 0x7

    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x0

    .line 9
    const/4 v5, 0x0

    .line 10
    const/4 v6, 0x0

    .line 11
    move-object v1, p0

    .line 12
    move-object v9, p1

    .line 13
    invoke-static/range {v1 .. v9}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->q2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    const-string p0, "is_emoji"

    .line 21
    .line 22
    invoke-static {p0, p2}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "e_quickchat_successpopup_trynow"

    .line 31
    .line 32
    const-string p2, "p_quickchat_successpopup"

    .line 33
    .line 34
    invoke-static {p1, p2, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 35
    .line 36
    .line 37
    sget-object p0, Ll/ydi;->f:Ljava/lang/Runnable;

    .line 38
    .line 39
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static o(Lcom/p1/mobile/android/app/Act;)Landroid/view/GestureDetector;
    .locals 2

    .line 1
    new-instance v0, Landroid/view/GestureDetector;

    .line 2
    .line 3
    new-instance v1, Ll/ydi$b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ydi$b;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, p0, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 6

    .line 1
    sget v0, Ll/adc0;->Be:I

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/TextView;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    sget v0, Ll/adc0;->Be:I

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/TextView;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const-string v3, "\u4ed6"

    .line 27
    .line 28
    const-string v4, "\u5979"

    .line 29
    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    move-object v2, v4

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move-object v2, v3

    .line 35
    :goto_0
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const-string v5, "\u53bb\u548c%s\u804a\u5929"

    .line 40
    .line 41
    invoke-static {v5, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    sget v0, Ll/adc0;->d1:I

    .line 49
    .line 50
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v2, Ll/udi;

    .line 55
    .line 56
    invoke-direct {v2, p0}, Ll/udi;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    new-instance v0, Ll/vdi;

    .line 63
    .line 64
    invoke-direct {v0, p2, p1}, Ll/vdi;-><init>(Landroid/view/View;Lcom/p1/mobile/putong/data/User;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 68
    .line 69
    .line 70
    sget v0, Ll/adc0;->K8:I

    .line 71
    .line 72
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Landroid/widget/TextView;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 79
    .line 80
    .line 81
    sget v0, Ll/adc0;->K8:I

    .line 82
    .line 83
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Landroid/widget/TextView;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_1

    .line 94
    .line 95
    move-object v3, v4

    .line 96
    :cond_1
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    const-string v1, "\u914d\u5bf9\u6210\u529f\uff0c%s\u5728\u7b49\u4f60\u804a\u5929"

    .line 101
    .line 102
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    sget p1, Ll/adc0;->A1:I

    .line 110
    .line 111
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    new-instance p2, Ll/wdi;

    .line 116
    .line 117
    invoke-direct {p2}, Ll/wdi;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    new-instance p1, Ll/xdi;

    .line 124
    .line 125
    invoke-direct {p1}, Ll/xdi;-><init>()V

    .line 126
    .line 127
    .line 128
    const-wide/16 v0, 0xfa0

    .line 129
    .line 130
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public static q(Landroid/view/View;)V
    .locals 7

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0xc8

    .line 7
    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 9
    .line 10
    .line 11
    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 12
    .line 13
    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    new-array v2, v1, [F

    .line 21
    .line 22
    fill-array-data v2, :array_0

    .line 23
    .line 24
    .line 25
    const-string v3, "alpha"

    .line 26
    .line 27
    invoke-static {p0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    neg-int v3, v3

    .line 36
    int-to-float v3, v3

    .line 37
    new-array v4, v1, [F

    .line 38
    .line 39
    const/4 v5, 0x0

    .line 40
    aput v3, v4, v5

    .line 41
    .line 42
    const/4 v3, 0x1

    .line 43
    const/4 v6, 0x0

    .line 44
    aput v6, v4, v3

    .line 45
    .line 46
    const-string v6, "translationY"

    .line 47
    .line 48
    invoke-static {p0, v6, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-array v1, v1, [Landroid/animation/Animator;

    .line 53
    .line 54
    aput-object v2, v1, v5

    .line 55
    .line 56
    aput-object p0, v1, v3

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 11

    .line 1
    sput-object p1, Ll/ydi;->d:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    sget-object v0, Ll/ydi;->e:Landroid/view/GestureDetector;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/ydi;->o(Lcom/p1/mobile/android/app/Act;)Landroid/view/GestureDetector;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/ydi;->e:Landroid/view/GestureDetector;

    .line 12
    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    invoke-static {v0}, Ll/pci;->y(Z)V

    .line 15
    .line 16
    .line 17
    sget-object v1, Ll/ydi;->a:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 23
    .line 24
    .line 25
    move-result-wide v3

    .line 26
    sput-wide v3, Ll/ydi;->c:J

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    sget v3, Ll/kec0;->u8:I

    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    invoke-virtual {v1, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-static {}, Ll/dox;->e()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-static {}, Ll/dox;->e()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    invoke-virtual {v1, v3, v4}, Landroid/view/View;->measure(II)V

    .line 48
    .line 49
    .line 50
    invoke-static {p0, p1, v1}, Ll/ydi;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    sget v3, Ll/adc0;->d1:I

    .line 54
    .line 55
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Landroidx/cardview/widget/CardView;

    .line 60
    .line 61
    const/high16 v3, 0x43f00000    # 480.0f

    .line 62
    .line 63
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    new-instance v4, Landroid/widget/PopupWindow;

    .line 68
    .line 69
    invoke-static {}, Ll/bnl0;->y0()I

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    invoke-direct {v4, v1, v5, v3, v2}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 74
    .line 75
    .line 76
    sput-object v4, Ll/ydi;->a:Landroid/widget/PopupWindow;

    .line 77
    .line 78
    invoke-virtual {v4}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    sget v3, Ll/adc0;->Vd:I

    .line 83
    .line 84
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Landroid/widget/LinearLayout;

    .line 89
    .line 90
    invoke-virtual {v1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 91
    .line 92
    .line 93
    new-instance v3, Ll/rdi;

    .line 94
    .line 95
    invoke-direct {v3}, Ll/rdi;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 99
    .line 100
    .line 101
    sget-object v1, Ll/ydi;->a:Landroid/widget/PopupWindow;

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setClippingEnabled(Z)V

    .line 104
    .line 105
    .line 106
    :cond_1
    sget-object v1, Ll/ydi;->a:Landroid/widget/PopupWindow;

    .line 107
    .line 108
    invoke-virtual {v1}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-static {v1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 113
    .line 114
    .line 115
    new-instance v0, Ll/l4g0;

    .line 116
    .line 117
    new-instance v1, Ll/ydi$a;

    .line 118
    .line 119
    invoke-direct {v1}, Ll/ydi$a;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-direct {v0, v1}, Ll/l4g0;-><init>(Ll/e6m;)V

    .line 123
    .line 124
    .line 125
    const-string v1, "otheruserID"

    .line 126
    .line 127
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 128
    .line 129
    invoke-static {v1, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->K()J

    .line 134
    .line 135
    .line 136
    move-result-wide v4

    .line 137
    const-wide/16 v6, 0x3e8

    .line 138
    .line 139
    div-long/2addr v4, v6

    .line 140
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    const-string v1, "time"

    .line 145
    .line 146
    invoke-static {v1, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    const-string p1, "tooltips_trigger_module"

    .line 151
    .line 152
    const-string v1, "null"

    .line 153
    .line 154
    invoke-static {p1, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    const-string p1, "tooltips_trigger_mode"

    .line 159
    .line 160
    const-string v1, "passive"

    .line 161
    .line 162
    invoke-static {p1, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 163
    .line 164
    .line 165
    move-result-object v6

    .line 166
    const-string p1, "tooltips_type_ui"

    .line 167
    .line 168
    const-string v1, "alert_self_definition_basic"

    .line 169
    .line 170
    invoke-static {p1, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 171
    .line 172
    .line 173
    move-result-object v7

    .line 174
    const-string p1, "tooltips_type"

    .line 175
    .line 176
    const-string v1, "alert"

    .line 177
    .line 178
    invoke-static {p1, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 179
    .line 180
    .line 181
    move-result-object v8

    .line 182
    const-string p1, "tooltips_trigger_page"

    .line 183
    .line 184
    const-string v1, "anywhere"

    .line 185
    .line 186
    invoke-static {p1, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 187
    .line 188
    .line 189
    move-result-object v9

    .line 190
    const-string p1, "tooltips_trigger_reason"

    .line 191
    .line 192
    const-string v1, "tips"

    .line 193
    .line 194
    invoke-static {p1, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 195
    .line 196
    .line 197
    move-result-object v10

    .line 198
    filled-new-array/range {v3 .. v10}, [Ll/sfj0$a;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-static {p1}, Ll/sfj0;->b([Ll/sfj0$a;)Lorg/json/JSONObject;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-virtual {v0, p1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 207
    .line 208
    .line 209
    sget-object p1, Ll/ydi;->a:Landroid/widget/PopupWindow;

    .line 210
    .line 211
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    const/16 v1, 0x31

    .line 220
    .line 221
    invoke-virtual {p1, p0, v1, v2, v2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 222
    .line 223
    .line 224
    sget-object p0, Ll/ydi;->a:Landroid/widget/PopupWindow;

    .line 225
    .line 226
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    invoke-static {p0}, Ll/ydi;->q(Landroid/view/View;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 234
    .line 235
    .line 236
    sget-object p0, Ll/ydi;->a:Landroid/widget/PopupWindow;

    .line 237
    .line 238
    new-instance p1, Ll/sdi;

    .line 239
    .line 240
    invoke-direct {p1, v0}, Ll/sdi;-><init>(Ll/l4g0;)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 244
    .line 245
    .line 246
    return-void
.end method
