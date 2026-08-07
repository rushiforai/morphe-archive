.class public final Ll/b9t0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/google/android/gms/common/util/Clock;

.field public final b:Ll/z8t0;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/util/Clock;Ll/z8t0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/b9t0;->a:Lcom/google/android/gms/common/util/Clock;

    .line 5
    .line 6
    iput-object p2, p0, Ll/b9t0;->b:Ll/z8t0;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Landroid/content/Context;)Ll/b9t0;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/t9t0;->d(Landroid/content/Context;)Ll/t9t0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/t9t0;->b()Ll/b9t0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public final b(IJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b9t0;->b:Ll/z8t0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/z8t0;->a(IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c(Lcom/google/android/gms/ads/internal/client/zzff;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/b9t0;->a:Lcom/google/android/gms/common/util/Clock;

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object p0, p0, Ll/b9t0;->b:Ll/z8t0;

    .line 8
    .line 9
    const/4 p1, -0x1

    .line 10
    invoke-virtual {p0, p1, v0, v1}, Ll/z8t0;->a(IJ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final d()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b9t0;->a:Lcom/google/android/gms/common/util/Clock;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object p0, p0, Ll/b9t0;->b:Ll/z8t0;

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    invoke-virtual {p0, v2, v0, v1}, Ll/z8t0;->a(IJ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
