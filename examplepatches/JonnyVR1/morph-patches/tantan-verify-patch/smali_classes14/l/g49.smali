.class public final synthetic Ll/g49;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreInnerPush;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreInnerPush;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g49;->a:Lcom/p1/mobile/putong/core/api/CoreInnerPush;

    iput-object p2, p0, Ll/g49;->b:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g49;->a:Lcom/p1/mobile/putong/core/api/CoreInnerPush;

    iget-object p0, p0, Ll/g49;->b:Lcom/p1/mobile/putong/core/data/Message;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->c(Lcom/p1/mobile/putong/core/api/CoreInnerPush;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
