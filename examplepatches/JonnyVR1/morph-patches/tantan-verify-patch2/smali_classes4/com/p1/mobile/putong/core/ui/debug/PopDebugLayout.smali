.class public Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/Button;

.field public b:Landroid/widget/Button;

.field public c:Landroid/widget/Button;

.field public d:Landroid/widget/Button;

.field public e:Landroid/widget/Button;

.field public f:Landroid/widget/Button;

.field public g:Landroid/widget/Button;

.field public h:Landroid/widget/Button;

.field public i:Landroid/widget/Button;

.field public j:Landroid/widget/Button;

.field public k:Landroid/widget/Button;

.field public l:Landroid/widget/Button;

.field public m:Landroid/widget/Button;

.field public n:Landroid/widget/Button;

.field public o:Landroid/widget/Button;

.field public p:Landroid/widget/Button;

.field public q:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->D(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Tag;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Tag;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/data/Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessageCustom;->new_()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, p0, v1}, Ll/f49;->W3(Lcom/p1/mobile/putong/data/PushMessageCustom;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->B(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->H()V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->M()V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->E()V

    return-void
.end method

.method public static synthetic t(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Tag;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Tag;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/data/Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->J(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->q:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget v0, Ll/pec0;->z1:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget v0, Ll/ddc0;->O:I

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroid/widget/TextView;

    .line 25
    .line 26
    const-string v1, "\u6211\u662f\u9ad8\u6743\u9650"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    sget v0, Ll/ddc0;->G:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lv/VIcon;

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    sget v1, Ll/gbc0;->j5:I

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    sget v1, Ll/gbc0;->i5:I

    .line 49
    .line 50
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 54
    .line 55
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    const/4 p0, 0x1

    .line 59
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "BUBBLE_SUPERLIKE_PUSH_ID"

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->u(Ljava/lang/String;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->v(Ljava/lang/String;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const/4 p1, 0x3

    .line 74
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->A(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    sget-object p1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->SUPER_LIKE_SEND:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->z(Ll/c3m;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final synthetic B(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->q:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget v0, Ll/pec0;->z1:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget v0, Ll/ddc0;->O:I

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroid/widget/TextView;

    .line 25
    .line 26
    const-string v1, "\u6211\u662f\u7cfb\u7edf\u6743\u9650"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    sget v0, Ll/ddc0;->G:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lv/VIcon;

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    sget v1, Ll/gbc0;->j5:I

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    sget v1, Ll/gbc0;->i5:I

    .line 49
    .line 50
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 54
    .line 55
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    const/4 p0, 0x1

    .line 59
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "BUBBLE_SUPERLIKE_PUSH_ID"

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->u(Ljava/lang/String;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->v(Ljava/lang/String;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const/4 p1, 0x5

    .line 74
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->A(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    sget-object p1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->PERMISSION_REQUEST_TEST:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->z(Ll/c3m;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final synthetic C(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessage;->new_()Lcom/p1/mobile/putong/data/PushMessage;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessageCustom;->new_()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 10
    .line 11
    const-string v1, "5908440"

    .line 12
    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "\u4e3b\u64ad\u6635\u79f0\u663e\u793a"

    .line 16
    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "\u597d\u4e45\u4e0d\u89c1\uff0c\u4e3a\u4f60\u51c6\u5907\u4e86\u4e00\u4efd\u793c\u5305"

    .line 20
    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "popExperimentStyle3"

    .line 24
    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 26
    .line 27
    const-string v1, "\u53bb\u9886\u53d6"

    .line 28
    .line 29
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 30
    .line 31
    const-string v1, "popExperimentStyleA"

    .line 32
    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    .line 34
    .line 35
    const-string v1, "\u4f60\u7684\u597d\u53cb"

    .line 36
    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    .line 38
    .line 39
    const-string v1, "super_like"

    .line 40
    .line 41
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    .line 42
    .line 43
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjVCVjZMSlFXQjY1VlJHVlJVWUw1V1pHVkVJUktLSDE0IiwidyI6NzAsImgiOjcwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NjU2OTU0MDU3ODAyMzEyMjczOX0.png"

    .line 44
    .line 45
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    .line 46
    .line 47
    const-string v2, "card,message,moment,me"

    .line 48
    .line 49
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    .line 50
    .line 51
    const-string v2, "live.ongoingLive.pinkCard"

    .line 52
    .line 53
    iput-object v2, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 54
    .line 55
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IldIN0lYNDNXNDNEVzNETzZLU1RQVjdGNDNaVzRIRzEyIiwidyI6MTEyNSwiaCI6OTU0LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzYyODM1NjQ2OTc0NTQ0MDcyfQ.png"

    .line 56
    .line 57
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->q:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->v2()Ll/b240;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0, p1}, Ll/b240;->A8(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final synthetic D(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->R(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic E()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->Q(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic F(Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance v0, Ll/bk80;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bk80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x5dc

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->R(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic H()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->Q(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic I(Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance v0, Ll/ak80;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ak80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x5dc

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic J(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->q:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic K(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ll/gm70;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->q:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 18
    .line 19
    invoke-direct {p1, p0, v0, v1}, Ll/gm70;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 20
    .line 21
    .line 22
    sget-object p0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->PICKS_GUIDE:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Ll/fqe0;->x(Ll/c3m;)Ll/fqe0;

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, p1}, Ll/llb0;->i(Ll/fqe0;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->S()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic M()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->S()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic N(Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance v0, Ll/ek80;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ek80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0xfa0

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic O(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;

    .line 2
    .line 3
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/u;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->a:Ll/vxd0;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->b:Ll/byd0;

    .line 17
    .line 18
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/baj;->o()V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->q:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const/4 v0, 0x0

    .line 45
    const-string v1, "swipe_card"

    .line 46
    .line 47
    invoke-static {p1, p0, v0, v1}, Ll/baj;->a0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic P(Landroid/view/View;)V
    .locals 5

    .line 1
    new-instance p1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->q:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "FAKE_SWIPE_COUNT_TIPS"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/high16 v0, 0x40000000    # 2.0f

    .line 22
    .line 23
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->B(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v2, "\u5269\u4f59\u5212\u5361\u6b21\u657010\u6b21"

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v2, "#fe7e1d"

    .line 38
    .line 39
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    filled-new-array {v2}, [I

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const/high16 v2, 0x40e00000    # 7.0f

    .line 52
    .line 53
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const/16 v3, 0x4b

    .line 62
    .line 63
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const/high16 v3, 0x41500000    # 13.0f

    .line 68
    .line 69
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const/high16 v3, 0x40a00000    # 5.0f

    .line 74
    .line 75
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 84
    .line 85
    const/high16 v4, 0x41200000    # 10.0f

    .line 86
    .line 87
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    invoke-virtual {v0, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->v(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const/4 v2, 0x1

    .line 104
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    new-instance v2, Ll/ck80;

    .line 109
    .line 110
    invoke-direct {v2}, Ll/ck80;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->d(Lcom/p1/mobile/android/ui/bubble/a$b;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const-wide/16 v2, 0x1f40

    .line 118
    .line 119
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->R:I

    .line 124
    .line 125
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 126
    .line 127
    or-int/2addr v2, v3

    .line 128
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 129
    .line 130
    .line 131
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->q:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 142
    .line 143
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->b6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {v0, p1, p0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public final Q(Z)V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "\u91cd\u751f\u7684\u5c0f\u80d6\u5b50"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->name:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "349281368"

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6Ikk2MlRQNldBSVFaM1ZRRFRPU01FSFdIS043Nk5RUTA0IiwidyI6MTk2MCwiaCI6MTk1OSwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjYxNzE0NDg5Nzk1MzUzMzg2ODAsImFiIjowfQ.jpg?format=128x128"

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->avatarUrl:Ljava/lang/String;

    .line 36
    .line 37
    const-string v1, ""

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->action:Ljava/lang/String;

    .line 40
    .line 41
    const-string v1, "female"

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->gender:Ljava/lang/String;

    .line 44
    .line 45
    const-string v1, "10"

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->age:Ljava/lang/String;

    .line 48
    .line 49
    const/16 v1, 0x64

    .line 50
    .line 51
    iput v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->distance:I

    .line 52
    .line 53
    const-string v1, "\u559c\u6b22\u5e7f\u573a\u821e"

    .line 54
    .line 55
    const-string v2, "\u559c\u6b22\u54c8\u54c8\u54c8"

    .line 56
    .line 57
    const-string v3, "\u5531\u5404\u8428\u8fbe\u591a\u4e2a"

    .line 58
    .line 59
    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    new-instance v2, Ll/fk80;

    .line 64
    .line 65
    invoke-direct {v2}, Ll/fk80;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {v1, v2}, Ll/jyb;->R([Ljava/lang/Object;Ll/qcj;)Ljava/util/ArrayList;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userTagList:Ljava/util/ArrayList;

    .line 73
    .line 74
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 77
    .line 78
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 79
    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 81
    .line 82
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 87
    .line 88
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 89
    .line 90
    if-eqz p1, :cond_0

    .line 91
    .line 92
    const/4 v3, 0x2

    .line 93
    goto :goto_0

    .line 94
    :cond_0
    const/4 v3, 0x1

    .line 95
    :goto_0
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 100
    .line 101
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v2, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 108
    .line 109
    if-eqz p1, :cond_1

    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->p:Landroid/widget/Button;

    .line 112
    .line 113
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 118
    .line 119
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 120
    .line 121
    invoke-static {p0, p1}, Ll/u6c0;->N(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 122
    .line 123
    .line 124
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 129
    .line 130
    new-instance p1, Ll/pf60;

    .line 131
    .line 132
    const-string v1, "pei_liao_broadcast"

    .line 133
    .line 134
    invoke-direct {p1, v1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 146
    .line 147
    new-instance p1, Ll/pf60;

    .line 148
    .line 149
    const-string v1, "tickets_broadcast"

    .line 150
    .line 151
    invoke-direct {p1, v1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public final R(Z)V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "\u91cd\u751f\u7684\u5c0f\u80d6\u5b50"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->name:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "349281368"

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6Ikk2MlRQNldBSVFaM1ZRRFRPU01FSFdIS043Nk5RUTA0IiwidyI6MTk2MCwiaCI6MTk1OSwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjYxNzE0NDg5Nzk1MzUzMzg2ODAsImFiIjowfQ.jpg?format=128x128"

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->avatarUrl:Ljava/lang/String;

    .line 36
    .line 37
    const-string v1, ""

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->action:Ljava/lang/String;

    .line 40
    .line 41
    const-string v1, "female"

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->gender:Ljava/lang/String;

    .line 44
    .line 45
    const-string v1, "10"

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->age:Ljava/lang/String;

    .line 48
    .line 49
    const/16 v1, 0x64

    .line 50
    .line 51
    iput v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->distance:I

    .line 52
    .line 53
    const-string v1, "\u559c\u6b22\u5e7f\u573a\u821e"

    .line 54
    .line 55
    const-string v2, "\u559c\u6b22\u54c8\u54c8\u54c8"

    .line 56
    .line 57
    const-string v3, "\u5531\u5404\u8428\u8fbe\u591a\u4e2a"

    .line 58
    .line 59
    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    new-instance v2, Ll/zj80;

    .line 64
    .line 65
    invoke-direct {v2}, Ll/zj80;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {v1, v2}, Ll/jyb;->R([Ljava/lang/Object;Ll/qcj;)Ljava/util/ArrayList;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userTagList:Ljava/util/ArrayList;

    .line 73
    .line 74
    new-instance v1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 75
    .line 76
    invoke-direct {v1, v0}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 77
    .line 78
    .line 79
    if-eqz p1, :cond_0

    .line 80
    .line 81
    const/4 p1, 0x3

    .line 82
    iput p1, v1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 83
    .line 84
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 85
    .line 86
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 89
    .line 90
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 95
    .line 96
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 97
    .line 98
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    const/4 v2, 0x1

    .line 103
    if-ge p1, v2, :cond_1

    .line 104
    .line 105
    return-void

    .line 106
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 107
    .line 108
    iget-object v3, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 109
    .line 110
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 111
    .line 112
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 113
    .line 114
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 119
    .line 120
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 127
    .line 128
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v3, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    iput-object p1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 135
    .line 136
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 137
    .line 138
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 139
    .line 140
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/v;->V:Ll/vxd0;

    .line 141
    .line 142
    const/4 v0, 0x0

    .line 143
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    invoke-static {}, Ll/a8d0;->x0()Ll/a8d0;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->q:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-virtual {p1, p0, v1}, Ll/a8d0;->B0(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public final S()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ActionToastStyle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "1"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->styleId:Ljava/lang/String;

    .line 9
    .line 10
    new-instance v1, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 11
    .line 12
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v2, "online"

    .line 16
    .line 17
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;->miniIcon:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->icons:Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 20
    .line 21
    const-string v1, "tantanapp://sendMessage?uid=137071&msg=\u65e9\u4e0a\u597d"

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 24
    .line 25
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->mainImg:Ljava/lang/String;

    .line 40
    .line 41
    const-string v2, "\u6797\u9752\u971e"

    .line 42
    .line 43
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 44
    .line 45
    const-string v2, "\u5f53\u524d\u5728\u7ebf\uff0c\u6253\u4e2a\u62db\u547c\u5427"

    .line 46
    .line 47
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->message:Ljava/lang/String;

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    iput-boolean v2, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showClose:Z

    .line 51
    .line 52
    new-instance v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;

    .line 53
    .line 54
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;-><init>()V

    .line 55
    .line 56
    .line 57
    const/4 v3, 0x1

    .line 58
    iput-boolean v3, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->showButton:Z

    .line 59
    .line 60
    const-string v3, "[\u7231\u5fc3]\u65e9\u4e0a\u597d"

    .line 61
    .line 62
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonMessage:Ljava/lang/String;

    .line 63
    .line 64
    const-string v3, "white"

    .line 65
    .line 66
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonBackground:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonLink:Ljava/lang/String;

    .line 69
    .line 70
    new-instance v1, Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 79
    .line 80
    new-instance v1, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    const-string v2, "swipe"

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    const-string v2, "message"

    .line 91
    .line 92
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    const-string v2, "live"

    .line 96
    .line 97
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    const-string v2, "my"

    .line 101
    .line 102
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    const-string v2, "123456"

    .line 106
    .line 107
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 108
    .line 109
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->scenes:Ljava/util/List;

    .line 110
    .line 111
    const/16 v1, 0x1388

    .line 112
    .line 113
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showTime:I

    .line 114
    .line 115
    const-string v1, "female_online"

    .line 116
    .line 117
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 118
    .line 119
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionData;->new_()Lcom/p1/mobile/putong/core/data/ActionData;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 124
    .line 125
    invoke-static {}, Ll/y2h0;->g()Ll/y2h0;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->q:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 130
    .line 131
    invoke-virtual {v0, p0, v1}, Ll/y2h0;->k(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/ActionData;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->w(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->x()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMainViewModel(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->q:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    return-void
.end method

.method public final w(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ok80;->a(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final x()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->a:Landroid/widget/Button;

    .line 2
    .line 3
    new-instance v1, Ll/sj80;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/sj80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->e:Landroid/widget/Button;

    .line 12
    .line 13
    new-instance v1, Ll/lk80;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/lk80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->g:Landroid/widget/Button;

    .line 22
    .line 23
    new-instance v1, Ll/mk80;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/mk80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->f:Landroid/widget/Button;

    .line 32
    .line 33
    new-instance v1, Ll/nk80;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/nk80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->h:Landroid/widget/Button;

    .line 42
    .line 43
    new-instance v1, Ll/tj80;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/tj80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->i:Landroid/widget/Button;

    .line 52
    .line 53
    new-instance v1, Ll/uj80;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/uj80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->j:Landroid/widget/Button;

    .line 62
    .line 63
    new-instance v1, Ll/vj80;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/vj80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->k:Landroid/widget/Button;

    .line 72
    .line 73
    new-instance v1, Ll/wj80;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/wj80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->l:Landroid/widget/Button;

    .line 82
    .line 83
    new-instance v1, Ll/xj80;

    .line 84
    .line 85
    invoke-direct {v1}, Ll/xj80;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->b:Landroid/widget/Button;

    .line 92
    .line 93
    new-instance v1, Ll/yj80;

    .line 94
    .line 95
    invoke-direct {v1, p0}, Ll/yj80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->c:Landroid/widget/Button;

    .line 102
    .line 103
    new-instance v1, Ll/dk80;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/dk80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->d:Landroid/widget/Button;

    .line 112
    .line 113
    new-instance v1, Ll/gk80;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/gk80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->m:Landroid/widget/Button;

    .line 122
    .line 123
    new-instance v1, Ll/hk80;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Ll/hk80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->n:Landroid/widget/Button;

    .line 132
    .line 133
    new-instance v1, Ll/ik80;

    .line 134
    .line 135
    invoke-direct {v1, p0}, Ll/ik80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 136
    .line 137
    .line 138
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->o:Landroid/widget/Button;

    .line 142
    .line 143
    new-instance v1, Ll/jk80;

    .line 144
    .line 145
    invoke-direct {v1, p0}, Ll/jk80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 146
    .line 147
    .line 148
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->p:Landroid/widget/Button;

    .line 152
    .line 153
    new-instance v1, Ll/kk80;

    .line 154
    .line 155
    invoke-direct {v1, p0}, Ll/kk80;-><init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    .line 156
    .line 157
    .line 158
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->q:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/z5h0;->L(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->q:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/wm4;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
