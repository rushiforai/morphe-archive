.class public Lcom/opera/android/downloads/DownloadPauseManager;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Lh7f;


# direct methods
.method public constructor <init>(J)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/opera/android/downloads/DownloadPauseManager;->b:Lh7f;

    iput-wide p1, p0, Lcom/opera/android/downloads/DownloadPauseManager;->a:J

    return-void
.end method


# virtual methods
.method public final finalize()V
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadPauseManager;->a:J

    invoke-static {v0, v1}, LJ/N;->MvDqqe5e(J)V

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public final onDownloadPauseChanged(JZ)V
    .registers 8

    iget-object p0, p0, Lcom/opera/android/downloads/DownloadPauseManager;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_6
    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpf7;

    iget-object v1, v0, Lpf7;->b:Lrf7;

    iget-object v0, v0, Lpf7;->a:Lxf7;

    invoke-virtual {v0}, Lxf7;->a()Z

    move-result v0

    if-eqz v0, :cond_1f

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    goto :goto_21

    :cond_1f
    const-wide/16 v2, 0x0

    :goto_21
    or-long/2addr v2, p1

    invoke-virtual {v1, v2, v3}, Lrf7;->d(J)Lre7;

    move-result-object v0

    if-eqz v0, :cond_6

    iget-object v1, v0, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {v1}, Lcom/opera/android/downloads/DownloadItem;->getState()I

    move-result v1

    invoke-virtual {v0, v1, p3}, Lre7;->B(IZ)V

    goto :goto_6

    :cond_32
    return-void
.end method
