.class public abstract Ll/fq1;
.super Ll/kf2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/kf2<",
        "Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;",
        ">;"
    }
.end annotation


# instance fields
.field public final q:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public r:Z


# direct methods
.method public constructor <init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 1
    .param p2    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/yec0;->y:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0, p3}, Ll/kf2;-><init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Ll/fq1;->q:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic d4(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fq1;->i4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;)V
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
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget v0, p0, Ll/fq1;->q:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->setLocalIcon(I)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/kf2;->Z3()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->setRemoteIcon(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-object v0, p0, Ll/kf2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->c(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 42
    .line 43
    .line 44
    iget-boolean p0, p0, Ll/fq1;->r:Z

    .line 45
    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->e()V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method
