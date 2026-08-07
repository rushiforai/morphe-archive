.class public final Ll/xpv0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/hpr;

.field public final b:J

.field public final c:Lcom/google/android/gms/common/util/Clock;


# direct methods
.method public constructor <init>(Ll/hpr;JLcom/google/android/gms/common/util/Clock;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xpv0;->a:Ll/hpr;

    .line 5
    .line 6
    iput-object p4, p0, Ll/xpv0;->c:Lcom/google/android/gms/common/util/Clock;

    .line 7
    .line 8
    invoke-interface {p4}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    add-long/2addr v0, p2

    .line 13
    iput-wide v0, p0, Ll/xpv0;->b:J

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/xpv0;->c:Lcom/google/android/gms/common/util/Clock;

    .line 2
    .line 3
    iget-wide v1, p0, Ll/xpv0;->b:J

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v3

    .line 9
    cmp-long p0, v1, v3

    .line 10
    .line 11
    if-gez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method
