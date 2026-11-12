.class public final Lsyj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lode;

.field public final b:I

.field public final c:F

.field public final d:J

.field public final e:Ljava/util/ArrayList;

.field public final f:Lsyj;

.field public g:Ljava/lang/Long;

.field public h:F

.field public i:J

.field public final j:Lssi;


# direct methods
.method public constructor <init>(Lode;IIF)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsyj;->a:Lode;

    iput p3, p0, Lsyj;->b:I

    iput p4, p0, Lsyj;->c:F

    int-to-long p1, p2

    const-wide/16 p3, 0x32

    div-long/2addr p1, p3

    iput-wide p1, p0, Lsyj;->d:J

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lsyj;->e:Ljava/util/ArrayList;

    iput-object p0, p0, Lsyj;->f:Lsyj;

    new-instance p1, Lssi;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Lssi;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lsyj;->j:Lssi;

    return-void
.end method


# virtual methods
.method public final a(F)V
    .registers 6

    iget v0, p0, Lsyj;->h:F

    mul-float/2addr p1, p1

    add-float/2addr p1, v0

    iput p1, p0, Lsyj;->h:F

    iget-wide v0, p0, Lsyj;->i:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lsyj;->i:J

    iget-wide v2, p0, Lsyj;->d:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_37

    long-to-float v0, v2

    div-float/2addr p1, v0

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float p1, v0

    iput p1, p0, Lsyj;->h:F

    iget-object p1, p0, Lsyj;->e:Ljava/util/ArrayList;

    monitor-enter p1

    :try_start_20
    iget-object v0, p0, Lsyj;->e:Ljava/util/ArrayList;

    iget v1, p0, Lsyj;->h:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2b
    .catchall {:try_start_20 .. :try_end_2b} :catchall_34

    monitor-exit p1

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lsyj;->i:J

    const/4 p1, 0x0

    iput p1, p0, Lsyj;->h:F

    return-void

    :catchall_34
    move-exception p0

    monitor-exit p1

    throw p0

    :cond_37
    return-void
.end method
