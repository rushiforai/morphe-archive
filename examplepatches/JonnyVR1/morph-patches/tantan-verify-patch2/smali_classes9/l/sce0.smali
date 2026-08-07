.class public Ll/sce0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/sce0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/sce0$a;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sce0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic H(Ll/sce0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sce0;->I(Landroid/view/View;)V

    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/sce0;->a:Ll/sce0$a;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1, p0}, Ll/sce0$a;->z(Ll/sce0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public J(Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/sce0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;->isSelected:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v1, 0x0

    .line 15
    :goto_0
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;Z)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/rce0;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/rce0;-><init>(Ll/sce0;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public K(Ll/sce0$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sce0;->a:Ll/sce0$a;

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->p5:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sce0;->J(Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/ScrapItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
