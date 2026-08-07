.class public final Ll/sc80;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/view/PlaceHolderRecyclerItemHolderView;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0017\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0002H\u0014\u00a2\u0006\u0004\u0008\u000b\u0010\u000cR\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\r\u0010\u000b\u001a\u0004\u0008\u000e\u0010\u0008\u00a8\u0006\u000f"
    }
    d2 = {
        "Ll/sc80;",
        "Ll/d3q;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/view/PlaceHolderRecyclerItemHolderView;",
        "",
        "height",
        "<init>",
        "(I)V",
        "o",
        "()I",
        "itemView",
        "",
        "I",
        "(Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/view/PlaceHolderRecyclerItemHolderView;)V",
        "a",
        "H",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/sc80;->a:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final H()I
    .locals 0

    .line 1
    iget p0, p0, Ll/sc80;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public I(Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/view/PlaceHolderRecyclerItemHolderView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/view/PlaceHolderRecyclerItemHolderView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/view/PlaceHolderRecyclerItemHolderView;->b(Ll/sc80;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->d5:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/view/PlaceHolderRecyclerItemHolderView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sc80;->I(Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/view/PlaceHolderRecyclerItemHolderView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
