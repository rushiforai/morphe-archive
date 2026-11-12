.class public final Lvjc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leig;


# instance fields
.field public final synthetic a:Lcom/opera/android/live_score/LiveCommentaryService;


# direct methods
.method public constructor <init>(Lcom/opera/android/live_score/LiveCommentaryService;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvjc;->a:Lcom/opera/android/live_score/LiveCommentaryService;

    return-void
.end method


# virtual methods
.method public final F(Lrhg;)V
    .registers 5

    sget-object v0, Lcs6;->c:Lnak;

    new-instance v1, Lwjc;

    iget-object p0, p0, Lvjc;->a:Lcom/opera/android/live_score/LiveCommentaryService;

    iget-object v2, p0, Lcom/opera/android/live_score/LiveCommentaryService;->f:Ljava/lang/String;

    if-nez v2, :cond_c

    const-string v2, ""

    :cond_c
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_14

    const-string p1, "Playback error"

    :cond_14
    invoke-direct {v1, v2, p1}, Lwjc;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p1, 0x0

    invoke-virtual {v0, p1, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    return-void
.end method

.method public final P(Z)V
    .registers 10

    const-string v0, ""

    const/4 v1, 0x0

    iget-object p0, p0, Lvjc;->a:Lcom/opera/android/live_score/LiveCommentaryService;

    if-eqz p1, :cond_23

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/opera/android/live_score/LiveCommentaryService;->j:J

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->k:Z

    sget-object p1, Lcs6;->c:Lnak;

    new-instance v2, Lzjc;

    iget-object p0, p0, Lcom/opera/android/live_score/LiveCommentaryService;->f:Ljava/lang/String;

    if-eqz p0, :cond_19

    move-object v0, p0

    :cond_19
    invoke-direct {v2, v0}, Lzjc;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v1, v2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void

    :cond_23
    iget-boolean p1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->k:Z

    if-eqz p1, :cond_75

    iget-wide v2, p0, Lcom/opera/android/live_score/LiveCommentaryService;->i:J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/opera/android/live_score/LiveCommentaryService;->j:J

    sub-long/2addr v4, v6

    add-long/2addr v4, v2

    iput-wide v4, p0, Lcom/opera/android/live_score/LiveCommentaryService;->i:J

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->k:Z

    iget-object p1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->a:Lujc;

    if-eqz p1, :cond_45

    iget-object p1, p1, Lgk9;->b:Lgig;

    invoke-interface {p1}, Lgig;->getPlaybackState()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_46

    :cond_45
    move-object p1, v1

    :goto_46
    if-eqz p1, :cond_75

    iget-object p1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->a:Lujc;

    if-eqz p1, :cond_55

    iget-object p1, p1, Lgk9;->b:Lgig;

    invoke-interface {p1}, Lgig;->getPlaybackState()I

    move-result p1

    const/4 v2, 0x4

    if-eq p1, v2, :cond_75

    :cond_55
    iget-object p1, p0, Lcom/opera/android/live_score/LiveCommentaryService;->a:Lujc;

    if-eqz p1, :cond_60

    iget-object p1, p1, Lgk9;->b:Lgig;

    invoke-interface {p1}, Lgig;->s()Lrhg;

    move-result-object p1

    goto :goto_61

    :cond_60
    move-object p1, v1

    :goto_61
    if-nez p1, :cond_75

    sget-object p1, Lcs6;->c:Lnak;

    new-instance v2, Lyjc;

    iget-object p0, p0, Lcom/opera/android/live_score/LiveCommentaryService;->f:Ljava/lang/String;

    if-eqz p0, :cond_6c

    move-object v0, p0

    :cond_6c
    invoke-direct {v2, v0}, Lyjc;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v1, v2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_75
    return-void
.end method

.method public final h(I)V
    .registers 4

    const/4 v0, 0x4

    if-ne p1, v0, :cond_13

    sget-object p1, Lcs6;->c:Lnak;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    sget-object v1, Lxjc;->a:Lxjc;

    invoke-virtual {p1, v0, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    iget-object p0, p0, Lvjc;->a:Lcom/opera/android/live_score/LiveCommentaryService;

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    :cond_13
    return-void
.end method
