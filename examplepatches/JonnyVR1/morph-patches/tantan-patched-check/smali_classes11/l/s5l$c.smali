.class public Ll/s5l$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qfj0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/s5l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# static fields
.field public static final g:Lcom/google/android/exoplayer2/k;

.field public static final h:Lcom/google/android/exoplayer2/k;


# instance fields
.field public final a:Ll/c5f;

.field public final b:Ll/qfj0;

.field public final c:Lcom/google/android/exoplayer2/k;

.field public d:Lcom/google/android/exoplayer2/k;

.field public e:[B

.field public f:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/k$b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "application/id3"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Ll/s5l$c;->g:Lcom/google/android/exoplayer2/k;

    .line 17
    .line 18
    new-instance v0, Lcom/google/android/exoplayer2/k$b;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v1, "application/x-emsg"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Ll/s5l$c;->h:Lcom/google/android/exoplayer2/k;

    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>(Ll/qfj0;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/c5f;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/c5f;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/s5l$c;->a:Ll/c5f;

    .line 10
    .line 11
    iput-object p1, p0, Ll/s5l$c;->b:Ll/qfj0;

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    if-eq p2, p1, :cond_1

    .line 15
    .line 16
    const/4 p1, 0x3

    .line 17
    if-ne p2, p1, :cond_0

    .line 18
    .line 19
    sget-object p1, Ll/s5l$c;->h:Lcom/google/android/exoplayer2/k;

    .line 20
    .line 21
    iput-object p1, p0, Ll/s5l$c;->c:Lcom/google/android/exoplayer2/k;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string p0, "Unknown metadataType: "

    .line 25
    .line 26
    invoke-static {p0, p2}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    throw p0

    .line 31
    :cond_1
    sget-object p1, Ll/s5l$c;->g:Lcom/google/android/exoplayer2/k;

    .line 32
    .line 33
    iput-object p1, p0, Ll/s5l$c;->c:Lcom/google/android/exoplayer2/k;

    .line 34
    .line 35
    :goto_0
    const/4 p1, 0x0

    .line 36
    new-array p2, p1, [B

    .line 37
    .line 38
    iput-object p2, p0, Ll/s5l$c;->e:[B

    .line 39
    .line 40
    iput p1, p0, Ll/s5l$c;->f:I

    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public a(JIIILl/qfj0$a;)V
    .locals 7
    .param p6    # Ll/qfj0$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/s5l$c;->d:Lcom/google/android/exoplayer2/k;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p4, p5}, Ll/s5l$c;->i(II)Ll/ig60;

    .line 7
    .line 8
    .line 9
    move-result-object p4

    .line 10
    iget-object v0, p0, Ll/s5l$c;->d:Lcom/google/android/exoplayer2/k;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Ll/s5l$c;->c:Lcom/google/android/exoplayer2/k;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, p0, Ll/s5l$c;->d:Lcom/google/android/exoplayer2/k;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 28
    .line 29
    const-string v1, "application/x-emsg"

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const-string v1, "HlsSampleStreamWrapper"

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Ll/s5l$c;->a:Ll/c5f;

    .line 40
    .line 41
    invoke-virtual {v0, p4}, Ll/c5f;->c(Ll/ig60;)Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;

    .line 42
    .line 43
    .line 44
    move-result-object p4

    .line 45
    invoke-virtual {p0, p4}, Ll/s5l$c;->g(Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    iget-object p0, p0, Ll/s5l$c;->c:Lcom/google/android/exoplayer2/k;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p4}, Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;->N()Lcom/google/android/exoplayer2/k;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "Ignoring EMSG. Expected it to contain wrapped %s but actual wrapped format: %s"

    .line 64
    .line 65
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {v1, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    new-instance v0, Ll/ig60;

    .line 74
    .line 75
    invoke-virtual {p4}, Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;->v()[B

    .line 76
    .line 77
    .line 78
    move-result-object p4

    .line 79
    invoke-static {p4}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p4

    .line 83
    check-cast p4, [B

    .line 84
    .line 85
    invoke-direct {v0, p4}, Ll/ig60;-><init>([B)V

    .line 86
    .line 87
    .line 88
    move-object p4, v0

    .line 89
    :goto_0
    invoke-virtual {p4}, Ll/ig60;->a()I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    iget-object v0, p0, Ll/s5l$c;->b:Ll/qfj0;

    .line 94
    .line 95
    invoke-interface {v0, p4, v4}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/s5l$c;->b:Ll/qfj0;

    .line 99
    .line 100
    move-wide v1, p1

    .line 101
    move v3, p3

    .line 102
    move v5, p5

    .line 103
    move-object v6, p6

    .line 104
    invoke-interface/range {v0 .. v6}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    const-string p2, "Ignoring sample for unsupported format: "

    .line 111
    .line 112
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Ll/s5l$c;->d:Lcom/google/android/exoplayer2/k;

    .line 116
    .line 117
    iget-object p0, p0, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {v1, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public b(Lcom/google/android/exoplayer2/k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s5l$c;->d:Lcom/google/android/exoplayer2/k;

    .line 2
    .line 3
    iget-object p1, p0, Ll/s5l$c;->b:Ll/qfj0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/s5l$c;->c:Lcom/google/android/exoplayer2/k;

    .line 6
    .line 7
    invoke-interface {p1, p0}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public c(Ll/e6c;IZI)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget p4, p0, Ll/s5l$c;->f:I

    .line 2
    .line 3
    add-int/2addr p4, p2

    .line 4
    invoke-virtual {p0, p4}, Ll/s5l$c;->h(I)V

    .line 5
    .line 6
    .line 7
    iget-object p4, p0, Ll/s5l$c;->e:[B

    .line 8
    .line 9
    iget v0, p0, Ll/s5l$c;->f:I

    .line 10
    .line 11
    invoke-interface {p1, p4, v0, p2}, Ll/e6c;->read([BII)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 p2, -0x1

    .line 16
    if-ne p1, p2, :cond_1

    .line 17
    .line 18
    if-eqz p3, :cond_0

    .line 19
    .line 20
    return p2

    .line 21
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    iget p2, p0, Ll/s5l$c;->f:I

    .line 27
    .line 28
    add-int/2addr p2, p1

    .line 29
    iput p2, p0, Ll/s5l$c;->f:I

    .line 30
    .line 31
    return p1
.end method

.method public f(Ll/ig60;II)V
    .locals 1

    .line 1
    iget p3, p0, Ll/s5l$c;->f:I

    .line 2
    .line 3
    add-int/2addr p3, p2

    .line 4
    invoke-virtual {p0, p3}, Ll/s5l$c;->h(I)V

    .line 5
    .line 6
    .line 7
    iget-object p3, p0, Ll/s5l$c;->e:[B

    .line 8
    .line 9
    iget v0, p0, Ll/s5l$c;->f:I

    .line 10
    .line 11
    invoke-virtual {p1, p3, v0, p2}, Ll/ig60;->l([BII)V

    .line 12
    .line 13
    .line 14
    iget p1, p0, Ll/s5l$c;->f:I

    .line 15
    .line 16
    add-int/2addr p1, p2

    .line 17
    iput p1, p0, Ll/s5l$c;->f:I

    .line 18
    .line 19
    return-void
.end method

.method public final g(Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;->N()Lcom/google/android/exoplayer2/k;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/s5l$c;->c:Lcom/google/android/exoplayer2/k;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final h(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s5l$c;->e:[B

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    if-ge v1, p1, :cond_0

    .line 5
    .line 6
    div-int/lit8 v1, p1, 0x2

    .line 7
    .line 8
    add-int/2addr p1, v1

    .line 9
    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/s5l$c;->e:[B

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final i(II)Ll/ig60;
    .locals 3

    .line 1
    iget v0, p0, Ll/s5l$c;->f:I

    .line 2
    .line 3
    sub-int/2addr v0, p2

    .line 4
    sub-int p1, v0, p1

    .line 5
    .line 6
    iget-object v1, p0, Ll/s5l$c;->e:[B

    .line 7
    .line 8
    invoke-static {v1, p1, v0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance v1, Ll/ig60;

    .line 13
    .line 14
    invoke-direct {v1, p1}, Ll/ig60;-><init>([B)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/s5l$c;->e:[B

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static {p1, v0, p1, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 21
    .line 22
    .line 23
    iput p2, p0, Ll/s5l$c;->f:I

    .line 24
    .line 25
    return-object v1
.end method
