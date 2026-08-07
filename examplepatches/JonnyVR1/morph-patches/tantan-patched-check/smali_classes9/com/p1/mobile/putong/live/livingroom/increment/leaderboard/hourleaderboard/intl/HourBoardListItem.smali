.class public Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VDraweeView;

.field public f:Lcom/p1/mobile/putong/live/base/view/LiveTagView;

.field public g:Lv/VText;

.field public h:Landroid/widget/FrameLayout;

.field public i:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;

.field public j:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

.field public k:Lv/VText;

.field public final l:I

.field public m:Ljava/lang/Runnable;

.field public n:Ljava/lang/Runnable;

.field public o:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x7d0

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->l:I

    .line 7
    .line 8
    const-string p1, ""

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->o:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0x7d0

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->l:I

    .line 15
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->o:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p1, 0x7d0

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->l:I

    .line 18
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->o:Ljava/lang/String;

    return-void
.end method

.method public static synthetic h0(Ll/uhl;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/uhl;->F(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->t0(Ljava/lang/String;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic j0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->q0()V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->s0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->r0()V

    return-void
.end method

.method private o0(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-wide p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->rank:J

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    cmp-long v0, p0, v0

    .line 6
    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "--"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-wide/16 v0, 0x64

    .line 13
    .line 14
    cmp-long v0, p0, v0

    .line 15
    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    const-string p0, "100+"

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method private p0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->j:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->C(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->j:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->v(IZ)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->j:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->C(Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->j:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->v(IZ)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private v0(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V
    .locals 9
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RtlHardcoded"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 9
    .line 10
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->enable:Z

    .line 11
    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->h:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    const-string v0, "#ff539c"

    .line 21
    .line 22
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    filled-new-array {v3, v0}, [I

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->i:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;

    .line 35
    .line 36
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;->setColors([I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 40
    .line 41
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->target:I

    .line 42
    .line 43
    const/high16 v3, 0x3f800000    # 1.0f

    .line 44
    .line 45
    if-lez v0, :cond_0

    .line 46
    .line 47
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->amount:J

    .line 48
    .line 49
    long-to-float v4, v4

    .line 50
    mul-float/2addr v4, v3

    .line 51
    int-to-float v0, v0

    .line 52
    div-float/2addr v4, v0

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const/4 v4, 0x0

    .line 55
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->i:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;

    .line 56
    .line 57
    cmpl-float v5, v4, v3

    .line 58
    .line 59
    if-lez v5, :cond_1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    move v3, v4

    .line 63
    :goto_1
    invoke-virtual {v0, v3, v1, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;->k(FII)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->i:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;

    .line 67
    .line 68
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->amount:J

    .line 69
    .line 70
    const-wide/16 v7, 0x0

    .line 71
    .line 72
    cmp-long v3, v5, v7

    .line 73
    .line 74
    if-lez v3, :cond_2

    .line 75
    .line 76
    move v1, v2

    .line 77
    :cond_2
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    invoke-direct {p0, v4, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->w0(FLcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->j:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->reset()V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->h:Landroid/widget/FrameLayout;

    .line 90
    .line 91
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method private w0(FLcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V
    .locals 3

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    cmpl-float p1, p1, v0

    .line 4
    .line 5
    if-ltz p1, :cond_0

    .line 6
    .line 7
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->u6:I

    .line 8
    .line 9
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->t6:I

    .line 15
    .line 16
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/p6s;->s0()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 25
    .line 26
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->target:I

    .line 27
    .line 28
    int-to-long v1, v1

    .line 29
    invoke-static {v0, v1, v2}, Ll/icr;->a(ZJ)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {p1, v0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->o:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ll/p6s;->s0()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->x6:I

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->v6:I

    .line 53
    .line 54
    :goto_0
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 55
    .line 56
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Ll/civ;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/civ;->n()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->w6:I

    .line 69
    .line 70
    :cond_2
    iget-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->amount:J

    .line 71
    .line 72
    long-to-int p2, v0

    .line 73
    int-to-long v0, p2

    .line 74
    invoke-static {v0, v1}, Ll/icr;->b(J)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 79
    .line 80
    iget p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->target:I

    .line 81
    .line 82
    int-to-long v0, p3

    .line 83
    invoke-static {v0, v1}, Ll/icr;->b(J)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    filled-new-array {p2, p3}, [Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-static {p1, p2}, Ll/xau;->v(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    new-instance p2, Ll/wil;

    .line 96
    .line 97
    invoke-direct {p2, p0}, Ll/wil;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;)V

    .line 98
    .line 99
    .line 100
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->n:Ljava/lang/Runnable;

    .line 101
    .line 102
    new-instance p2, Ll/xil;

    .line 103
    .line 104
    invoke-direct {p2, p0, p1}, Ll/xil;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->m:Ljava/lang/Runnable;

    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->n:Ljava/lang/Runnable;

    .line 114
    .line 115
    const-wide/16 v0, 0x7d0

    .line 116
    .line 117
    invoke-static {p2, p3, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 118
    .line 119
    .line 120
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->j:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 121
    .line 122
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 123
    .line 124
    .line 125
    move-result p2

    .line 126
    if-lez p2, :cond_3

    .line 127
    .line 128
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->o:Ljava/lang/String;

    .line 129
    .line 130
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->p0(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->j:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 135
    .line 136
    invoke-static {p2}, Ll/bnl0;->K(Landroid/view/View;)Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-virtual {p2}, Lrx/c;->first()Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    new-instance p3, Ll/yil;

    .line 145
    .line 146
    invoke-direct {p3, p0, p1}, Ll/yil;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-static {p3}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 154
    .line 155
    .line 156
    return-void
.end method


# virtual methods
.method public final n0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bjl;->a(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->n0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic q0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->m:Ljava/lang/Runnable;

    .line 6
    .line 7
    const-wide/16 v1, 0x7d0

    .line 8
    .line 9
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic r0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->j:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->setGap(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->j:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 9
    .line 10
    const-wide/16 v1, 0x190

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->setNextAnim(J)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->j:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->o:Ljava/lang/String;

    .line 18
    .line 19
    new-instance v2, Ll/zil;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Ll/zil;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->G(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic s0(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->j:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 2
    .line 3
    const-wide/16 v1, 0x190

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->setPreAnim(J)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->j:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 9
    .line 10
    new-instance v0, Ll/ajl;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/ajl;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->G(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic t0(Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->o:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->p0(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u0(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;Ll/uhl;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V
    .locals 4
    .param p2    # Ll/uhl;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->g:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->userName:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->d:Lv/VText;

    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->k:Lv/VText;

    .line 18
    .line 19
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/p6s;->u0()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/xau;->B()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->k:Lv/VText;

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/p6s;->s0()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->amount:J

    .line 47
    .line 48
    invoke-static {v0, v2, v3}, Ll/icr;->c(ZJ)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_0
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ll/p6s;->s0()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->amount:J

    .line 65
    .line 66
    invoke-static {v0, v2, v3}, Ll/icr;->c(ZJ)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Ll/p6s;->s0()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_1

    .line 82
    .line 83
    sget v0, Ll/obc0;->M3:I

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    sget v0, Ll/obc0;->n:I

    .line 87
    .line 88
    :goto_0
    sget-object v1, Ll/htd0;->f:Ll/htd0;

    .line 89
    .line 90
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    check-cast v1, Ll/civ;

    .line 95
    .line 96
    invoke-virtual {v1}, Ll/civ;->n()Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-eqz v1, :cond_2

    .line 101
    .line 102
    sget v0, Ll/obc0;->k3:I

    .line 103
    .line 104
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->k:Lv/VText;

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-static {v1, v0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->k:Lv/VText;

    .line 118
    .line 119
    sget v1, Ll/qa00;->c:I

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 122
    .line 123
    .line 124
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->e:Lv/VDraweeView;

    .line 125
    .line 126
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->userImage:Ljava/lang/String;

    .line 127
    .line 128
    sget v2, Ll/qa00;->x:I

    .line 129
    .line 130
    const-string v3, "context_single_room"

    .line 131
    .line 132
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->f:Lcom/p1/mobile/putong/live/base/view/LiveTagView;

    .line 136
    .line 137
    const-string v1, "#ff852a"

    .line 138
    .line 139
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    const-string v2, "#ff3a00"

    .line 144
    .line 145
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/view/LiveTagView;->c(II)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->f:Lcom/p1/mobile/putong/live/base/view/LiveTagView;

    .line 153
    .line 154
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveState:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 155
    .line 156
    const-string v2, "onlive"

    .line 157
    .line 158
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 163
    .line 164
    .line 165
    new-instance v0, Ll/vil;

    .line 166
    .line 167
    invoke-direct {v0, p2, p1}, Ll/vil;-><init>(Ll/uhl;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    .line 168
    .line 169
    .line 170
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 171
    .line 172
    .line 173
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->h:Landroid/widget/FrameLayout;

    .line 174
    .line 175
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->isOwn:Z

    .line 176
    .line 177
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 178
    .line 179
    .line 180
    iget-boolean p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->isOwn:Z

    .line 181
    .line 182
    if-eqz p2, :cond_3

    .line 183
    .line 184
    invoke-direct {p0, p1, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->v0(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V

    .line 185
    .line 186
    .line 187
    :cond_3
    return-void
.end method

.method public y0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->n:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->m:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->i:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v0, v1, v2, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;->k(FII)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->j:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->t()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
