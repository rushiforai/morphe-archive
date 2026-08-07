.class public final Ll/w0f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

.field public c:Ll/s2e;

.field public d:Ll/s2e;

.field public final e:Ljava/lang/StringBuilder;

.field public f:I

.field public g:I

.field public h:Ll/hoh0;

.field public i:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    array-length v2, v0

    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 14
    .line 15
    .line 16
    array-length v2, v0

    .line 17
    const/4 v3, 0x0

    .line 18
    :goto_0
    if-ge v3, v2, :cond_2

    .line 19
    .line 20
    aget-byte v4, v0, v3

    .line 21
    .line 22
    and-int/lit16 v4, v4, 0xff

    .line 23
    .line 24
    int-to-char v4, v4

    .line 25
    const/16 v5, 0x3f

    .line 26
    .line 27
    if-ne v4, v5, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    if-ne v6, v5, :cond_0

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    const-string p0, "Message contains characters outside ISO-8859-1 encoding."

    .line 37
    .line 38
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    throw p0

    .line 43
    :cond_1
    :goto_1
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    add-int/lit8 v3, v3, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Ll/w0f;->a:Ljava/lang/String;

    .line 54
    .line 55
    sget-object v0, Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;->FORCE_NONE:Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    .line 56
    .line 57
    iput-object v0, p0, Ll/w0f;->b:Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    .line 58
    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, Ll/w0f;->e:Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const/4 p1, -0x1

    .line 71
    iput p1, p0, Ll/w0f;->g:I

    .line 72
    .line 73
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0f;->e:Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b()Ljava/lang/StringBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0f;->e:Ljava/lang/StringBuilder;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()C
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w0f;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget p0, p0, Ll/w0f;->f:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->charAt(I)C

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0f;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/w0f;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public f()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/w0f;->h()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget p0, p0, Ll/w0f;->f:I

    .line 6
    .line 7
    sub-int/2addr v0, p0

    .line 8
    return v0
.end method

.method public g()Ll/hoh0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0f;->h:Ll/hoh0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w0f;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget p0, p0, Ll/w0f;->i:I

    .line 8
    .line 9
    sub-int/2addr v0, p0

    .line 10
    return v0
.end method

.method public i()Z
    .locals 1

    .line 1
    iget v0, p0, Ll/w0f;->f:I

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w0f;->h()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ge v0, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public j()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ll/w0f;->g:I

    .line 3
    .line 4
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/w0f;->h:Ll/hoh0;

    .line 3
    .line 4
    return-void
.end method

.method public l(Ll/s2e;Ll/s2e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w0f;->c:Ll/s2e;

    .line 2
    .line 3
    iput-object p2, p0, Ll/w0f;->d:Ll/s2e;

    .line 4
    .line 5
    return-void
.end method

.method public m(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/w0f;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public n(Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w0f;->b:Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    .line 2
    .line 3
    return-void
.end method

.method public o(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/w0f;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/w0f;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/w0f;->q(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/w0f;->h:Ll/hoh0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/hoh0;->a()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-le p1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/w0f;->b:Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    .line 14
    .line 15
    iget-object v1, p0, Ll/w0f;->c:Ll/s2e;

    .line 16
    .line 17
    iget-object v2, p0, Ll/w0f;->d:Ll/s2e;

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    invoke-static {p1, v0, v1, v2, v3}, Ll/hoh0;->l(ILcom/google/zxing/datamatrix/encoder/SymbolShapeHint;Ll/s2e;Ll/s2e;Z)Ll/hoh0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/w0f;->h:Ll/hoh0;

    .line 25
    .line 26
    return-void
.end method

.method public r(C)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0f;->e:Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0f;->e:Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    .line 5
    .line 6
    return-void
.end method
