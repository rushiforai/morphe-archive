.class public Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/RelativeLayout;",
        "Ll/iam<",
        "Ll/bep0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Lv/VText;

.field public c:Ll/bep0;

.field public final d:Landroid/widget/PopupWindow;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/widget/PopupWindow;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/widget/PopupWindow;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->d:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Landroid/widget/PopupWindow;

    invoke-direct {p1}, Landroid/widget/PopupWindow;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->d:Landroid/widget/PopupWindow;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Landroid/widget/PopupWindow;

    invoke-direct {p1}, Landroid/widget/PopupWindow;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->d:Landroid/widget/PopupWindow;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->m(Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->l()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->k(Landroid/view/View;)V

    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->c:Ll/bep0;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->c:Ll/bep0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/bep0;->W3()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private s()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->c:Ll/bep0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bep0;->Z3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hep0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(Ll/bep0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->c:Ll/bep0;

    .line 2
    .line 3
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->d:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->d:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/bep0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->f(Ll/bep0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final synthetic l()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Ll/bnl0;->w0()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1, v0, v1}, Landroid/view/View;->measure(II)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/high16 v2, 0x42180000    # 38.0f

    .line 25
    .line 26
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    sub-int/2addr v1, v2

    .line 31
    div-int/lit8 v1, v1, 0x2

    .line 32
    .line 33
    sub-int/2addr v0, v1

    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->d:Landroid/widget/PopupWindow;

    .line 35
    .line 36
    neg-int p1, p1

    .line 37
    neg-int v0, v0

    .line 38
    invoke-virtual {p0, p2, p1, v0}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public n()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->a:Landroid/widget/TextView;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->b:Lv/VText;

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    const-string v0, "0"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget v0, Ll/yec0;->ga:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    move-object v0, p1

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;

    .line 18
    .line 19
    sget p1, Ll/obc0;->Q9:I

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 22
    .line 23
    .line 24
    sget p1, Ll/qa00;->i:I

    .line 25
    .line 26
    sget v1, Ll/qa00;->g:I

    .line 27
    .line 28
    sget v2, Ll/qa00;->l:I

    .line 29
    .line 30
    invoke-virtual {v0, p1, v1, v2, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->c:Ll/bep0;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->c:Ll/bep0;

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->c:Ll/bep0;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    new-instance v5, Ll/eep0;

    .line 64
    .line 65
    invoke-direct {v5, p0}, Ll/eep0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;)V

    .line 66
    .line 67
    .line 68
    move-object v1, p2

    .line 69
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->d:Landroid/widget/PopupWindow;

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->a:Landroid/widget/TextView;

    .line 78
    .line 79
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->c:Ll/bep0;

    .line 80
    .line 81
    invoke-virtual {p2}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    new-instance v1, Ll/fep0;

    .line 86
    .line 87
    invoke-direct {v1, p0, v0, p1}, Ll/fep0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;Landroid/view/View;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p2, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->c:Ll/bep0;

    .line 94
    .line 95
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    new-instance p2, Ll/gep0;

    .line 100
    .line 101
    invoke-direct {p2, p0}, Ll/gep0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;)V

    .line 102
    .line 103
    .line 104
    const-wide/16 v0, 0x1388

    .line 105
    .line 106
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public r()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    new-instance v1, Ll/cep0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/cep0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->b:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/dep0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/dep0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->d:Landroid/widget/PopupWindow;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->d:Landroid/widget/PopupWindow;

    .line 28
    .line 29
    const/4 v1, -0x2

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->d:Landroid/widget/PopupWindow;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->d:Landroid/widget/PopupWindow;

    .line 39
    .line 40
    sget v0, Ll/jgc0;->m:I

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public setData(Ll/ado0;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ll/ado0;->J()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Ll/p6s;->J1()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    int-to-long v2, v2

    .line 14
    cmp-long v2, v0, v2

    .line 15
    .line 16
    if-lez v2, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2}, Ll/p6s;->I1()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    sput v2, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->t:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/16 v2, 0x3e8

    .line 30
    .line 31
    sput v2, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->t:I

    .line 32
    .line 33
    :goto_0
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Ll/p6s;->K1()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    int-to-long v2, v2

    .line 42
    cmp-long v2, v0, v2

    .line 43
    .line 44
    if-lez v2, :cond_1

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->setEnableMask(Z)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->setEnableAnimMask(Z)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    long-to-double v0, v0

    .line 55
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v2}, Ll/p6s;->K1()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    int-to-double v2, v2

    .line 64
    const-wide/high16 v4, 0x3fe8000000000000L    # 0.75

    .line 65
    .line 66
    mul-double/2addr v2, v4

    .line 67
    cmpg-double v0, v0, v2

    .line 68
    .line 69
    if-gez v0, :cond_2

    .line 70
    .line 71
    const/4 v0, 0x1

    .line 72
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->setEnableMask(Z)V

    .line 73
    .line 74
    .line 75
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->setEnableAnimMask(Z)V

    .line 76
    .line 77
    .line 78
    :cond_2
    :goto_1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->vi:I

    .line 79
    .line 80
    invoke-virtual {p1}, Ll/ado0;->J()J

    .line 81
    .line 82
    .line 83
    move-result-wide v1

    .line 84
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {v0, v1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {}, Ll/yau;->k()Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_3

    .line 97
    .line 98
    invoke-virtual {p1}, Ll/ado0;->J()J

    .line 99
    .line 100
    .line 101
    move-result-wide v0

    .line 102
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->a:Landroid/widget/TextView;

    .line 107
    .line 108
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public u(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->a:Landroid/widget/TextView;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public v(D)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
