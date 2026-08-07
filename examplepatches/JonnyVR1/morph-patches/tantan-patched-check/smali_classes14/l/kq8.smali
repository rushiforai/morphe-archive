.class public final synthetic Ll/kq8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/h;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/h;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kq8;->a:Lcom/p1/mobile/putong/core/api/h;

    iput-object p2, p0, Ll/kq8;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kq8;->a:Lcom/p1/mobile/putong/core/api/h;

    iget-object p0, p0, Ll/kq8;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/h;->h3(Lcom/p1/mobile/putong/core/api/h;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method
