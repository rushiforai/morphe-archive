.class public Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;,
        Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$a;
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;


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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->b()V

    .line 5
    .line 6
    .line 7
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

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->b()V

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

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->b()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 2
    .line 3
    iget v1, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->b:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->a:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 15
    .line 16
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->a:Lv/VDraweeView;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 22
    .line 23
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->b:I

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget v1, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->e:I

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    iget v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->f:I

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    move v4, v1

    .line 38
    move v1, v0

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move v1, v3

    .line 41
    move v4, v1

    .line 42
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget v5, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 47
    .line 48
    if-lez v5, :cond_2

    .line 49
    .line 50
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    if-lez v0, :cond_2

    .line 53
    .line 54
    move v1, v0

    .line 55
    move v4, v5

    .line 56
    goto :goto_1

    .line 57
    :catch_0
    move-exception v0

    .line 58
    goto :goto_2

    .line 59
    :cond_2
    :goto_1
    move v9, v1

    .line 60
    move v8, v4

    .line 61
    goto :goto_3

    .line 62
    :goto_2
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->a:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_4

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->c()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->a:Lv/VDraweeView;

    .line 81
    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 88
    .line 89
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 101
    .line 102
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->a:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 113
    .line 114
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 115
    .line 116
    .line 117
    goto :goto_4

    .line 118
    :cond_3
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 122
    .line 123
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 127
    .line 128
    iget-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->d:Ljava/lang/String;

    .line 129
    .line 130
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->a:Lv/VDraweeView;

    .line 131
    .line 132
    iget-object v7, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->a:Ljava/lang/String;

    .line 133
    .line 134
    iget-boolean v10, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->g:Z

    .line 135
    .line 136
    iget-boolean v11, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->h:Z

    .line 137
    .line 138
    iget-boolean v12, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->i:Z

    .line 139
    .line 140
    iget-object v13, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->j:Ll/fn2;

    .line 141
    .line 142
    invoke-static/range {v5 .. v13}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 143
    .line 144
    .line 145
    :cond_4
    :goto_4
    return-void
.end method

.method public final b()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->g0:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    sget v0, Ll/mdc0;->d6:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lv/VDraweeView;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->a:Lv/VDraweeView;

    .line 24
    .line 25
    sget v0, Ll/mdc0;->q6:I

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final c()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->c:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "svga"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->c:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->a:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public setImageResID(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 13
    .line 14
    iput p1, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;->b:I

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->a()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setMaskAvatarData(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView$b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
