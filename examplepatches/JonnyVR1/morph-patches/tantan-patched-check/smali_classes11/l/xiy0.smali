.class public final Ll/xiy0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/google/android/gms/common/util/Clock;

.field public b:J


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/util/Clock;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/xiy0;->a:Lcom/google/android/gms/common/util/Clock;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/xiy0;->b:J

    .line 4
    .line 5
    return-void
.end method

.method public final b(J)Z
    .locals 2

    .line 1
    iget-wide p1, p0, Ll/xiy0;->b:J

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    cmp-long p1, p1, v0

    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return p2

    .line 11
    :cond_0
    iget-object p1, p0, Ll/xiy0;->a:Lcom/google/android/gms/common/util/Clock;

    .line 12
    .line 13
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iget-wide p0, p0, Ll/xiy0;->b:J

    .line 18
    .line 19
    sub-long/2addr v0, p0

    .line 20
    const-wide/32 p0, 0x36ee80

    .line 21
    .line 22
    .line 23
    cmp-long p0, v0, p0

    .line 24
    .line 25
    if-ltz p0, :cond_1

    .line 26
    .line 27
    return p2

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public final c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xiy0;->a:Lcom/google/android/gms/common/util/Clock;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iput-wide v0, p0, Ll/xiy0;->b:J

    .line 8
    .line 9
    return-void
.end method
