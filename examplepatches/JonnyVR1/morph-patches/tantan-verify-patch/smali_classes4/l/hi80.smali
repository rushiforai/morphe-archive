.class public Ll/hi80;
.super Ll/nx2;
.source "SourceFile"


# instance fields
.field public b:Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ji80;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nx2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hi80;->d:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hi80;->b:Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public d(Landroid/view/View;I)V
    .locals 1

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;

    .line 2
    .line 3
    iget-object v0, p0, Ll/hi80;->c:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/ji80;

    .line 10
    .line 11
    iget-object p0, p0, Ll/hi80;->d:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 12
    .line 13
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->q(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Ll/ji80;)V

    .line 14
    .line 15
    .line 16
    if-nez p2, :cond_0

    .line 17
    .line 18
    iget-object p0, v0, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->n(Lcom/p1/mobile/putong/data/User;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, v0, Ll/ji80;->c:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->o(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public e(ILandroid/content/Context;Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 0

    .line 1
    sget p1, Ll/kec0;->L8:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/hi80;->b:Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-virtual {p3, p1, p0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hi80;->c:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public g(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hi80;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h(I)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public i(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hi80;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ji80;

    .line 8
    .line 9
    iget-object p0, p0, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public l(Landroid/view/View;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public m(Ll/txl0;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/hi80;->c:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/hi80;->c:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/hi80;->d:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->R4()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public n(Ll/ji80;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hi80;->c:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/hi80;->c:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/hi80;->c:Ljava/util/List;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/nx2;->a()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public o(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ji80;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/hi80;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nx2;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
