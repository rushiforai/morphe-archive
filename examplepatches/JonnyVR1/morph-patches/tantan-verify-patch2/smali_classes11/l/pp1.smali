.class public final Ll/pp1;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:F

.field public final i:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;IIIIIIFLjava/lang/String;)V
    .locals 0
    .param p9    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[B>;IIIIIIF",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pp1;->a:Ljava/util/List;

    .line 5
    .line 6
    iput p2, p0, Ll/pp1;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/pp1;->c:I

    .line 9
    .line 10
    iput p4, p0, Ll/pp1;->d:I

    .line 11
    .line 12
    iput p5, p0, Ll/pp1;->e:I

    .line 13
    .line 14
    iput p6, p0, Ll/pp1;->f:I

    .line 15
    .line 16
    iput p7, p0, Ll/pp1;->g:I

    .line 17
    .line 18
    iput p8, p0, Ll/pp1;->h:F

    .line 19
    .line 20
    iput-object p9, p0, Ll/pp1;->i:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method public static a(Ll/ig60;)[B
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ig60;->N()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ig60;->e()[B

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0, v1, v0}, Ll/lc5;->d([BII)[B

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static b(Ll/ig60;)Ll/pp1;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x4

    .line 2
    :try_start_0
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x3

    .line 10
    and-int/2addr v0, v1

    .line 11
    add-int/lit8 v4, v0, 0x1

    .line 12
    .line 13
    if-eq v4, v1, :cond_3

    .line 14
    .line 15
    new-instance v3, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    and-int/lit8 v0, v0, 0x1f

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    move v2, v1

    .line 28
    :goto_0
    if-ge v2, v0, :cond_0

    .line 29
    .line 30
    invoke-static {p0}, Ll/pp1;->a(Ll/ig60;)[B

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    add-int/lit8 v2, v2, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {p0}, Ll/ig60;->H()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    move v5, v1

    .line 45
    :goto_1
    if-ge v5, v2, :cond_1

    .line 46
    .line 47
    invoke-static {p0}, Ll/pp1;->a(Ll/ig60;)[B

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    add-int/lit8 v5, v5, 0x1

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    if-lez v0, :cond_2

    .line 58
    .line 59
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    check-cast p0, [B

    .line 64
    .line 65
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, [B

    .line 70
    .line 71
    array-length p0, p0

    .line 72
    invoke-static {v0, v4, p0}, Ll/jb20;->l([BII)Ll/jb20$c;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    iget v0, p0, Ll/jb20$c;->f:I

    .line 77
    .line 78
    iget v1, p0, Ll/jb20$c;->g:I

    .line 79
    .line 80
    iget v2, p0, Ll/jb20$c;->o:I

    .line 81
    .line 82
    iget v5, p0, Ll/jb20$c;->p:I

    .line 83
    .line 84
    iget v6, p0, Ll/jb20$c;->q:I

    .line 85
    .line 86
    iget v7, p0, Ll/jb20$c;->h:F

    .line 87
    .line 88
    iget v8, p0, Ll/jb20$c;->a:I

    .line 89
    .line 90
    iget v9, p0, Ll/jb20$c;->b:I

    .line 91
    .line 92
    iget p0, p0, Ll/jb20$c;->c:I

    .line 93
    .line 94
    invoke-static {v8, v9, p0}, Ll/lc5;->a(III)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    move v8, v5

    .line 99
    move v9, v6

    .line 100
    move v10, v7

    .line 101
    move v5, v0

    .line 102
    move v6, v1

    .line 103
    move v7, v2

    .line 104
    :goto_2
    move-object v11, p0

    .line 105
    goto :goto_3

    .line 106
    :cond_2
    const/4 v0, -0x1

    .line 107
    const/high16 v7, 0x3f800000    # 1.0f

    .line 108
    .line 109
    const/4 p0, 0x0

    .line 110
    move v5, v0

    .line 111
    move v6, v5

    .line 112
    move v8, v6

    .line 113
    move v9, v8

    .line 114
    move v10, v7

    .line 115
    move v7, v9

    .line 116
    goto :goto_2

    .line 117
    :goto_3
    new-instance v2, Ll/pp1;

    .line 118
    .line 119
    invoke-direct/range {v2 .. v11}, Ll/pp1;-><init>(Ljava/util/List;IIIIIIFLjava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return-object v2

    .line 123
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 124
    .line 125
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 126
    .line 127
    .line 128
    throw p0
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    :catch_0
    move-exception v0

    .line 130
    move-object p0, v0

    .line 131
    const-string v0, "Error parsing AVC config"

    .line 132
    .line 133
    invoke-static {v0, p0}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    throw p0
.end method
