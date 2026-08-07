.class public Ll/pjn;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public final f:I

.field public g:Landroid/view/View;

.field public h:Landroidx/cardview/widget/CardView;

.field public i:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

.field public j:Landroid/view/View;

.field public k:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    sget v0, Ll/hgc0;->b:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    const/high16 v0, 0x41200000    # 10.0f

    .line 7
    .line 8
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/pjn;->f:I

    .line 13
    .line 14
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/xec0;->k2:I

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    sget v1, Ll/ldc0;->Y:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget v1, Ll/nbc0;->D1:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Ll/pjn;->k:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    sget p1, Ll/ldc0;->u1:I

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    sget v0, Ll/ldc0;->I0:I

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 61
    .line 62
    iput-object v0, p0, Ll/pjn;->i:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 63
    .line 64
    sget v0, Ll/ldc0;->F:I

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Ll/pjn;->j:Landroid/view/View;

    .line 71
    .line 72
    sget v0, Ll/ldc0;->L:I

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Landroidx/cardview/widget/CardView;

    .line 79
    .line 80
    iput-object v0, p0, Ll/pjn;->h:Landroidx/cardview/widget/CardView;

    .line 81
    .line 82
    sget v0, Ll/ldc0;->d0:I

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Ll/pjn;->g:Landroid/view/View;

    .line 89
    .line 90
    new-instance v0, Ll/ljn;

    .line 91
    .line 92
    invoke-direct {v0, p0}, Ll/ljn;-><init>(Ll/pjn;)V

    .line 93
    .line 94
    .line 95
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Ll/pjn;->j:Landroid/view/View;

    .line 99
    .line 100
    new-instance v0, Ll/mjn;

    .line 101
    .line 102
    invoke-direct {v0, p0}, Ll/mjn;-><init>(Ll/pjn;)V

    .line 103
    .line 104
    .line 105
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    new-instance p1, Ll/njn;

    .line 109
    .line 110
    invoke-direct {p1, p0}, Ll/njn;-><init>(Ll/pjn;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Ll/pjn;->i:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 117
    .line 118
    const/4 v0, 0x1

    .line 119
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->setOnCheckIsTextEditorFlag(Z)V

    .line 120
    .line 121
    .line 122
    new-instance p1, Ll/ojn;

    .line 123
    .line 124
    invoke-direct {p1, p0}, Ll/ojn;-><init>(Ll/pjn;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public static synthetic A(Ll/pjn;Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pjn;->F(Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method

.method public static synthetic C(Ll/pjn;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pjn;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic D(Ll/pjn;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pjn;->H(Landroid/view/View;)V

    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Ll/pjn;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pjn;->J(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic y(Ll/pjn;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pjn;->K(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic z(Ll/pjn;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pjn;->G(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public E(ZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pjn;->i:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->y(ZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/pjn;->i:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 7
    .line 8
    const/4 p3, 0x1

    .line 9
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->setOnCheckIsTextEditorFlag(Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {p2}, Ll/dep;->b(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    sget-object p1, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 19
    .line 20
    const-string p2, "octopus_game_loading"

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/pjn;->i:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->t()V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/pjn;->i:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 31
    .line 32
    new-instance p2, Ll/dep;

    .line 33
    .line 34
    invoke-direct {p2, p0}, Ll/dep;-><init>(Ll/pjn;)V

    .line 35
    .line 36
    .line 37
    const-string p0, "app"

    .line 38
    .line 39
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->m(Ll/wqo;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public final synthetic F(Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v0, Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p2, p1, v0}, Ll/pjn;->M(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic G(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    new-instance p2, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1, p2}, Ll/pjn;->M(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic J(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/pjn;->i:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->v()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/pjn;->i:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->p()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic K(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    check-cast p1, Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    sget v0, Lcom/google/android/material/R$id;->design_bottom_sheet:I

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Landroid/widget/FrameLayout;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v0, 0x3

    .line 16
    invoke-virtual {p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/pjn$a;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1}, Ll/pjn$a;-><init>(Ll/pjn;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->addBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final L(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->a()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/pej0;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/jjn;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/jjn;-><init>(Ll/pjn;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/kjn;

    .line 17
    .line 18
    invoke-direct {v2, p0, p1}, Ll/kjn;-><init>(Ll/pjn;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public M(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pjn;->i:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pjn;->k:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->l(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public N([IZIIZ)V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p1, v0

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    aget p1, p1, v2

    .line 6
    .line 7
    const/16 v3, 0x50

    .line 8
    .line 9
    if-ne p3, v3, :cond_0

    .line 10
    .line 11
    move v3, v2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v3, v0

    .line 14
    :goto_0
    iget-object v4, p0, Ll/pjn;->h:Landroidx/cardview/widget/CardView;

    .line 15
    .line 16
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 21
    .line 22
    iput v0, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 23
    .line 24
    iput v0, v4, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 25
    .line 26
    iput v0, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 27
    .line 28
    iput v0, v4, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 29
    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    const/4 p1, -0x1

    .line 33
    iput p1, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 34
    .line 35
    if-eqz p5, :cond_2

    .line 36
    .line 37
    invoke-static {}, Ll/bnl0;->F0()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    iput p1, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 45
    .line 46
    :cond_2
    :goto_1
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 47
    .line 48
    if-eqz v3, :cond_3

    .line 49
    .line 50
    iget p1, p0, Ll/pjn;->f:I

    .line 51
    .line 52
    neg-int p1, p1

    .line 53
    goto :goto_2

    .line 54
    :cond_3
    move p1, v0

    .line 55
    :goto_2
    iput p1, v4, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 56
    .line 57
    or-int/lit8 p1, p3, 0x1

    .line 58
    .line 59
    iput p1, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 60
    .line 61
    iget-object p1, p0, Ll/pjn;->h:Landroidx/cardview/widget/CardView;

    .line 62
    .line 63
    invoke-virtual {p1, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/pjn;->h:Landroidx/cardview/widget/CardView;

    .line 67
    .line 68
    if-eqz v3, :cond_4

    .line 69
    .line 70
    iget p2, p0, Ll/pjn;->f:I

    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_4
    move p2, v0

    .line 74
    :goto_3
    invoke-virtual {p1, v0, v0, v0, p2}, Landroidx/cardview/widget/CardView;->setContentPadding(IIII)V

    .line 75
    .line 76
    .line 77
    int-to-float p1, p4

    .line 78
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v9

    .line 82
    iget-object v4, p0, Ll/pjn;->h:Landroidx/cardview/widget/CardView;

    .line 83
    .line 84
    if-eqz v3, :cond_5

    .line 85
    .line 86
    const/4 v7, 0x0

    .line 87
    neg-int v8, v9

    .line 88
    const/4 v5, 0x0

    .line 89
    const/4 v6, 0x0

    .line 90
    invoke-static/range {v4 .. v9}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_5
    invoke-static {v4, v9}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public O(Ljava/lang/String;[IZILcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZIZ)V
    .locals 6

    .line 1
    const/4 v1, 0x1

    .line 2
    invoke-virtual {p0, v1, p1, p5}, Ll/pjn;->E(ZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 3
    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aget v2, p2, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    aget v1, p2, v1

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    move-object v0, p0

    .line 15
    move-object v1, p2

    .line 16
    move v2, p3

    .line 17
    move v3, p4

    .line 18
    move v4, p8

    .line 19
    move v5, p9

    .line 20
    invoke-virtual/range {v0 .. v5}, Ll/pjn;->N([IZIIZ)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v1, p0, Ll/pjn;->i:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 24
    .line 25
    invoke-virtual {v1, p5}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->setWebViewBg(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/pjn;->j:Landroid/view/View;

    .line 29
    .line 30
    invoke-static {v1, p6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ll/pjn;->g:Landroid/view/View;

    .line 34
    .line 35
    if-eqz p7, :cond_1

    .line 36
    .line 37
    sget v2, Ll/m9c0;->g:I

    .line 38
    .line 39
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 v2, 0x0

    .line 48
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 49
    .line 50
    .line 51
    :goto_0
    invoke-virtual/range {p0 .. p1}, Ll/pjn;->L(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public onBackPressed()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    const-string v0, "about:blank"

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const-string v2, ""

    .line 8
    .line 9
    invoke-virtual {p0, v2, v0, v1}, Ll/pjn;->M(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
