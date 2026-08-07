.class public final synthetic Ll/nm7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ChatGroup;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nm7;->a:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iput-object p2, p0, Ll/nm7;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-object p3, p0, Ll/nm7;->c:Ljava/util/List;

    iput-object p4, p0, Ll/nm7;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nm7;->a:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iget-object v1, p0, Ll/nm7;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-object v2, p0, Ll/nm7;->c:Ljava/util/List;

    iget-object p0, p0, Ll/nm7;->d:Ljava/util/List;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/e;->t5(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method
