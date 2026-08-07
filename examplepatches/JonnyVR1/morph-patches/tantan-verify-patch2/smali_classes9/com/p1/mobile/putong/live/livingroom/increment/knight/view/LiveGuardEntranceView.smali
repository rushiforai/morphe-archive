.class public Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LivingUserRollAnimView;

.field public f:Lv/VImage;

.field public g:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


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

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->k0(Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;Ll/nsv;)Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardSimpleUserView;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->m0(Ll/nsv;)Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardSimpleUserView;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ets;->a(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k0(Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->g:Ll/z20;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->g:Ll/z20;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public l0(ZLcom/p1/mobile/putong/live/base/data/BLiveData;Ljava/util/List;Z)V
    .locals 2
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/p1/mobile/putong/live/base/data/BLiveData;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveKnightsInfosSummary;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsInfosSummary;

    .line 19
    .line 20
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsInfosSummary;->knightsNumber:I

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->d:Lv/VText;

    .line 25
    .line 26
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->S:I

    .line 27
    .line 28
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsInfosSummary;

    .line 33
    .line 34
    iget p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsInfosSummary;->knightsNumber:I

    .line 35
    .line 36
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    invoke-static {v1, p3}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    invoke-virtual {p4, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->d:Lv/VText;

    .line 49
    .line 50
    if-eqz p4, :cond_1

    .line 51
    .line 52
    sget p4, Lcom/p1/mobile/putong/live/livingroom/R$string;->W:I

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    sget p4, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ge:I

    .line 56
    .line 57
    :goto_0
    invoke-static {p4}, Ll/xau;->t(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p4

    .line 61
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    :goto_1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LivingUserRollAnimView;

    .line 65
    .line 66
    invoke-static {p2}, Ll/fvk;->f(Lcom/p1/mobile/putong/live/base/data/BLiveData;)Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->setUsers(Ljava/util/List;)V

    .line 71
    .line 72
    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LivingUserRollAnimView;

    .line 76
    .line 77
    new-instance p2, Ll/cts;

    .line 78
    .line 79
    invoke-direct {p2, p0}, Ll/cts;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->setItemViewFunc(Ll/qcj;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LivingUserRollAnimView;

    .line 86
    .line 87
    const/16 p2, 0x9c4

    .line 88
    .line 89
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->setDelay(I)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LivingUserRollAnimView;

    .line 93
    .line 94
    const/4 p2, 0x1

    .line 95
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LivingUserRollAnimView;

    .line 99
    .line 100
    new-instance p2, Ll/dts;

    .line 101
    .line 102
    invoke-direct {p2, p0}, Ll/dts;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->setNextAction(Ll/z20;)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LivingUserRollAnimView;

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->O()V

    .line 111
    .line 112
    .line 113
    :cond_2
    return-void
.end method

.method public final m0(Ll/nsv;)Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardSimpleUserView;
    .locals 2
    .param p1    # Ll/nsv;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)",
            "Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardSimpleUserView;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Ll/yec0;->b2:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardSimpleUserView;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardSimpleUserView;->a(Ll/nsv;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    return-object p0
.end method

.method public n0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LivingUserRollAnimView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->reset()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public setNextAction(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->g:Ll/z20;

    .line 2
    .line 3
    return-void
.end method
