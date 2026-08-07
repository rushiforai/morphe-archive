.class public Ll/yhe0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

.field public b:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yhe0;->b:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Landroid/view/View;
    .locals 1

    .line 1
    sget p3, Ll/kec0;->Tb:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 9
    .line 10
    iput-object p1, p0, Ll/yhe0;->a:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->setRenderType(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/yhe0;->a:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 16
    .line 17
    return-object p0
.end method

.method public e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V
    .locals 0
    .param p4    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    instance-of p2, p1, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 6
    .line 7
    iget-object p0, p0, Ll/yhe0;->b:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->O(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    return-object p0
.end method
