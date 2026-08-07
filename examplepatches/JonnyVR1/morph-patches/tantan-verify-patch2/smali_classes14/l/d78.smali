.class public final synthetic Ll/d78;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d78;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/d78;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/d78;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d78;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/d78;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/d78;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/g;->r5(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method
