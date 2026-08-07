.class public Ll/zbd0;
.super Ll/e9d0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/e9d0<",
        "Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;",
        ">;"
    }
.end annotation


# instance fields
.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Z


# direct methods
.method public constructor <init>(Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/e9d0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zbd0;->e:Ljava/util/List;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/zbd0;->f:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public H()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zbd0;->e:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public I()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/zbd0;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public J(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->k(Ll/zbd0;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;Ljava/util/List;)V
    .locals 0
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/d3q;->v(Landroid/view/View;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->p1:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zbd0;->J(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic v(Landroid/view/View;Ljava/util/List;)V
    .locals 0
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/zbd0;->K(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
