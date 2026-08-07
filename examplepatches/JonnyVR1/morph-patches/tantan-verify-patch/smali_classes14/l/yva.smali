.class public final synthetic Ll/yva;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/RedPacket;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;Lcom/p1/mobile/putong/core/data/RedPacket;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yva;->a:Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;

    iput-object p2, p0, Ll/yva;->b:Lcom/p1/mobile/putong/core/data/RedPacket;

    iput-object p3, p0, Ll/yva;->c:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yva;->a:Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;

    iget-object v1, p0, Ll/yva;->b:Lcom/p1/mobile/putong/core/data/RedPacket;

    iget-object p0, p0, Ll/yva;->c:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/x;->h3(Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;Lcom/p1/mobile/putong/core/data/RedPacket;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
