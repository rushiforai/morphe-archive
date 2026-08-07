.class public final Ll/gj3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k5l;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final d:Ll/ll80;


# instance fields
.field public final a:Ll/zrf;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final b:Lcom/google/android/exoplayer2/k;

.field public final c:Ll/h0j0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ll80;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ll80;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/gj3;->d:Ll/ll80;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ll/zrf;Lcom/google/android/exoplayer2/k;Ll/h0j0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gj3;->a:Ll/zrf;

    .line 5
    .line 6
    iput-object p2, p0, Ll/gj3;->b:Lcom/google/android/exoplayer2/k;

    .line 7
    .line 8
    iput-object p3, p0, Ll/gj3;->c:Ll/h0j0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/asf;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gj3;->a:Ll/zrf;

    .line 2
    .line 3
    sget-object v0, Ll/gj3;->d:Ll/ll80;

    .line 4
    .line 5
    invoke-interface {p0, p1, v0}, Ll/zrf;->h(Ll/asf;Ll/ll80;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public b(Ll/bsf;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gj3;->a:Ll/zrf;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/zrf;->b(Ll/bsf;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/gj3;->a:Ll/zrf;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    invoke-interface {p0, v0, v1, v0, v1}, Ll/zrf;->a(JJ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gj3;->a:Ll/zrf;

    .line 2
    .line 3
    instance-of v0, p0, Ll/ikj0;

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    instance-of p0, p0, Ll/d6j;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gj3;->a:Ll/zrf;

    .line 2
    .line 3
    instance-of v0, p0, Ll/v90;

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    instance-of v0, p0, Ll/x8;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    instance-of v0, p0, Ll/b9;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    instance-of p0, p0, Ll/z610;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public f()Ll/k5l;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/gj3;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    xor-int/lit8 v0, v0, 0x1

    .line 6
    .line 7
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/gj3;->a:Ll/zrf;

    .line 11
    .line 12
    instance-of v1, v0, Ll/fvp0;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    new-instance v0, Ll/fvp0;

    .line 17
    .line 18
    iget-object v1, p0, Ll/gj3;->b:Lcom/google/android/exoplayer2/k;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/google/android/exoplayer2/k;->c:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v2, p0, Ll/gj3;->c:Ll/h0j0;

    .line 23
    .line 24
    invoke-direct {v0, v1, v2}, Ll/fvp0;-><init>(Ljava/lang/String;Ll/h0j0;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    instance-of v1, v0, Ll/v90;

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    new-instance v0, Ll/v90;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/v90;-><init>()V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    instance-of v1, v0, Ll/x8;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    new-instance v0, Ll/x8;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/x8;-><init>()V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    instance-of v1, v0, Ll/b9;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    new-instance v0, Ll/b9;

    .line 53
    .line 54
    invoke-direct {v0}, Ll/b9;-><init>()V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    instance-of v1, v0, Ll/z610;

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    new-instance v0, Ll/z610;

    .line 63
    .line 64
    invoke-direct {v0}, Ll/z610;-><init>()V

    .line 65
    .line 66
    .line 67
    :goto_0
    new-instance v1, Ll/gj3;

    .line 68
    .line 69
    iget-object v2, p0, Ll/gj3;->b:Lcom/google/android/exoplayer2/k;

    .line 70
    .line 71
    iget-object p0, p0, Ll/gj3;->c:Ll/h0j0;

    .line 72
    .line 73
    invoke-direct {v1, v0, v2, p0}, Ll/gj3;-><init>(Ll/zrf;Lcom/google/android/exoplayer2/k;Ll/h0j0;)V

    .line 74
    .line 75
    .line 76
    return-object v1

    .line 77
    :cond_4
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const-string v0, "Unexpected extractor type for recreation: "

    .line 86
    .line 87
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    const/4 p0, 0x0

    .line 95
    return-object p0
.end method
