.class public Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public d:Landroid/view/View;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lv/VDraweeView;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/TextView;

.field public j:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ljava/lang/String;

.field public m:Landroid/animation/ObjectAnimator;


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

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->h(Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->j(Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;)V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;)V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/v320;->a(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f()Lcom/p1/mobile/android/app/Act;
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

.method public final g()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->m:Landroid/animation/ObjectAnimator;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->j:Ll/y20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->k:Ll/y20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final j(Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/mbs;->G()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/nam;->a()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->B0:I

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget-object v1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->VIDEO_CHAT:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 30
    .line 31
    if-ne v0, v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->anchorId:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->liveId:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->status:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 48
    .line 49
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->role:Ljava/lang/String;

    .line 50
    .line 51
    const-string v5, ""

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    invoke-static/range {v0 .. v5}, Ll/gfj0;->e(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->l:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    const-string v1, "my_room_in_profile"

    .line 68
    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    sget-object p1, Ll/tbs;->f:Ll/j6t;

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->f()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const/4 v2, 0x0

    .line 82
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->m(Z)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p1, p0, v0}, Ll/j6t;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_2
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->f()Lcom/p1/mobile/android/app/Act;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->liveId:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v3, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->l:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->z(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {v0, v2, p1}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->f()Lcom/p1/mobile/android/app/Act;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/mbs;->G()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/nam;->a()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->B0:I

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget-object v1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->VIDEO_CHAT:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 30
    .line 31
    if-ne v0, v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 46
    .line 47
    const/4 v5, 0x1

    .line 48
    const/4 v0, 0x0

    .line 49
    const/4 v3, 0x0

    .line 50
    invoke-static/range {v0 .. v5}, Ll/gfj0;->h(ZLjava/lang/String;Ljava/lang/String;ZLjava/lang/String;Z)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->l:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    const-string v1, "my_room_in_profile"

    .line 64
    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->needBuild:Z

    .line 68
    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->f()Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-static {p0, p1}, Ll/iqn0;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->isPersonal:Z

    .line 92
    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->l:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_3

    .line 106
    .line 107
    const-string p0, "\u79c1\u4eba\u623f\u6682\u4e0d\u5bf9\u5916\u5f00\u653e~"

    .line 108
    .line 109
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->f()Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    sget-object v2, Ll/tbs;->f:Ll/j6t;

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->f()Lcom/p1/mobile/android/app/Act;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v4, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    const-string v1, ""

    .line 138
    .line 139
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    const/4 v1, 0x1

    .line 144
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->l:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->z(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {v2, v3, p0}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public l(Ll/bkj0;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/tantanapp/common/data/ValueObject;",
            "Lcom/tantanapp/common/data/ValueObject;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->l:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p2, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 4
    .line 5
    instance-of v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object p2, v1

    .line 14
    :goto_0
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 15
    .line 16
    instance-of v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    move-object p1, v1

    .line 24
    :goto_1
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->j:Ll/y20;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->k:Ll/y20;

    .line 31
    .line 32
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->n(Ll/pf60;Ll/y20;Ll/y20;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->d:Landroid/view/View;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->b:Lv/VDraweeView;

    .line 19
    .line 20
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->background:Ljava/lang/String;

    .line 21
    .line 22
    new-instance v2, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard$d;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard$d;-><init>(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;)V

    .line 25
    .line 26
    .line 27
    const-string v3, "context_square"

    .line 28
    .line 29
    invoke-static {v3, v0, v1, v2}, Ll/izs;->w(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->f:Lv/VDraweeView;

    .line 33
    .line 34
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->anchorAvatar:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v3, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->g:Landroid/widget/TextView;

    .line 40
    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->title:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->h:Landroid/widget/TextView;

    .line 47
    .line 48
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->subTitle:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/t320;

    .line 58
    .line 59
    invoke-direct {v1, p0, p1}, Ll/t320;-><init>(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public n(Ll/pf60;Ll/y20;Ll/y20;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p4, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    if-nez p4, :cond_0

    .line 4
    .line 5
    iget-object p4, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    if-nez p4, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/16 p1, 0x8

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p4, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->a:Lv/VFrame;

    .line 20
    .line 21
    sget v0, Ll/qa00;->m:I

    .line 22
    .line 23
    invoke-static {p4, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-virtual {p4, v0}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    iget-object p4, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 35
    .line 36
    if-eqz p4, :cond_1

    .line 37
    .line 38
    check-cast p4, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    .line 39
    .line 40
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->m(Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 44
    .line 45
    if-eqz p1, :cond_2

    .line 46
    .line 47
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->o(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->j:Ll/y20;

    .line 53
    .line 54
    iput-object p3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->k:Ll/y20;

    .line 55
    .line 56
    return-void
.end method

.method public final o(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->d:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->g:Landroid/widget/TextView;

    .line 19
    .line 20
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->title:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->h:Landroid/widget/TextView;

    .line 26
    .line 27
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->i:Landroid/widget/TextView;

    .line 33
    .line 34
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 40
    .line 41
    sget-object v3, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 42
    .line 43
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 47
    .line 48
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->background:Ljava/lang/String;

    .line 49
    .line 50
    new-instance v4, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard$c;

    .line 51
    .line 52
    invoke-direct {v4, p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard$c;-><init>(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;)V

    .line 53
    .line 54
    .line 55
    const/4 v5, -0x1

    .line 56
    invoke-virtual {v0, v3, v5, v4, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->g(Ljava/lang/String;ILl/wo0;Z)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 60
    .line 61
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_0

    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->f:Lv/VDraweeView;

    .line 68
    .line 69
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Ljava/lang/String;

    .line 76
    .line 77
    const/high16 v2, 0x42400000    # 48.0f

    .line 78
    .line 79
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    const-string v4, "context_square"

    .line 88
    .line 89
    invoke-static {v4, v0, v1, v3, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 90
    .line 91
    .line 92
    :cond_0
    new-instance v0, Ll/u320;

    .line 93
    .line 94
    invoke-direct {v0, p0, p1}, Ll/u320;-><init>(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->g()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard$a;-><init>(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->j:Ll/y20;

    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard$b;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard$b;-><init>(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->k:Ll/y20;

    .line 20
    .line 21
    return-void
.end method
