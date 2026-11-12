.class public final Lhv2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw82;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public final c:Lb59;

.field public final d:Ld53;

.field public final e:Lip1;

.field public f:Z

.field public g:Lc53;

.field public h:Z

.field public i:Z

.field public final j:Lfv2;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLjava/lang/String;Lb59;Ld53;Lip1;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lfv2;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lfv2;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lhv2;->j:Lfv2;

    const-string v0, "/"

    invoke-static {p1, v0, p4}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lhv2;->a:Ljava/lang/String;

    long-to-int p1, p2

    iput p1, p0, Lhv2;->b:I

    iput-object p5, p0, Lhv2;->c:Lb59;

    iput-object p6, p0, Lhv2;->d:Ld53;

    iput-object p7, p0, Lhv2;->e:Lip1;

    return-void
.end method


# virtual methods
.method public final a(Lc53;)V
    .registers 3

    iput-object p1, p0, Lhv2;->g:Lc53;

    iget-boolean v0, p0, Lhv2;->h:Z

    if-nez v0, :cond_13

    if-eqz p1, :cond_13

    iget-object v0, p0, Lhv2;->e:Lip1;

    invoke-virtual {v0, p1}, Lip1;->accept(Ljava/lang/Object;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lhv2;->g:Lc53;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lhv2;->f:Z

    :cond_13
    return-void
.end method

.method public final c(Lc53;)V
    .registers 2

    const/4 p1, 0x0

    iput-object p1, p0, Lhv2;->g:Lc53;

    return-void
.end method

.method public final d(Lk92;Ljava/lang/Exception;)V
    .registers 3

    const/4 p1, 0x0

    iput-object p1, p0, Lhv2;->g:Lc53;

    return-void
.end method

.method public final e()V
    .registers 11

    iget-boolean v0, p0, Lhv2;->i:Z

    iget-object v1, p0, Lhv2;->j:Lfv2;

    if-eqz v0, :cond_c

    invoke-static {v1}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lhv2;->i:Z

    :cond_c
    iget-boolean v0, p0, Lhv2;->f:Z

    const-wide/16 v2, 0x0

    if-nez v0, :cond_4e

    iget-boolean v0, p0, Lhv2;->h:Z

    if-nez v0, :cond_4e

    iget-object v0, p0, Lhv2;->g:Lc53;

    if-nez v0, :cond_4e

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v0, p0, Lhv2;->c:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "autorefresh.time["

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lhv2;->a:Ljava/lang/String;

    const-string v8, "]"

    invoke-static {v6, v7, v8}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    cmp-long v0, v6, v8

    if-lez v0, :cond_42

    move-wide v6, v2

    :cond_42
    sub-long/2addr v4, v6

    iget v0, p0, Lhv2;->b:I

    int-to-long v6, v0

    cmp-long v0, v4, v6

    if-gez v0, :cond_4c

    sub-long/2addr v6, v4

    goto :goto_50

    :cond_4c
    move-wide v6, v2

    goto :goto_50

    :cond_4e
    const-wide/16 v6, -0x1

    :goto_50
    cmp-long v0, v6, v2

    if-nez v0, :cond_5e

    invoke-virtual {p0}, Lhv2;->f()V

    iget-object v0, p0, Lhv2;->d:Ld53;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1, p0}, Ld53;->e(Ljava/lang/Object;Loqe;Lw82;)V

    return-void

    :cond_5e
    if-gez v0, :cond_61

    return-void

    :cond_61
    const/4 v0, 0x1

    iput-boolean v0, p0, Lhv2;->i:Z

    const-wide/16 v2, 0x3e8

    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void
.end method

.method public final f()V
    .registers 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lhv2;->c:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "autorefresh.time["

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lhv2;->a:Ljava/lang/String;

    const-string v4, "]"

    invoke-static {v3, p0, v4}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v2, p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lhv2;->a:Ljava/lang/String;

    return-object p0
.end method
