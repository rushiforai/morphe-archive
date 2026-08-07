.class public abstract Ll/uxr;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Ll/d3q<",
        "TV;>;"
    }
.end annotation


# static fields
.field public static final TOTAL_SPAN_COUNT:I = 0x6


# instance fields
.field private final autoPlayHelper:Ll/ph4;

.field protected final cardContext:Ll/hk4;


# direct methods
.method public constructor <init>(Ll/hk4;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ph4;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ph4;-><init>(Ll/uxr;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/uxr;->autoPlayHelper:Ll/ph4;

    .line 10
    .line 11
    iput-object p1, p0, Ll/uxr;->cardContext:Ll/hk4;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public H()Ll/ph4;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxr;->autoPlayHelper:Ll/ph4;

    .line 2
    .line 3
    return-object p0
.end method

.method public I(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public J(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public K(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/uxr;->autoPlayHelper:Ll/ph4;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ph4;->b(Landroid/view/View;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public L(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMc(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public N(Ll/j80;Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/j80;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const-string v0, "0"

    .line 6
    .line 7
    const-string v1, "1"

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    move-object p1, v1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object p1, v0

    .line 14
    :goto_0
    const-string v2, "is_return_search"

    .line 15
    .line 16
    invoke-virtual {p2, v2, p1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/uxr;->H()Ll/ph4;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/ph4;->d()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    move-object v0, v1

    .line 30
    :cond_1
    const-string p0, "is_gif"

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    invoke-static {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMv(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public v(Landroid/view/View;Ljava/util/List;)V
    .locals 1
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;",
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
    const/4 v0, 0x0

    .line 5
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0, p1, p2}, Ll/uxr;->K(Landroid/view/View;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/uxr;->I(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public y(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->y(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/uxr;->autoPlayHelper:Ll/ph4;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/ph4;->c(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
