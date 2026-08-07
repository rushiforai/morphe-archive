.class public Ll/biv;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(ILcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    if-nez p0, :cond_2

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p0}, Ll/biv;->l(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    const/4 v0, 0x1

    .line 29
    if-ne p0, v0, :cond_4

    .line 30
    .line 31
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p0}, Ll/biv;->l(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_4
    const/4 v0, 0x2

    .line 51
    if-ne p0, v0, :cond_5

    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_5
    const-string p0, ""

    .line 57
    .line 58
    return-object p0
.end method

.method public static b(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;",
            "I",
            "Ll/nsv<",
            "TT;>;",
            "Ll/qcj<",
            "TT;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v3, 0x1

    .line 2
    const/4 v5, -0x1

    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v4, p3

    .line 7
    invoke-static/range {v0 .. v5}, Ll/biv;->e(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;ZLl/qcj;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;",
            "I",
            "Ll/nsv<",
            "TT;>;",
            "Ll/qcj<",
            "TT;",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .line 1
    const/4 v3, 0x1

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v4, p3

    .line 6
    move v5, p4

    .line 7
    invoke-static/range {v0 .. v5}, Ll/biv;->e(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;ZLl/qcj;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;ZLl/qcj;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;",
            "I",
            "Ll/nsv<",
            "TT;>;Z",
            "Ll/qcj<",
            "TT;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v5, -0x1

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move-object v4, p4

    .line 7
    invoke-static/range {v0 .. v5}, Ll/biv;->e(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;ZLl/qcj;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;ZLl/qcj;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;",
            "I",
            "Ll/nsv<",
            "TT;>;Z",
            "Ll/qcj<",
            "TT;",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Ll/l6o0;->e()Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    invoke-static {p2}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iget-object p2, p2, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 16
    .line 17
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 18
    .line 19
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 20
    .line 21
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    invoke-virtual {p4}, Ll/p6s;->L1()Z

    .line 28
    .line 29
    .line 30
    move-result p4

    .line 31
    if-eqz p4, :cond_0

    .line 32
    .line 33
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 34
    .line 35
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 36
    .line 37
    invoke-static {p5, p3}, Ll/biv;->a(ILcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    :cond_0
    move-object v5, p3

    .line 42
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarResourceType:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 45
    .line 46
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 47
    .line 48
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 49
    .line 50
    iget-object v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 51
    .line 52
    move-object v0, p0

    .line 53
    move v1, p1

    .line 54
    invoke-static/range {v0 .. v5}, Ll/biv;->h(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    move-object v0, p0

    .line 59
    move v1, p1

    .line 60
    invoke-static {p2}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ll/e3t;->e()Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_3

    .line 69
    .line 70
    invoke-static {p2}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iget-object p0, p0, Ll/e3t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 79
    .line 80
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-virtual {p2}, Ll/p6s;->L1()Z

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    if-eqz p2, :cond_2

    .line 89
    .line 90
    invoke-static {p5, p1}, Ll/biv;->a(ILcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 95
    .line 96
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 101
    .line 102
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v0, v1, p1, p2, p0}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_3
    iget-object p0, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 111
    .line 112
    invoke-interface {p4, p0}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    check-cast p0, Ljava/lang/String;

    .line 117
    .line 118
    const/4 p1, 0x0

    .line 119
    invoke-static {v0, v1, p0, p1, p1}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 6
    .param p0    # Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarResourceType:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 6
    .line 7
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 12
    .line 13
    move-object v0, p0

    .line 14
    move v1, p1

    .line 15
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->r0(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p0    # Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v2, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move-object v3, p2

    .line 5
    move-object v4, p3

    .line 6
    move-object v5, p4

    .line 7
    invoke-static/range {v0 .. v5}, Ll/biv;->h(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static h(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0    # Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object v0, p4

    .line 2
    move-object p4, p3

    .line 3
    move-object p3, v0

    .line 4
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->r0(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static i(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0    # Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->m0(ILjava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static j(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0    # Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->m0(ILjava/lang/String;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static k(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 6
    .param p0    # Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarResourceType:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 6
    .line 7
    const-string v5, ""

    .line 8
    .line 9
    const-string v3, ""

    .line 10
    .line 11
    move-object v0, p0

    .line 12
    move v1, p1

    .line 13
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->r0(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static l(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method
