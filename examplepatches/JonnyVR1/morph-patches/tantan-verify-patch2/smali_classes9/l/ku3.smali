.class public Ll/ku3;
.super Ll/e80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/e80<",
        "Lcom/p1/mobile/putong/live/livingroom/common/bottom/SummonFansItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Z

.field public final B:Ll/w34;

.field public final C:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public final D:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public E:Landroid/view/View;

.field public x:Z

.field public y:Ljava/lang/String;

.field public z:Z


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    sget v2, Ll/yec0;->z:I

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    move-object v6, p5

    .line 9
    move-object v7, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Ll/e80;-><init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    iput-boolean p0, v0, Ll/ku3;->x:Z

    .line 15
    .line 16
    const-string p1, ""

    .line 17
    .line 18
    iput-object p1, v0, Ll/ku3;->y:Ljava/lang/String;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    iput-boolean p1, v0, Ll/ku3;->z:Z

    .line 22
    .line 23
    iput-boolean p0, v0, Ll/ku3;->A:Z

    .line 24
    .line 25
    sget p0, Ll/obc0;->l6:I

    .line 26
    .line 27
    iput p0, v0, Ll/ku3;->C:I

    .line 28
    .line 29
    sget p0, Ll/obc0;->m6:I

    .line 30
    .line 31
    iput p0, v0, Ll/ku3;->D:I

    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    iput-object p0, v0, Ll/ku3;->E:Landroid/view/View;

    .line 35
    .line 36
    new-instance p0, Ll/w34;

    .line 37
    .line 38
    invoke-direct {p0, v1, v0}, Ll/w34;-><init>(Ll/dum;Ll/ku3;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Ll/w34;

    .line 46
    .line 47
    iput-object p0, v0, Ll/ku3;->B:Ll/w34;

    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public V3(Landroid/view/View;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingSuperCall"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/kf2;->g4()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/qmj;

    .line 5
    .line 6
    const/16 v0, 0x1388

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ll/qmj;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;

    .line 16
    .line 17
    new-instance v1, Ll/pmj;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Ll/pmj;-><init>(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 27
    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void

    .line 34
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/ku3;->B:Ll/w34;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/w34;->D4(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;
    .locals 0

    .line 1
    const-string p0, "summonFans"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic d4(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/SummonFansItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ku3;->p4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/SummonFansItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f4()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ku3;->x:Z

    .line 2
    .line 3
    return p0
.end method

.method public n4()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    iget-object p0, p0, Ll/ku3;->E:Landroid/view/View;

    .line 8
    .line 9
    return-object p0
.end method

.method public o4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/SummonFansItemView;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/ku3;->p4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/SummonFansItemView;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public p4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/SummonFansItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/e80;->d4(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ku3;->E:Landroid/view/View;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/SummonFansItemView;->f:Lv/VText;

    .line 7
    .line 8
    iget-object v0, p0, Ll/kf2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iget-boolean p1, p0, Ll/ku3;->z:Z

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/ku3;->q4(Z)V

    .line 18
    .line 19
    .line 20
    iget-boolean p1, p0, Ll/ku3;->A:Z

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/ku3;->r4(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public q4(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Ll/ku3;->z:Z

    .line 2
    .line 3
    iget-object v0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/SummonFansItemView;

    .line 11
    .line 12
    iget-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/SummonFansItemView;->c:Lv/VDraweeView;

    .line 13
    .line 14
    iget p0, p0, Ll/ku3;->C:I

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/SummonFansItemView;

    .line 21
    .line 22
    iget-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/SummonFansItemView;->c:Lv/VDraweeView;

    .line 23
    .line 24
    iget p0, p0, Ll/ku3;->D:I

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public r4(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Ll/ku3;->A:Z

    .line 2
    .line 3
    iget-object v0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/SummonFansItemView;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/SummonFansItemView;->g:Landroid/widget/TextView;

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/kf2;->k:Landroid/view/View;

    .line 16
    .line 17
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/SummonFansItemView;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/SummonFansItemView;->g:Landroid/widget/TextView;

    .line 20
    .line 21
    iget-object p0, p0, Ll/ku3;->y:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public s4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ku3;->y:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public t4(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ku3;->x:Z

    .line 2
    .line 3
    return-void
.end method
