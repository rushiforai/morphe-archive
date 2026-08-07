.class public Lcom/p1/mobile/putong/core/util/DebugUtil$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil$a;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Lcom/p1/mobile/putong/core/data/Conversation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic b:Lcom/p1/mobile/putong/core/util/DebugUtil$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/util/DebugUtil$a;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$a$a;->b:Lcom/p1/mobile/putong/core/util/DebugUtil$a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$a$a;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 5

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$a$a;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->clone()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->pinChatSuggested:Z

    .line 15
    .line 16
    invoke-static {}, Ll/pzi0;->o()J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    const-wide/32 v3, 0x1d4c0

    .line 21
    .line 22
    .line 23
    add-long/2addr v1, v3

    .line 24
    long-to-double v1, v1

    .line 25
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->expireTime:D

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
