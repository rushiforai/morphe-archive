.class public Lcom/p1/mobile/putong/ui/webview/mk/a;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public final f:I

.field public g:Landroid/view/View;

.field public h:Landroidx/cardview/widget/CardView;

.field public i:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

.field public j:Landroid/view/View;

.field public k:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    sget v0, Ll/zfc0;->g:I

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
    iput v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->f:I

    .line 13
    .line 14
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/jec0;->r:I

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
    move-result-object v1

    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    sget v2, Ll/ycc0;->y:I

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    sget v2, Ll/cbc0;->G0:I

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->k:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    sget p1, Ll/ycc0;->r:I

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->i:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 57
    .line 58
    sget p1, Ll/ycc0;->q:I

    .line 59
    .line 60
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->j:Landroid/view/View;

    .line 65
    .line 66
    sget p1, Ll/ycc0;->s:I

    .line 67
    .line 68
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Landroidx/cardview/widget/CardView;

    .line 73
    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->h:Landroidx/cardview/widget/CardView;

    .line 75
    .line 76
    sget p1, Ll/ycc0;->B:I

    .line 77
    .line 78
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->g:Landroid/view/View;

    .line 83
    .line 84
    new-instance v0, Ll/ml5;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ll/ml5;-><init>(Lcom/p1/mobile/putong/ui/webview/mk/a;)V

    .line 87
    .line 88
    .line 89
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->j:Landroid/view/View;

    .line 93
    .line 94
    new-instance v0, Ll/nl5;

    .line 95
    .line 96
    invoke-direct {v0, p0}, Ll/nl5;-><init>(Lcom/p1/mobile/putong/ui/webview/mk/a;)V

    .line 97
    .line 98
    .line 99
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    new-instance p1, Ll/ol5;

    .line 103
    .line 104
    invoke-direct {p1, p0}, Ll/ol5;-><init>(Lcom/p1/mobile/putong/ui/webview/mk/a;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 108
    .line 109
    .line 110
    new-instance p1, Ll/pl5;

    .line 111
    .line 112
    invoke-direct {p1, p0}, Ll/pl5;-><init>(Lcom/p1/mobile/putong/ui/webview/mk/a;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/ui/webview/mk/a;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/a;->J(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/ui/webview/mk/a;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/webview/mk/a;->G(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/ui/webview/mk/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/a;->I(Landroid/view/View;)V

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

.method private synthetic J(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->i:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->p()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->i:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->k()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic K(Landroid/content/DialogInterface;)V
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
    new-instance v0, Lcom/p1/mobile/putong/ui/webview/mk/a$a;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/a$a;-><init>(Lcom/p1/mobile/putong/ui/webview/mk/a;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->addBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private L(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->accessOutterToken()Lrx/c;

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
    new-instance v1, Ll/ql5;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/ql5;-><init>(Lcom/p1/mobile/putong/ui/webview/mk/a;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/rl5;

    .line 17
    .line 18
    invoke-direct {v2, p0, p1}, Ll/rl5;-><init>(Lcom/p1/mobile/putong/ui/webview/mk/a;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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

.method public static synthetic x(Lcom/p1/mobile/putong/ui/webview/mk/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/a;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/ui/webview/mk/a;Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/webview/mk/a;->F(Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/ui/webview/mk/a;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/a;->K(Landroid/content/DialogInterface;)V

    return-void
.end method


# virtual methods
.method public E(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->i:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->o(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->i:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 7
    .line 8
    sget p2, Ll/ycc0;->I0:I

    .line 9
    .line 10
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->s(ILjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
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
    invoke-virtual {p0, p2, p1, v0}, Lcom/p1/mobile/putong/ui/webview/mk/a;->M(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

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
    invoke-virtual {p0, v0, p1, p2}, Lcom/p1/mobile/putong/ui/webview/mk/a;->M(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 9
    .line 10
    .line 11
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
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->i:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->k:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->j(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final N(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->b:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->d:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/ui/webview/mk/a;->E(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 6
    .line 7
    .line 8
    iget v1, p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->f:I

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget v1, p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->g:I

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/a;->O(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget v1, p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->e:I

    .line 20
    .line 21
    const/16 v2, 0x50

    .line 22
    .line 23
    if-eq v1, v2, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    sget v2, Ll/zfc0;->a:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->i:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->d:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->setWebViewBg(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->j:Landroid/view/View;

    .line 42
    .line 43
    iget-boolean v2, p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->c:Z

    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-boolean v1, p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->i:Z

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->g:Landroid/view/View;

    .line 51
    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    const-string v1, "#4c000000"

    .line 55
    .line 56
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    const/4 v1, 0x0

    .line 65
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 66
    .line 67
    .line 68
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/a;->P(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;)V

    .line 69
    .line 70
    .line 71
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/ui/webview/mk/a;->L(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;)V
    .locals 9

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->f:I

    .line 2
    .line 3
    iget v1, p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->g:I

    .line 4
    .line 5
    iget v2, p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->e:I

    .line 6
    .line 7
    const/16 v3, 0x50

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    const/4 v5, 0x0

    .line 11
    if-ne v2, v3, :cond_0

    .line 12
    .line 13
    move v2, v4

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v2, v5

    .line 16
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->h:Landroidx/cardview/widget/CardView;

    .line 17
    .line 18
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 23
    .line 24
    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 25
    .line 26
    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 27
    .line 28
    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 29
    .line 30
    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 31
    .line 32
    iget-boolean v6, p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->j:Z

    .line 33
    .line 34
    if-eqz v6, :cond_1

    .line 35
    .line 36
    const/4 v1, -0x1

    .line 37
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 38
    .line 39
    iget-boolean v1, p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->a:Z

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-static {}, Ll/bnl0;->F0()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 51
    .line 52
    :cond_2
    :goto_1
    iput v0, v3, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 53
    .line 54
    if-eqz v2, :cond_3

    .line 55
    .line 56
    iget v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->f:I

    .line 57
    .line 58
    neg-int v0, v0

    .line 59
    goto :goto_2

    .line 60
    :cond_3
    move v0, v5

    .line 61
    :goto_2
    iput v0, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 62
    .line 63
    iget v0, p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->e:I

    .line 64
    .line 65
    or-int/2addr v0, v4

    .line 66
    iput v0, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->h:Landroidx/cardview/widget/CardView;

    .line 69
    .line 70
    invoke-virtual {v0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->h:Landroidx/cardview/widget/CardView;

    .line 74
    .line 75
    if-eqz v2, :cond_4

    .line 76
    .line 77
    iget v1, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->f:I

    .line 78
    .line 79
    goto :goto_3

    .line 80
    :cond_4
    move v1, v5

    .line 81
    :goto_3
    invoke-virtual {v0, v5, v5, v5, v1}, Landroidx/cardview/widget/CardView;->setContentPadding(IIII)V

    .line 82
    .line 83
    .line 84
    iget p1, p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->h:I

    .line 85
    .line 86
    int-to-float p1, p1

    .line 87
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 88
    .line 89
    .line 90
    move-result v8

    .line 91
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->h:Landroidx/cardview/widget/CardView;

    .line 92
    .line 93
    if-eqz v2, :cond_5

    .line 94
    .line 95
    const/4 v6, 0x0

    .line 96
    neg-int v7, v8

    .line 97
    const/4 v4, 0x0

    .line 98
    const/4 v5, 0x0

    .line 99
    invoke-static/range {v3 .. v8}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_5
    invoke-static {v3, v8}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final P(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/a;->i:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 2
    .line 3
    const-string v1, "tantan_dialog"

    .line 4
    .line 5
    invoke-virtual {v0, p0, v1, p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->r(Lcom/p1/mobile/putong/ui/webview/mk/a;Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Q(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/webview/mk/a;->N(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;)V

    .line 7
    .line 8
    .line 9
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
    invoke-virtual {p0, v2, v0, v1}, Lcom/p1/mobile/putong/ui/webview/mk/a;->M(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
