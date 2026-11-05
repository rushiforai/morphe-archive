.class public final Le/e/a/CastControls218$Clock;
.super Ljava/lang/Object;
.source "CastControls218.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CastControls218;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Clock"
.end annotation


# instance fields
.field private final fragment:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CastControls218$Clock;->fragment:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getCurrentPosition()J
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 88
    iget-object v0, p0, Le/e/a/CastControls218$Clock;->fragment:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/CastControls218;->current(Ljava/lang/Object;)Z

    move-result v0

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_1a

    const-string v0, "O"

    # invokes: Le/e/a/CastControls218;->state(Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v0}, Le/e/a/CastControls218;->access$0(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    :cond_1a
    return-wide v1
.end method

.method public getDuration()J
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 87
    iget-object v0, p0, Le/e/a/CastControls218$Clock;->fragment:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/CastControls218;->current(Ljava/lang/Object;)Z

    move-result v0

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_1a

    const-string v0, "N"

    # invokes: Le/e/a/CastControls218;->state(Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v0}, Le/e/a/CastControls218;->access$0(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    :cond_1a
    return-wide v1
.end method

.method public seekTo(J)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 90
    iget-object v0, p0, Le/e/a/CastControls218$Clock;->fragment:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/CastControls218;->current(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    .line 91
    :cond_9
    iget-object v0, p0, Le/e/a/CastControls218$Clock;->fragment:Ljava/lang/Object;

    const-string v1, "A1"

    # invokes: Le/e/a/CastControls218;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v0, v1}, Le/e/a/CastControls218;->access$1(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-virtual {p0}, Le/e/a/CastControls218$Clock;->getDuration()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_21

    .line 92
    invoke-static {p1, p2, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    :cond_21
    invoke-static {v3, v4, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    const-wide/32 v1, 0x7fffffff

    invoke-static {v1, v2, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    long-to-int p2, p1

    .line 93
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.sauzask.nicoid.NicoidChormecastSenderService"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iget-object v1, p0, Le/e/a/CastControls218$Clock;->fragment:Ljava/lang/Object;

    const-string v2, "b0"

    # invokes: Le/e/a/CastControls218;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v1, v2}, Le/e/a/CastControls218;->access$1(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "url"

    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v1, "type"

    const/4 v2, 0x3

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p1

    const-string v1, "posi"

    invoke-virtual {p1, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p1

    .line 94
    invoke-static {v0, p1}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method
