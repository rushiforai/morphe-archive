.class public Ll/tf4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/qf4;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/ImageView;

.field public final d:Landroid/widget/FrameLayout;

.field public e:Ll/w0c;

.field public f:Ll/qf4;

.field public g:Landroid/animation/Animator;

.field public h:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/widget/FrameLayout;)V
    .locals 1
    .param p1    # Landroid/widget/FrameLayout;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/tf4;->g:Landroid/animation/Animator;

    .line 6
    .line 7
    iput-object p1, p0, Ll/tf4;->d:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/tf4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tf4;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/tf4;Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tf4;->l(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c(Ll/tf4;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tf4;->h:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/tf4;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tf4;->p()V

    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tf4;->j()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/tf4;->f:Ll/qf4;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/qf4;->T3()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tf4;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    const-string v1, "about:blank"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/tf4;->h:Landroid/view/View;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/tf4;->i()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private r()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/tf4;->f:Ll/qf4;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/tf4;->d:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Ll/tf4;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iput-object v2, p0, Ll/tf4;->h:Landroid/view/View;

    .line 18
    .line 19
    sget-object v3, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 20
    .line 21
    new-instance v8, Landroid/view/animation/AccelerateInterpolator;

    .line 22
    .line 23
    invoke-direct {v8}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 24
    .line 25
    .line 26
    const/high16 v0, -0x3c790000    # -270.0f

    .line 27
    .line 28
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    int-to-float v0, v0

    .line 33
    const/4 v1, 0x2

    .line 34
    new-array v9, v1, [F

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    aput v0, v9, v1

    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    const/4 v4, 0x0

    .line 41
    aput v4, v9, v0

    .line 42
    .line 43
    const-wide/16 v4, 0x0

    .line 44
    .line 45
    const-wide/16 v6, 0x12c

    .line 46
    .line 47
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    iput-object v2, p0, Ll/tf4;->g:Landroid/animation/Animator;

    .line 52
    .line 53
    new-instance v2, Ll/w0c;

    .line 54
    .line 55
    invoke-direct {v2}, Ll/w0c;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v2, p0, Ll/tf4;->e:Ll/w0c;

    .line 59
    .line 60
    iget-object v3, p0, Ll/tf4;->f:Ll/qf4;

    .line 61
    .line 62
    invoke-virtual {v3}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    iget-object v4, p0, Ll/tf4;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 67
    .line 68
    invoke-virtual {v2, v3, v4}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->z(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 69
    .line 70
    .line 71
    iget-object v2, p0, Ll/tf4;->e:Ll/w0c;

    .line 72
    .line 73
    iget-object v3, p0, Ll/tf4;->f:Ll/qf4;

    .line 74
    .line 75
    invoke-virtual {v3}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    check-cast v3, Lcom/p1/mobile/putong/app/PutongAct;

    .line 80
    .line 81
    const-string v4, ""

    .line 82
    .line 83
    iget-object v5, p0, Ll/tf4;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 84
    .line 85
    invoke-virtual {v2, v3, v4, v5, v4}, Ll/w0c;->M(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object v2, p0, Ll/tf4;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 89
    .line 90
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 91
    .line 92
    .line 93
    iget-object v2, p0, Ll/tf4;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 94
    .line 95
    invoke-virtual {v2, v1}, Landroid/view/View;->setHorizontalScrollBarEnabled(Z)V

    .line 96
    .line 97
    .line 98
    iget-object v2, p0, Ll/tf4;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 99
    .line 100
    invoke-virtual {v2, v1}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    .line 101
    .line 102
    .line 103
    iget-object v2, p0, Ll/tf4;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 104
    .line 105
    new-instance v3, Ll/tf4$a;

    .line 106
    .line 107
    iget-object v4, p0, Ll/tf4;->e:Ll/w0c;

    .line 108
    .line 109
    invoke-direct {v3, p0, v4}, Ll/tf4$a;-><init>(Ll/tf4;Ll/nxl;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2, v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setMKWebLoadListener(Ll/ilw;)V

    .line 113
    .line 114
    .line 115
    iget-object v2, p0, Ll/tf4;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 116
    .line 117
    invoke-virtual {v2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    const/4 v3, -0x1

    .line 122
    invoke-virtual {v2, v3}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 123
    .line 124
    .line 125
    iget-object v2, p0, Ll/tf4;->h:Landroid/view/View;

    .line 126
    .line 127
    iget-object v3, p0, Ll/tf4;->f:Ll/qf4;

    .line 128
    .line 129
    invoke-virtual {v3}, Ll/qf4;->U3()Landroid/view/ViewGroup$LayoutParams;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 134
    .line 135
    .line 136
    iget-object v2, p0, Ll/tf4;->d:Landroid/widget/FrameLayout;

    .line 137
    .line 138
    iget-object v3, p0, Ll/tf4;->h:Landroid/view/View;

    .line 139
    .line 140
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 141
    .line 142
    .line 143
    iget-object v2, p0, Ll/tf4;->f:Ll/qf4;

    .line 144
    .line 145
    invoke-virtual {v2}, Ll/qf4;->T3()V

    .line 146
    .line 147
    .line 148
    iget-object v2, p0, Ll/tf4;->c:Landroid/widget/ImageView;

    .line 149
    .line 150
    new-instance v3, Ll/rf4;

    .line 151
    .line 152
    invoke-direct {v3, p0}, Ll/rf4;-><init>(Ll/tf4;)V

    .line 153
    .line 154
    .line 155
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 156
    .line 157
    .line 158
    iget-object v2, p0, Ll/tf4;->d:Landroid/widget/FrameLayout;

    .line 159
    .line 160
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 161
    .line 162
    .line 163
    iget-object p0, p0, Ll/tf4;->h:Landroid/view/View;

    .line 164
    .line 165
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tf4;->d:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/tf4;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/tf4;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 5
    .line 6
    iget-object p0, p0, Ll/tf4;->e:Ll/w0c;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/ffv;->a(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ll/w0c;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/uf4;->b(Ll/tf4;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ll/qf4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tf4;->f:Ll/qf4;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/tf4;->r()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tf4;->g:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/tf4;->g:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/qf4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tf4;->f(Ll/qf4;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tf4;->h:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tf4;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/tf4;->f:Ll/qf4;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/qf4;->T3()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/tf4;->j()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/tf4;->f:Ll/qf4;

    .line 10
    .line 11
    const/16 p2, 0x514

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getSchema()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p2, p1}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public m(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$ChatAreaOperationSiteContainer;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$ChatAreaOperationSiteContainer;->getJumpLinkItem()Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {}, Ll/bnl0;->y0()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-float v0, v0

    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getWidthScreenRatio()F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    mul-float/2addr v0, v1

    .line 15
    float-to-int v0, v0

    .line 16
    invoke-static {}, Ll/bnl0;->y0()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v1, v1

    .line 21
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getWidthScreenRatio()F

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    mul-float/2addr v1, v2

    .line 26
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getWidthHighRatio()F

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    div-float/2addr v1, v2

    .line 31
    float-to-int v1, v1

    .line 32
    new-instance v2, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getUrl()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-static {v3}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_0

    .line 46
    .line 47
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-nez v3, :cond_0

    .line 52
    .line 53
    const-string v3, "H5-Authorization"

    .line 54
    .line 55
    invoke-interface {v2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getIsClientDeal()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    iget-object v3, p0, Ll/tf4;->b:Landroid/view/View;

    .line 63
    .line 64
    if-eqz p1, :cond_1

    .line 65
    .line 66
    const/4 p1, 0x1

    .line 67
    invoke-static {v3, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/tf4;->b:Landroid/view/View;

    .line 71
    .line 72
    new-instance v3, Ll/sf4;

    .line 73
    .line 74
    invoke-direct {v3, p0, p2}, Ll/sf4;-><init>(Ll/tf4;Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    const/4 p1, 0x0

    .line 82
    invoke-static {v3, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/tf4;->b:Landroid/view/View;

    .line 86
    .line 87
    const/4 v3, 0x0

    .line 88
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    :goto_0
    iget-object p1, p0, Ll/tf4;->c:Landroid/widget/ImageView;

    .line 92
    .line 93
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getEnableClose()Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Ll/tf4;->h:Landroid/view/View;

    .line 101
    .line 102
    invoke-static {p1, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Ll/tf4;->h:Landroid/view/View;

    .line 106
    .line 107
    filled-new-array {p1}, [Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-static {v0, p1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Ll/tf4;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 115
    .line 116
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getUrl()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p0, p1, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final p()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tf4;->g:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/tf4;->g:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
