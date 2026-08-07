.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VImage;

.field public i:Lv/VImage;

.field public j:Lv/VImage;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VDraweeView;

.field public q:Lv/VText;

.field public r:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public s:Landroid/animation/ObjectAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->r:Lrx/subjects/b;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic h0(Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->q0()V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->o0(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;DLcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->p0(DLcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Ljava/lang/Long;)V

    return-void
.end method


# virtual methods
.method public final l0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/yds;->a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final m0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->s:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->s:Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final n0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->g:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->g:Landroid/widget/LinearLayout;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic o0(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->l:Lv/VText;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->r:Lrx/subjects/b;

    .line 5
    .line 6
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->m0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->l0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p0(DLcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Double;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide p1

    .line 9
    const/4 p4, 0x1

    .line 10
    invoke-static {p1, p2, p4}, Ll/kdu;->P(JZ)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->u0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->l:Lv/VText;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->h4:I

    .line 31
    .line 32
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p3, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic q0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->j:Lv/VImage;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public r0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->m0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->n0()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->d:Lv/VImage;

    .line 8
    .line 9
    sget v1, Ll/obc0;->U1:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->e:Lv/VText;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->o:Lv/VText;

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->p:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->q:Lv/VText;

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->k:Lv/VText;

    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->m:Lv/VText;

    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->n:Lv/VText;

    .line 46
    .line 47
    const/4 v2, 0x1

    .line 48
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->l:Lv/VText;

    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->f:Lv/VText;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

    .line 59
    .line 60
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    xor-int/2addr p1, v2

    .line 65
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->h:Lv/VImage;

    .line 69
    .line 70
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->i:Lv/VImage;

    .line 74
    .line 75
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->j:Lv/VImage;

    .line 79
    .line 80
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public s0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Lrx/c;Landroid/view/View$OnClickListener;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;",
            "Lrx/c<",
            "Ljava/lang/Long;",
            ">;",
            "Landroid/view/View$OnClickListener;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->m0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->giftContent:Ljava/util/List;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->t0(Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->o:Lv/VText;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->q:Lv/VText;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->p:Lv/VDraweeView;

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->n:Lv/VText;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->e:Lv/VText;

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->h:Lv/VImage;

    .line 37
    .line 38
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->h:Lv/VImage;

    .line 42
    .line 43
    sget v3, Ll/obc0;->R1:I

    .line 44
    .line 45
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->h:Lv/VImage;

    .line 49
    .line 50
    new-instance v3, Ll/uds;

    .line 51
    .line 52
    invoke-direct {v3, p3}, Ll/uds;-><init>(Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->i:Lv/VImage;

    .line 59
    .line 60
    invoke-static {p3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->i:Lv/VImage;

    .line 64
    .line 65
    sget v0, Ll/obc0;->V1:I

    .line 66
    .line 67
    invoke-virtual {p3, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 68
    .line 69
    .line 70
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->j:Lv/VImage;

    .line 71
    .line 72
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->k:Lv/VText;

    .line 76
    .line 77
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->l:Lv/VText;

    .line 81
    .line 82
    invoke-static {p3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->endTime:D

    .line 86
    .line 87
    new-instance p3, Ll/vds;

    .line 88
    .line 89
    invoke-direct {p3, p0}, Ll/vds;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p2, p3}, Lrx/c;->takeUntil(Ll/qcj;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->r:Lrx/subjects/b;

    .line 97
    .line 98
    invoke-virtual {p2, p3}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    new-instance p3, Ll/wds;

    .line 103
    .line 104
    invoke-direct {p3, p0, v0, v1, p1}, Ll/wds;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;DLcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;)V

    .line 105
    .line 106
    .line 107
    invoke-static {p3}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    invoke-virtual {p2, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 112
    .line 113
    .line 114
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->m:Lv/VText;

    .line 115
    .line 116
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->m:Lv/VText;

    .line 120
    .line 121
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 122
    .line 123
    .line 124
    move-result-object p3

    .line 125
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->j4:I

    .line 126
    .line 127
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderName:Ljava/lang/String;

    .line 128
    .line 129
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {p3, v0, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p3

    .line 137
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->d:Lv/VImage;

    .line 141
    .line 142
    sget p3, Ll/obc0;->Q1:I

    .line 143
    .line 144
    invoke-virtual {p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 145
    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->f:Lv/VText;

    .line 148
    .line 149
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

    .line 150
    .line 151
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    xor-int/2addr p1, v2

    .line 156
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public final t0(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->g:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->g:Landroid/widget/LinearLayout;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    move v1, v0

    .line 17
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/4 v3, 0x3

    .line 22
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-ge v1, v2, :cond_1

    .line 27
    .line 28
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    sget v4, Ll/yec0;->R0:I

    .line 39
    .line 40
    const/4 v5, 0x0

    .line 41
    invoke-static {v3, v4, v5}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/RedPacketGiftView;

    .line 46
    .line 47
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 48
    .line 49
    const/4 v5, -0x1

    .line 50
    invoke-direct {v4, v0, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 51
    .line 52
    .line 53
    const/high16 v5, 0x3f800000    # 1.0f

    .line 54
    .line 55
    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 56
    .line 57
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->g:Landroid/widget/LinearLayout;

    .line 58
    .line 59
    invoke-virtual {v5, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/RedPacketGiftView;->i0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;)V

    .line 63
    .line 64
    .line 65
    add-int/lit8 v1, v1, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    :goto_1
    return-void
.end method

.method public u0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->m0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->l:Lv/VText;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->o:Lv/VText;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->q:Lv/VText;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->p:Lv/VDraweeView;

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->n:Lv/VText;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->giftContent:Ljava/util/List;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->t0(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->e:Lv/VText;

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->h:Lv/VImage;

    .line 42
    .line 43
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->h:Lv/VImage;

    .line 47
    .line 48
    const/4 v3, 0x0

    .line 49
    invoke-static {v0, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->h:Lv/VImage;

    .line 53
    .line 54
    sget v3, Ll/obc0;->S1:I

    .line 55
    .line 56
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->i:Lv/VImage;

    .line 60
    .line 61
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->i:Lv/VImage;

    .line 65
    .line 66
    sget v3, Ll/obc0;->W1:I

    .line 67
    .line 68
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->j:Lv/VImage;

    .line 72
    .line 73
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->k:Lv/VText;

    .line 77
    .line 78
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->k:Lv/VText;

    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->f4:I

    .line 88
    .line 89
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->m:Lv/VText;

    .line 97
    .line 98
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->m:Lv/VText;

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->j4:I

    .line 108
    .line 109
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderName:Ljava/lang/String;

    .line 110
    .line 111
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-virtual {v1, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->d:Lv/VImage;

    .line 123
    .line 124
    sget v1, Ll/obc0;->Q1:I

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->f:Lv/VText;

    .line 130
    .line 131
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

    .line 132
    .line 133
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    xor-int/2addr p1, v2

    .line 138
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public v0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->m0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->n0()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->d:Lv/VImage;

    .line 8
    .line 9
    sget v1, Ll/obc0;->T1:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->h:Lv/VImage;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->i:Lv/VImage;

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->j:Lv/VImage;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->e:Lv/VText;

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->l:Lv/VText;

    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->o:Lv/VText;

    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->grabbedGiftContent:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;

    .line 47
    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->p:Lv/VDraweeView;

    .line 51
    .line 52
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->p:Lv/VDraweeView;

    .line 56
    .line 57
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;->giftUrl:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->q:Lv/VText;

    .line 63
    .line 64
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->q:Lv/VText;

    .line 68
    .line 69
    new-instance v3, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;->giftName:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v4, " X"

    .line 80
    .line 81
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;->num:I

    .line 85
    .line 86
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->k:Lv/VText;

    .line 97
    .line 98
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->k:Lv/VText;

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->g4:I

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;->expireDay:Ljava/lang/String;

    .line 110
    .line 111
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v3, v4, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->m:Lv/VText;

    .line 123
    .line 124
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->m:Lv/VText;

    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->j4:I

    .line 134
    .line 135
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderName:Ljava/lang/String;

    .line 136
    .line 137
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    .line 147
    .line 148
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->f:Lv/VText;

    .line 149
    .line 150
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

    .line 151
    .line 152
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    xor-int/2addr p1, v1

    .line 157
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public w0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Lrx/c;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;",
            "Lrx/c<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->s0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Lrx/c;Landroid/view/View$OnClickListener;)V

    .line 3
    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->i:Lv/VImage;

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->j:Lv/VImage;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->j:Lv/VImage;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getRotation()F

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->j:Lv/VImage;

    .line 24
    .line 25
    const/high16 v2, 0x43b40000    # 360.0f

    .line 26
    .line 27
    add-float/2addr v2, p1

    .line 28
    const/4 v3, 0x2

    .line 29
    new-array v3, v3, [F

    .line 30
    .line 31
    aput p1, v3, p2

    .line 32
    .line 33
    aput v2, v3, v0

    .line 34
    .line 35
    const-string p1, "rotation"

    .line 36
    .line 37
    invoke-static {v1, p1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->s:Landroid/animation/ObjectAnimator;

    .line 42
    .line 43
    const-wide/16 v0, 0x7d0

    .line 44
    .line 45
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->s:Landroid/animation/ObjectAnimator;

    .line 49
    .line 50
    new-instance p2, Landroid/view/animation/LinearInterpolator;

    .line 51
    .line 52
    invoke-direct {p2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->s:Landroid/animation/ObjectAnimator;

    .line 59
    .line 60
    const/4 p2, -0x1

    .line 61
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->s:Landroid/animation/ObjectAnimator;

    .line 65
    .line 66
    new-instance p2, Ll/xds;

    .line 67
    .line 68
    invoke-direct {p2, p0}, Ll/xds;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p1, p2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->s:Landroid/animation/ObjectAnimator;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public y0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->m0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->l:Lv/VText;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->o:Lv/VText;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->q:Lv/VText;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->p:Lv/VDraweeView;

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->n:Lv/VText;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->giftContent:Ljava/util/List;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->t0(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->e:Lv/VText;

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->h:Lv/VImage;

    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->h:Lv/VImage;

    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->h:Lv/VImage;

    .line 53
    .line 54
    sget v2, Ll/obc0;->S1:I

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->i:Lv/VImage;

    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->i:Lv/VImage;

    .line 65
    .line 66
    sget v2, Ll/obc0;->W1:I

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->k:Lv/VText;

    .line 72
    .line 73
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->k:Lv/VText;

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->i4:I

    .line 83
    .line 84
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->m:Lv/VText;

    .line 92
    .line 93
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->m:Lv/VText;

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->j4:I

    .line 103
    .line 104
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderName:Ljava/lang/String;

    .line 105
    .line 106
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->d:Lv/VImage;

    .line 118
    .line 119
    sget v2, Ll/obc0;->Q1:I

    .line 120
    .line 121
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 122
    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->f:Lv/VText;

    .line 125
    .line 126
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

    .line 127
    .line 128
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    xor-int/2addr p1, v1

    .line 133
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    return-void
.end method
