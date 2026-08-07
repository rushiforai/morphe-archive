.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public a:J

.field public b:Z

.field public final c:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;->a:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;->b:Z

    .line 10
    .line 11
    new-instance v0, Ll/sq6;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/sq6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;->c:Ljava/lang/Runnable;

    .line 17
    .line 18
    return-void
.end method

.method public synthetic constructor <init>(Ll/xq6;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;-><init>()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;->c()V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;->a:J

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;->c:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic c()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->t1:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;->a:J

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;->b:Z

    .line 16
    .line 17
    const-string p0, "ConversationList refreshObs onNext(Unit.UNIT)"

    .line 18
    .line 19
    invoke-static {p0}, Ll/ue6;->C(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public d()V
    .locals 5

    .line 1
    invoke-static {}, Ll/gra;->n()Lcom/p1/mobile/putong/core/data/ConversationRefreshIntervalConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget v0, v0, Lcom/p1/mobile/putong/core/data/ConversationRefreshIntervalConfig;->conversationRefreshObsInterval:I

    .line 12
    .line 13
    mul-int/lit16 v0, v0, 0x3e8

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;->a:J

    .line 22
    .line 23
    sub-long/2addr v1, v3

    .line 24
    invoke-static {v1, v2}, Ljava/lang/Math;->abs(J)J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    int-to-long v3, v0

    .line 29
    cmp-long v0, v1, v3

    .line 30
    .line 31
    if-ltz v0, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;->c:Ljava/lang/Runnable;

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;->b:Z

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    const/4 v0, 0x1

    .line 45
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;->b:Z

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$d;->c:Ljava/lang/Runnable;

    .line 50
    .line 51
    invoke-static {v0, p0, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
