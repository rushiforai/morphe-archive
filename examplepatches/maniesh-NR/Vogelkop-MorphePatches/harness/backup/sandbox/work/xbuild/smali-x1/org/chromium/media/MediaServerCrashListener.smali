.class public final Lorg/chromium/media/MediaServerCrashListener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# instance fields
.field public a:Landroid/media/MediaPlayer;

.field public b:J

.field public final c:J


# direct methods
.method public constructor <init>(J)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/chromium/media/MediaServerCrashListener;->b:J

    iput-wide p1, p0, Lorg/chromium/media/MediaServerCrashListener;->c:J

    return-void
.end method

.method public static create(J)Lorg/chromium/media/MediaServerCrashListener;
    .registers 3

    new-instance v0, Lorg/chromium/media/MediaServerCrashListener;

    invoke-direct {v0, p0, p1}, Lorg/chromium/media/MediaServerCrashListener;-><init>(J)V

    return-object v0
.end method


# virtual methods
.method public final onError(Landroid/media/MediaPlayer;II)Z
    .registers 4

    const/16 p1, 0x64

    const/4 p3, 0x1

    if-ne p2, p1, :cond_d

    iget-wide p1, p0, Lorg/chromium/media/MediaServerCrashListener;->c:J

    invoke-static {p1, p2, p3}, LJ/N;->Mm$QSrAo(JZ)V

    invoke-virtual {p0}, Lorg/chromium/media/MediaServerCrashListener;->releaseWatchdog()V

    :cond_d
    return p3
.end method

.method public final releaseWatchdog()V
    .registers 2

    iget-object v0, p0, Lorg/chromium/media/MediaServerCrashListener;->a:Landroid/media/MediaPlayer;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/media/MediaServerCrashListener;->a:Landroid/media/MediaPlayer;

    return-void
.end method

.method public final startListening()Z
    .registers 9

    iget-object v0, p0, Lorg/chromium/media/MediaServerCrashListener;->a:Landroid/media/MediaPlayer;

    const/4 v1, 0x1

    if-eqz v0, :cond_6

    return v1

    :cond_6
    :try_start_6
    sget-object v0, Lt8;->a:Landroid/content/Context;

    const v2, 0x7f13000c

    invoke-static {v0, v2}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/media/MediaServerCrashListener;->a:Landroid/media/MediaPlayer;
    :try_end_11
    .catch Ljava/lang/IllegalStateException; {:try_start_6 .. :try_end_11} :catch_11
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_11} :catch_11

    :catch_11
    iget-object v0, p0, Lorg/chromium/media/MediaServerCrashListener;->a:Landroid/media/MediaPlayer;

    const-wide/16 v2, -0x1

    if-eqz v0, :cond_1d

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    iput-wide v2, p0, Lorg/chromium/media/MediaServerCrashListener;->b:J

    return v1

    :cond_1d
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v4, p0, Lorg/chromium/media/MediaServerCrashListener;->b:J

    cmp-long v2, v4, v2

    const/4 v3, 0x0

    if-eqz v2, :cond_30

    sub-long v4, v0, v4

    const-wide/16 v6, 0x1388

    cmp-long v2, v4, v6

    if-lez v2, :cond_37

    :cond_30
    iget-wide v4, p0, Lorg/chromium/media/MediaServerCrashListener;->c:J

    invoke-static {v4, v5, v3}, LJ/N;->Mm$QSrAo(JZ)V

    iput-wide v0, p0, Lorg/chromium/media/MediaServerCrashListener;->b:J

    :cond_37
    return v3
.end method
