.class public final Ll/vke0;
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
            "Lcom/google/android/exoplayer2/k;",
            ">;"
        }
    .end annotation
.end field

.field public final b:[Ll/qfj0;


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vke0;->a:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    new-array p1, p1, [Ll/qfj0;

    .line 11
    .line 12
    iput-object p1, p0, Ll/vke0;->b:[Ll/qfj0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(JLl/ig60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vke0;->b:[Ll/qfj0;

    .line 2
    .line 3
    invoke-static {p1, p2, p3, p0}, Ll/mo4;->a(JLl/ig60;[Ll/qfj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/bsf;Ll/jkj0$d;)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/vke0;->b:[Ll/qfj0;

    .line 4
    .line 5
    array-length v2, v2

    .line 6
    if-ge v1, v2, :cond_3

    .line 7
    .line 8
    invoke-virtual {p2}, Ll/jkj0$d;->a()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Ll/jkj0$d;->c()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x3

    .line 16
    invoke-interface {p1, v2, v3}, Ll/bsf;->b(II)Ll/qfj0;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v3, p0, Ll/vke0;->a:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Lcom/google/android/exoplayer2/k;

    .line 27
    .line 28
    iget-object v4, v3, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 29
    .line 30
    const-string v5, "application/cea-608"

    .line 31
    .line 32
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-nez v5, :cond_1

    .line 37
    .line 38
    const-string v5, "application/cea-708"

    .line 39
    .line 40
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    if-eqz v5, :cond_0

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    move v5, v0

    .line 48
    goto :goto_2

    .line 49
    :cond_1
    :goto_1
    const/4 v5, 0x1

    .line 50
    :goto_2
    new-instance v6, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v7, "Invalid closed caption MIME type provided: "

    .line 53
    .line 54
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-static {v5, v6}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    iget-object v5, v3, Lcom/google/android/exoplayer2/k;->a:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz v5, :cond_2

    .line 70
    .line 71
    goto :goto_3

    .line 72
    :cond_2
    invoke-virtual {p2}, Ll/jkj0$d;->b()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    :goto_3
    new-instance v6, Lcom/google/android/exoplayer2/k$b;

    .line 77
    .line 78
    invoke-direct {v6}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v6, v5}, Lcom/google/android/exoplayer2/k$b;->U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-virtual {v5, v4}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    iget v5, v3, Lcom/google/android/exoplayer2/k;->d:I

    .line 90
    .line 91
    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer2/k$b;->i0(I)Lcom/google/android/exoplayer2/k$b;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    iget-object v5, v3, Lcom/google/android/exoplayer2/k;->c:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer2/k$b;->X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    iget v5, v3, Lcom/google/android/exoplayer2/k;->D:I

    .line 102
    .line 103
    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer2/k$b;->H(I)Lcom/google/android/exoplayer2/k$b;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    iget-object v3, v3, Lcom/google/android/exoplayer2/k;->n:Ljava/util/List;

    .line 108
    .line 109
    invoke-virtual {v4, v3}, Lcom/google/android/exoplayer2/k$b;->V(Ljava/util/List;)Lcom/google/android/exoplayer2/k$b;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    invoke-interface {v2, v3}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 118
    .line 119
    .line 120
    iget-object v3, p0, Ll/vke0;->b:[Ll/qfj0;

    .line 121
    .line 122
    aput-object v2, v3, v1

    .line 123
    .line 124
    add-int/lit8 v1, v1, 0x1

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_3
    return-void
.end method
