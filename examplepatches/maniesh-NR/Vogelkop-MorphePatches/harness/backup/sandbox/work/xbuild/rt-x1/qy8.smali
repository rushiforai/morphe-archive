.class public final Lqy8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:B

.field public final c:I

.field public final d:Z

.field public e:J

.field public f:J

.field public g:I

.field public final synthetic h:Luy8;


# direct methods
.method public constructor <init>(Luy8;Ljava/lang/String;IJZ)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqy8;->h:Luy8;

    const-string p1, "FEEDBACK_TRACKER_SEND_CONTROLLER_LAST_SUCCESS_"

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lqy8;->a:Ljava/lang/String;

    iput-byte p3, p0, Lqy8;->b:B

    long-to-int p1, p4

    iput p1, p0, Lqy8;->c:I

    iput-boolean p6, p0, Lqy8;->d:Z

    return-void
.end method


# virtual methods
.method public final a()J
    .registers 4

    iget-object v0, p0, Lqy8;->h:Luy8;

    iget-object v0, v0, Luy8;->n:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    iget-object p0, p0, Lqy8;->a:Ljava/lang/String;

    const-wide/16 v1, 0x0

    invoke-interface {v0, p0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public final b()V
    .registers 5

    iget-object v0, p0, Lqy8;->h:Luy8;

    iget-object v0, v0, Luy8;->n:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lqy8;->a:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lqy8;->c(Z)V

    return-void
.end method

.method public final c(Z)V
    .registers 12

    iget-object v0, p0, Lqy8;->h:Luy8;

    iget-object v0, v0, Luy8;->g:Lue2;

    iget-boolean v1, p0, Lqy8;->d:Z

    if-nez v1, :cond_f

    iget v1, p0, Lqy8;->g:I

    if-gtz v1, :cond_f

    if-nez p1, :cond_f

    return-void

    :cond_f
    invoke-virtual {p0}, Lqy8;->a()J

    move-result-wide v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    cmp-long v5, v1, v3

    const-wide/16 v6, 0x0

    if-lez v5, :cond_1e

    move-wide v1, v6

    :cond_1e
    iget-wide v8, p0, Lqy8;->e:J

    cmp-long v5, v8, v1

    if-lez v5, :cond_27

    iget-wide v6, p0, Lqy8;->f:J

    goto :goto_2e

    :cond_27
    if-nez p1, :cond_2e

    iget p1, p0, Lqy8;->c:I

    int-to-long v5, p1

    add-long v6, v1, v5

    :cond_2e
    :goto_2e
    iget-byte p0, p0, Lqy8;->b:B

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeMessages(I)V

    cmp-long p1, v6, v3

    if-gtz p1, :cond_3b

    invoke-virtual {v0, p0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    :cond_3b
    sub-long/2addr v6, v3

    invoke-virtual {v0, p0, v6, v7}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method
