.class public final Lcom/google/android/exoplayer2/f$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:F

.field public b:F

.field public c:J

.field public d:F

.field public e:J

.field public f:J

.field public g:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x3f7851ec    # 0.97f

    .line 5
    .line 6
    .line 7
    iput v0, p0, Lcom/google/android/exoplayer2/f$b;->a:F

    .line 8
    .line 9
    const v0, 0x3f83d70a    # 1.03f

    .line 10
    .line 11
    .line 12
    iput v0, p0, Lcom/google/android/exoplayer2/f$b;->b:F

    .line 13
    .line 14
    const-wide/16 v0, 0x3e8

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/google/android/exoplayer2/f$b;->c:J

    .line 17
    .line 18
    const v0, 0x33d6bf95    # 1.0E-7f

    .line 19
    .line 20
    .line 21
    iput v0, p0, Lcom/google/android/exoplayer2/f$b;->d:F

    .line 22
    .line 23
    const-wide/16 v0, 0x14

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bmk0;->J0(J)J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    iput-wide v0, p0, Lcom/google/android/exoplayer2/f$b;->e:J

    .line 30
    .line 31
    const-wide/16 v0, 0x1f4

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/bmk0;->J0(J)J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    iput-wide v0, p0, Lcom/google/android/exoplayer2/f$b;->f:J

    .line 38
    .line 39
    const v0, 0x3f7fbe77    # 0.999f

    .line 40
    .line 41
    .line 42
    iput v0, p0, Lcom/google/android/exoplayer2/f$b;->g:F

    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public a()Lcom/google/android/exoplayer2/f;
    .locals 12

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/f;

    .line 2
    .line 3
    iget v1, p0, Lcom/google/android/exoplayer2/f$b;->a:F

    .line 4
    .line 5
    iget v2, p0, Lcom/google/android/exoplayer2/f$b;->b:F

    .line 6
    .line 7
    iget-wide v3, p0, Lcom/google/android/exoplayer2/f$b;->c:J

    .line 8
    .line 9
    iget v5, p0, Lcom/google/android/exoplayer2/f$b;->d:F

    .line 10
    .line 11
    iget-wide v6, p0, Lcom/google/android/exoplayer2/f$b;->e:J

    .line 12
    .line 13
    iget-wide v8, p0, Lcom/google/android/exoplayer2/f$b;->f:J

    .line 14
    .line 15
    iget v10, p0, Lcom/google/android/exoplayer2/f$b;->g:F

    .line 16
    .line 17
    const/4 v11, 0x0

    .line 18
    invoke-direct/range {v0 .. v11}, Lcom/google/android/exoplayer2/f;-><init>(FFJFJJFLcom/google/android/exoplayer2/f$a;)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method
