.class public final synthetic Ll/etc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ltc0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/RedPacket;


# direct methods
.method public synthetic constructor <init>(Ll/ltc0;Lcom/p1/mobile/putong/core/data/RedPacket;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/etc0;->a:Ll/ltc0;

    iput-object p2, p0, Ll/etc0;->b:Lcom/p1/mobile/putong/core/data/RedPacket;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/etc0;->a:Ll/ltc0;

    iget-object p0, p0, Ll/etc0;->b:Lcom/p1/mobile/putong/core/data/RedPacket;

    invoke-static {v0, p0}, Ll/ltc0;->h0(Ll/ltc0;Lcom/p1/mobile/putong/core/data/RedPacket;)V

    return-void
.end method
