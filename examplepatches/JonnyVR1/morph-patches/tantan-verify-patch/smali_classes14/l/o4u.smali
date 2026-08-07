.class public Ll/o4u;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareMenuItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final b:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;I)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/o4u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;

    .line 5
    .line 6
    iput p2, p0, Ll/o4u;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareMenuItemView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/o4u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;

    .line 5
    .line 6
    iget v1, p0, Ll/o4u;->b:I

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareMenuItemView;->c(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;I)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareMenuItemView;->a:Lv/VImage;

    .line 12
    .line 13
    iget-object p0, p0, Ll/o4u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;->isShowRedDots()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p1, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->H0:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareMenuItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/o4u;->H(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareMenuItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
