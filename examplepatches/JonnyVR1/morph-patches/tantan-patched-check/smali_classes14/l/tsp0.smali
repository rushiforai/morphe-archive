.class public final synthetic Ll/tsp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/WebSocketManager$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/WebSocketManager$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tsp0;->a:Lcom/p1/mobile/putong/api/WebSocketManager$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tsp0;->a:Lcom/p1/mobile/putong/api/WebSocketManager$a;

    check-cast p1, Lcom/p1/mobile/putong/data/Connector;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager$a;->a(Lcom/p1/mobile/putong/api/WebSocketManager$a;Lcom/p1/mobile/putong/data/Connector;)V

    return-void
.end method
