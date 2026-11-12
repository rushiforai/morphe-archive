.class public final Lkng;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public b:J

.field public c:Z

.field public d:J

.field public e:Lld9;

.field public f:Loml;


# direct methods
.method public constructor <init>(Lumi;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkng;->a:Lumi;

    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lkng;->b:J

    const/4 p1, 0x0

    iput-object p1, p0, Lkng;->e:Lld9;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 8

    iget-boolean v0, p0, Lkng;->c:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lkng;->e:Lld9;

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Lld9;->run()V

    :cond_c
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lkng;->d:J

    new-instance v0, Lpjg;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lpjg;-><init>(Ljava/lang/Object;B)V

    iget-object v1, p0, Lkng;->a:Lumi;

    invoke-interface {v1, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v1, Loml;

    invoke-direct {v1, v0}, Loml;-><init>(Lnml;)V

    iput-object v1, p0, Lkng;->f:Loml;

    iget-wide v3, p0, Lkng;->b:J

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v6, 0x0

    const/4 v2, 0x0

    invoke-virtual/range {v1 .. v6}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    return-void
.end method
