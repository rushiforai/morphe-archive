.class public final synthetic Ll/msp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/WebSocketManager;

.field public final synthetic b:Lokio/ByteString;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/WebSocketManager;Lokio/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/msp0;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    iput-object p2, p0, Ll/msp0;->b:Lokio/ByteString;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/msp0;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    iget-object p0, p0, Ll/msp0;->b:Lokio/ByteString;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->a(Lcom/p1/mobile/putong/api/WebSocketManager;Lokio/ByteString;)V

    return-void
.end method
