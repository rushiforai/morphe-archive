.class public Ll/n5o;
.super Ll/bvu;
.source "SourceFile"


# instance fields
.field public final l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;"
        }
    .end annotation
.end field

.field public final m:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/FragmentManager;Ljava/util/List;IILcom/tantan/live/home/eventbus/LiveHomeEventBus;)V
    .locals 1
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/FragmentManager;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;II",
            "Lcom/tantan/live/home/eventbus/LiveHomeEventBus;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0, p3, p4}, Ll/bvu;-><init>(Landroidx/fragment/app/FragmentManager;ZII)V

    .line 3
    .line 4
    .line 5
    iput-object p2, p0, Ll/n5o;->l:Ljava/util/List;

    .line 6
    .line 7
    iput-object p5, p0, Ll/n5o;->m:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n5o;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public k(I)Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n5o;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 8
    .line 9
    sget-object v1, Ll/m5o;->INSTANCE:Ll/m5o;

    .line 10
    .line 11
    iget v2, p0, Ll/bvu;->h:I

    .line 12
    .line 13
    if-ne p1, v2, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    :goto_0
    iget-object p0, p0, Ll/n5o;->m:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 19
    .line 20
    invoke-virtual {v1, v0, p1, p0}, Ll/m5o;->e(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;ZLcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method
