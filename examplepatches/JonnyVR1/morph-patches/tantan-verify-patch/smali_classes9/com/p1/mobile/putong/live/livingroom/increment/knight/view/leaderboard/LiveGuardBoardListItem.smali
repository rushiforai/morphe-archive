.class public Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardListItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VDraweeView;

.field public f:Lcom/p1/mobile/putong/live/base/view/LiveTagView;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/TextView;


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

.method public static synthetic h0(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ats;->G(Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vss;->a(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardListItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardListItem;->f:Lcom/p1/mobile/putong/live/base/view/LiveTagView;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->liveStates:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 4
    .line 5
    const-string v2, "onlive"

    .line 6
    .line 7
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->liveStates:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 15
    .line 16
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardListItem;->g:Landroid/widget/TextView;

    .line 21
    .line 22
    const/high16 v2, 0x42100000    # 36.0f

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-static {v1, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/high16 v0, 0x41800000    # 16.0f

    .line 35
    .line 36
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-static {v1, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardListItem;->d:Lv/VText;

    .line 44
    .line 45
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->rank:I

    .line 46
    .line 47
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardListItem;->e:Lv/VDraweeView;

    .line 55
    .line 56
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->userImage:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    const-string v4, "context_livingAct"

    .line 67
    .line 68
    invoke-static {v4, v0, v1, v3, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardListItem;->g:Landroid/widget/TextView;

    .line 72
    .line 73
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->userName:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardListItem;->h:Landroid/widget/TextView;

    .line 79
    .line 80
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->K5:I

    .line 81
    .line 82
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->amount:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 85
    .line 86
    .line 87
    move-result-wide v2

    .line 88
    invoke-static {v2, v3}, Ll/yau;->c(D)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-static {v1, v2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    new-instance v0, Ll/uss;

    .line 100
    .line 101
    invoke-direct {v0, p1, p2}, Ll/uss;-><init>(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardListItem;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
