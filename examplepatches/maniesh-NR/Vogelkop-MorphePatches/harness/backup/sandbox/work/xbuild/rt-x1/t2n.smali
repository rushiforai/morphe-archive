.class public final Lt2n;
.super Lrb4;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final synthetic b:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic c:Ll94;

.field public final synthetic d:Lq3j;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/atomic/AtomicBoolean;Ll94;Lq3j;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt2n;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p2, p0, Lt2n;->c:Ll94;

    iput-object p3, p0, Lt2n;->d:Lq3j;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lt2n;->a:Z

    return-void
.end method


# virtual methods
.method public final b(ILyb4;)V
    .registers 5

    iget-boolean p1, p0, Lt2n;->a:Z

    if-eqz p1, :cond_10

    const/4 p1, 0x0

    iput-boolean p1, p0, Lt2n;->a:Z

    invoke-interface {p2}, Lyb4;->e()J

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    :cond_10
    iget-object p1, p0, Lt2n;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_54

    invoke-interface {p2}, Lyb4;->d()Lhbl;

    move-result-object p2

    const-string v0, "androidx.camera.video.VideoCapture.streamUpdate"

    iget-object p2, p2, Lhbl;->a:Landroid/util/ArrayMap;

    invoke-virtual {p2, v0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_54

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    iget-object v0, p0, Lt2n;->c:Ll94;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    if-ne p2, v1, :cond_54

    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Ll94;->b(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_54

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result p1

    if-nez p1, :cond_54

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p1

    new-instance p2, Lnpl;

    const/16 v0, 0x13

    iget-object v1, p0, Lt2n;->d:Lq3j;

    invoke-direct {p2, p0, v1, v0}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    check-cast p1, Lg7a;

    invoke-virtual {p1, p2}, Lg7a;->execute(Ljava/lang/Runnable;)V

    :cond_54
    return-void
.end method
