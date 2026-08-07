.class Lcom/immomo/momomediaext/MMLiveEngine$n$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveEngine$n;->i(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/momomediaext/MMLiveEngine$n;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine$n;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$n$b;->a:Lcom/immomo/momomediaext/MMLiveEngine$n;

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
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$n$b;->a:Lcom/immomo/momomediaext/MMLiveEngine$n;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/immomo/momomediaext/MMLiveEngine$n;->a:Lcom/immomo/momomediaext/MMLiveEngine;

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
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$n$b;->a:Lcom/immomo/momomediaext/MMLiveEngine$n;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$n;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->i(Lcom/immomo/momomediaext/MMLiveEngine;)Ll/enw;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLiveAcrossRoomState;->MMLiveAcrossRoomStateDisconnected:Lcom/immomo/momomediaext/utils/MMLiveAcrossRoomState;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/enw;->a(Lcom/immomo/momomediaext/utils/MMLiveAcrossRoomState;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
