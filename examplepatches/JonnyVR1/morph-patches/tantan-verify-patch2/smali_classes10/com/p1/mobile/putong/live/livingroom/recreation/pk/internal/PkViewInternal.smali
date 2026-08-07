.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/sx70;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lv/VImage;

.field public B:Landroidx/recyclerview/widget/RecyclerView;

.field public C:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

.field public D:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;

.field public E:Lv/VText;

.field public E0:Z

.field public F:Lv/VDraweeView;

.field public F0:Z

.field public G:Landroid/widget/LinearLayout;

.field public G0:Ljava/lang/String;

.field public H:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

.field public H0:Ll/sa80;

.field public I:Lv/VImage;

.field public I0:Ll/t880;

.field public J:Landroidx/recyclerview/widget/RecyclerView;

.field public J0:Ll/kt70;

.field public K:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

.field public L:Lv/VText;

.field public M:Lv/VDraweeView;

.field public N:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

.field public O:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

.field public P:Lv/VButton;

.field public Q:Lv/VText;

.field public R:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public S:Lv/VImage;

.field public T:Ll/sx70;

.field public U:Ll/k36;

.field public V:Ll/k36;

.field public W:Landroid/animation/AnimatorSet;

.field public a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;

.field public b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

.field public c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkCursorView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VImage;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/view/View;

.field public k0:Z

.field public l:Lv/VImage;

.field public m:Landroid/view/View;

.field public n:Landroid/view/View;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public p0:Z

.field public q:Lv/VImage;

.field public r:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public s:Landroid/view/View;

.field public t:Landroid/widget/Space;

.field public u:Lv/VDraweeView;

.field public v:Lv/VText;

.field public w:Lv/VImage;

.field public x:Lv/VText;

.field public y:Landroid/widget/LinearLayout;

.field public z:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->p0:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->E0:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F0:Z

    .line 10
    .line 11
    const-string p1, ""

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->G0:Ljava/lang/String;

    .line 14
    .line 15
    new-instance p1, Ll/sa80;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/sa80;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H0:Ll/sa80;

    .line 21
    .line 22
    new-instance p1, Ll/t880;

    .line 23
    .line 24
    invoke-direct {p1}, Ll/t880;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I0:Ll/t880;

    .line 28
    .line 29
    new-instance p1, Ll/kt70;

    .line 30
    .line 31
    invoke-direct {p1}, Ll/kt70;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->J0:Ll/kt70;

    .line 35
    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 38
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->p0:Z

    .line 39
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->E0:Z

    .line 40
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F0:Z

    .line 41
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->G0:Ljava/lang/String;

    .line 42
    new-instance p1, Ll/sa80;

    invoke-direct {p1}, Ll/sa80;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H0:Ll/sa80;

    .line 43
    new-instance p1, Ll/t880;

    invoke-direct {p1}, Ll/t880;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I0:Ll/t880;

    .line 44
    new-instance p1, Ll/kt70;

    invoke-direct {p1}, Ll/kt70;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->J0:Ll/kt70;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 45
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 46
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->p0:Z

    .line 47
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->E0:Z

    .line 48
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F0:Z

    .line 49
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->G0:Ljava/lang/String;

    .line 50
    new-instance p1, Ll/sa80;

    invoke-direct {p1}, Ll/sa80;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H0:Ll/sa80;

    .line 51
    new-instance p1, Ll/t880;

    invoke-direct {p1}, Ll/t880;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I0:Ll/t880;

    .line 52
    new-instance p1, Ll/kt70;

    invoke-direct {p1}, Ll/kt70;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->J0:Ll/kt70;

    return-void
.end method

.method private A(ZLjava/util/List;ZZZ)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;",
            ">;ZZZ)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    const/4 v1, 0x3

    .line 8
    if-ge v0, v1, :cond_3

    .line 9
    .line 10
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-le v1, v0, :cond_1

    .line 23
    .line 24
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    move-object v2, v1

    .line 29
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;

    .line 30
    .line 31
    :cond_1
    :goto_1
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 32
    .line 33
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setHost(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setRank(I)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setPunishStage(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1, p4}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setTied(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1, p5}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setSuccess(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_2

    .line 61
    .line 62
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->image:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setAvatarUrl(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->userId:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setUserId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iget-wide v2, v2, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->point:J

    .line 75
    .line 76
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setScore(J)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    :cond_2
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    add-int/lit8 v0, v0, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    return-object p0
.end method

.method private C()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->W:Landroid/animation/AnimatorSet;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->W:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->getFollowView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x2

    .line 23
    new-array v1, v1, [F

    .line 24
    .line 25
    fill-array-data v1, :array_0

    .line 26
    .line 27
    .line 28
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 29
    .line 30
    invoke-static {v0, v2, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-wide/16 v1, 0x12c

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->getFollowView()Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->getFollowView()Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    sget-object v5, Ll/it0;->n:Landroid/util/Property;

    .line 52
    .line 53
    const/4 v6, 0x0

    .line 54
    filled-new-array {v3, v6}, [I

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-static {v4, v5, v3}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v3, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 63
    .line 64
    .line 65
    const-wide/16 v1, 0xc8

    .line 66
    .line 67
    invoke-virtual {v3, v1, v2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 68
    .line 69
    .line 70
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 71
    .line 72
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->W:Landroid/animation/AnimatorSet;

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->W:Landroid/animation/AnimatorSet;

    .line 85
    .line 86
    const-wide/16 v1, 0x1f4

    .line 87
    .line 88
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->W:Landroid/animation/AnimatorSet;

    .line 92
    .line 93
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->W:Landroid/animation/AnimatorSet;

    .line 97
    .line 98
    new-instance v1, Ll/sb80;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/sb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->v:Lv/VText;

    .line 107
    .line 108
    const/high16 v0, 0x41000000    # 8.0f

    .line 109
    .line 110
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    invoke-virtual {p0, v6, v6, v0, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    nop

    .line 119
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public static E(JI)I
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    long-to-double v0, v0

    .line 6
    long-to-double p0, p0

    .line 7
    const-wide v2, 0x412e848000000000L    # 1000000.0

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    div-double/2addr p0, v2

    .line 13
    sub-double/2addr v0, p0

    .line 14
    double-to-long p0, v0

    .line 15
    int-to-long v0, p2

    .line 16
    const-wide/16 v2, 0x3e8

    .line 17
    .line 18
    div-long/2addr p0, v2

    .line 19
    sub-long/2addr v0, p0

    .line 20
    long-to-int p0, v0

    .line 21
    return p0
.end method

.method public static F(Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;)I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->startTs:J

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->duration:I

    .line 4
    .line 5
    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->E(JI)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private I()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->E:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->L:Lv/VText;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private J()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->getFollowView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;->ACTION_FOLLOW_USER:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/sx70;->V3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;->ACTION_PK_ONCE_MORE:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/sx70;->V3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;->ACTION_PK_EXIT:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/sx70;->V3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic P(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->S:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic Q(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->S:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 8
    .line 9
    xor-int/lit8 v1, p1, 0x1

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->v:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    new-instance v3, Ll/dc80;

    .line 22
    .line 23
    invoke-direct {v3, p0}, Ll/dc80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1, v2, v3}, Ll/sx70;->m4(ZLjava/lang/String;Ll/y20;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 30
    .line 31
    xor-int/lit8 v1, p1, 0x1

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/ua80;->a(Ll/i6t;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 37
    .line 38
    invoke-static {p0, p1}, Ll/n180;->d(Ll/i6t;Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;->ACTION_SHOW_USER_CARD:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/sx70;->V3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic S(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-static {p0, p1, p1}, Ll/su70;->a(Ll/i6t;ZZ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-static {p0, p1, v0}, Ll/su70;->a(Ll/i6t;ZZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private Y(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/sx70;->k4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->Y(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->R(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->X()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->U(Ljava/lang/Float;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->L()V

    return-void
.end method

.method private i0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/dw40;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/dw40;->p()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPlaying()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->S:Lv/VImage;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 24
    .line 25
    invoke-static {p1, v0}, Ll/ua80;->b(Landroid/view/View;Ll/i6t;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->S:Lv/VImage;

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->S:Lv/VImage;

    .line 39
    .line 40
    invoke-static {p1, v0, p0}, Ll/c680;->n(Landroid/content/Context;Landroid/view/View;Landroid/view/ViewGroup;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPking()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    invoke-static {p1}, Ll/c680;->l(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->S:Lv/VImage;

    .line 55
    .line 56
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->S:Lv/VImage;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->P(Ljava/lang/Boolean;)V

    return-void
.end method

.method private o0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    const-string v0, "svga"

    .line 6
    .line 7
    invoke-static {v0}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->getAnchorResource()Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    return p0

    .line 18
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;->resourceId:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, p0}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ll/l4;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    xor-int/lit8 p0, p0, 0x1

    .line 37
    .line 38
    return p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;[JLjava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->W([JLjava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->V(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    return-void
.end method

.method private r()V
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->k0:Z

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->J()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->getFollowView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/rb80;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/rb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->P:Lv/VButton;

    .line 24
    .line 25
    new-instance v1, Ll/wb80;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/wb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->l:Lv/VImage;

    .line 34
    .line 35
    new-instance v1, Ll/xb80;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/xb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->S:Lv/VImage;

    .line 44
    .line 45
    new-instance v1, Ll/yb80;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/yb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->r:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 54
    .line 55
    new-instance v1, Ll/zb80;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/zb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->m:Landroid/view/View;

    .line 64
    .line 65
    new-instance v1, Ll/ac80;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/ac80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->n:Landroid/view/View;

    .line 74
    .line 75
    new-instance v1, Ll/bc80;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/bc80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    new-instance v0, Ll/kuf0;

    .line 84
    .line 85
    sget v1, Ll/qa00;->e:I

    .line 86
    .line 87
    const/4 v2, 0x0

    .line 88
    invoke-direct {v0, v1, v2}, Ll/kuf0;-><init>(II)V

    .line 89
    .line 90
    .line 91
    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    const/4 v5, 0x1

    .line 98
    invoke-direct {v3, v4, v2, v5}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 99
    .line 100
    .line 101
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->B:Landroidx/recyclerview/widget/RecyclerView;

    .line 102
    .line 103
    invoke-virtual {v4, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 104
    .line 105
    .line 106
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->B:Landroidx/recyclerview/widget/RecyclerView;

    .line 107
    .line 108
    invoke-virtual {v3, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 109
    .line 110
    .line 111
    new-instance v0, Ll/guf0;

    .line 112
    .line 113
    invoke-direct {v0, v1, v2}, Ll/guf0;-><init>(II)V

    .line 114
    .line 115
    .line 116
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-direct {v1, v3, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 123
    .line 124
    .line 125
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->J:Landroidx/recyclerview/widget/RecyclerView;

    .line 126
    .line 127
    invoke-virtual {v3, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 128
    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->J:Landroidx/recyclerview/widget/RecyclerView;

    .line 131
    .line 132
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 133
    .line 134
    .line 135
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I()V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->N:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 139
    .line 140
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 144
    .line 145
    new-instance v1, Ll/cc80;

    .line 146
    .line 147
    invoke-direct {v1, p0}, Ll/cc80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->setCursorListener(Ll/y20;)V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method private r0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->P:Lv/VButton;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->j:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->A:Lv/VImage;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I:Lv/VImage;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->z:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->J()V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->D:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->p0()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)Ll/sx70;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    return-object p0
.end method

.method private s0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/ynp0;->p()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    mul-int/lit16 v0, v0, 0x324

    .line 6
    .line 7
    div-int/lit16 v0, v0, 0x438

    .line 8
    .line 9
    const/high16 v1, 0x42800000    # 64.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 23
    .line 24
    invoke-virtual {v2}, Ll/xzs;->L2()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    const/high16 v2, 0x43200000    # 160.0f

    .line 31
    .line 32
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/high16 v2, 0x43020000    # 130.0f

    .line 40
    .line 41
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 46
    .line 47
    :goto_0
    invoke-static {}, Ll/ynp0;->p()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 52
    .line 53
    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 54
    .line 55
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Ll/vb80;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/vb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)Ll/t880;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I0:Ll/t880;

    return-object p0
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->l0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    return-void
.end method


# virtual methods
.method public A0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->i:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "00:00"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    if-gez p1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    mul-int/lit16 p1, p1, 0x3e8

    .line 19
    .line 20
    int-to-double v0, p1

    .line 21
    invoke-static {v0, v1}, Ll/tzi0;->a(D)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v1, ":"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const/4 v1, 0x2

    .line 46
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->i:Landroid/widget/TextView;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public B()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->changeInputSize()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Landroid/util/Size;

    .line 14
    .line 15
    sget v2, Ll/pae;->a:I

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-direct {v1, v3, v2}, Landroid/util/Size;-><init>(II)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    const-string v0, "pkView endPk"

    .line 25
    .line 26
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H0:Ll/sa80;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/sa80;->a()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->a()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkCursorView;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkCursorView;->b()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->d()V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H0:Ll/sa80;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/sa80;->b()V

    .line 55
    .line 56
    .line 57
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->r0()V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->S:Lv/VImage;

    .line 61
    .line 62
    invoke-virtual {p0, v3}, Landroid/view/View;->setSelected(Z)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public G(Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "https://auto.tancdn.com/v1/raw/1e59b30b-025e-4fad-814e-cb38badff31012.svga"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "https://auto.tancdn.com/v1/raw/ad732906-9c77-48a7-b866-1bc5c7f6eef013.svga"

    .line 7
    .line 8
    return-object p0
.end method

.method public H()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public K()Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sx70;->i:Ll/xx70;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xx70;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isRankPk()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/sx70;->d4()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->getLeftScore()J

    .line 30
    .line 31
    .line 32
    move-result-wide v2

    .line 33
    const-wide/16 v4, 0x0

    .line 34
    .line 35
    cmp-long v0, v2, v4

    .line 36
    .line 37
    if-gtz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->j:Landroid/widget/TextView;

    .line 40
    .line 41
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->getRightScore()J

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    cmp-long p0, v2, v4

    .line 54
    .line 55
    if-gtz p0, :cond_1

    .line 56
    .line 57
    const/4 p0, 0x1

    .line 58
    return p0

    .line 59
    :cond_1
    return v1
.end method

.method public final synthetic L()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->getFollowView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic U(Ljava/lang/Float;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkCursorView;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkCursorView;->setCursorOffset(F)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->setCursorOffset(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->m0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic W([JLjava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/dw40;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p5, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-interface {p3, p5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    const/4 p0, 0x0

    .line 40
    aput-wide v0, p1, p0

    .line 41
    .line 42
    :cond_0
    invoke-static {p5, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    invoke-interface {p3, p5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 63
    .line 64
    .line 65
    move-result-wide p2

    .line 66
    const/4 p0, 0x1

    .line 67
    aput-wide p2, p1, p0

    .line 68
    .line 69
    :cond_1
    return-void
.end method

.method public final synthetic X()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sub-int/2addr v0, v1

    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 23
    .line 24
    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 25
    .line 26
    add-int/2addr v0, v1

    .line 27
    sget v1, Ll/pae;->k:I

    .line 28
    .line 29
    sub-int/2addr v0, v1

    .line 30
    sget v1, Ll/pae;->a:I

    .line 31
    .line 32
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->changeInputSize()Ll/v3f$d;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance v1, Landroid/util/Size;

    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    invoke-direct {v1, v2, v0}, Landroid/util/Size;-><init>(II)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public Z()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->n:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->m:Landroid/view/View;

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
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 21
    :goto_1
    const/high16 v1, 0x422c0000    # 43.0f

    .line 22
    .line 23
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iget-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F0:Z

    .line 28
    .line 29
    const/high16 v3, 0x41f00000    # 30.0f

    .line 30
    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    add-int/2addr v1, v2

    .line 38
    :cond_2
    const/high16 v2, 0x41700000    # 15.0f

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    add-int/2addr v1, v4

    .line 47
    :cond_3
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->r:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 48
    .line 49
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 54
    .line 55
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->r:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 58
    .line 59
    invoke-virtual {v1, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    .line 61
    .line 62
    const/high16 v1, 0x42920000    # 73.0f

    .line 63
    .line 64
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iget-boolean v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F0:Z

    .line 69
    .line 70
    if-eqz v4, :cond_4

    .line 71
    .line 72
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    add-int/2addr v1, v3

    .line 77
    :cond_4
    if-eqz v0, :cond_5

    .line 78
    .line 79
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr v1, v0

    .line 84
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->S:Lv/VImage;

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 91
    .line 92
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->S:Lv/VImage;

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->C:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->K:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->A:Lv/VImage;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I:Lv/VImage;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->z:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->a()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H0:Ll/sa80;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/sa80;->a()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkCursorView;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkCursorView;->b()V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->d()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public b0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, -0x1

    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->d0(Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->z()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->d()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->n0()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public c0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;ZZ)V
    .locals 6

    .line 1
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/dw40;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "liveId"

    .line 26
    .line 27
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    filled-new-array {v1}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v3, "e_pk_adverseprofile_button"

    .line 36
    .line 37
    invoke-static {v3, v0, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/xzs;->L2()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 55
    .line 56
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Ll/dw40;

    .line 61
    .line 62
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 71
    .line 72
    invoke-virtual {v2}, Ll/xzs;->E2()Ll/oo2;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    check-cast v2, Ll/dw40;

    .line 77
    .line 78
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 83
    .line 84
    const-string v3, "anchorId"

    .line 85
    .line 86
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const-string v2, "e_pk_close_button"

    .line 95
    .line 96
    invoke-static {v2, v0, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 97
    .line 98
    .line 99
    :cond_0
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_1

    .line 104
    .line 105
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->A:Lv/VImage;

    .line 109
    .line 110
    const/4 v0, 0x0

    .line 111
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I:Lv/VImage;

    .line 115
    .line 116
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->l:Lv/VImage;

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 122
    .line 123
    invoke-virtual {v1}, Ll/xzs;->L2()Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->k:Landroid/view/View;

    .line 131
    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 133
    .line 134
    invoke-virtual {v1}, Ll/xzs;->L2()Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    const/4 v2, 0x1

    .line 139
    xor-int/2addr v1, v2

    .line 140
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->i:Landroid/widget/TextView;

    .line 144
    .line 145
    invoke-static {p3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F:Lv/VDraweeView;

    .line 149
    .line 150
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 151
    .line 152
    .line 153
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->M:Lv/VDraweeView;

    .line 154
    .line 155
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 156
    .line 157
    .line 158
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->J0:Ll/kt70;

    .line 159
    .line 160
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isBountyPk()Z

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    invoke-virtual {p3, v1}, Ll/kt70;->c(Z)V

    .line 165
    .line 166
    .line 167
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I()V

    .line 168
    .line 169
    .line 170
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->s0()V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUser()Lcom/p1/mobile/putong/data/User;

    .line 174
    .line 175
    .line 176
    move-result-object p3

    .line 177
    if-nez p3, :cond_2

    .line 178
    .line 179
    return-void

    .line 180
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->P:Lv/VButton;

    .line 181
    .line 182
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 183
    .line 184
    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->u:Lv/VDraweeView;

    .line 186
    .line 187
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    const-string v4, "context_single_room"

    .line 196
    .line 197
    invoke-static {v4, v1, v3}, Ll/izs;->r(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 198
    .line 199
    .line 200
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->v:Lv/VText;

    .line 201
    .line 202
    iget-object p3, p3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPunishing()Z

    .line 208
    .line 209
    .line 210
    move-result p3

    .line 211
    if-eqz p3, :cond_6

    .line 212
    .line 213
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->h:Lv/VImage;

    .line 214
    .line 215
    sget v1, Ll/obc0;->J5:I

    .line 216
    .line 217
    invoke-virtual {p3, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isRankPk()Z

    .line 221
    .line 222
    .line 223
    move-result p3

    .line 224
    if-nez p3, :cond_3

    .line 225
    .line 226
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isBountyPk()Z

    .line 227
    .line 228
    .line 229
    move-result p3

    .line 230
    if-nez p3, :cond_3

    .line 231
    .line 232
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 233
    .line 234
    invoke-virtual {p3}, Ll/xzs;->L2()Z

    .line 235
    .line 236
    .line 237
    move-result p3

    .line 238
    if-eqz p3, :cond_3

    .line 239
    .line 240
    goto :goto_0

    .line 241
    :cond_3
    move v2, v0

    .line 242
    :goto_0
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->v0(Z)V

    .line 243
    .line 244
    .line 245
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H0:Ll/sa80;

    .line 246
    .line 247
    invoke-virtual {p3}, Ll/sa80;->b()V

    .line 248
    .line 249
    .line 250
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H0:Ll/sa80;

    .line 251
    .line 252
    invoke-virtual {p3}, Ll/sa80;->a()V

    .line 253
    .line 254
    .line 255
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->t0(Z)V

    .line 256
    .line 257
    .line 258
    if-eqz p2, :cond_5

    .line 259
    .line 260
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isBountyPk()Z

    .line 261
    .line 262
    .line 263
    move-result p2

    .line 264
    if-eqz p2, :cond_4

    .line 265
    .line 266
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getPkBountyData()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    .line 267
    .line 268
    .line 269
    move-result-object p2

    .line 270
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->o0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;)Z

    .line 271
    .line 272
    .line 273
    move-result p2

    .line 274
    if-eqz p2, :cond_4

    .line 275
    .line 276
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->J0:Ll/kt70;

    .line 277
    .line 278
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getPkBountyData()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    .line 279
    .line 280
    .line 281
    move-result-object p3

    .line 282
    new-instance v0, Ll/ec80;

    .line 283
    .line 284
    invoke-direct {v0, p0, p1}, Ll/ec80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {p2, p3, v0}, Ll/kt70;->d(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;Ll/x20;)V

    .line 288
    .line 289
    .line 290
    goto :goto_1

    .line 291
    :cond_4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->w0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 292
    .line 293
    .line 294
    goto :goto_1

    .line 295
    :cond_5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->m0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 296
    .line 297
    .line 298
    :goto_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->l0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 299
    .line 300
    .line 301
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I0:Ll/t880;

    .line 302
    .line 303
    invoke-virtual {p2, p1}, Ll/t880;->d(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 304
    .line 305
    .line 306
    goto :goto_2

    .line 307
    :cond_6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPlaying()Z

    .line 308
    .line 309
    .line 310
    move-result p3

    .line 311
    if-eqz p3, :cond_9

    .line 312
    .line 313
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->h:Lv/VImage;

    .line 314
    .line 315
    sget v0, Ll/obc0;->b5:I

    .line 316
    .line 317
    invoke-virtual {p3, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isBountyPk()Z

    .line 321
    .line 322
    .line 323
    move-result p3

    .line 324
    if-eqz p3, :cond_7

    .line 325
    .line 326
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->J0:Ll/kt70;

    .line 327
    .line 328
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getPkBountyData()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    invoke-virtual {p3, v0}, Ll/kt70;->f(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;)V

    .line 333
    .line 334
    .line 335
    :cond_7
    if-eqz p2, :cond_9

    .line 336
    .line 337
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isBountyPk()Z

    .line 338
    .line 339
    .line 340
    move-result p2

    .line 341
    if-eqz p2, :cond_8

    .line 342
    .line 343
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getPkBountyData()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    .line 344
    .line 345
    .line 346
    move-result-object p2

    .line 347
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->o0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;)Z

    .line 348
    .line 349
    .line 350
    move-result p2

    .line 351
    if-eqz p2, :cond_8

    .line 352
    .line 353
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->J0:Ll/kt70;

    .line 354
    .line 355
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getPkBountyData()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    .line 356
    .line 357
    .line 358
    move-result-object p3

    .line 359
    invoke-virtual {p2, p3}, Ll/kt70;->e(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;)V

    .line 360
    .line 361
    .line 362
    goto :goto_2

    .line 363
    :cond_8
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->O:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 364
    .line 365
    new-instance p3, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal$a;

    .line 366
    .line 367
    invoke-direct {p3, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 368
    .line 369
    .line 370
    const-string v0, "https://auto.tancdn.com/v1/raw/d9e41474-7ea7-4f9c-a05e-40b41937f64213.svga"

    .line 371
    .line 372
    invoke-virtual {p2, v0, v2, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 373
    .line 374
    .line 375
    :cond_9
    :goto_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object p2

    .line 379
    iget-object p3, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 380
    .line 381
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 382
    .line 383
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->points:Lcom/p1/mobile/putong/live/base/data/BLivePkPointList;

    .line 384
    .line 385
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLivePkPointList;->userId:Ljava/util/List;

    .line 386
    .line 387
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLivePkPointList;->point:Ljava/util/List;

    .line 388
    .line 389
    invoke-virtual {p0, p2, v0, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->k0(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 390
    .line 391
    .line 392
    iget-object p2, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 393
    .line 394
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 395
    .line 396
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->currentStageInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;

    .line 397
    .line 398
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;->stage:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 399
    .line 400
    const-string p3, "punishing"

    .line 401
    .line 402
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 403
    .line 404
    .line 405
    move-result v3

    .line 406
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getHostContributors()Ljava/util/List;

    .line 407
    .line 408
    .line 409
    move-result-object v1

    .line 410
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getOtherContributors()Ljava/util/List;

    .line 411
    .line 412
    .line 413
    move-result-object v2

    .line 414
    iget-object p2, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 415
    .line 416
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 417
    .line 418
    iget-boolean v4, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->isTied:Z

    .line 419
    .line 420
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->winnerId:Ljava/lang/String;

    .line 421
    .line 422
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getAnchorId()Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object p3

    .line 426
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 427
    .line 428
    .line 429
    move-result v5

    .line 430
    move-object v0, p0

    .line 431
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->h0(Ljava/util/List;Ljava/util/List;ZZZ)V

    .line 432
    .line 433
    .line 434
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->i0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 435
    .line 436
    .line 437
    iget-object p0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;

    .line 438
    .line 439
    iget-object p2, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 440
    .line 441
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkScoreViewConfig:Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;

    .line 442
    .line 443
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;->setDecorateData(Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;)V

    .line 444
    .line 445
    .line 446
    iget-object p0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkCursorView;

    .line 447
    .line 448
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 449
    .line 450
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkScoreViewConfig:Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;

    .line 451
    .line 452
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;->cursorUrl:Ljava/lang/String;

    .line 453
    .line 454
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkCursorView;->a(Ljava/lang/String;)V

    .line 455
    .line 456
    .line 457
    return-void
.end method

.method public d0(Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->Q:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p1, :cond_1

    .line 5
    .line 6
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->Q:Lv/VText;

    .line 13
    .line 14
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->R:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 18
    .line 19
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void

    .line 23
    :cond_1
    const/4 v2, 0x1

    .line 24
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->G0:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->type:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->type:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->G0:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    const/4 v4, -0x1

    .line 49
    sparse-switch v3, :sswitch_data_0

    .line 50
    .line 51
    .line 52
    :goto_0
    move v0, v4

    .line 53
    goto :goto_1

    .line 54
    :sswitch_0
    const-string v3, "supportTaskFinished"

    .line 55
    .line 56
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_2

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    const/4 v0, 0x2

    .line 64
    goto :goto_1

    .line 65
    :sswitch_1
    const-string v3, "firstSend"

    .line 66
    .line 67
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_3

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    move v0, v2

    .line 75
    goto :goto_1

    .line 76
    :sswitch_2
    const-string v3, "supportTask"

    .line 77
    .line 78
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_4

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    move v0, v1

    .line 86
    :goto_1
    const-string v3, "https://auto.tancdn.com/v1/raw/a00bebb8-f672-4b0a-af83-ebf361a5f54014.so"

    .line 87
    .line 88
    packed-switch v0, :pswitch_data_0

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->Q:Lv/VText;

    .line 92
    .line 93
    sget v3, Ll/obc0;->t:I

    .line 94
    .line 95
    invoke-static {v3}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->R:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 103
    .line 104
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :pswitch_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->Q:Lv/VText;

    .line 109
    .line 110
    sget v5, Ll/obc0;->D0:I

    .line 111
    .line 112
    invoke-static {v5}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    invoke-virtual {v0, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->R:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 120
    .line 121
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->R:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 125
    .line 126
    invoke-virtual {v0, v3, v4}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 127
    .line 128
    .line 129
    goto :goto_2

    .line 130
    :pswitch_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->Q:Lv/VText;

    .line 131
    .line 132
    sget v5, Ll/obc0;->g0:I

    .line 133
    .line 134
    invoke-static {v5}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    invoke-virtual {v0, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->R:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 142
    .line 143
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->R:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 147
    .line 148
    invoke-virtual {v0, v3, v4}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 149
    .line 150
    .line 151
    :cond_5
    :goto_2
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->text:Ljava/lang/String;

    .line 152
    .line 153
    if-ltz p2, :cond_6

    .line 154
    .line 155
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->showCountdown:Z

    .line 156
    .line 157
    if-eqz v3, :cond_6

    .line 158
    .line 159
    new-instance p1, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string v0, " "

    .line 168
    .line 169
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v0, "s"

    .line 176
    .line 177
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    new-instance v0, Landroid/text/SpannableString;

    .line 185
    .line 186
    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    .line 190
    .line 191
    sget v3, Ll/n9c0;->w1:I

    .line 192
    .line 193
    invoke-static {v3}, Ll/n3d0;->a(I)I

    .line 194
    .line 195
    .line 196
    move-result v3

    .line 197
    invoke-direct {v1, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p2

    .line 208
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 209
    .line 210
    .line 211
    move-result p2

    .line 212
    sub-int/2addr v3, p2

    .line 213
    sub-int/2addr v3, v2

    .line 214
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 215
    .line 216
    .line 217
    move-result p1

    .line 218
    const/16 p2, 0x12

    .line 219
    .line 220
    invoke-virtual {v0, v1, v3, p1, p2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 221
    .line 222
    .line 223
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->Q:Lv/VText;

    .line 224
    .line 225
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :cond_6
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->showCountdown:Z

    .line 230
    .line 231
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->Q:Lv/VText;

    .line 232
    .line 233
    if-nez p1, :cond_7

    .line 234
    .line 235
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 236
    .line 237
    .line 238
    return-void

    .line 239
    :cond_7
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 240
    .line 241
    .line 242
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->R:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 243
    .line 244
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 245
    .line 246
    .line 247
    return-void

    .line 248
    nop

    .line 249
    :sswitch_data_0
    .sparse-switch
        -0x6e58560c -> :sswitch_2
        0x7ed3e58 -> :sswitch_1
        0x54db9a86 -> :sswitch_0
    .end sparse-switch

    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e0(ZZ)V
    .locals 8

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->E0:Z

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->p0:Z

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->b(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->getLeftScore()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->getRightScore()J

    .line 19
    .line 20
    .line 21
    move-result-wide v4

    .line 22
    iget-boolean v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->E0:Z

    .line 23
    .line 24
    move v7, p2

    .line 25
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->b(JJZZ)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public f0(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;Z)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_2

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->m:Landroid/view/View;

    .line 5
    .line 6
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->u0(ZZ)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->n:Landroid/view/View;

    .line 16
    .line 17
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->u0(ZZ)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void

    .line 27
    :cond_2
    if-eqz p2, :cond_3

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->o:Lv/VText;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->p:Lv/VText;

    .line 33
    .line 34
    :goto_0
    const/4 v2, 0x1

    .line 35
    invoke-virtual {p0, p2, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->u0(ZZ)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;

    .line 45
    .line 46
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->showCountdown:Z

    .line 47
    .line 48
    const/4 p2, 0x0

    .line 49
    if-nez p1, :cond_4

    .line 50
    .line 51
    invoke-virtual {v1, p2, p2, p2, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->text:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_4
    sget p1, Ll/obc0;->L4:I

    .line 61
    .line 62
    invoke-static {p1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const/high16 v2, 0x41400000    # 12.0f

    .line 67
    .line 68
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    invoke-virtual {p1, v0, v0, v3, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1, p2, p2, p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F(Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    new-instance p2, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->text:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string p0, "\u751f\u6548\u4e2d("

    .line 97
    .line 98
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string p0, "s)"

    .line 105
    .line 106
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public g0(Ljava/util/List;Z)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->o:Lv/VText;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->p:Lv/VText;

    .line 11
    .line 12
    :goto_0
    const/4 v2, 0x1

    .line 13
    invoke-virtual {p0, p2, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->u0(ZZ)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x2

    .line 17
    if-eq v0, p0, :cond_3

    .line 18
    .line 19
    const/4 p0, 0x3

    .line 20
    if-eq v0, p0, :cond_2

    .line 21
    .line 22
    const/4 p0, 0x4

    .line 23
    if-eq v0, p0, :cond_1

    .line 24
    .line 25
    sget p0, Ll/obc0;->J4:I

    .line 26
    .line 27
    invoke-static {p0}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    sget p0, Ll/obc0;->K4:I

    .line 33
    .line 34
    invoke-static {p0}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    goto :goto_1

    .line 39
    :cond_2
    sget p0, Ll/obc0;->M4:I

    .line 40
    .line 41
    invoke-static {p0}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    goto :goto_1

    .line 46
    :cond_3
    sget p0, Ll/obc0;->N4:I

    .line 47
    .line 48
    invoke-static {p0}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    :goto_1
    const/high16 p2, 0x41700000    # 15.0f

    .line 53
    .line 54
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    const/4 v2, 0x0

    .line 63
    invoke-virtual {p0, v2, v2, v0, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 64
    .line 65
    .line 66
    sget p2, Ll/obc0;->L4:I

    .line 67
    .line 68
    invoke-static {p2}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    const/high16 v0, 0x41400000    # 12.0f

    .line 73
    .line 74
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    invoke-virtual {p2, v2, v2, v3, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 83
    .line 84
    .line 85
    const/4 v0, 0x0

    .line 86
    invoke-virtual {v1, p0, v0, p2, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 87
    .line 88
    .line 89
    new-instance p0, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    const-string p2, "\u5f20\u5361\u7247\u751f\u6548\u4e2d("

    .line 92
    .line 93
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;

    .line 101
    .line 102
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F(Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;)I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string p1, "s)"

    .line 110
    .line 111
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public getFollowView()Landroid/view/View;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->k0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->x:Lv/VText;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->w:Lv/VImage;

    .line 9
    .line 10
    return-object p0
.end method

.method public h0(Ljava/util/List;Ljava/util/List;ZZZ)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;",
            ">;ZZZ)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "renderContributors isPunishStage:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ",hostContributors:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ",otherContributors: "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->U:Ll/k36;

    .line 43
    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    new-instance v0, Ll/k36;

    .line 47
    .line 48
    new-instance v1, Ll/tb80;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/tb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 51
    .line 52
    .line 53
    invoke-direct {v0, v1}, Ll/k36;-><init>(Ll/y20;)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->U:Ll/k36;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->B:Landroidx/recyclerview/widget/RecyclerView;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->U:Ll/k36;

    .line 64
    .line 65
    const/4 v2, 0x1

    .line 66
    move-object v1, p0

    .line 67
    move-object v3, p1

    .line 68
    move v4, p3

    .line 69
    move v5, p4

    .line 70
    move v6, p5

    .line 71
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->A(ZLjava/util/List;ZZZ)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v0, p0}, Ll/k36;->I(Ljava/util/List;)V

    .line 76
    .line 77
    .line 78
    iget-object p0, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->V:Ll/k36;

    .line 79
    .line 80
    if-nez p0, :cond_1

    .line 81
    .line 82
    new-instance p0, Ll/k36;

    .line 83
    .line 84
    new-instance p3, Ll/tb80;

    .line 85
    .line 86
    invoke-direct {p3, v1}, Ll/tb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 87
    .line 88
    .line 89
    invoke-direct {p0, p3}, Ll/k36;-><init>(Ll/y20;)V

    .line 90
    .line 91
    .line 92
    iput-object p0, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->V:Ll/k36;

    .line 93
    .line 94
    iget-object p3, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->J:Landroidx/recyclerview/widget/RecyclerView;

    .line 95
    .line 96
    invoke-virtual {p3, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 97
    .line 98
    .line 99
    :cond_1
    iget-object p0, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->V:Ll/k36;

    .line 100
    .line 101
    xor-int/lit8 v6, v6, 0x1

    .line 102
    .line 103
    const/4 v2, 0x0

    .line 104
    move-object v3, p2

    .line 105
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->A(ZLjava/util/List;ZZZ)Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p0, p2}, Ll/k36;->I(Ljava/util/List;)V

    .line 110
    .line 111
    .line 112
    iget-object p0, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 113
    .line 114
    if-eqz p0, :cond_2

    .line 115
    .line 116
    invoke-virtual {p0, p1, v3}, Ll/sx70;->q4(Ljava/util/List;Ljava/util/List;)V

    .line 117
    .line 118
    .line 119
    :cond_2
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/sx70;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->x(Ll/sx70;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public j0(ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 3

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isRankPk()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->z:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isBountyPk()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/vwt;->V4()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-boolean v0, p2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->showWinTimesTag:Z

    .line 36
    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->z:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

    .line 41
    .line 42
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getAnchorWinTimes()J

    .line 43
    .line 44
    .line 45
    move-result-wide v1

    .line 46
    invoke-virtual {v0, p1, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;->b(ZJ)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

    .line 50
    .line 51
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getOtherWinTimes()J

    .line 52
    .line 53
    .line 54
    move-result-wide v0

    .line 55
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;->b(ZJ)V

    .line 56
    .line 57
    .line 58
    :cond_2
    :goto_0
    return-void
.end method

.method public k0(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v3, v0, [J

    .line 3
    .line 4
    fill-array-data v3, :array_0

    .line 5
    .line 6
    .line 7
    new-instance v1, Ll/ub80;

    .line 8
    .line 9
    move-object v2, p0

    .line 10
    move-object v6, p1

    .line 11
    move-object v5, p2

    .line 12
    move-object v4, p3

    .line 13
    invoke-direct/range {v1 .. v6}, Ll/ub80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;[JLjava/util/List;Ljava/util/List;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v5, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    iget-object v4, v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    aget-wide v5, v3, p0

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    aget-wide v7, v3, p1

    .line 26
    .line 27
    iget-boolean v9, v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->E0:Z

    .line 28
    .line 29
    iget-boolean v10, v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->p0:Z

    .line 30
    .line 31
    invoke-virtual/range {v4 .. v10}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->b(JJZZ)V

    .line 32
    .line 33
    .line 34
    iget-object p2, v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 35
    .line 36
    aget-wide v0, v3, p0

    .line 37
    .line 38
    aget-wide p0, v3, p1

    .line 39
    .line 40
    invoke-static {p2, v0, v1, p0, p1}, Ll/n180;->n(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;JJ)V

    .line 41
    .line 42
    .line 43
    iget-object p0, v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/sx70;->Y3()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :array_0
    .array-data 8
        0x0
        0x0
    .end array-data
.end method

.method public final l0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isRankPk()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPlaying()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->z:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getAnchorWinTimes()J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {v1, v0, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;->b(ZJ)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getOtherWinTimes()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;->b(ZJ)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    const/4 p1, 0x0

    .line 35
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkWinTimesViewInternal;

    .line 39
    .line 40
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->A:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I:Lv/VImage;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 15
    .line 16
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->isTied:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->A:Lv/VImage;

    .line 21
    .line 22
    sget v2, Ll/obc0;->R5:I

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I:Lv/VImage;

    .line 28
    .line 29
    sget v2, Ll/obc0;->R5:I

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 32
    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->winnerId:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0, v2}, Ll/a9g0;->l(Ljava/lang/String;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->A:Lv/VImage;

    .line 50
    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    sget v3, Ll/obc0;->V4:I

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    sget v3, Ll/obc0;->P5:I

    .line 57
    .line 58
    :goto_0
    invoke-virtual {v2, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I:Lv/VImage;

    .line 62
    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    sget v0, Ll/obc0;->P5:I

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    sget v0, Ll/obc0;->V4:I

    .line 69
    .line 70
    :goto_1
    invoke-virtual {v2, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 71
    .line 72
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v2, "pkInfo anchorWinTimes:"

    .line 76
    .line 77
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getAnchorWinTimes()J

    .line 81
    .line 82
    .line 83
    move-result-wide v2

    .line 84
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v2, ",otherWinTimes:"

    .line 88
    .line 89
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getOtherWinTimes()J

    .line 93
    .line 94
    .line 95
    move-result-wide v2

    .line 96
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const-string v2, "LivePkConstant"

    .line 104
    .line 105
    invoke-static {v2, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :goto_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isRankPk()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-nez v0, :cond_3

    .line 113
    .line 114
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->j0(ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 115
    .line 116
    .line 117
    :cond_3
    return-void
.end method

.method public n0()V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->p0:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->E0:Z

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->getLeftScore()J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->getRightScore()J

    .line 15
    .line 16
    .line 17
    move-result-wide v4

    .line 18
    const/4 v6, 0x0

    .line 19
    const/4 v7, 0x0

    .line 20
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->b(JJZZ)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H0:Ll/sa80;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/sa80;->a()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->W:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->W:Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->W:Landroid/animation/AnimatorSet;

    .line 21
    .line 22
    :cond_0
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->w(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->r()V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/sa80;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->e:Landroid/view/View;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->f:Landroid/view/View;

    .line 15
    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->g:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->i:Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-direct {v0, v1, v2, v3, v4}, Ll/sa80;-><init>(Landroid/view/View;Landroid/view/View;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H0:Ll/sa80;

    .line 24
    .line 25
    new-instance v0, Ll/t880;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->C:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->K:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F:Lv/VDraweeView;

    .line 32
    .line 33
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->M:Lv/VDraweeView;

    .line 34
    .line 35
    invoke-direct {v0, v1, v2, v3, v4}, Ll/t880;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;Lv/VDraweeView;Lv/VDraweeView;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I0:Ll/t880;

    .line 39
    .line 40
    new-instance v0, Ll/kt70;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->N:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->E:Lv/VText;

    .line 45
    .line 46
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->L:Lv/VText;

    .line 47
    .line 48
    invoke-direct {v0, v1, v2, v3}, Ll/kt70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;Lv/VText;Lv/VText;)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->J0:Ll/kt70;

    .line 52
    .line 53
    return-void
.end method

.method public p0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 8
    .line 9
    const/16 v1, 0x50

    .line 10
    .line 11
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 12
    .line 13
    const/high16 v2, 0x41a00000    # 20.0f

    .line 14
    .line 15
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 20
    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 22
    .line 23
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkCursorView;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 33
    .line 34
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 35
    .line 36
    const/high16 v3, 0x41200000    # 10.0f

    .line 37
    .line 38
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 43
    .line 44
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkCursorView;

    .line 45
    .line 46
    invoke-virtual {v4, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 56
    .line 57
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 58
    .line 59
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 64
    .line 65
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;

    .line 66
    .line 67
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 77
    .line 78
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 79
    .line 80
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;

    .line 87
    .line 88
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    .line 90
    .line 91
    const/4 v0, 0x0

    .line 92
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F0:Z

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->Z()V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public q0()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->n:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->m:Landroid/view/View;

    .line 11
    .line 12
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    move v0, v1

    .line 22
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 29
    .line 30
    const/16 v3, 0x30

    .line 31
    .line 32
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 33
    .line 34
    const/high16 v4, 0x42640000    # 57.0f

    .line 35
    .line 36
    const/high16 v5, 0x423c0000    # 47.0f

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    goto :goto_2

    .line 45
    :cond_2
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    :goto_2
    iput v6, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 50
    .line 51
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 52
    .line 53
    invoke-virtual {v6, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkCursorView;

    .line 57
    .line 58
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 63
    .line 64
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 65
    .line 66
    const/high16 v6, 0x42140000    # 37.0f

    .line 67
    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v7

    .line 74
    goto :goto_3

    .line 75
    :cond_3
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v7

    .line 79
    :goto_3
    iput v7, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 80
    .line 81
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkCursorView;

    .line 82
    .line 83
    invoke-virtual {v7, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 84
    .line 85
    .line 86
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;

    .line 87
    .line 88
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 93
    .line 94
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 95
    .line 96
    if-eqz v0, :cond_4

    .line 97
    .line 98
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    goto :goto_4

    .line 103
    :cond_4
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v6

    .line 107
    :goto_4
    iput v6, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 108
    .line 109
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkDecorateView;

    .line 110
    .line 111
    invoke-virtual {v6, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    .line 113
    .line 114
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;

    .line 115
    .line 116
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 121
    .line 122
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 123
    .line 124
    if-eqz v0, :cond_5

    .line 125
    .line 126
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    goto :goto_5

    .line 131
    :cond_5
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    :goto_5
    iput v0, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;

    .line 138
    .line 139
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 140
    .line 141
    .line 142
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F0:Z

    .line 143
    .line 144
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->Z()V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public t0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->j:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->i:Landroid/widget/TextView;

    .line 7
    .line 8
    xor-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public u0(ZZ)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->m:Landroid/view/View;

    .line 4
    .line 5
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->o:Lv/VText;

    .line 9
    .line 10
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->n:Landroid/view/View;

    .line 15
    .line 16
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->p:Lv/VText;

    .line 20
    .line 21
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F0:Z

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->q0()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->p0()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public v0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->P:Lv/VButton;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final w(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gc80;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public w0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->winnerId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/a9g0;->l(Ljava/lang/String;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isRankPk()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->I0:Ll/t880;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 24
    .line 25
    invoke-virtual {v1, v2, p1, v0, p0}, Ll/t880;->f(Ll/sx70;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal$b;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 37
    .line 38
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->isTied:Z

    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->C:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 41
    .line 42
    const/4 v3, 0x1

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    const-string p1, "https://auto.tancdn.com/v1/raw/8f12e6b0-762c-4bf7-8733-7f8801aed51013.svga"

    .line 46
    .line 47
    invoke-virtual {v2, p1, v3, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->K:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 51
    .line 52
    invoke-virtual {p0, p1, v3, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    xor-int/lit8 p1, v0, 0x1

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->G(Z)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {v2, p1, v3, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->K:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->G(Z)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p1, p0, v3, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public x(Ll/sx70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 2
    .line 3
    return-void
.end method

.method public x0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H0:Ll/sa80;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/sa80;->a()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->H0:Ll/sa80;

    .line 7
    .line 8
    if-gtz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/sa80;->b()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 14
    .line 15
    iget-object p1, p1, Ll/sx70;->i:Ll/xx70;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/xx70;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPlaying()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->t0(Z)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->D:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->p0()V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void

    .line 37
    :cond_1
    invoke-virtual {v0}, Ll/sa80;->c()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public y(ZLcom/p1/mobile/putong/data/User;Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 9
    .line 10
    invoke-virtual {v2}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2, v0}, Ll/tfs$a;->b(Ll/oo2;Z)Ll/tfs$a;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "live_pk_main"

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ll/tfs$a;->e(Ljava/lang/String;)Ll/tfs$a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v1, p2}, Ll/tfs$a;->h(Ljava/lang/String;)Ll/tfs$a;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p2}, Ll/tfs$a;->a()Ll/tfs;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-static {v1, p2}, Ll/afu;->d(Ljava/lang/String;Ll/tfs;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    if-eqz p1, :cond_2

    .line 44
    .line 45
    if-eqz p3, :cond_1

    .line 46
    .line 47
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->C()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->J()V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->getFollowView()Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->k0:Z

    .line 64
    .line 65
    if-eqz p2, :cond_3

    .line 66
    .line 67
    const/high16 p2, 0x41400000    # 12.0f

    .line 68
    .line 69
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->D4:I

    .line 78
    .line 79
    invoke-virtual {p3, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p3

    .line 83
    const/16 v1, 0xa

    .line 84
    .line 85
    invoke-static {v1, p3}, Ll/ynp0;->s(ILjava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result p3

    .line 89
    add-int/2addr p2, p3

    .line 90
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    sget p3, Ll/iac0;->b:I

    .line 98
    .line 99
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 104
    .line 105
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->getFollowView()Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->getFollowView()Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    const/high16 p2, 0x3f800000    # 1.0f

    .line 117
    .line 118
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->getFollowView()Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    const/4 p2, 0x1

    .line 126
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->v:Lv/VText;

    .line 130
    .line 131
    const/high16 p2, 0x40800000    # 4.0f

    .line 132
    .line 133
    invoke-static {p2}, Ll/bnl0;->w(F)I

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    invoke-virtual {p1, v0, v0, p2, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 141
    .line 142
    invoke-virtual {p1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->T:Ll/sx70;

    .line 147
    .line 148
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    check-cast p0, Ll/dw40;

    .line 153
    .line 154
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    const-string p2, "liveId"

    .line 159
    .line 160
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    filled-new-array {p0}, [Ll/pf60;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    const-string p2, "e_pk_adverseprofile_button"

    .line 169
    .line 170
    invoke-static {p2, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public y0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->S:Lv/VImage;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->z0(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public z()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->u0(ZZ)V

    .line 3
    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->u0(ZZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public z0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->S:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
