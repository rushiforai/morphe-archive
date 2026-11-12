.class public final Lpta;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:J

.field public final c:J

.field public final d:J


# direct methods
.method public constructor <init>(JJJJ)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lpta;->a:J

    iput-wide p3, p0, Lpta;->b:J

    iput-wide p5, p0, Lpta;->c:J

    iput-wide p7, p0, Lpta;->d:J

    return-void
.end method

.method public static synthetic b(Lpta;JJJI)Lpta;
    .registers 17

    and-int/lit8 v0, p7, 0x1

    if-eqz v0, :cond_6

    iget-wide p1, p0, Lpta;->a:J

    :cond_6
    move-wide v1, p1

    iget-wide v5, p0, Lpta;->c:J

    and-int/lit8 p1, p7, 0x8

    if-eqz p1, :cond_f

    iget-wide p5, p0, Lpta;->d:J

    :cond_f
    move-object v0, p0

    move-wide v3, p3

    move-wide v7, p5

    invoke-virtual/range {v0 .. v8}, Lpta;->a(JJJJ)Lpta;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a(JJJJ)Lpta;
    .registers 18

    const-wide/16 v1, 0x10

    cmp-long v3, p1, v1

    if-eqz v3, :cond_8

    move-wide v3, p1

    goto :goto_a

    :cond_8
    iget-wide v3, p0, Lpta;->a:J

    :goto_a
    cmp-long v5, p3, v1

    if-eqz v5, :cond_10

    move-wide v5, p3

    goto :goto_12

    :cond_10
    iget-wide v5, p0, Lpta;->b:J

    :goto_12
    cmp-long v7, p5, v1

    if-eqz v7, :cond_18

    move-wide v7, p5

    goto :goto_1a

    :cond_18
    iget-wide v7, p0, Lpta;->c:J

    :goto_1a
    cmp-long v1, p7, v1

    if-eqz v1, :cond_21

    move-wide/from16 v0, p7

    goto :goto_23

    :cond_21
    iget-wide v0, p0, Lpta;->d:J

    :goto_23
    new-instance v2, Lpta;

    move-wide/from16 p7, v0

    move-object p0, v2

    move-wide p1, v3

    move-wide p3, v5

    move-wide p5, v7

    invoke-direct/range {p0 .. p8}, Lpta;-><init>(JJJJ)V

    move-object v0, p0

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 8

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_3c

    instance-of v2, p1, Lpta;

    if-eqz v2, :cond_3c

    check-cast p1, Lpta;

    iget-wide v2, p1, Lpta;->a:J

    sget v4, Lu95;->h:I

    iget-wide v4, p0, Lpta;->a:J

    invoke-static {v4, v5, v2, v3}, Ljgm;->a(JJ)Z

    move-result v2

    if-nez v2, :cond_1a

    return v1

    :cond_1a
    iget-wide v2, p0, Lpta;->b:J

    iget-wide v4, p1, Lpta;->b:J

    invoke-static {v2, v3, v4, v5}, Ljgm;->a(JJ)Z

    move-result v2

    if-nez v2, :cond_25

    return v1

    :cond_25
    iget-wide v2, p0, Lpta;->c:J

    iget-wide v4, p1, Lpta;->c:J

    invoke-static {v2, v3, v4, v5}, Ljgm;->a(JJ)Z

    move-result v2

    if-nez v2, :cond_30

    return v1

    :cond_30
    iget-wide v2, p0, Lpta;->d:J

    iget-wide p0, p1, Lpta;->d:J

    invoke-static {v2, v3, p0, p1}, Ljgm;->a(JJ)Z

    move-result p0

    if-nez p0, :cond_3b

    return v1

    :cond_3b
    return v0

    :cond_3c
    return v1
.end method

.method public final hashCode()I
    .registers 5

    sget v0, Lu95;->h:I

    sget-object v0, Ljgm;->b:Ligm;

    iget-wide v0, p0, Lpta;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-wide v2, p0, Lpta;->b:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-wide v2, p0, Lpta;->c:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-wide v1, p0, Lpta;->d:J

    invoke-static {v1, v2}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method
