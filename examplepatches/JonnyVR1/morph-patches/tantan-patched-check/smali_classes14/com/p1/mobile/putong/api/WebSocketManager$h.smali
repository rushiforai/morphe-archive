.class public Lcom/p1/mobile/putong/api/WebSocketManager$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/WebSocketManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "h"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/WebSocketManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$h;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/WebSocketManager;Ll/zsp0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager$h;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$h;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->S()Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->FORBIDDEN:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 8
    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CLOSE:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$h;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/api/WebSocketManager;->g:Ljava/util/Queue;

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroid/util/Pair;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$h;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/p1/mobile/putong/api/WebSocketManager;->j(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/api/WebSocketManager$f;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$h;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 37
    .line 38
    invoke-static {v1}, Lcom/p1/mobile/putong/api/WebSocketManager;->j(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/api/WebSocketManager$f;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/api/WebSocketManager$f;->a:Lokio/ByteString;

    .line 43
    .line 44
    iget-object v2, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 45
    .line 46
    if-eq v1, v2, :cond_2

    .line 47
    .line 48
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$h;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 49
    .line 50
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v0, Lokio/ByteString;

    .line 53
    .line 54
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->A(Lcom/p1/mobile/putong/api/WebSocketManager;Lokio/ByteString;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    :goto_0
    return-void
.end method
