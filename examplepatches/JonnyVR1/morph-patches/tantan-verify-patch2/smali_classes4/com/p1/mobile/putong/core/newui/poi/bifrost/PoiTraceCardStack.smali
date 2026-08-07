.class public Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;
.super Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;
.source "SourceFile"

# interfaces
.implements Ll/pn4;


# instance fields
.field public f:Ll/px2;

.field public g:Ll/fsh;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->D()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->D()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/fsh;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->g:Ll/fsh;

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->D()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;)Ll/px2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->f:Ll/px2;

    return-object p0
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;)Ll/fsh;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->g:Ll/fsh;

    return-object p0
.end method

.method private D()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->setAllowUpSwipe(Z)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Ll/ii80;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Ll/ii80;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->f:Ll/px2;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ll/ox2;->l0(Ll/pn4;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->f:Ll/px2;

    .line 20
    .line 21
    new-instance v1, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack$a;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack$a;-><init>(Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/ox2;->k0(Ll/dn4;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private E(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_UP:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack$b;->c:[I

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    aget p1, v1, p1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq p1, v1, :cond_2

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq p1, v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq p1, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_LEFT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 25
    .line 26
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->f:Ll/px2;

    .line 27
    .line 28
    invoke-virtual {p0, v0, p2}, Ll/px2;->A0(Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->E(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public d()Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->f:Ll/px2;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ox2;->G()Ll/txl0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object p0, v0, Ll/txl0;->a:Landroid/view/View;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->f:Ll/px2;

    .line 17
    .line 18
    const-string v0, "get top null"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/ox2;->Y(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public d0(FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 1

    .line 1
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->f:Ll/px2;

    .line 2
    .line 3
    invoke-virtual {p4}, Ll/ox2;->p()Ll/nx2;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    invoke-virtual {p4}, Ll/nx2;->f()I

    .line 8
    .line 9
    .line 10
    move-result p4

    .line 11
    const/4 v0, 0x1

    .line 12
    if-ne p4, v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->g:Ll/fsh;

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2, p3}, Ll/fsh;->n(FFF)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public r(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->E(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setAdapter(Ll/nx2;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->f:Ll/px2;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0, p1}, Ll/ox2;->i0(Ll/nx2;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->f:Ll/px2;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->setRenderManager(Ll/px2;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setAllowUpSwipe(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->b:Z

    .line 2
    .line 3
    return-void
.end method
