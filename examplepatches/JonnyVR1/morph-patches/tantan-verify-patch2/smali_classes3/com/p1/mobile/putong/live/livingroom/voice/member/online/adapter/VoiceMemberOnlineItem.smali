.class public Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;

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

.field public t:Ll/a3o0;


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

.method public static synthetic a(Ll/y20;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Ljava/lang/String;
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
    invoke-static {p0, p1}, Ll/s8o0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->h:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->s:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->l:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->m:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->q:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->k:Landroid/widget/TextView;

    .line 43
    .line 44
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final e(Ljava/lang/String;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->h:Lv/VLinear;

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
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    sget v1, Ll/obc0;->V5:I

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget v1, Ll/obc0;->T5:I

    .line 19
    .line 20
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->i:Lv/VImage;

    .line 21
    .line 22
    invoke-virtual {v2, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->h:Lv/VLinear;

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
    invoke-virtual {v1, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->j:Lv/VText;

    .line 55
    .line 56
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->j:Lv/VText;

    .line 62
    .line 63
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/data/User;Ll/cm0;)V
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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->t:Ll/a3o0;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    new-instance v0, Ll/a3o0;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-direct {v0, v1}, Ll/a3o0;-><init>(Z)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->t:Ll/a3o0;

    .line 28
    .line 29
    invoke-virtual {v0, p2}, Ll/a3o0;->v(Ll/cm0;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->t:Ll/a3o0;

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
    invoke-virtual {p2, v0}, Ll/a3o0;->t(Ll/ner;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->t:Ll/a3o0;

    .line 44
    .line 45
    invoke-virtual {p2}, Ll/a3o0;->i()V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->t:Ll/a3o0;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 57
    .line 58
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 59
    .line 60
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->q:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 61
    .line 62
    filled-new-array {v1, v2, v3, v4}, [Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {p2, v0, v1}, Ll/a3o0;->h(Landroid/content/Context;[Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->t:Ll/a3o0;

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ll/a3o0;->s(Lcom/p1/mobile/putong/data/User;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public g(Ll/y20;Ll/nsv;Ll/cm0;ZLjava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;",
            "Ll/cm0;",
            "Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->d:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 9
    .line 10
    sget v2, Ll/qa00;->D:I

    .line 11
    .line 12
    new-instance v3, Ll/q8o0;

    .line 13
    .line 14
    invoke-direct {v3, v0}, Ll/q8o0;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1, v2, p2, v3}, Ll/biv;->b(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p2}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ll/e3t;->d()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->f:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 29
    .line 30
    const/4 v4, 0x1

    .line 31
    const-string v5, "#e6ffffff"

    .line 32
    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    iget-object p2, v1, Ll/e3t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 36
    .line 37
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    iget-object p4, v1, Ll/e3t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 44
    .line 45
    iget-object p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userNameGradientColors:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {v3, p2, p3, p4}, Ll/und0;->b(Landroid/widget/TextView;Ljava/lang/CharSequence;ILjava/util/List;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->d()V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->r:Lv/VImage;

    .line 54
    .line 55
    invoke-static {p2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    iget-object v5, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 68
    .line 69
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->userNameGradientColors:Ljava/util/List;

    .line 70
    .line 71
    invoke-static {v3, v1, v2, v5}, Ll/und0;->b(Landroid/widget/TextView;Ljava/lang/CharSequence;ILjava/util/List;)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->r:Lv/VImage;

    .line 75
    .line 76
    const/4 v2, 0x0

    .line 77
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 81
    .line 82
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 87
    .line 88
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    invoke-virtual {p0, v1, v3}, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->e(Ljava/lang/String;I)V

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->j:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-nez v3, :cond_2

    .line 102
    .line 103
    invoke-static {p5}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    if-nez v3, :cond_2

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    move v4, v2

    .line 111
    :goto_0
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0, v0, p4, p5}, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->h(Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget-object p2, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 118
    .line 119
    move-object p4, p2

    .line 120
    check-cast p4, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 121
    .line 122
    iget-object p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 123
    .line 124
    if-eqz p4, :cond_3

    .line 125
    .line 126
    move-object p4, p2

    .line 127
    check-cast p4, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 128
    .line 129
    iget-object p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 130
    .line 131
    iget-wide p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->grade:J

    .line 132
    .line 133
    const-wide/16 v3, 0x0

    .line 134
    .line 135
    cmp-long p4, p4, v3

    .line 136
    .line 137
    if-lez p4, :cond_3

    .line 138
    .line 139
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 140
    .line 141
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 142
    .line 143
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->i(Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V

    .line 144
    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->l:Lv/VDraweeView;

    .line 148
    .line 149
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 150
    .line 151
    .line 152
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->m:Lv/VDraweeView;

    .line 153
    .line 154
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p0, v0, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->f(Lcom/p1/mobile/putong/data/User;Ll/cm0;)V

    .line 158
    .line 159
    .line 160
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->k:Landroid/widget/TextView;

    .line 161
    .line 162
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 163
    .line 164
    .line 165
    :goto_2
    new-instance p2, Ll/r8o0;

    .line 166
    .line 167
    invoke-direct {p2, p1, v0}, Ll/r8o0;-><init>(Ll/y20;Lcom/p1/mobile/putong/data/User;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p3}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->s:Lv/VText;

    .line 6
    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p3, 0x1

    .line 15
    invoke-static {v0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 19
    .line 20
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 21
    .line 22
    invoke-static {v0, p3}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz p2, :cond_2

    .line 27
    .line 28
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 29
    .line 30
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 31
    .line 32
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-nez p2, :cond_2

    .line 39
    .line 40
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 41
    .line 42
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 43
    .line 44
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 51
    .line 52
    if-eqz p2, :cond_1

    .line 53
    .line 54
    iget-object p2, v1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 55
    .line 56
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 57
    .line 58
    :goto_0
    move-object v0, p2

    .line 59
    goto :goto_1

    .line 60
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v1, " "

    .line 73
    .line 74
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    goto :goto_0

    .line 85
    :cond_2
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->s:Lv/VText;

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->s:Lv/VText;

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    xor-int/2addr p1, p3

    .line 97
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V
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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->l:Lv/VDraweeView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->l:Lv/VDraweeView;

    .line 33
    .line 34
    invoke-static {p1, p0, v0}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->l:Lv/VDraweeView;

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

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/member/online/adapter/VoiceMemberOnlineItem;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
