.class public Lcom/p1/mobile/putong/core/util/DebugUtil$y1$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil$y1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/util/DebugUtil$y1;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/util/DebugUtil$y1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$y1$a;->a:Lcom/p1/mobile/putong/core/util/DebugUtil$y1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/il8;->m:Ll/mm6;

    .line 4
    .line 5
    const-string v0, "fake_conversation_local_summary_marriage_conversation"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Conversation;->new_()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iput-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    long-to-double v0, v1

    .line 26
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 27
    .line 28
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 29
    .line 30
    const-string v0, "default"

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 36
    .line 37
    const/4 v0, 0x2

    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 v0, 0x3

    .line 42
    iput v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 43
    .line 44
    long-to-double v0, v1

    .line 45
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 46
    .line 47
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
