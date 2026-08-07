.class public Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;

.field public b:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public c:Lv/VText;

.field public d:Lv/VImage;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Landroid/widget/LinearLayout;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VDraweeView;

.field public m:Lv/VDraweeView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public q:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public r:Lv/VText;

.field public s:Ll/a3o0;


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

.method public static synthetic b(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/y20;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p3, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 4
    .line 5
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->inviteStatus:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "invited"

    .line 8
    .line 9
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    invoke-static {p1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Ljava/lang/String;
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
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/b0n0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public final f(Ljava/lang/String;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->h:Landroid/widget/LinearLayout;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->i:Lv/VImage;

    .line 21
    .line 22
    invoke-virtual {v2, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->h:Landroid/widget/LinearLayout;

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
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->j:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->j:Lv/VText;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->s:Ll/a3o0;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->s:Ll/a3o0;

    .line 28
    .line 29
    invoke-virtual {v0, p2}, Ll/a3o0;->v(Ll/cm0;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->s:Ll/a3o0;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->s:Ll/a3o0;

    .line 44
    .line 45
    invoke-virtual {p2}, Ll/a3o0;->i()V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->s:Ll/a3o0;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 57
    .line 58
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 59
    .line 60
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->q:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->s:Ll/a3o0;

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ll/a3o0;->s(Lcom/p1/mobile/putong/data/User;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public h(Ll/y20;Ll/y20;Ll/nsv;Ll/cm0;Ljava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/y20<",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;>;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;",
            "Ll/cm0;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p3}, Ll/nsv;->i()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {p5}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->f:Lv/VText;

    .line 19
    .line 20
    const-string v4, "#ccffffff"

    .line 21
    .line 22
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->b:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 30
    .line 31
    sget v4, Ll/qa00;->D:I

    .line 32
    .line 33
    new-instance v5, Ll/yzm0;

    .line 34
    .line 35
    invoke-direct {v5, v0}, Ll/yzm0;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v3, v4, p3, v5}, Ll/biv;->b(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;)V

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->f:Lv/VText;

    .line 42
    .line 43
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 49
    .line 50
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 55
    .line 56
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    invoke-virtual {p0, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->f(Ljava/lang/String;I)V

    .line 61
    .line 62
    .line 63
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->j:Lv/VText;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    const/4 v5, 0x1

    .line 70
    const/4 v6, 0x0

    .line 71
    if-nez v4, :cond_2

    .line 72
    .line 73
    if-nez v2, :cond_2

    .line 74
    .line 75
    move v4, v5

    .line 76
    goto :goto_0

    .line 77
    :cond_2
    move v4, v6

    .line 78
    :goto_0
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->r:Lv/VText;

    .line 82
    .line 83
    invoke-static {v3, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, p3, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->k(Ll/nsv;Z)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, p3, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->i(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Z)V

    .line 90
    .line 91
    .line 92
    iget-object v2, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 95
    .line 96
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 97
    .line 98
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->j(Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->m:Lv/VDraweeView;

    .line 102
    .line 103
    invoke-static {v2, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, v0, p4}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->g(Lcom/p1/mobile/putong/data/User;Ll/cm0;)V

    .line 107
    .line 108
    .line 109
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->k:Landroid/widget/TextView;

    .line 110
    .line 111
    invoke-static {p4, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    sget-object p4, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_BOSS:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {p4, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p4

    .line 120
    if-eqz p4, :cond_3

    .line 121
    .line 122
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result p4

    .line 126
    if-eqz p4, :cond_3

    .line 127
    .line 128
    iget p4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 129
    .line 130
    sget p5, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_NINE_MIC_BOSS_POSITION:I

    .line 131
    .line 132
    if-ne p4, p5, :cond_3

    .line 133
    .line 134
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->f:Lv/VText;

    .line 135
    .line 136
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 137
    .line 138
    .line 139
    move-result-object p5

    .line 140
    sget v2, Ll/n9c0;->P0:I

    .line 141
    .line 142
    invoke-virtual {p5, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 143
    .line 144
    .line 145
    move-result p5

    .line 146
    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 147
    .line 148
    .line 149
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->c:Lv/VText;

    .line 150
    .line 151
    invoke-static {p4, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->d:Lv/VImage;

    .line 155
    .line 156
    invoke-static {p4, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_3
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->f:Lv/VText;

    .line 161
    .line 162
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 163
    .line 164
    .line 165
    move-result-object p5

    .line 166
    sget v2, Ll/n9c0;->e1:I

    .line 167
    .line 168
    invoke-virtual {p5, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 169
    .line 170
    .line 171
    move-result p5

    .line 172
    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 173
    .line 174
    .line 175
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->d:Lv/VImage;

    .line 176
    .line 177
    invoke-static {p4, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 178
    .line 179
    .line 180
    :goto_1
    new-instance p4, Ll/zzm0;

    .line 181
    .line 182
    invoke-direct {p4, p1, v0}, Ll/zzm0;-><init>(Ll/y20;Lcom/p1/mobile/putong/data/User;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p0, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    .line 187
    .line 188
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->r:Lv/VText;

    .line 189
    .line 190
    new-instance p1, Ll/a0n0;

    .line 191
    .line 192
    invoke-direct {p1, p3, v1, p2}, Ll/a0n0;-><init>(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/y20;)V

    .line 193
    .line 194
    .line 195
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public final i(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Z)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz p2, :cond_1

    .line 9
    .line 10
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    if-nez v4, :cond_0

    .line 19
    .line 20
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-nez v4, :cond_0

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->r:Lv/VText;

    .line 33
    .line 34
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object v2, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 41
    .line 42
    iget-boolean v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->isManager:Z

    .line 43
    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-nez v2, :cond_1

    .line 51
    .line 52
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-nez v2, :cond_1

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->r:Lv/VText;

    .line 59
    .line 60
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-nez v2, :cond_2

    .line 69
    .line 70
    iget-object v2, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 73
    .line 74
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->reference:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_2

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->r:Lv/VText;

    .line 83
    .line 84
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    invoke-static {p2}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    const-string v0, "#ffffff"

    .line 93
    .line 94
    const-string v1, "#CCffffff"

    .line 95
    .line 96
    if-eqz p2, :cond_4

    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->r:Lv/VText;

    .line 99
    .line 100
    sget p2, Ll/obc0;->U0:I

    .line 101
    .line 102
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->r:Lv/VText;

    .line 106
    .line 107
    if-eqz p3, :cond_3

    .line 108
    .line 109
    move-object v0, v1

    .line 110
    :cond_3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->r:Lv/VText;

    .line 118
    .line 119
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ki:I

    .line 120
    .line 121
    invoke-static {p2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_4
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 130
    .line 131
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 132
    .line 133
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->inviteStatus:Ljava/lang/String;

    .line 134
    .line 135
    const-string p2, "invited"

    .line 136
    .line 137
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->r:Lv/VText;

    .line 142
    .line 143
    if-eqz p1, :cond_5

    .line 144
    .line 145
    sget p1, Ll/obc0;->U0:I

    .line 146
    .line 147
    invoke-virtual {p2, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->r:Lv/VText;

    .line 151
    .line 152
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    sget p3, Ll/n9c0;->j1:I

    .line 157
    .line 158
    invoke-static {p2, p3}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 159
    .line 160
    .line 161
    move-result p2

    .line 162
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->r:Lv/VText;

    .line 166
    .line 167
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Gh:I

    .line 168
    .line 169
    invoke-static {p2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    .line 175
    .line 176
    goto :goto_0

    .line 177
    :cond_5
    sget p1, Ll/obc0;->z0:I

    .line 178
    .line 179
    invoke-virtual {p2, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->r:Lv/VText;

    .line 183
    .line 184
    if-eqz p3, :cond_6

    .line 185
    .line 186
    move-object v0, v1

    .line 187
    :cond_6
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 188
    .line 189
    .line 190
    move-result p2

    .line 191
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->r:Lv/VText;

    .line 195
    .line 196
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Fh:I

    .line 197
    .line 198
    invoke-static {p2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p2

    .line 202
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 203
    .line 204
    .line 205
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->r:Lv/VText;

    .line 206
    .line 207
    const/4 p1, 0x1

    .line 208
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 209
    .line 210
    .line 211
    return-void
.end method

.method public final j(Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V
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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->l:Lv/VDraweeView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->l:Lv/VDraweeView;

    .line 33
    .line 34
    invoke-static {p1, p0, v0}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->l:Lv/VDraweeView;

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

.method public final k(Ll/nsv;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->c:Lv/VText;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const-string v1, "#CCffffff"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v1, "#ffffff"

    .line 9
    .line 10
    :goto_0
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ll/nsv;->i()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->c:Lv/VText;

    .line 29
    .line 30
    sget v0, Ll/obc0;->s0:I

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->c:Lv/VText;

    .line 36
    .line 37
    if-eqz p2, :cond_1

    .line 38
    .line 39
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->wf:I

    .line 40
    .line 41
    invoke-static {p2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->uf:I

    .line 50
    .line 51
    invoke-static {p2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->c:Lv/VText;

    .line 59
    .line 60
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 67
    .line 68
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->isManager:Z

    .line 69
    .line 70
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->c:Lv/VText;

    .line 71
    .line 72
    if-eqz p1, :cond_3

    .line 73
    .line 74
    sget p1, Ll/obc0;->B:I

    .line 75
    .line 76
    invoke-virtual {p2, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->c:Lv/VText;

    .line 80
    .line 81
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->l7:I

    .line 82
    .line 83
    invoke-static {p2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->c:Lv/VText;

    .line 91
    .line 92
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_3
    const/4 p0, 0x0

    .line 97
    invoke-static {p2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/manager/VoiceCallMemberManagerItemView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
