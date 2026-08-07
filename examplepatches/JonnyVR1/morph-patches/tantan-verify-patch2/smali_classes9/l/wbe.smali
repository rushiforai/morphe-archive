.class public Ll/wbe;
.super Ll/lb2;
.source "SourceFile"


# instance fields
.field public e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/bce;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wbe;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic q(Ll/bce;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bce;->d:Ll/tbe;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic r(Ll/wbe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/wbe;->s()V

    return-void
.end method

.method private synthetic s()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wbe;->f:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/ube;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/ube;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wbe;->f:Ljava/util/List;

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

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wbe;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Ll/bce;

    .line 8
    .line 9
    invoke-virtual {p2, p1}, Ll/bce;->g(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/wbe;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;

    .line 14
    .line 15
    invoke-virtual {p2, v1, v0}, Ll/bce;->d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Landroidx/recyclerview/widget/RecyclerView;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/vbe;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/vbe;-><init>(Ll/wbe;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p2, Ll/bce;->e:Ll/x20;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public t(Ll/xbe;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/xbe;->a:Ljava/util/List;

    .line 2
    .line 3
    iput-object p1, p0, Ll/wbe;->f:Ljava/util/List;

    .line 4
    .line 5
    return-void
.end method
