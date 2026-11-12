.class public final Liwl;
.super Luuj;
.source "SourceFile"


# instance fields
.field public d:J


# virtual methods
.method public final h(Lcom/opera/android/webapps/WebappActivity;Landroid/view/ViewGroup;I)V
    .registers 4

    invoke-super {p0, p1, p2, p3}, Luuj;->h(Lcom/opera/android/webapps/WebappActivity;Landroid/view/ViewGroup;I)V

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Liwl;->d:J

    return-void
.end method

.method public final j()I
    .registers 1

    const p0, 0x7f0d042f

    return p0
.end method

.method public final k()J
    .registers 5

    iget-wide v0, p0, Liwl;->d:J

    const-wide/16 v2, 0x7d0

    add-long/2addr v0, v2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public final n(Ljava/lang/String;)V
    .registers 2

    return-void
.end method
