.class public Ll/w8k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/z8k0<",
        "TD;>;>;"
    }
.end annotation


# instance fields
.field public a:Ll/jxd0;

.field public b:Ll/z8k0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z8k0<",
            "TD;>;"
        }
    .end annotation
.end field

.field public final c:Landroid/widget/LinearLayout;

.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;


# direct methods
.method public constructor <init>(Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jxd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "has_anim_guard_shown_"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/w8k0;->a:Ll/jxd0;

    .line 32
    .line 33
    iput-object p1, p0, Ll/w8k0;->c:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    iput-object p2, p0, Ll/w8k0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic a(Ll/w8k0;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w8k0;->f(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Ll/w8k0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w8k0;->i()V

    return-void
.end method

.method public static synthetic c(Ll/w8k0;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w8k0;->j(Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/w8k0;->c:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final d()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/w8k0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/w8k0;->c:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/w8k0;->b:Ll/z8k0;

    .line 19
    .line 20
    new-instance v1, Ll/u8k0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/u8k0;-><init>(Ll/w8k0;)V

    .line 23
    .line 24
    .line 25
    const-wide/16 v2, 0x3e8

    .line 26
    .line 27
    invoke-virtual {v0, v2, v3, v1}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/z8k0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z8k0<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/w8k0;->b:Ll/z8k0;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic f(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Ll/w8k0;->c:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    invoke-static {v0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/w8k0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;

    .line 17
    .line 18
    const/high16 v0, 0x42500000    # 52.0f

    .line 19
    .line 20
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sub-int/2addr v0, p1

    .line 25
    int-to-float p1, v0

    .line 26
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic i()V
    .locals 4

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/high16 v1, 0x42500000    # 52.0f

    .line 8
    .line 9
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    filled-new-array {v0, v1}, [I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/v8k0;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/v8k0;-><init>(Ll/w8k0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/w8k0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;

    .line 30
    .line 31
    const/4 v1, 0x2

    .line 32
    new-array v2, v1, [F

    .line 33
    .line 34
    fill-array-data v2, :array_0

    .line 35
    .line 36
    .line 37
    const-string v3, "alpha"

    .line 38
    .line 39
    invoke-static {p0, v3, v2}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-array v1, v1, [Landroid/animation/Animator;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    aput-object p0, v1, v2

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    aput-object v0, v1, p0

    .line 50
    .line 51
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-wide/16 v0, 0x1f4

    .line 56
    .line 57
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    nop

    .line 65
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/z8k0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w8k0;->e(Ll/z8k0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final synthetic j(Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    sub-int/2addr p2, p1

    .line 10
    const/4 p1, 0x3

    .line 11
    if-ne p2, p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/w8k0;->b:Ll/z8k0;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/xzs;->D2()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/w8k0;->b:Ll/z8k0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/z8k0;->n4()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public k(ZLcom/p1/mobile/putong/live/base/data/BLiveData;Ljava/util/List;)V
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
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/w8k0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/w8k0;->b:Ll/z8k0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

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
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 16
    .line 17
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-virtual {v0, p1, p2, p3, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->l0(ZLcom/p1/mobile/putong/live/base/data/BLiveData;Ljava/util/List;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public l(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;)V
    .locals 3
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/w8k0;->b:Ll/z8k0;

    .line 10
    .line 11
    invoke-virtual {v0, p2, p1}, Ll/z8k0;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    move p1, v2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move p1, v1

    .line 20
    :goto_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/w8k0;->b:Ll/z8k0;

    .line 27
    .line 28
    invoke-virtual {v0, p2}, Ll/z8k0;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-eqz p2, :cond_1

    .line 33
    .line 34
    move p2, v2

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move p2, v1

    .line 37
    :goto_1
    iget-object v0, p0, Ll/w8k0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;

    .line 38
    .line 39
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/w8k0;->c:Landroid/widget/LinearLayout;

    .line 43
    .line 44
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/w8k0;->c:Landroid/widget/LinearLayout;

    .line 48
    .line 49
    if-eqz p2, :cond_2

    .line 50
    .line 51
    sget p2, Ll/qa00;->i:I

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_2
    sget p2, Ll/qa00;->o:I

    .line 55
    .line 56
    :goto_2
    invoke-static {v0, p2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    if-eqz p1, :cond_4

    .line 60
    .line 61
    iget-object p1, p0, Ll/w8k0;->a:Ll/jxd0;

    .line 62
    .line 63
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Ljava/lang/Boolean;

    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_3

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/w8k0;->d()V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/w8k0;->a:Ll/jxd0;

    .line 79
    .line 80
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 81
    .line 82
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    :cond_3
    iget-object p1, p0, Ll/w8k0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;

    .line 86
    .line 87
    iget-object p2, p0, Ll/w8k0;->b:Ll/z8k0;

    .line 88
    .line 89
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 90
    .line 91
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p2, v0}, Ll/ms2;->i0(Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    const/4 v0, 0x0

    .line 100
    invoke-virtual {p1, v2, v0, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->l0(ZLcom/p1/mobile/putong/live/base/data/BLiveData;Ljava/util/List;Z)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Ll/w8k0;->b:Ll/z8k0;

    .line 104
    .line 105
    invoke-virtual {p1}, Ll/z8k0;->m4()V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Ll/w8k0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;

    .line 109
    .line 110
    new-instance p2, Ll/t8k0;

    .line 111
    .line 112
    invoke-direct {p2, p0}, Ll/t8k0;-><init>(Ll/w8k0;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;->setNextAction(Ll/z20;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_4
    iget-object p0, p0, Ll/w8k0;->d:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;

    .line 120
    .line 121
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    return-void
.end method
