.class public final Lcom/google/android/exoplayer2/n$g$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/n$g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:J

.field public b:J

.field public c:J

.field public d:F

.field public e:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 26
    iput-wide v0, p0, Lcom/google/android/exoplayer2/n$g$a;->a:J

    .line 27
    iput-wide v0, p0, Lcom/google/android/exoplayer2/n$g$a;->b:J

    .line 28
    iput-wide v0, p0, Lcom/google/android/exoplayer2/n$g$a;->c:J

    const v0, -0x800001

    .line 29
    iput v0, p0, Lcom/google/android/exoplayer2/n$g$a;->d:F

    .line 30
    iput v0, p0, Lcom/google/android/exoplayer2/n$g$a;->e:F

    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/n$g;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p1, Lcom/google/android/exoplayer2/n$g;->a:J

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/google/android/exoplayer2/n$g$a;->a:J

    .line 7
    .line 8
    iget-wide v0, p1, Lcom/google/android/exoplayer2/n$g;->b:J

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/google/android/exoplayer2/n$g$a;->b:J

    .line 11
    .line 12
    iget-wide v0, p1, Lcom/google/android/exoplayer2/n$g;->c:J

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/google/android/exoplayer2/n$g$a;->c:J

    .line 15
    .line 16
    iget v0, p1, Lcom/google/android/exoplayer2/n$g;->d:F

    .line 17
    .line 18
    iput v0, p0, Lcom/google/android/exoplayer2/n$g$a;->d:F

    .line 19
    .line 20
    iget p1, p1, Lcom/google/android/exoplayer2/n$g;->e:F

    .line 21
    .line 22
    iput p1, p0, Lcom/google/android/exoplayer2/n$g$a;->e:F

    .line 23
    .line 24
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/n$g;Lcom/google/android/exoplayer2/n$a;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/n$g$a;-><init>(Lcom/google/android/exoplayer2/n$g;)V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/exoplayer2/n$g$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/n$g$a;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic b(Lcom/google/android/exoplayer2/n$g$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/n$g$a;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic c(Lcom/google/android/exoplayer2/n$g$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/n$g$a;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic d(Lcom/google/android/exoplayer2/n$g$a;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/n$g$a;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Lcom/google/android/exoplayer2/n$g$a;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/n$g$a;->e:F

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public f()Lcom/google/android/exoplayer2/n$g;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/n$g;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/google/android/exoplayer2/n$g;-><init>(Lcom/google/android/exoplayer2/n$g$a;Lcom/google/android/exoplayer2/n$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public g(J)Lcom/google/android/exoplayer2/n$g$a;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/google/android/exoplayer2/n$g$a;->c:J

    .line 2
    .line 3
    return-object p0
.end method

.method public h(F)Lcom/google/android/exoplayer2/n$g$a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/n$g$a;->e:F

    .line 2
    .line 3
    return-object p0
.end method

.method public i(J)Lcom/google/android/exoplayer2/n$g$a;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/google/android/exoplayer2/n$g$a;->b:J

    .line 2
    .line 3
    return-object p0
.end method

.method public j(F)Lcom/google/android/exoplayer2/n$g$a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/n$g$a;->d:F

    .line 2
    .line 3
    return-object p0
.end method

.method public k(J)Lcom/google/android/exoplayer2/n$g$a;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/google/android/exoplayer2/n$g$a;->a:J

    .line 2
    .line 3
    return-object p0
.end method
