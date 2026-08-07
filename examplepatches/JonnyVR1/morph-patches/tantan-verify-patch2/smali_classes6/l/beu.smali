.class public Ll/beu;
.super Ll/uxr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/uxr<",
        "Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/titleline/LiveTitleLineCardView;",
        ">;"
    }
.end annotation


# instance fields
.field private final cardData:Ll/ceu;


# direct methods
.method public constructor <init>(Ll/hk4;Ll/ceu;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uxr;-><init>(Ll/hk4;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/beu;->cardData:Ll/ceu;

    .line 5
    .line 6
    return-void
.end method

.method public static O(Ll/hk4;Ll/a4s;)Ll/beu;
    .locals 1

    .line 1
    instance-of v0, p1, Ll/ceu;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/beu;

    .line 6
    .line 7
    check-cast p1, Ll/ceu;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ll/beu;-><init>(Ll/hk4;Ll/ceu;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method


# virtual methods
.method public P(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/titleline/LiveTitleLineCardView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/uxr;->cardContext:Ll/hk4;

    .line 5
    .line 6
    iget-object p0, p0, Ll/beu;->cardData:Ll/ceu;

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/titleline/LiveTitleLineCardView;->c(Ll/hk4;Ll/ceu;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/vec0;->r:I

    .line 2
    .line 3
    return p0
.end method

.method public q()I
    .locals 0

    .line 1
    const/4 p0, 0x6

    .line 2
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/titleline/LiveTitleLineCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/beu;->P(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/titleline/LiveTitleLineCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
