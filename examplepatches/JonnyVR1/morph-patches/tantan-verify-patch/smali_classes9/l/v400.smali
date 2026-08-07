.class public final synthetic Ll/v400;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/g500;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Ll/g500;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v400;->a:Ll/g500;

    iput-object p2, p0, Ll/v400;->b:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v400;->a:Ll/g500;

    iget-object p0, p0, Ll/v400;->b:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, p0}, Ll/g500;->h0(Ll/g500;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
