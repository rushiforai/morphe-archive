.class public Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;

.field public b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public c:Lv/VText;

.field public d:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

.field public g:Lv/VLinear;

.field public h:Lv/VLinear;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VDraweeView;

.field public m:Lv/VDraweeView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public q:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public r:Lv/VImage;

.field public s:Lv/VText;

.field public t:Ll/x3t;


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

.method public static synthetic a(Ll/y20;Lcom/p1/mobile/putong/data/User;ZLandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/v1n0;->o()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Ll/v1n0;->p()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/o3o0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->c:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Ll/okc0;->e(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lv/VText;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final e(D)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->s:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->s:Lv/VText;

    .line 8
    .line 9
    const-string v1, "#ff8817"

    .line 10
    .line 11
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/xau;->B()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->s:Lv/VText;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    new-instance p0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, p2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 39
    .line 40
    sget-object p2, Ll/htd0;->f:Ll/htd0;

    .line 41
    .line 42
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    check-cast p2, Ll/civ;

    .line 47
    .line 48
    invoke-virtual {p2}, Ll/civ;->n()Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-eqz p2, :cond_0

    .line 53
    .line 54
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Td:I

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->W5:I

    .line 58
    .line 59
    :goto_0
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    invoke-static {p1, p2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->s:Lv/VText;

    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 88
    .line 89
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Ll/civ;

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/civ;->n()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    sget v0, Ll/obc0;->k3:I

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_2
    sget v0, Ll/obc0;->n:I

    .line 105
    .line 106
    :goto_1
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-static {p1, p2}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->s:Lv/VText;

    .line 114
    .line 115
    sget p1, Ll/qa00;->c:I

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public final f(Ljava/lang/String;ILcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->h:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    const-string v0, "male"

    .line 8
    .line 9
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    sget v2, Ll/obc0;->V5:I

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget v2, Ll/obc0;->T5:I

    .line 19
    .line 20
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->i:Lv/VImage;

    .line 21
    .line 22
    invoke-virtual {v3, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->h:Lv/VLinear;

    .line 26
    .line 27
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    const p1, -0xa18f02

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    const p1, -0x7c767

    .line 38
    .line 39
    .line 40
    :goto_1
    const/high16 v0, 0x40a00000    # 5.0f

    .line 41
    .line 42
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    int-to-float v0, v0

    .line 47
    invoke-static {p1, v0}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {v2, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 52
    .line 53
    .line 54
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->j:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->j:Lv/VText;

    .line 62
    .line 63
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->j:Lv/VText;

    .line 71
    .line 72
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    xor-int/2addr p1, v1

    .line 77
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/data/User;Ll/cm0;)V
    .locals 5
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/cm0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->t:Ll/x3t;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    new-instance v0, Ll/x3t;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-direct {v0, v1}, Ll/x3t;-><init>(Z)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->t:Ll/x3t;

    .line 28
    .line 29
    invoke-virtual {v0, p2}, Ll/x3t;->E(Ll/cm0;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->t:Ll/x3t;

    .line 33
    .line 34
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    invoke-virtual {p2, v0}, Ll/x3t;->C(Ll/ner;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->t:Ll/x3t;

    .line 44
    .line 45
    invoke-virtual {p2}, Ll/x3t;->l()V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->t:Ll/x3t;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 57
    .line 58
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 59
    .line 60
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->q:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 61
    .line 62
    filled-new-array {v1, v2, v3, v4}, [Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {p2, v0, v1}, Ll/x3t;->k(Landroid/content/Context;[Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->t:Ll/x3t;

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ll/x3t;->y(Lcom/p1/mobile/putong/data/User;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->l:Lv/VDraweeView;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->grade:J

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/kny;->a(J)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    sget v0, Ll/i0k;->b:I

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    sget v0, Ll/i0k;->a:I

    .line 29
    .line 30
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->l:Lv/VDraweeView;

    .line 33
    .line 34
    invoke-static {p1, p0, v0}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->l:Lv/VDraweeView;

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public i(Ll/y20;Ll/nsv;Ll/cm0;Z)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;",
            "Ll/cm0;",
            "Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->m:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->c:Lv/VText;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->d:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 19
    .line 20
    const/high16 v2, 0x422c0000    # 43.0f

    .line 21
    .line 22
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-static {v0, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->e:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    const/high16 v2, 0x42ce0000    # 103.0f

    .line 32
    .line 33
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-static {v0, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 43
    .line 44
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rank:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->d(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->user:Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->d:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 59
    .line 60
    sget v3, Ll/qa00;->A:I

    .line 61
    .line 62
    new-instance v4, Ll/m3o0;

    .line 63
    .line 64
    invoke-direct {v4, v0}, Ll/m3o0;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v2, v3, p2, v4}, Ll/biv;->b(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;)V

    .line 68
    .line 69
    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->f:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 71
    .line 72
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 73
    .line 74
    const-string v4, "#e6ffffff"

    .line 75
    .line 76
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    iget-object v5, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 81
    .line 82
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 83
    .line 84
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->userNameGradientColors:Ljava/util/List;

    .line 85
    .line 86
    invoke-static {v2, v3, v4, v5}, Ll/und0;->b(Landroid/widget/TextView;Ljava/lang/CharSequence;ILjava/util/List;)V

    .line 87
    .line 88
    .line 89
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 90
    .line 91
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 96
    .line 97
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    invoke-virtual {p0, v2, v3, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->f(Ljava/lang/String;ILcom/p1/mobile/putong/data/User;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, v0, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->g(Lcom/p1/mobile/putong/data/User;Ll/cm0;)V

    .line 105
    .line 106
    .line 107
    iget-object p3, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 108
    .line 109
    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 110
    .line 111
    iget-wide v2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->amount:D

    .line 112
    .line 113
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->e(D)V

    .line 114
    .line 115
    .line 116
    new-instance p3, Ll/n3o0;

    .line 117
    .line 118
    invoke-direct {p3, p1, v0, p4}, Ll/n3o0;-><init>(Ll/y20;Lcom/p1/mobile/putong/data/User;Z)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 125
    .line 126
    move-object p2, p1

    .line 127
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 128
    .line 129
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 130
    .line 131
    if-eqz p2, :cond_1

    .line 132
    .line 133
    move-object p2, p1

    .line 134
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 135
    .line 136
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 137
    .line 138
    iget-wide p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->grade:J

    .line 139
    .line 140
    const-wide/16 v2, 0x0

    .line 141
    .line 142
    cmp-long p2, p2, v2

    .line 143
    .line 144
    if-lez p2, :cond_1

    .line 145
    .line 146
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 147
    .line 148
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 149
    .line 150
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->h(Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->l:Lv/VDraweeView;

    .line 155
    .line 156
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceLiveMemberItem;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
