.class public final Lvmk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Lumi;

.field public final c:Lqlk;

.field public d:Z

.field public e:J

.field public f:J

.field public g:J

.field public h:J

.field public i:Loml;


# direct methods
.method public constructor <init>(JLavj;Lumi;Lqlk;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lvmk;->a:J

    iput-object p4, p0, Lvmk;->b:Lumi;

    iput-object p5, p0, Lvmk;->c:Lqlk;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 15

    iget-object v0, p0, Lvmk;->i:Loml;

    if-eqz v0, :cond_b

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lvmk;->i:Loml;

    :cond_b
    iget-boolean v0, p0, Lvmk;->d:Z

    if-eqz v0, :cond_76

    iget-wide v0, p0, Lvmk;->e:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_76

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v4, p0, Lvmk;->b:Lumi;

    iget-object v5, p0, Lvmk;->c:Lqlk;

    invoke-interface {v4, v5}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v4

    new-instance v5, Loml;

    invoke-direct {v5, v4}, Loml;-><init>(Lnml;)V

    iput-object v5, p0, Lvmk;->i:Loml;

    iget-wide v4, p0, Lvmk;->e:J

    iget-wide v6, p0, Lvmk;->h:J

    cmp-long v8, v6, v2

    if-lez v8, :cond_36

    cmp-long v8, v0, v6

    if-ltz v8, :cond_6b

    :cond_36
    iget-wide v6, p0, Lvmk;->f:J

    cmp-long v2, v6, v2

    if-gtz v2, :cond_3f

    const-wide/high16 v2, -0x8000000000000000L

    goto :goto_42

    :cond_3f
    iget-wide v2, p0, Lvmk;->a:J

    add-long/2addr v2, v6

    :goto_42
    cmp-long v6, v4, v0

    if-gtz v6, :cond_4b

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    goto :goto_6b

    :cond_4b
    const-wide/32 v6, 0x5265c00

    sub-long v6, v4, v6

    cmp-long v8, v0, v6

    if-ltz v8, :cond_59

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    goto :goto_6b

    :cond_59
    const-wide/32 v8, 0xa4cb800

    sub-long/2addr v4, v8

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    sub-long/2addr v6, v4

    invoke-static {v6, v7}, Lavj;->e(J)J

    move-result-wide v6

    add-long/2addr v6, v4

    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    :cond_6b
    :goto_6b
    sub-long v10, v6, v0

    iget-object v8, p0, Lvmk;->i:Loml;

    sget-object v12, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v13, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v8 .. v13}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    :cond_76
    return-void
.end method
