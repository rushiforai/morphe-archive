.class public Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;
.super Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;
.source "SourceFile"


# static fields
.field public static final m:I


# instance fields
.field public c:Landroid/widget/LinearLayout;

.field public d:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

.field public e:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroid/widget/ImageView;

.field public k:F

.field public l:Ll/q0n;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->f:I

    .line 2
    .line 3
    sput v0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->m:I

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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->h(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->g(Landroid/graphics/Bitmap;)V

    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->j:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->h:Lv/VText;

    .line 10
    .line 11
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->g:Lv/VText;

    .line 17
    .line 18
    iget-object v2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->h:Lv/VText;

    .line 24
    .line 25
    iget-object v2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_0

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->i:Lv/VText;

    .line 39
    .line 40
    iget-object v2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    .line 48
    .line 49
    const-string v1, "virtualAvatar"

    .line 50
    .line 51
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->e:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 58
    .line 59
    const-string v1, "#35D3FF"

    .line 60
    .line 61
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-virtual {p1, v2, v1}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->e(II)V

    .line 70
    .line 71
    .line 72
    :cond_1
    iget-object p1, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_2

    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->d:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 81
    .line 82
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->f:Lv/VDraweeView;

    .line 86
    .line 87
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->e:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 91
    .line 92
    const/4 v0, 0x1

    .line 93
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 97
    .line 98
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p1, p2}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    new-instance p2, Ll/q3d0;

    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->e:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->getAvatarSize()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->e:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->getAvatarSize()I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    invoke-direct {p2, v0, v1}, Ll/q3d0;-><init>(II)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, p2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 130
    .line 131
    new-instance v0, Ll/w0t;

    .line 132
    .line 133
    invoke-direct {v0, p0}, Ll/w0t;-><init>(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p2, p1, v0}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 137
    .line 138
    .line 139
    :cond_2
    return-void
.end method

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/z0t;->a(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic g(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->e:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->setAvatar(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getHideAnim()Landroid/animation/Animator;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->c:Landroid/widget/LinearLayout;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->c:Landroid/widget/LinearLayout;

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

.method public final synthetic h(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->l:Ll/q0n;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p1, Ll/a0n;->a:Ll/zzm;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/q0n;->o()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->l:Ll/q0n;

    .line 13
    .line 14
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/zzm;->J()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->l:Ll/q0n;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p1, Ll/a0n;->a:Ll/zzm;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/q0n;->o()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->l:Ll/q0n;

    .line 13
    .line 14
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/zzm;->J()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->b(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->j:Landroid/widget/ImageView;

    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->j:Landroid/widget/ImageView;

    .line 11
    .line 12
    new-instance p2, Ll/y0t;

    .line 13
    .line 14
    invoke-direct {p2, p0}, Ll/y0t;-><init>(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->j:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->j:Landroid/widget/ImageView;

    .line 8
    .line 9
    new-instance v2, Ll/x0t;

    .line 10
    .line 11
    invoke-direct {v2, p0}, Ll/x0t;-><init>(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->e:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-nez v3, :cond_1

    .line 32
    .line 33
    const-string v3, ".svga"

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->d:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 40
    .line 41
    if-eqz v3, :cond_0

    .line 42
    .line 43
    invoke-static {v4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->f:Lv/VDraweeView;

    .line 47
    .line 48
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->d:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 52
    .line 53
    const/4 v2, -0x1

    .line 54
    invoke-virtual {v1, v0, v2}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->startSVGAAnim(Ljava/lang/String;I)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->f:Lv/VDraweeView;

    .line 62
    .line 63
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 67
    .line 68
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->f:Lv/VDraweeView;

    .line 69
    .line 70
    invoke-virtual {v1, v2, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->g:Lv/VText;

    .line 74
    .line 75
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->h:Lv/VText;

    .line 81
    .line 82
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_2

    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->i:Lv/VText;

    .line 96
    .line 97
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    :cond_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->f(Landroid/view/View;)V

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
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->k:F

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
    sget v1, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->m:I

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
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->k:F

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
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->k:F

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
    sget v2, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->m:I

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

.method public setHandler(Ll/q0n;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->l:Ll/q0n;

    .line 2
    .line 3
    return-void
.end method
