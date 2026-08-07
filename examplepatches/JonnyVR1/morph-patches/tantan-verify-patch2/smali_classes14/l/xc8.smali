.class public final synthetic Ll/xc8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xc8;->a:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p2, p0, Ll/xc8;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/xc8;->c:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xc8;->a:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v1, p0, Ll/xc8;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/xc8;->c:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/g;->E6(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
