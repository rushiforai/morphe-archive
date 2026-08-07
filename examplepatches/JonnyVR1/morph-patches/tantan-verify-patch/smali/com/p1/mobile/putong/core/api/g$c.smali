.class public Lcom/p1/mobile/putong/core/api/g$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/api/g;->qq(D)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/g$c;->b:Lcom/p1/mobile/putong/core/api/g;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/p1/mobile/putong/core/api/g$c;->a:D

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
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/api/g$c;->a:D

    .line 2
    .line 3
    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    .line 4
    .line 5
    cmpl-double v0, v0, v2

    .line 6
    .line 7
    const-string v1, "fake_conversation_local_limited_trial_see_fold"

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
    const/4 v2, 0x0

    .line 30
    const/4 v3, 0x1

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Conversation;->new_()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/api/g$c;->a:D

    .line 40
    .line 41
    iput-wide v4, v0, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 42
    .line 43
    iput-wide v4, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 44
    .line 45
    const-string p0, "default"

    .line 46
    .line 47
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 48
    .line 49
    iput-boolean v3, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 50
    .line 51
    iput v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 52
    .line 53
    :goto_0
    move v2, v3

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    iget-wide v4, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 56
    .line 57
    iget-wide v6, p0, Lcom/p1/mobile/putong/core/api/g$c;->a:D

    .line 58
    .line 59
    cmpl-double p0, v4, v6

    .line 60
    .line 61
    if-eqz p0, :cond_2

    .line 62
    .line 63
    iput-wide v6, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    :goto_1
    if-eqz v2, :cond_3

    .line 67
    .line 68
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 73
    .line 74
    .line 75
    :cond_3
    return-void
.end method
