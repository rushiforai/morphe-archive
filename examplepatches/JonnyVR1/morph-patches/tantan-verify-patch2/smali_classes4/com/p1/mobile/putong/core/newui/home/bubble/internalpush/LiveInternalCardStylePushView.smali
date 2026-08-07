.class public Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;
.super Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;
.source "SourceFile"


# static fields
.field public static final m:I


# instance fields
.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VDraweeView;

.field public e:Lv/VImage;

.field public f:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VButton;

.field public j:F

.field public k:Ll/p0n;

.field public l:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->f:I

    .line 2
    .line 3
    sput v0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->m:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjZCVzNXMklTQklLU0ZIMzNNNkxIWDcyN09GQVlIQTE0IiwidyI6MTA3NywiaCI6NjQ4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTQ0OTU5NjEzMDA1OTg3OTY4fQ.png"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->l:Ljava/lang/String;

    .line 7
    .line 8
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

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjZCVzNXMklTQklLU0ZIMzNNNkxIWDcyN09GQVlIQTE0IiwidyI6MTA3NywiaCI6NjQ4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTQ0OTU5NjEzMDA1OTg3OTY4fQ.png"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->l:Ljava/lang/String;

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

    .line 11
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjZCVzNXMklTQklLU0ZIMzNNNkxIWDcyN09GQVlIQTE0IiwidyI6MTA3NywiaCI6NjQ4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTQ0OTU5NjEzMDA1OTg3OTY4fQ.png"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->l:Ljava/lang/String;

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->h(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->k(Landroid/view/View;)V

    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->k:Ll/p0n;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Ll/a0n;->a:Ll/zzm;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/zzm;->J()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->k:Ll/p0n;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/p0n;->f()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->k:Ll/p0n;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Ll/a0n;->a:Ll/zzm;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/zzm;->J()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->k:Ll/p0n;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/p0n;->f()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public b(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->h:Lv/VText;

    .line 4
    .line 5
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 6
    .line 7
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->g:Lv/VText;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->h:Lv/VText;

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-nez p2, :cond_0

    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->i:Lv/VButton;

    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->d:Lv/VDraweeView;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->l:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-nez p2, :cond_1

    .line 55
    .line 56
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->f:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 57
    .line 58
    const/4 v0, 0x1

    .line 59
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->f:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 63
    .line 64
    const v0, 0x3fcccccd    # 1.6f

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->setHaloZoomRatio(F)V

    .line 68
    .line 69
    .line 70
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p2, p1}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    new-instance p2, Ll/q3d0;

    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->f:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->getAvatarSize()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->f:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->getAvatarSize()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-direct {p2, v0, v1}, Ll/q3d0;-><init>(II)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, p2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 104
    .line 105
    new-instance v0, Ll/l0t;

    .line 106
    .line 107
    invoke-direct {v0, p0}, Ll/l0t;-><init>(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p2, p1, v0}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 111
    .line 112
    .line 113
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->i:Lv/VButton;

    .line 114
    .line 115
    new-instance p2, Ll/m0t;

    .line 116
    .line 117
    invoke-direct {p2, p0}, Ll/m0t;-><init>(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->f:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 124
    .line 125
    new-instance p2, Ll/n0t;

    .line 126
    .line 127
    invoke-direct {p2, p0}, Ll/n0t;-><init>(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->e:Lv/VImage;

    .line 134
    .line 135
    new-instance p2, Ll/o0t;

    .line 136
    .line 137
    invoke-direct {p2, p0}, Ll/o0t;-><init>(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;)V

    .line 138
    .line 139
    .line 140
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/p0t;->a(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getHideAnim()Landroid/animation/Animator;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 8
    .line 9
    neg-int v0, v0

    .line 10
    int-to-float v0, v0

    .line 11
    const/4 v1, 0x2

    .line 12
    new-array v1, v1, [F

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x0

    .line 16
    aput v2, v1, v3

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    aput v0, v1, v2

    .line 20
    .line 21
    const-string v0, "translationY"

    .line 22
    .line 23
    invoke-static {p0, v0, v1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-wide/16 v0, 0x190

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    return-object p0
.end method

.method public getShowAnim()Landroid/animation/Animator;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 8
    .line 9
    neg-int v0, v0

    .line 10
    int-to-float v0, v0

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sub-float/2addr v0, v1

    .line 16
    const/4 v1, 0x2

    .line 17
    new-array v1, v1, [F

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    aput v0, v1, v2

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    const/4 v2, 0x1

    .line 24
    aput v0, v1, v2

    .line 25
    .line 26
    const-string v0, "translationY"

    .line 27
    .line 28
    invoke-static {p0, v0, v1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-wide/16 v0, 0x190

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 35
    .line 36
    .line 37
    return-object p0
.end method

.method public final synthetic h(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->f:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->setAvatar(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;->b:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Ll/p0n;)Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->k:Ll/p0n;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->j:F

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    sub-float/2addr v0, v1

    .line 18
    sget v1, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->m:I

    .line 19
    .line 20
    int-to-float v1, v1

    .line 21
    cmpl-float v0, v0, v1

    .line 22
    .line 23
    if-lez v0, :cond_2

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->j:F

    .line 32
    .line 33
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;->a:Ll/x20;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v2, 0x3

    .line 18
    if-eq v0, v2, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->j:F

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    sub-float/2addr v0, v2

    .line 28
    sget v2, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->m:I

    .line 29
    .line 30
    int-to-float v2, v2

    .line 31
    cmpl-float v0, v0, v2

    .line 32
    .line 33
    if-lez v0, :cond_2

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;->a:Ll/x20;

    .line 36
    .line 37
    invoke-interface {p1}, Ll/x20;->call()V

    .line 38
    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;->a:Ll/x20;

    .line 42
    .line 43
    return v1

    .line 44
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0
.end method
