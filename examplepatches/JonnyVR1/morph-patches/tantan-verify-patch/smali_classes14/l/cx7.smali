.class public final synthetic Ll/cx7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cx7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/cx7;->b:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cx7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object p0, p0, Ll/cx7;->b:Lcom/p1/mobile/putong/core/data/Message;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->b9(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
