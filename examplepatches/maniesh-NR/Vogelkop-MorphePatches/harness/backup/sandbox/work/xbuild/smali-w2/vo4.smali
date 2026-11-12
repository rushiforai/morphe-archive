.class public final Lvo4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/cast/framework/media/RemoteMediaClient$ProgressListener;


# instance fields
.field public final synthetic a:Lzo4;


# direct methods
.method public constructor <init>(Lzo4;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvo4;->a:Lzo4;

    return-void
.end method


# virtual methods
.method public final onProgressUpdated(JJ)V
    .registers 8

    iget-object p0, p0, Lvo4;->a:Lzo4;

    iget-boolean v0, p0, Lzo4;->L:Z

    if-nez v0, :cond_13

    new-instance v0, Lt14;

    const/16 v1, 0x1b

    invoke-direct {v0, v1}, Lt14;-><init>(B)V

    invoke-virtual {p0, v0}, Lzo4;->y0(Lt14;)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_13
    return-void

    :cond_14
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_1d

    const/4 v2, 0x0

    iput-boolean v2, p0, Lzo4;->K:Z

    :cond_1d
    iput-wide p1, p0, Lzo4;->s:J

    cmp-long p1, p3, v0

    if-gez p1, :cond_28

    const-wide p3, -0x7fffffffffffffffL    # -4.9E-324

    :cond_28
    iput-wide p3, p0, Lzo4;->E:J

    return-void
.end method
