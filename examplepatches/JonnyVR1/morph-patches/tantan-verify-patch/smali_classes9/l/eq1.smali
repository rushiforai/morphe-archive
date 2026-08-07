.class public Ll/eq1;
.super Ll/kf2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/kf2<",
        "Lcom/p1/mobile/putong/live/livingroom/common/bottom/BlackDiamondBottomView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 1

    .line 1
    sget v0, Ll/yec0;->r:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0, p2}, Ll/kf2;-><init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public V3(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/kf2;->V3(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kf2;->c4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;
    .locals 0

    .line 1
    const-string p0, "diamond"

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
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BlackDiamondBottomView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/eq1;->i4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/BlackDiamondBottomView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/BlackDiamondBottomView;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/kf2;->d4(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 5
    .line 6
    sget v1, Ll/kf2;->o:I

    .line 7
    .line 8
    sget v2, Ll/kf2;->p:I

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/kf2;->Z3()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BlackDiamondBottomView;->b:Lv/VDraweeView;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/kf2;->Z3()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v0, "context_livingAct"

    .line 33
    .line 34
    invoke-static {v0, p1, p0}, Ll/izs;->k(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method
