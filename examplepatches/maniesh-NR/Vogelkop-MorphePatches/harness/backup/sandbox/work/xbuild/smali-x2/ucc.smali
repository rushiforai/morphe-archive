.class public final Lucc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final a:Ls2;

.field public b:Z

.field public c:J


# direct methods
.method public constructor <init>(Ls2;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lucc;->a:Ls2;

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lucc;->c:J

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)V
    .registers 9

    iget-boolean v0, p0, Lucc;->b:Z

    if-nez v0, :cond_25

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lucc;->c:J

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-ltz v6, :cond_25

    cmp-long v4, v0, v4

    if-ltz v4, :cond_25

    cmp-long v4, v2, v0

    if-gtz v4, :cond_25

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-object v1, p0, Lucc;->a:Ls2;

    invoke-virtual {v1, p1, v0}, Ls2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lucc;->b:Z

    :cond_25
    return-void
.end method

.method public final onPause(Lndc;)V
    .registers 2

    sget-object p1, Lbh0;->e:Lbh0;

    invoke-virtual {p0, p1}, Lucc;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 4

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lucc;->c:J

    return-void
.end method
