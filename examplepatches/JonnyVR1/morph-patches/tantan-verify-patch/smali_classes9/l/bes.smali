.class public Ll/bes;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveTask;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveTask;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveTask;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bes;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTask;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bes;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTask;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveTask;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    if-eqz p1, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    check-cast p1, Ll/bes;

    .line 19
    .line 20
    iget-object p0, p0, Ll/bes;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTask;

    .line 21
    .line 22
    iget-object p1, p1, Ll/bes;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTask;

    .line 23
    .line 24
    invoke-static {p0, p1}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bes;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTask;

    .line 2
    .line 3
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/k950;->b([Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->u3:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bes;->H(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
