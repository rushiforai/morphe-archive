.class public final synthetic Ll/mfq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mfq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mfq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->b(Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;)V

    return-void
.end method
