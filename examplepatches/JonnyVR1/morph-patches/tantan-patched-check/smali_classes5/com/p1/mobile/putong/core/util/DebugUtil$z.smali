.class public Lcom/p1/mobile/putong/core/util/DebugUtil$z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->xj(Lcom/p1/mobile/putong/core/newui/home/b;Ll/b240;)Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 4
    .line 5
    const/16 v1, 0xa

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iput v1, v0, Lcom/p1/mobile/putong/data/Passby;->count:I

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/Passby;->new_()Lcom/p1/mobile/putong/data/Passby;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 17
    .line 18
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    .line 21
    .line 22
    iput v1, p0, Lcom/p1/mobile/putong/data/Passby;->count:I

    .line 23
    .line 24
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil$z;->a(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
