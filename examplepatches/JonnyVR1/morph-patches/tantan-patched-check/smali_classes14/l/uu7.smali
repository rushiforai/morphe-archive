.class public final synthetic Ll/uu7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uu7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/uu7;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-boolean p3, p0, Ll/uu7;->c:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uu7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/uu7;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-boolean p0, p0, Ll/uu7;->c:Z

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/g;->e9(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;Z)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
