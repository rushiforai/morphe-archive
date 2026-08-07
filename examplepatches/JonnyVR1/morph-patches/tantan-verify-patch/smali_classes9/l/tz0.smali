.class public abstract Ll/tz0;
.super Ll/e80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/e80<",
        "Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final x:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;ILjava/lang/String;)V
    .locals 8
    .param p6    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    sget v2, Ll/yec0;->f1:I

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
    move-object v7, p7

    .line 10
    invoke-direct/range {v0 .. v7}, Ll/e80;-><init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput p6, v0, Ll/tz0;->x:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public bridge synthetic d4(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tz0;->n4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/e80;->d4(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/e80;->Z3()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object v0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/e80;->Z3()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;->setImageUrl(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;

    .line 27
    .line 28
    iget p1, p0, Ll/tz0;->x:I

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;->setImageRes(I)V

    .line 31
    .line 32
    .line 33
    :goto_0
    iget-object p1, p0, Ll/kf2;->k:Landroid/view/View;

    .line 34
    .line 35
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;

    .line 36
    .line 37
    iget-object p0, p0, Ll/kf2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
