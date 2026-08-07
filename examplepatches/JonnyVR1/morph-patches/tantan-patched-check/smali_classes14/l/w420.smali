.class public Ll/w420;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/r420;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/VText;

.field public c:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public e:Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public k:Lv/VDraweeView;

.field public l:Landroid/view/View;

.field public m:Landroid/view/View;

.field public n:Lv/VDraweeView;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;",
            ">;"
        }
    .end annotation
.end field

.field public r:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;",
            ">;"
        }
    .end annotation
.end field

.field public s:Landroid/animation/ObjectAnimator;

.field public t:Landroid/animation/ObjectAnimator;


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

.method public static synthetic a(Ll/w420;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w420;->m(I)V

    return-void
.end method

.method public static synthetic b(Ll/w420;Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w420;->n(Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/w420;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w420;->p(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic d(Ll/w420;)Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w420;->s:Landroid/animation/ObjectAnimator;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/w420;Landroid/animation/ObjectAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w420;->s:Landroid/animation/ObjectAnimator;

    return-void
.end method

.method public static bridge synthetic f(Ll/w420;Lv/VDraweeView;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/w420;->j(Lv/VDraweeView;II)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/w420;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/w420;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w420;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/w420;->t:Landroid/animation/ObjectAnimator;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/w420;->s:Landroid/animation/ObjectAnimator;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/x420;->b(Ll/w420;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/r420;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w420;->k(Ll/r420;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w420;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j(Lv/VDraweeView;II)V
    .locals 2

    .line 1
    new-instance p2, Landroidx/constraintlayout/widget/a;

    .line 2
    .line 3
    invoke-direct {p2}, Landroidx/constraintlayout/widget/a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/w420;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 7
    .line 8
    invoke-virtual {p2, v0}, Landroidx/constraintlayout/widget/a;->c(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p2, p1, p3}, Landroidx/constraintlayout/widget/a;->g(II)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/w420;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 19
    .line 20
    invoke-virtual {p2, p1}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/w420;->k:Lv/VDraweeView;

    .line 24
    .line 25
    new-instance p2, Ll/u420;

    .line 26
    .line 27
    invoke-direct {p2, p0, p3}, Ll/u420;-><init>(Ll/w420;I)V

    .line 28
    .line 29
    .line 30
    const-wide/16 v0, 0x3e8

    .line 31
    .line 32
    invoke-virtual {p1, p2, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public k(Ll/r420;)V
    .locals 0

    .line 1
    return-void
.end method

.method public l(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w420;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    xor-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic m(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/w420;->k:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/w420;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr p1, v1

    .line 10
    int-to-float p1, p1

    .line 11
    const/4 v1, 0x2

    .line 12
    new-array v2, v1, [F

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    const/4 v4, 0x0

    .line 16
    aput v3, v2, v4

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    aput p1, v2, v3

    .line 20
    .line 21
    const-string p1, "TranslationY"

    .line 22
    .line 23
    invoke-static {v0, p1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-wide/16 v2, 0x1f40

    .line 28
    .line 29
    invoke-virtual {p1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Ll/w420;->t:Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    const/4 v0, -0x1

    .line 36
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/w420;->t:Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/w420;->t:Landroid/animation/ObjectAnimator;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w420;->q:Ll/y20;

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

.method public final synthetic p(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w420;->r:Ll/y20;

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

.method public q(Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/w420;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    sget v1, Ll/qa00;->i:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/w420;->k:Lv/VDraweeView;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->background:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v2, Ll/w420$b;

    .line 13
    .line 14
    invoke-direct {v2, p0}, Ll/w420$b;-><init>(Ll/w420;)V

    .line 15
    .line 16
    .line 17
    const-string v3, "context_square"

    .line 18
    .line 19
    invoke-static {v3, v0, v1, v2}, Ll/izs;->w(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/w420;->n:Lv/VDraweeView;

    .line 23
    .line 24
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->anchorAvatar:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v3, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/w420;->o:Lv/VText;

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->title:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/w420;->p:Lv/VText;

    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->subTitle:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/w420;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 44
    .line 45
    new-instance v1, Ll/s420;

    .line 46
    .line 47
    invoke-direct {v1, p0, p1}, Ll/s420;-><init>(Ll/w420;Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public s(Ll/pf60;Ll/y20;Ll/y20;Ljava/lang/String;)V
    .locals 11
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
    iget-object v0, p0, Ll/w420;->b:Lv/VText;

    .line 2
    .line 3
    const v1, -0xdededf

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/w420;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/w420;->b:Lv/VText;

    .line 16
    .line 17
    sget-object v1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/w420;->b:Lv/VText;

    .line 24
    .line 25
    sget-object v1, Ll/tbs;->b:Ll/vwt;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/vwt;->R4()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 35
    .line 36
    const/16 v1, 0x8

    .line 37
    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 41
    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    iget-object p0, p0, Ll/w420;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 45
    .line 46
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    iget-object v0, p0, Ll/w420;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 51
    .line 52
    const/4 v3, 0x0

    .line 53
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 57
    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    move-object v4, v0

    .line 61
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    .line 62
    .line 63
    iget-object v6, v4, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->anchorId:Ljava/lang/String;

    .line 64
    .line 65
    move-object v4, v0

    .line 66
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    .line 67
    .line 68
    iget-object v7, v4, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->liveId:Ljava/lang/String;

    .line 69
    .line 70
    move-object v4, v0

    .line 71
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    .line 72
    .line 73
    iget-object v8, v4, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->status:Ljava/lang/String;

    .line 74
    .line 75
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 78
    .line 79
    iget-object v9, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->role:Ljava/lang/String;

    .line 80
    .line 81
    const/4 v5, 0x0

    .line 82
    move-object v10, p4

    .line 83
    invoke-static/range {v5 .. v10}, Ll/gfj0;->e(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object p4, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast p4, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    .line 89
    .line 90
    invoke-virtual {p0, p4}, Ll/w420;->q(Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;)V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_1
    iget-object p4, p0, Ll/w420;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 95
    .line 96
    invoke-virtual {p4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 97
    .line 98
    .line 99
    :goto_0
    iget-object p4, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 100
    .line 101
    if-eqz p4, :cond_3

    .line 102
    .line 103
    move-object v0, p4

    .line 104
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    .line 105
    .line 106
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 107
    .line 108
    move-object v0, p4

    .line 109
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    .line 110
    .line 111
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 112
    .line 113
    check-cast p4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    .line 114
    .line 115
    iget-object v8, p4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 116
    .line 117
    const/4 v9, 0x1

    .line 118
    const/4 v4, 0x1

    .line 119
    const/4 v7, 0x0

    .line 120
    invoke-static/range {v4 .. v9}, Ll/gfj0;->h(ZLjava/lang/String;Ljava/lang/String;ZLjava/lang/String;Z)V

    .line 121
    .line 122
    .line 123
    iget-object p4, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 124
    .line 125
    check-cast p4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    .line 126
    .line 127
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 128
    .line 129
    if-nez p1, :cond_2

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_2
    move v2, v3

    .line 133
    :goto_1
    invoke-virtual {p0, p4, v2}, Ll/w420;->u(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;Z)V

    .line 134
    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_3
    iget-object p1, p0, Ll/w420;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 138
    .line 139
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 140
    .line 141
    .line 142
    :goto_2
    iput-object p2, p0, Ll/w420;->q:Ll/y20;

    .line 143
    .line 144
    iput-object p3, p0, Ll/w420;->r:Ll/y20;

    .line 145
    .line 146
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/w420;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/w420;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    sget v2, Ll/qa00;->i:I

    .line 10
    .line 11
    invoke-static {v0, v2}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/w420;->h:Lv/VText;

    .line 15
    .line 16
    const/16 v2, 0x8

    .line 17
    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    move v3, v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v3, v2

    .line 23
    :goto_0
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/w420;->i:Lv/VText;

    .line 27
    .line 28
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->isPersonal:Z

    .line 29
    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    move v2, v1

    .line 33
    :cond_1
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/w420;->f:Lv/VText;

    .line 37
    .line 38
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->title:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    if-nez p2, :cond_2

    .line 45
    .line 46
    iget-boolean p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->needBuild:Z

    .line 47
    .line 48
    if-eqz p2, :cond_2

    .line 49
    .line 50
    iget-object p2, p0, Ll/w420;->g:Lv/VText;

    .line 51
    .line 52
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object p2, p0, Ll/w420;->g:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    sget v3, Ll/nbc0;->a0:I

    .line 64
    .line 65
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {p2, v0, v0, v2, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 70
    .line 71
    .line 72
    iget-object p2, p0, Ll/w420;->g:Lv/VText;

    .line 73
    .line 74
    const/16 v2, 0x11

    .line 75
    .line 76
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_2
    iget-object p2, p0, Ll/w420;->g:Lv/VText;

    .line 81
    .line 82
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    iget-object p2, p0, Ll/w420;->h:Lv/VText;

    .line 88
    .line 89
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    :goto_1
    iget-boolean p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->needBuild:Z

    .line 95
    .line 96
    if-eqz p2, :cond_3

    .line 97
    .line 98
    iget-object p2, p0, Ll/w420;->h:Lv/VText;

    .line 99
    .line 100
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    sget v3, Ll/nbc0;->a0:I

    .line 105
    .line 106
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {p2, v0, v0, v2, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 111
    .line 112
    .line 113
    :cond_3
    iget-object p2, p0, Ll/w420;->e:Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;

    .line 114
    .line 115
    const/high16 v0, 0x42400000    # 48.0f

    .line 116
    .line 117
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->setRadius(F)V

    .line 118
    .line 119
    .line 120
    iget-object p2, p0, Ll/w420;->e:Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;

    .line 121
    .line 122
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 123
    .line 124
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->p0(Ljava/util/List;Z)V

    .line 125
    .line 126
    .line 127
    iget-object p2, p0, Ll/w420;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 128
    .line 129
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 130
    .line 131
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 132
    .line 133
    .line 134
    iget-object p2, p0, Ll/w420;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 135
    .line 136
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->background:Ljava/lang/String;

    .line 137
    .line 138
    new-instance v1, Ll/w420$a;

    .line 139
    .line 140
    invoke-direct {v1, p0}, Ll/w420$a;-><init>(Ll/w420;)V

    .line 141
    .line 142
    .line 143
    const/4 v2, 0x1

    .line 144
    const/4 v3, -0x1

    .line 145
    invoke-virtual {p2, v0, v3, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->g(Ljava/lang/String;ILl/wo0;Z)V

    .line 146
    .line 147
    .line 148
    iget-object p2, p0, Ll/w420;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 149
    .line 150
    new-instance v0, Ll/t420;

    .line 151
    .line 152
    invoke-direct {v0, p0, p1}, Ll/t420;-><init>(Ll/w420;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;)V

    .line 153
    .line 154
    .line 155
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method
