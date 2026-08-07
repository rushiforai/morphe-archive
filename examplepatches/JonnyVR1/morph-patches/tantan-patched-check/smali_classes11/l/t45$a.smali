.class public final Ll/t45$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xwd0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/t45;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/t45;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/t45<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final b:Lcom/google/android/exoplayer2/source/q;

.field public final c:I

.field public d:Z

.field public final synthetic e:Ll/t45;


# direct methods
.method public constructor <init>(Ll/t45;Ll/t45;Lcom/google/android/exoplayer2/source/q;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/t45<",
            "TT;>;",
            "Lcom/google/android/exoplayer2/source/q;",
            "I)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/t45$a;->e:Ll/t45;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/t45$a;->a:Ll/t45;

    .line 7
    .line 8
    iput-object p3, p0, Ll/t45$a;->b:Lcom/google/android/exoplayer2/source/q;

    .line 9
    .line 10
    iput p4, p0, Ll/t45$a;->c:I

    .line 11
    .line 12
    return-void
.end method

.method private c()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Ll/t45$a;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/t45$a;->e:Ll/t45;

    .line 6
    .line 7
    invoke-static {v0}, Ll/t45;->z(Ll/t45;)Lcom/google/android/exoplayer2/source/j$a;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v0, p0, Ll/t45$a;->e:Ll/t45;

    .line 12
    .line 13
    invoke-static {v0}, Ll/t45;->w(Ll/t45;)[I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v2, p0, Ll/t45$a;->c:I

    .line 18
    .line 19
    aget v2, v0, v2

    .line 20
    .line 21
    iget-object v0, p0, Ll/t45$a;->e:Ll/t45;

    .line 22
    .line 23
    invoke-static {v0}, Ll/t45;->x(Ll/t45;)[Lcom/google/android/exoplayer2/k;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget v3, p0, Ll/t45$a;->c:I

    .line 28
    .line 29
    aget-object v3, v0, v3

    .line 30
    .line 31
    iget-object v0, p0, Ll/t45$a;->e:Ll/t45;

    .line 32
    .line 33
    invoke-static {v0}, Ll/t45;->y(Ll/t45;)J

    .line 34
    .line 35
    .line 36
    move-result-wide v6

    .line 37
    const/4 v4, 0x0

    .line 38
    const/4 v5, 0x0

    .line 39
    invoke-virtual/range {v1 .. v7}, Lcom/google/android/exoplayer2/source/j$a;->h(ILcom/google/android/exoplayer2/k;ILjava/lang/Object;J)V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    iput-boolean v0, p0, Ll/t45$a;->d:Z

    .line 44
    .line 45
    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public b()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t45$a;->e:Ll/t45;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/t45;->H()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/t45$a;->b:Lcom/google/android/exoplayer2/source/q;

    .line 10
    .line 11
    iget-object p0, p0, Ll/t45$a;->e:Ll/t45;

    .line 12
    .line 13
    iget-boolean p0, p0, Ll/t45;->w:Z

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lcom/google/android/exoplayer2/source/q;->K(Z)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t45$a;->e:Ll/t45;

    .line 2
    .line 3
    invoke-static {v0}, Ll/t45;->v(Ll/t45;)[Z

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Ll/t45$a;->c:I

    .line 8
    .line 9
    aget-boolean v0, v0, v1

    .line 10
    .line 11
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/t45$a;->e:Ll/t45;

    .line 15
    .line 16
    invoke-static {v0}, Ll/t45;->v(Ll/t45;)[Z

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget p0, p0, Ll/t45$a;->c:I

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    aput-boolean v1, v0, p0

    .line 24
    .line 25
    return-void
.end method

.method public k(J)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t45$a;->e:Ll/t45;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/t45;->H()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object v0, p0, Ll/t45$a;->b:Lcom/google/android/exoplayer2/source/q;

    .line 12
    .line 13
    iget-object v1, p0, Ll/t45$a;->e:Ll/t45;

    .line 14
    .line 15
    iget-boolean v1, v1, Ll/t45;->w:Z

    .line 16
    .line 17
    invoke-virtual {v0, p1, p2, v1}, Lcom/google/android/exoplayer2/source/q;->E(JZ)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object p2, p0, Ll/t45$a;->e:Ll/t45;

    .line 22
    .line 23
    invoke-static {p2}, Ll/t45;->u(Ll/t45;)Ll/cq2;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    iget-object p2, p0, Ll/t45$a;->e:Ll/t45;

    .line 30
    .line 31
    invoke-static {p2}, Ll/t45;->u(Ll/t45;)Ll/cq2;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    iget v0, p0, Ll/t45$a;->c:I

    .line 36
    .line 37
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    invoke-virtual {p2, v0}, Ll/cq2;->i(I)I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    iget-object v0, p0, Ll/t45$a;->b:Lcom/google/android/exoplayer2/source/q;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/q;->C()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    sub-int/2addr p2, v0

    .line 50
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    :cond_1
    iget-object p2, p0, Ll/t45$a;->b:Lcom/google/android/exoplayer2/source/q;

    .line 55
    .line 56
    invoke-virtual {p2, p1}, Lcom/google/android/exoplayer2/source/q;->d0(I)V

    .line 57
    .line 58
    .line 59
    if-lez p1, :cond_2

    .line 60
    .line 61
    invoke-direct {p0}, Ll/t45$a;->c()V

    .line 62
    .line 63
    .line 64
    :cond_2
    return p1
.end method

.method public l(Ll/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;I)I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t45$a;->e:Ll/t45;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/t45;->H()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x3

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Ll/t45$a;->e:Ll/t45;

    .line 12
    .line 13
    invoke-static {v0}, Ll/t45;->u(Ll/t45;)Ll/cq2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/t45$a;->e:Ll/t45;

    .line 20
    .line 21
    invoke-static {v0}, Ll/t45;->u(Ll/t45;)Ll/cq2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget v2, p0, Ll/t45$a;->c:I

    .line 26
    .line 27
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Ll/cq2;->i(I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iget-object v2, p0, Ll/t45$a;->b:Lcom/google/android/exoplayer2/source/q;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/q;->C()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-gt v0, v2, :cond_1

    .line 40
    .line 41
    return v1

    .line 42
    :cond_1
    invoke-direct {p0}, Ll/t45$a;->c()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/t45$a;->b:Lcom/google/android/exoplayer2/source/q;

    .line 46
    .line 47
    iget-object p0, p0, Ll/t45$a;->e:Ll/t45;

    .line 48
    .line 49
    iget-boolean p0, p0, Ll/t45;->w:Z

    .line 50
    .line 51
    invoke-virtual {v0, p1, p2, p3, p0}, Lcom/google/android/exoplayer2/source/q;->R(Ll/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;IZ)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0
.end method
