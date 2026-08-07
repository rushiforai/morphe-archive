.class public final synthetic Ll/b08;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b08;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/b08;->b:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b08;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object p0, p0, Ll/b08;->b:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->l6(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
