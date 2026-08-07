.class public final Ll/bqd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/aqd0;


# instance fields
.field public final a:Ll/zpd0;

.field public b:Ll/qfj0;

.field public c:J

.field public d:J

.field public e:I


# direct methods
.method public constructor <init>(Ll/zpd0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bqd0;->a:Ll/zpd0;

    .line 5
    .line 6
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    iput-wide v0, p0, Ll/bqd0;->c:J

    .line 12
    .line 13
    const-wide/16 v0, 0x0

    .line 14
    .line 15
    iput-wide v0, p0, Ll/bqd0;->d:J

    .line 16
    .line 17
    const/4 p1, -0x1

    .line 18
    iput p1, p0, Ll/bqd0;->e:I

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a(JJ)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/bqd0;->c:J

    .line 2
    .line 3
    iput-wide p3, p0, Ll/bqd0;->d:J

    .line 4
    .line 5
    return-void
.end method

.method public b(Ll/ig60;JIZ)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p4

    .line 4
    .line 5
    iget-object v2, v0, Ll/bqd0;->b:Ll/qfj0;

    .line 6
    .line 7
    invoke-static {v2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    iget v2, v0, Ll/bqd0;->e:I

    .line 11
    .line 12
    const/4 v3, -0x1

    .line 13
    if-eq v2, v3, :cond_0

    .line 14
    .line 15
    invoke-static {v2}, Ll/wpd0;->b(I)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eq v1, v2, :cond_0

    .line 20
    .line 21
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const-string v3, "Received RTP packet with unexpected sequence number. Expected: %d; received: %d."

    .line 34
    .line 35
    invoke-static {v3, v2}, Ll/bmk0;->D(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-wide v4, v0, Ll/bqd0;->d:J

    .line 39
    .line 40
    iget-wide v8, v0, Ll/bqd0;->c:J

    .line 41
    .line 42
    iget-object v2, v0, Ll/bqd0;->a:Ll/zpd0;

    .line 43
    .line 44
    iget v10, v2, Ll/zpd0;->b:I

    .line 45
    .line 46
    move-wide/from16 v6, p2

    .line 47
    .line 48
    invoke-static/range {v4 .. v10}, Ll/cqd0;->a(JJJI)J

    .line 49
    .line 50
    .line 51
    move-result-wide v12

    .line 52
    invoke-virtual/range {p1 .. p1}, Ll/ig60;->a()I

    .line 53
    .line 54
    .line 55
    move-result v15

    .line 56
    iget-object v2, v0, Ll/bqd0;->b:Ll/qfj0;

    .line 57
    .line 58
    move-object/from16 v3, p1

    .line 59
    .line 60
    invoke-interface {v2, v3, v15}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 61
    .line 62
    .line 63
    iget-object v11, v0, Ll/bqd0;->b:Ll/qfj0;

    .line 64
    .line 65
    const/16 v16, 0x0

    .line 66
    .line 67
    const/16 v17, 0x0

    .line 68
    .line 69
    const/4 v14, 0x1

    .line 70
    invoke-interface/range {v11 .. v17}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 71
    .line 72
    .line 73
    iput v1, v0, Ll/bqd0;->e:I

    .line 74
    .line 75
    return-void
.end method

.method public c(JI)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/bqd0;->c:J

    .line 2
    .line 3
    return-void
.end method

.method public d(Ll/bsf;I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-interface {p1, p2, v0}, Ll/bsf;->b(II)Ll/qfj0;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    iput-object p1, p0, Ll/bqd0;->b:Ll/qfj0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/bqd0;->a:Ll/zpd0;

    .line 9
    .line 10
    iget-object p0, p0, Ll/zpd0;->c:Lcom/google/android/exoplayer2/k;

    .line 11
    .line 12
    invoke-interface {p1, p0}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
