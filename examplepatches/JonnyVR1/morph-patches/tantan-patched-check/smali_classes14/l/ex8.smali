.class public final synthetic Ll/ex8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ex8;->a:Lcom/p1/mobile/putong/core/api/j;

    iput-object p2, p0, Ll/ex8;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/ex8;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ex8;->a:Lcom/p1/mobile/putong/core/api/j;

    iget-object v1, p0, Ll/ex8;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/ex8;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/j;->H3(Lcom/p1/mobile/putong/core/api/j;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object p0

    return-object p0
.end method
