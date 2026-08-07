.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/PkBottomMenuView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDot;


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/PkBottomMenuView;

.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public d:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ss70;->a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/PkBottomMenuView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/PkBottomMenuView;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/PkBottomMenuView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/PkBottomMenuView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 14
    .line 15
    const-string v0, "https://auto.tancdn.com/v1/raw/b397b07f-304c-4a32-b675-4ff555a3a26411.pdf"

    .line 16
    .line 17
    const/4 v1, -0x1

    .line 18
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/PkBottomMenuView;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/PkBottomMenuView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/PkBottomMenuView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public g0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/PkBottomMenuView;->d:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/PkBottomMenuView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setIcon(I)V
    .locals 0

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/PkBottomMenuView;->b:Lv/VDraweeView;

    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    return-void
.end method

.method public setIcon(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/PkBottomMenuView;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const/high16 v0, 0x42300000    # 44.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/high16 v1, 0x42180000    # 38.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const-string v2, "context_livingAct"

    .line 16
    .line 17
    invoke-static {v2, p0, p1, v0, v1}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setPkBackGround(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget p1, Ll/obc0;->T:I

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
