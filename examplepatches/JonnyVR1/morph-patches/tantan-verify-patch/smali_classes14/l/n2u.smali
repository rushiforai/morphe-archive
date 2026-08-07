.class public Ll/n2u;
.super Ll/bvu;
.source "SourceFile"


# instance fields
.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;"
        }
    .end annotation
.end field

.field public final m:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/FragmentManager;IILcom/tantan/live/home/eventbus/LiveHomeEventBus;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0, p2, p3}, Ll/bvu;-><init>(Landroidx/fragment/app/FragmentManager;ZII)V

    .line 3
    .line 4
    .line 5
    new-instance p1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/n2u;->l:Ljava/util/List;

    .line 11
    .line 12
    iput-object p4, p0, Ll/n2u;->m:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n2u;->l:Ljava/util/List;

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
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n2u;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 8
    .line 9
    sget-object v0, Ll/m2u;->INSTANCE:Ll/m2u;

    .line 10
    .line 11
    iget-object p0, p0, Ll/n2u;->m:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 12
    .line 13
    invoke-virtual {v0, p1, p0}, Ll/m2u;->d(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public l()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/n2u;->l:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/n2u;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/n2u;->l:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/bvu;->j()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
