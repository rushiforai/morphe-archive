.class public final Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Landroid/content/Context;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Z

.field public e:Z

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Landroid/content/Context;)Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()Landroid/content/Intent;
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->a:Landroid/content/Context;

    .line 4
    .line 5
    const-class v2, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "VIDEO_FLOW_MOMENT_ID"

    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->b:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    const-string v1, "isHideComment"

    .line 18
    .line 19
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->d:Z

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    const-string v1, "VIDEO_LIVE_AUTHOR_ID"

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->f:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    const-string v1, "VIDEO_LIVE_ROOM_ID"

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->g:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    const-string v1, "start_home_card"

    .line 39
    .line 40
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->e:Z

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    const-string v1, "from"

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->h:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->c:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_0

    .line 59
    .line 60
    const-string v1, "VIDEO_FLOW_SOURCE"

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->c:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    :cond_0
    return-object v0
.end method

.method public c(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Z)Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->e:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
