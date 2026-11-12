.class public abstract Lbtf;
.super Lnzc;
.source "SourceFile"


# instance fields
.field public final b:Z

.field public c:Latf;


# direct methods
.method public constructor <init>(Z)V
    .registers 2

    invoke-direct {p0}, Landroid/app/job/JobService;-><init>()V

    iput-boolean p1, p0, Lbtf;->b:Z

    return-void
.end method


# virtual methods
.method public final a(Landroid/app/job/JobParameters;)Z
    .registers 2

    iget-object p1, p0, Lbtf;->c:Latf;

    if-eqz p1, :cond_a

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    const/4 p1, 0x0

    iput-object p1, p0, Lbtf;->c:Latf;

    :cond_a
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lbtf;->b(Z)Z

    move-result p0

    return p0
.end method

.method public b(Z)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final onStartJob(Landroid/app/job/JobParameters;)Z
    .registers 4

    invoke-static {p0}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    new-instance v0, Latf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1}, Latf;-><init>(Lbtf;Landroid/app/job/JobParameters;Ljava/lang/String;)V

    iput-object v0, p0, Lbtf;->c:Latf;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    const/4 p0, 0x1

    return p0
.end method
