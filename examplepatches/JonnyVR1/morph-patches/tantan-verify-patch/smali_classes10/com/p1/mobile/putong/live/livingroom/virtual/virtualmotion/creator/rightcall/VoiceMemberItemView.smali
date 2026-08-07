.class public Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/view/View;

.field public e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public f:Landroid/widget/ImageView;

.field public g:Lv/VDraweeView;

.field public h:Lv/VLinear;

.field public i:Lv/VText;

.field public j:Landroid/view/View;

.field public k:Lv/VDraweeView;

.field public l:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public n:Ll/wo0;

.field public o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

.field public p:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Ll/h64;",
            ">;"
        }
    .end annotation
.end field

.field public q:Ll/d55;

.field public r:Ljava/lang/String;

.field public s:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/h64;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h64;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private k0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->s:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->s:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 35
    .line 36
    const/4 v0, -0x1

    .line 37
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private l0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->verticalVoicingUrl:Ljava/lang/String;

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_1
    :goto_0
    const-string p1, "https://auto.tancdn.com/v1/raw/6b3f432c-10e8-4ccf-8482-230a304c68c711.pdf"

    .line 12
    .line 13
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->l:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->r:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->r:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->l:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 33
    .line 34
    const/4 v1, -0x1

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->n:Ll/wo0;

    .line 36
    .line 37
    invoke-virtual {v0, p1, v1, p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private p0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    const-string v0, ""

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->s:Ljava/lang/String;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method private q0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->l:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->l:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGAnimationView;->setAnimListener(Lcom/tantan/library/svga/AnimListener;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->j:Landroid/view/View;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->l:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->t0()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private t0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isSpeak:Z

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-static {p1}, Ll/guk0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->p:Ll/nsv;

    .line 21
    .line 22
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/l6o0;->d()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->p:Ll/nsv;

    .line 33
    .line 34
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p1, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->checkNeedChangeVoice()Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->s0()V

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void

    .line 80
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->t0()V

    .line 83
    .line 84
    .line 85
    return-void
.end method


# virtual methods
.method public getCallUser()Ll/nsv;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/nsv<",
            "Ll/h64;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->p:Ll/nsv;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/r7o0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/yau;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/high16 v0, 0x42b40000    # 90.0f

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Landroid/view/View;->setRotation(F)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 15
    .line 16
    const/high16 v1, -0x3f400000    # -6.0f

    .line 17
    .line 18
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v1, v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 24
    .line 25
    .line 26
    const/high16 v0, 0x42200000    # 40.0f

    .line 27
    .line 28
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    new-array v1, v1, [Landroid/view/View;

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    aput-object p0, v1, v2

    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    const/4 v0, 0x0

    .line 45
    invoke-virtual {v1, v0}, Landroid/view/View;->setRotation(F)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public m0(Ljava/lang/String;Ll/nsv;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "guideGoCallUser"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->f:Landroid/widget/ImageView;

    .line 12
    .line 13
    sget p2, Ll/obc0;->J2:I

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->f:Landroid/widget/ImageView;

    .line 19
    .line 20
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->d:Landroid/view/View;

    .line 24
    .line 25
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->d:Landroid/view/View;

    .line 29
    .line 30
    sget p2, Ll/obc0;->N:I

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 36
    .line 37
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->q:Ll/d55;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/d55;->b()V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->q0()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 50
    .line 51
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->f:Landroid/widget/ImageView;

    .line 55
    .line 56
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    invoke-static {p2}, Ll/f3t;->h(Ll/nsv;)Ll/nsv;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->p:Ll/nsv;

    .line 64
    .line 65
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 70
    .line 71
    const/high16 v3, 0x42680000    # 58.0f

    .line 72
    .line 73
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    new-instance v4, Ll/q7o0;

    .line 78
    .line 79
    invoke-direct {v4}, Ll/q7o0;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-static {v2, v3, p1, v4, v1}, Ll/biv;->c(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2}, Ll/l6o0;->d()Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_1

    .line 90
    .line 91
    iget-object p2, p2, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 92
    .line 93
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 94
    .line 95
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 96
    .line 97
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->checkNeedChangeVoice()Z

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    if-eqz p2, :cond_1

    .line 102
    .line 103
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 104
    .line 105
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->d:Landroid/view/View;

    .line 113
    .line 114
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->q:Ll/d55;

    .line 118
    .line 119
    invoke-virtual {p2, p1}, Ll/d55;->e(Ll/nsv;)V

    .line 120
    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->d:Landroid/view/View;

    .line 123
    .line 124
    const-string p1, "#382121"

    .line 125
    .line 126
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    invoke-static {p1}, Ll/fc2;->h(I)Landroid/graphics/drawable/GradientDrawable;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 139
    .line 140
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->d:Landroid/view/View;

    .line 148
    .line 149
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->q:Ll/d55;

    .line 153
    .line 154
    invoke-virtual {p0}, Ll/d55;->b()V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public n0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->q0()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->k:Lv/VDraweeView;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->p0()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public o0(Ll/usm0;Ljava/lang/String;ILjava/lang/String;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/usm0<",
            "*>;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->g:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 5
    .line 6
    .line 7
    invoke-static {p1}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {p1}, Ll/i9o0;->i(Ll/i6t;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->h:Lv/VLinear;

    .line 16
    .line 17
    const/high16 v4, 0x42200000    # 40.0f

    .line 18
    .line 19
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    invoke-virtual {v3, v4}, Landroid/view/View;->setMinimumHeight(I)V

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 27
    .line 28
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 29
    .line 30
    invoke-static {v4}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-eqz v4, :cond_0

    .line 35
    .line 36
    const/high16 v4, 0x40400000    # 3.0f

    .line 37
    .line 38
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const/4 v4, 0x0

    .line 44
    :goto_0
    invoke-static {v3, v4}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 45
    .line 46
    .line 47
    const-string v3, "anchor"

    .line 48
    .line 49
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    const/high16 v4, 0x41200000    # 10.0f

    .line 54
    .line 55
    if-eqz v3, :cond_2

    .line 56
    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Ll/rwn0;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/rwn0;->i3()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_1

    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 72
    .line 73
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->wf:I

    .line 74
    .line 75
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 80
    .line 81
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->uf:I

    .line 82
    .line 83
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 84
    .line 85
    .line 86
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 87
    .line 88
    sget p2, Ll/n9c0;->w1:I

    .line 89
    .line 90
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->g:Lv/VDraweeView;

    .line 98
    .line 99
    sget p2, Ll/n9c0;->B:I

    .line 100
    .line 101
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    invoke-static {p2, p3}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 114
    .line 115
    .line 116
    goto/16 :goto_4

    .line 117
    .line 118
    :cond_2
    const-string v3, "manager"

    .line 119
    .line 120
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    if-eqz v3, :cond_3

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->j0()V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 130
    .line 131
    sget p2, Ll/n9c0;->w1:I

    .line 132
    .line 133
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->g:Lv/VDraweeView;

    .line 141
    .line 142
    sget p2, Ll/n9c0;->z:I

    .line 143
    .line 144
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 145
    .line 146
    .line 147
    move-result p2

    .line 148
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 149
    .line 150
    .line 151
    move-result p3

    .line 152
    invoke-static {p2, p3}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 160
    .line 161
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->l7:I

    .line 162
    .line 163
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 164
    .line 165
    .line 166
    goto/16 :goto_4

    .line 167
    .line 168
    :cond_3
    const-string v3, "default"

    .line 169
    .line 170
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result p2

    .line 174
    if-eqz p2, :cond_4

    .line 175
    .line 176
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 177
    .line 178
    invoke-static {p2}, Ll/guk0;->j(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 179
    .line 180
    .line 181
    move-result p2

    .line 182
    if-eqz p2, :cond_4

    .line 183
    .line 184
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 185
    .line 186
    sget p2, Ll/n9c0;->w1:I

    .line 187
    .line 188
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 189
    .line 190
    .line 191
    move-result p2

    .line 192
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 193
    .line 194
    .line 195
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->g:Lv/VDraweeView;

    .line 196
    .line 197
    sget p2, Ll/n9c0;->A:I

    .line 198
    .line 199
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 200
    .line 201
    .line 202
    move-result p2

    .line 203
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 204
    .line 205
    .line 206
    move-result p3

    .line 207
    invoke-static {p2, p3}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 208
    .line 209
    .line 210
    move-result-object p2

    .line 211
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 212
    .line 213
    .line 214
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 215
    .line 216
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->jd:I

    .line 217
    .line 218
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 219
    .line 220
    .line 221
    goto :goto_3

    .line 222
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 223
    .line 224
    sget v3, Ll/n9c0;->p1:I

    .line 225
    .line 226
    invoke-static {v3}, Ll/n3d0;->a(I)I

    .line 227
    .line 228
    .line 229
    move-result v3

    .line 230
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 231
    .line 232
    .line 233
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->g:Lv/VDraweeView;

    .line 234
    .line 235
    sget v3, Ll/n9c0;->M:I

    .line 236
    .line 237
    invoke-static {v3}, Ll/n3d0;->a(I)I

    .line 238
    .line 239
    .line 240
    move-result v3

    .line 241
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 242
    .line 243
    .line 244
    move-result v4

    .line 245
    invoke-static {v3, v4}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 246
    .line 247
    .line 248
    move-result-object v3

    .line 249
    invoke-virtual {p2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 250
    .line 251
    .line 252
    invoke-static {p4}, Ll/guk0;->i(Ljava/lang/String;)Z

    .line 253
    .line 254
    .line 255
    move-result p2

    .line 256
    if-eqz p2, :cond_5

    .line 257
    .line 258
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 259
    .line 260
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->jd:I

    .line 261
    .line 262
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 263
    .line 264
    .line 265
    goto :goto_3

    .line 266
    :cond_5
    if-ne v1, p3, :cond_7

    .line 267
    .line 268
    if-nez v2, :cond_6

    .line 269
    .line 270
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    check-cast p1, Ll/rwn0;

    .line 275
    .line 276
    invoke-virtual {p1}, Ll/rwn0;->p()Z

    .line 277
    .line 278
    .line 279
    move-result p1

    .line 280
    if-nez p1, :cond_6

    .line 281
    .line 282
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 283
    .line 284
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->xf:I

    .line 285
    .line 286
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 287
    .line 288
    .line 289
    goto :goto_2

    .line 290
    :cond_6
    if-eqz v0, :cond_8

    .line 291
    .line 292
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 293
    .line 294
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->K6:I

    .line 295
    .line 296
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 297
    .line 298
    .line 299
    goto :goto_2

    .line 300
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 301
    .line 302
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object p2

    .line 306
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 307
    .line 308
    .line 309
    :cond_8
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->g:Lv/VDraweeView;

    .line 310
    .line 311
    sget p2, Ll/obc0;->O:I

    .line 312
    .line 313
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 314
    .line 315
    .line 316
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 317
    .line 318
    sget p2, Ll/n9c0;->p1:I

    .line 319
    .line 320
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 321
    .line 322
    .line 323
    move-result p2

    .line 324
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 325
    .line 326
    .line 327
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 328
    .line 329
    const/4 p2, 0x0

    .line 330
    invoke-virtual {p1, p2}, Landroid/view/View;->setRotation(F)V

    .line 331
    .line 332
    .line 333
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 334
    .line 335
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 336
    .line 337
    .line 338
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i:Lv/VText;

    .line 339
    .line 340
    const/4 p2, 0x1

    .line 341
    invoke-static {p1, p2}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 342
    .line 343
    .line 344
    :goto_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 345
    .line 346
    if-eqz p1, :cond_9

    .line 347
    .line 348
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 349
    .line 350
    if-eqz p1, :cond_9

    .line 351
    .line 352
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->g:Lv/VDraweeView;

    .line 353
    .line 354
    const/4 p2, 0x0

    .line 355
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 356
    .line 357
    .line 358
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->g:Lv/VDraweeView;

    .line 359
    .line 360
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 361
    .line 362
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 363
    .line 364
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->verticalBg:Ljava/lang/String;

    .line 365
    .line 366
    const/high16 p2, 0x41900000    # 18.0f

    .line 367
    .line 368
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 369
    .line 370
    .line 371
    move-result p2

    .line 372
    sget p3, Ll/qa00;->z:I

    .line 373
    .line 374
    const-string p4, "context_livingAct"

    .line 375
    .line 376
    invoke-static {p4, p1, p0, p2, p3}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 377
    .line 378
    .line 379
    :cond_9
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->n0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->n:Ll/wo0;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->setMaskUnLimit(Z)V

    .line 18
    .line 19
    .line 20
    const/high16 v0, 0x429c0000    # 78.0f

    .line 21
    .line 22
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    new-array v1, v1, [Landroid/view/View;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    aput-object p0, v1, v2

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/d55;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getCountDownProgressView()Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-direct {v0, v1}, Ll/d55;-><init>(Lcom/p1/mobile/putong/live/base/view/CircularProgressView;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->q:Ll/d55;

    .line 46
    .line 47
    return-void
.end method

.method public r0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->k0(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->p0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public s0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isSpeak:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->q0()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setCallInfo(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    const-string v0, "[live][voice]"

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const-string p1, "call is null"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->q0()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->k:Lv/VDraweeView;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->toJson()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->k:Lv/VDraweeView;

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 36
    .line 37
    const/high16 v1, 0x41400000    # 12.0f

    .line 38
    .line 39
    const-string v2, "context_livingAct"

    .line 40
    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 44
    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 48
    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->k:Lv/VDraweeView;

    .line 50
    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->defaultIcon:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    invoke-static {v2, v3, v0, v1}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    sget v0, Ll/obc0;->S9:I

    .line 64
    .line 65
    invoke-virtual {v3, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 70
    .line 71
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->k:Lv/VDraweeView;

    .line 72
    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->muteIcon:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    invoke-static {v2, v3, v0, v1}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_3
    sget v0, Ll/obc0;->R9:I

    .line 86
    .line 87
    invoke-virtual {v3, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 88
    .line 89
    .line 90
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->s0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 91
    .line 92
    .line 93
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->t0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method
