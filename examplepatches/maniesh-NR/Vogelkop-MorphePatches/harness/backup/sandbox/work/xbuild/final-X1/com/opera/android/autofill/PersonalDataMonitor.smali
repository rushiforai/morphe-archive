.class public final Lcom/opera/android/autofill/PersonalDataMonitor;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/Runnable;

.field public b:J


# virtual methods
.method public final a()V
    .registers 6

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/autofill/PersonalDataMonitor;->a:Ljava/lang/Runnable;

    iget-wide v0, p0, Lcom/opera/android/autofill/PersonalDataMonitor;->b:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_10

    invoke-static {v0, v1}, LJ/N;->Mdhcfmkv(J)V

    iput-wide v2, p0, Lcom/opera/android/autofill/PersonalDataMonitor;->b:J

    :cond_10
    return-void
.end method

.method public final onPersonalDataChanged()V
    .registers 1

    iget-object p0, p0, Lcom/opera/android/autofill/PersonalDataMonitor;->a:Ljava/lang/Runnable;

    if-eqz p0, :cond_7

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_7
    return-void
.end method
