.class public final synthetic Ll/im9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/r;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/api/r;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/im9;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/im9;->b:Lcom/p1/mobile/putong/core/api/r;

    iput-object p3, p0, Ll/im9;->c:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/im9;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/im9;->b:Lcom/p1/mobile/putong/core/api/r;

    iget-object p0, p0, Ll/im9;->c:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/r;->F3(Ljava/lang/String;Lcom/p1/mobile/putong/core/api/r;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
