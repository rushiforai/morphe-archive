.class public final synthetic Ll/uhe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic b:Ll/fzq;

.field public final synthetic c:Ll/mdk;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Message;Ll/fzq;Ll/mdk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uhe;->a:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p2, p0, Ll/uhe;->b:Ll/fzq;

    iput-object p3, p0, Ll/uhe;->c:Ll/mdk;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uhe;->a:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v1, p0, Ll/uhe;->b:Ll/fzq;

    iget-object p0, p0, Ll/uhe;->c:Ll/mdk;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, v1, p0, p1}, Ll/bie;->R(Lcom/p1/mobile/putong/core/data/Message;Ll/fzq;Ll/mdk;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
