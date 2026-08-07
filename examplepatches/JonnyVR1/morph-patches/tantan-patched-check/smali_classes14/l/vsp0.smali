.class public final synthetic Ll/vsp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/WebSocketManager$b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/WebSocketManager$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vsp0;->a:Lcom/p1/mobile/putong/api/WebSocketManager$b;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vsp0;->a:Lcom/p1/mobile/putong/api/WebSocketManager$b;

    invoke-static {p0}, Lcom/p1/mobile/putong/api/WebSocketManager$b;->j(Lcom/p1/mobile/putong/api/WebSocketManager$b;)V

    return-void
.end method
