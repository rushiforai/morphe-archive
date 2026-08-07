.class public Ll/w6j;
.super Ll/em2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/em2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlLiveCardPartDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;->getCurrentVoice()Lcom/p1/mobile/putong/core/data/Voice;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Voice;->voiceRoomId:Ljava/lang/String;

    .line 42
    .line 43
    const-string v1, "suggest-card"

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-interface {v0, p1, p0, v1, v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->wd(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-static {}, Ll/w6j;->q()V

    .line 50
    .line 51
    .line 52
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->g2:Lrx/subjects/b;

    .line 57
    .line 58
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static q()V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const-string v1, "intl_card_audio_ux"

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    filled-new-array {v0}, [Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "e_intl_card_audio"

    .line 17
    .line 18
    const-string v2, "p_suggest_users_home_view"

    .line 19
    .line 20
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/oql;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/w6j;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V
    .locals 1

    .line 1
    invoke-super/range {p0 .. p5}, Ll/em2;->c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 5
    .line 6
    const/4 p5, 0x1

    .line 7
    invoke-virtual {p3, p5}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a(Z)V

    .line 8
    .line 9
    .line 10
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlVoiceLayout;

    .line 11
    .line 12
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlVoiceLayout;->d:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 13
    .line 14
    invoke-virtual {p0, p3, p1, p4}, Ll/em2;->k(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;I)V

    .line 15
    .line 16
    .line 17
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 18
    .line 19
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlVoiceLayout;->f:Lv/VDraweeView;

    .line 20
    .line 21
    const-string p4, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik4zSk1HV01CNFVUMzVZS1lDR05SN1FTWVdKVU1KNjEzIiwidyI6OTgxLCJoIjoyNjQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyODkzNjA2OTEzNTIzMDY2OTJ9.png"

    .line 22
    .line 23
    invoke-virtual {p0, p3, p4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 37
    .line 38
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlVoiceLayout;->j:Lv/VDraweeView;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object p4

    .line 44
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 45
    .line 46
    .line 47
    move-result-object p4

    .line 48
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 49
    .line 50
    .line 51
    move-result-object p4

    .line 52
    invoke-virtual {p0, p3, p4}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlVoiceLayout;->k:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 56
    .line 57
    new-instance p3, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;

    .line 58
    .line 59
    invoke-direct {p3}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string p4, "core_intl_voice_card_head.svga"

    .line 63
    .line 64
    const/4 v0, -0x1

    .line 65
    invoke-virtual {p0, p4, v0, p3, p5}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;->loadAnimWithListener(Ljava/lang/String;ILcom/tantanapp/media/ttmediaeffect/anim/AnimListener;Z)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlVoiceLayout;->g:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 69
    .line 70
    new-instance p3, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;

    .line 71
    .line 72
    invoke-direct {p3}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;-><init>()V

    .line 73
    .line 74
    .line 75
    const-string p4, "core_intl_voice_card_bg.svga"

    .line 76
    .line 77
    invoke-virtual {p0, p4, v0, p3, p5}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;->loadAnimWithListener(Ljava/lang/String;ILcom/tantanapp/media/ttmediaeffect/anim/AnimListener;Z)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlVoiceLayout;->h:Lv/VLinear;

    .line 81
    .line 82
    new-instance p2, Ll/v6j;

    .line 83
    .line 84
    invoke-direct {p2, p1}, Ll/v6j;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public d(Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/em2;->d(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 6
    .line 7
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 8
    .line 9
    return-void
.end method

.method public g()I
    .locals 0

    .line 1
    const/high16 p0, 0x430a0000    # 138.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    sget p0, Ll/qa00;->R:I

    .line 2
    .line 3
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 p2, 0x0

    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object p4

    .line 20
    iget-object p4, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->M6(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 31
    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    return p2

    .line 35
    :cond_0
    const/high16 p0, 0x42f20000    # 121.0f

    .line 36
    .line 37
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {p1, p3, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->v(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;I)V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    return p0

    .line 46
    :cond_1
    return p2
.end method
