.class public final Ll/yzr;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/LiveBlackListItemView;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u000b\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0017\u0010\u000e\u001a\u00020\r2\u0006\u0010\u000c\u001a\u00020\u0002H\u0014\u00a2\u0006\u0004\u0008\u000e\u0010\u000fR\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0010\u0010\u0011\u001a\u0004\u0008\u0012\u0010\u0013R\u0017\u0010\u0006\u001a\u00020\u00058\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0014\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017\u00a8\u0006\u0018"
    }
    d2 = {
        "Ll/yzr;",
        "Ll/d3q;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/LiveBlackListItemView;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;",
        "item",
        "Ll/czr;",
        "listener",
        "<init>",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;Ll/czr;)V",
        "",
        "o",
        "()I",
        "itemView",
        "",
        "J",
        "(Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/LiveBlackListItemView;)V",
        "a",
        "Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;",
        "H",
        "()Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;",
        "b",
        "Ll/czr;",
        "I",
        "()Ll/czr;",
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
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ll/czr;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;Ll/czr;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/czr;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/yzr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;

    .line 11
    .line 12
    iput-object p2, p0, Ll/yzr;->b:Ll/czr;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final H()Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yzr;->a:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public final I()Ll/czr;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yzr;->b:Ll/czr;

    .line 2
    .line 3
    return-object p0
.end method

.method public J(Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/LiveBlackListItemView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/LiveBlackListItemView;
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
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/LiveBlackListItemView;->j0(Ll/yzr;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->h1:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/LiveBlackListItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yzr;->J(Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/LiveBlackListItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
