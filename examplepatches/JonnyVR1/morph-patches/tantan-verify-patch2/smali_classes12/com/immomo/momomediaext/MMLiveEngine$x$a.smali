.class Lcom/immomo/momomediaext/MMLiveEngine$x$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveEngine$x;->onRequestChannelKey()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/momomediaext/MMLiveEngine$x;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine$x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$x$a;->a:Lcom/immomo/momomediaext/MMLiveEngine$x;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$x$a;->a:Lcom/immomo/momomediaext/MMLiveEngine$x;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$x;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "onRequestChannelKey"

    .line 12
    .line 13
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->b([Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$x$a;->a:Lcom/immomo/momomediaext/MMLiveEngine$x;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$x;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$x$a;->a:Lcom/immomo/momomediaext/MMLiveEngine$x;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$x;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->h(Lcom/immomo/momomediaext/MMLiveEngine;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ll/enw;->f0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method
