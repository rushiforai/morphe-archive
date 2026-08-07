.class public Ll/db2;
.super Ll/kf2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/kf2<",
        "Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;",
        ">;"
    }
.end annotation


# instance fields
.field public final q:Ll/jjj0;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 1

    .line 1
    sget v0, Ll/yec0;->f6:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0, p2}, Ll/kf2;-><init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Ll/jjj0;

    .line 7
    .line 8
    invoke-direct {p2, p1, p0}, Ll/jjj0;-><init>(Ll/dum;Ll/db2;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ll/jjj0;

    .line 16
    .line 17
    iput-object p1, p0, Ll/db2;->q:Ll/jjj0;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public V3(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;
    .locals 0

    .line 1
    const-string p0, "newUserTreasureBoxButton"

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
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/db2;->i4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/kf2;->d4(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 5
    .line 6
    sget v1, Ll/bnl0;->f:I

    .line 7
    .line 8
    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/kf2;->Z3()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;->setIcon(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/db2;->q:Ll/jjj0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/jjj0;->o4()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
