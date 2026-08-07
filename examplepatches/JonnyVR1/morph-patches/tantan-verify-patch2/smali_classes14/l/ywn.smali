.class public Ll/ywn;
.super Ll/txs;
.source "SourceFile"


# instance fields
.field public f:Ll/rkn;

.field public g:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;Lv/VFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/txs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/ywn;->g:Landroid/view/ViewGroup;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic Q2(Ll/ywn;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ywn;->S2()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private synthetic S2()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/evs;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/evs;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/lang/String;

    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method public R2(Landroid/view/ViewGroup;Ll/egj0;)V
    .locals 3

    .line 1
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v0, -0x2

    .line 4
    invoke-direct {p2, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    sget v0, Ll/qa00;->h:I

    .line 8
    .line 9
    const/high16 v1, 0x41100000    # 9.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p2, v2, v2, v0, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 17
    .line 18
    .line 19
    const v0, 0x800055

    .line 20
    .line 21
    .line 22
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget v1, Ll/xec0;->J:I

    .line 33
    .line 34
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;

    .line 39
    .line 40
    invoke-virtual {v0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    new-instance p1, Ll/rkn;

    .line 47
    .line 48
    iget-object p2, p0, Ll/cyr;->lifecycleProviderImpl:Ll/ner;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/mus;->H2()Ll/nus;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const/4 v2, 0x1

    .line 55
    invoke-direct {p1, p2, v1, v2}, Ll/rkn;-><init>(Ll/ner;Ll/nus;Z)V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, Ll/ywn;->f:Ll/rkn;

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/ywn;->f:Ll/rkn;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/rkn;->I2()V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/ywn;->f:Ll/rkn;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/rkn;->U2()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ywn;->g:Landroid/view/ViewGroup;

    .line 5
    .line 6
    new-instance v1, Ll/xwn;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/xwn;-><init>(Ll/ywn;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ywn;->R2(Landroid/view/ViewGroup;Ll/egj0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
