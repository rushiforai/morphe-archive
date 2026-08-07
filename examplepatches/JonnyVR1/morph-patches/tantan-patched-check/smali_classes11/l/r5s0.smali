.class public final Ll/r5s0;
.super Ll/x5s0;
.source "SourceFile"


# instance fields
.field public final i:Lcom/google/android/gms/internal/ads/t;

.field public j:J


# direct methods
.method public constructor <init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;IILcom/google/android/gms/internal/ads/t;)V
    .locals 0

    .line 1
    const-string p3, "ZqqofhkB4+yK9ARzF+IbcECpWBtuTXlqWFDkC/AVdcM="

    .line 2
    .line 3
    const/16 p6, 0x35

    .line 4
    .line 5
    const-string p2, "2ZUgS25mCfmBpvNAAnoop42ZvK9H4E17vIqHMHWBgDSruAgpJ0/PRWhyN3sqcUbC"

    .line 6
    .line 7
    invoke-direct/range {p0 .. p6}, Ll/x5s0;-><init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V

    .line 8
    .line 9
    .line 10
    iput-object p7, p0, Ll/r5s0;->i:Lcom/google/android/gms/internal/ads/t;

    .line 11
    .line 12
    if-eqz p7, :cond_0

    .line 13
    .line 14
    invoke-virtual {p7}, Lcom/google/android/gms/internal/ads/t;->a()J

    .line 15
    .line 16
    .line 17
    move-result-wide p1

    .line 18
    iput-wide p1, p0, Ll/r5s0;->j:J

    .line 19
    .line 20
    :cond_0
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/r5s0;->i:Lcom/google/android/gms/internal/ads/t;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/x5s0;->f:Ljava/lang/reflect/Method;

    .line 8
    .line 9
    iget-wide v2, p0, Ll/r5s0;->j:J

    .line 10
    .line 11
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v1, v2, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ljava/lang/Long;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    invoke-virtual {v0, v1, v2}, Ll/fzr0;->G(J)Ll/fzr0;

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method
