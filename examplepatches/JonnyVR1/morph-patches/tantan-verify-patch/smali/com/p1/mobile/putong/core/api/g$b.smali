.class public Lcom/p1/mobile/putong/core/api/g$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/api/g;->Pg(D)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:D

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/g;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/g;D)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/g$b;->b:Lcom/p1/mobile/putong/core/api/g;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/p1/mobile/putong/core/api/g$b;->a:D

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
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/api/g$b;->a:D

    .line 2
    .line 3
    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    .line 4
    .line 5
    cmpl-double v0, v0, v2

    .line 6
    .line 7
    const-string v1, "fake_conversation_local_team_group_conversation"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 12
    .line 13
    iget-object p0, p0, Ll/il8;->m:Ll/mm6;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Ll/wzh0;->delete(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 20
    .line 21
    iget-object v0, v0, Ll/il8;->m:Ll/mm6;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Conversation;->new_()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/api/g$b;->a:D

    .line 38
    .line 39
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 40
    .line 41
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 42
    .line 43
    const-string p0, "default"

    .line 44
    .line 45
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 49
    .line 50
    const/4 p0, 0x0

    .line 51
    iput p0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 55
    .line 56
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/api/g$b;->a:D

    .line 57
    .line 58
    cmpl-double p0, v1, v3

    .line 59
    .line 60
    if-eqz p0, :cond_2

    .line 61
    .line 62
    iput-wide v3, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 63
    .line 64
    :cond_2
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method
