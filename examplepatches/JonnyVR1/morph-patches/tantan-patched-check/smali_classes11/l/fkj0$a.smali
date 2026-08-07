.class public final Ll/fkj0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ey2$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fkj0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/h0j0;

.field public final b:Ll/ig60;

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(ILl/h0j0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/fkj0$a;->c:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/fkj0$a;->a:Ll/h0j0;

    .line 7
    .line 8
    iput p3, p0, Ll/fkj0$a;->d:I

    .line 9
    .line 10
    new-instance p1, Ll/ig60;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/ig60;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/fkj0$a;->b:Ll/ig60;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a(Ll/asf;J)Ll/ey2$e;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 2
    .line 3
    .line 4
    move-result-wide v4

    .line 5
    iget v0, p0, Ll/fkj0$a;->d:I

    .line 6
    .line 7
    int-to-long v0, v0

    .line 8
    invoke-interface {p1}, Ll/asf;->getLength()J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    sub-long/2addr v2, v4

    .line 13
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    long-to-int v0, v0

    .line 18
    iget-object v1, p0, Ll/fkj0$a;->b:Ll/ig60;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/ig60;->Q(I)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/fkj0$a;->b:Ll/ig60;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/ig60;->e()[B

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-interface {p1, v1, v2, v0}, Ll/asf;->f([BII)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ll/fkj0$a;->b:Ll/ig60;

    .line 34
    .line 35
    move-object v0, p0

    .line 36
    move-wide v2, p2

    .line 37
    invoke-virtual/range {v0 .. v5}, Ll/fkj0$a;->c(Ll/ig60;JJ)Ll/ey2$e;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fkj0$a;->b:Ll/ig60;

    .line 2
    .line 3
    sget-object v0, Ll/bmk0;->f:[B

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/ig60;->R([B)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final c(Ll/ig60;JJ)Ll/ey2$e;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-wide/from16 v2, p4

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/ig60;->g()I

    .line 8
    .line 9
    .line 10
    move-result v4

    .line 11
    const-wide/16 v5, -0x1

    .line 12
    .line 13
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    move-wide v9, v5

    .line 19
    move-wide v11, v7

    .line 20
    :goto_0
    invoke-virtual {v1}, Ll/ig60;->a()I

    .line 21
    .line 22
    .line 23
    move-result v13

    .line 24
    const/16 v14, 0xbc

    .line 25
    .line 26
    if-lt v13, v14, :cond_5

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/ig60;->e()[B

    .line 29
    .line 30
    .line 31
    move-result-object v13

    .line 32
    invoke-virtual {v1}, Ll/ig60;->f()I

    .line 33
    .line 34
    .line 35
    move-result v14

    .line 36
    invoke-static {v13, v14, v4}, Ll/kkj0;->a([BII)I

    .line 37
    .line 38
    .line 39
    move-result v13

    .line 40
    add-int/lit16 v14, v13, 0xbc

    .line 41
    .line 42
    if-le v14, v4, :cond_0

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    iget v5, v0, Ll/fkj0$a;->c:I

    .line 46
    .line 47
    invoke-static {v1, v13, v5}, Ll/kkj0;->c(Ll/ig60;II)J

    .line 48
    .line 49
    .line 50
    move-result-wide v5

    .line 51
    cmp-long v15, v5, v7

    .line 52
    .line 53
    if-eqz v15, :cond_4

    .line 54
    .line 55
    iget-object v15, v0, Ll/fkj0$a;->a:Ll/h0j0;

    .line 56
    .line 57
    invoke-virtual {v15, v5, v6}, Ll/h0j0;->b(J)J

    .line 58
    .line 59
    .line 60
    move-result-wide v5

    .line 61
    cmp-long v15, v5, p2

    .line 62
    .line 63
    if-lez v15, :cond_2

    .line 64
    .line 65
    cmp-long v0, v11, v7

    .line 66
    .line 67
    if-nez v0, :cond_1

    .line 68
    .line 69
    invoke-static {v5, v6, v2, v3}, Ll/ey2$e;->d(JJ)Ll/ey2$e;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    return-object v0

    .line 74
    :cond_1
    add-long v0, v2, v9

    .line 75
    .line 76
    invoke-static {v0, v1}, Ll/ey2$e;->e(J)Ll/ey2$e;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    return-object v0

    .line 81
    :cond_2
    const-wide/32 v9, 0x186a0

    .line 82
    .line 83
    .line 84
    add-long/2addr v9, v5

    .line 85
    cmp-long v9, v9, p2

    .line 86
    .line 87
    if-lez v9, :cond_3

    .line 88
    .line 89
    int-to-long v0, v13

    .line 90
    add-long/2addr v0, v2

    .line 91
    invoke-static {v0, v1}, Ll/ey2$e;->e(J)Ll/ey2$e;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    return-object v0

    .line 96
    :cond_3
    int-to-long v9, v13

    .line 97
    move-wide v11, v5

    .line 98
    :cond_4
    invoke-virtual {v1, v14}, Ll/ig60;->U(I)V

    .line 99
    .line 100
    .line 101
    int-to-long v5, v14

    .line 102
    goto :goto_0

    .line 103
    :cond_5
    :goto_1
    cmp-long v0, v11, v7

    .line 104
    .line 105
    if-eqz v0, :cond_6

    .line 106
    .line 107
    add-long v0, v2, v5

    .line 108
    .line 109
    invoke-static {v11, v12, v0, v1}, Ll/ey2$e;->f(JJ)Ll/ey2$e;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    return-object v0

    .line 114
    :cond_6
    sget-object v0, Ll/ey2$e;->d:Ll/ey2$e;

    .line 115
    .line 116
    return-object v0
.end method
