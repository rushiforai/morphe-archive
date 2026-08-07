.class public final synthetic Ll/rl8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/tl8;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Device;


# direct methods
.method public synthetic constructor <init>(Ll/tl8;Lcom/p1/mobile/putong/data/Device;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rl8;->a:Ll/tl8;

    iput-object p2, p0, Ll/rl8;->b:Lcom/p1/mobile/putong/data/Device;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rl8;->a:Ll/tl8;

    iget-object p0, p0, Ll/rl8;->b:Lcom/p1/mobile/putong/data/Device;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Ll/tl8;->y(Ll/tl8;Lcom/p1/mobile/putong/data/Device;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Device;

    move-result-object p0

    return-object p0
.end method
