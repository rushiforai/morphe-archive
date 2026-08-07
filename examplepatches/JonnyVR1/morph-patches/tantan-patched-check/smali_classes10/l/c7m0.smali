.class public Ll/c7m0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/dressup/VirtualUserDressUpItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;

.field public b:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/c7m0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;

    .line 5
    .line 6
    iput-object p2, p0, Ll/c7m0;->b:Ll/y20;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/dressup/VirtualUserDressUpItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/c7m0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;

    .line 5
    .line 6
    iget-object p0, p0, Ll/c7m0;->b:Ll/y20;

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/dressup/VirtualUserDressUpItemView;->c(Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->q7:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/dressup/VirtualUserDressUpItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/c7m0;->H(Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/dressup/VirtualUserDressUpItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
