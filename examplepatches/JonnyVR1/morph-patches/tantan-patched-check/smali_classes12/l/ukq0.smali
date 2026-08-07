.class public final Ll/ukq0;
.super Ll/yr3;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/yr3;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/w0f;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-virtual {p1}, Ll/w0f;->i()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/w0f;->c()C

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget v2, p1, Ll/w0f;->f:I

    .line 17
    .line 18
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    iput v2, p1, Ll/w0f;->f:I

    .line 21
    .line 22
    invoke-virtual {p0, v1, v0}, Ll/ukq0;->c(CLjava/lang/StringBuilder;)I

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    rem-int/lit8 v1, v1, 0x3

    .line 30
    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    invoke-static {p1, v0}, Ll/yr3;->g(Ll/w0f;Ljava/lang/StringBuilder;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ll/w0f;->d()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget v2, p1, Ll/w0f;->f:I

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/ukq0;->e()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-static {v1, v2, v3}, Ll/z4l;->n(Ljava/lang/CharSequence;II)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {p0}, Ll/ukq0;->e()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eq v1, v2, :cond_0

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    invoke-virtual {p1, v1}, Ll/w0f;->o(I)V

    .line 58
    .line 59
    .line 60
    :cond_1
    invoke-virtual {p0, p1, v0}, Ll/ukq0;->f(Ll/w0f;Ljava/lang/StringBuilder;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public c(CLjava/lang/StringBuilder;)I
    .locals 1

    .line 1
    const/16 p0, 0xd

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, p0, :cond_5

    .line 5
    .line 6
    const/16 p0, 0x20

    .line 7
    .line 8
    if-eq p1, p0, :cond_4

    .line 9
    .line 10
    const/16 p0, 0x2a

    .line 11
    .line 12
    if-eq p1, p0, :cond_3

    .line 13
    .line 14
    const/16 p0, 0x3e

    .line 15
    .line 16
    if-eq p1, p0, :cond_2

    .line 17
    .line 18
    const/16 p0, 0x30

    .line 19
    .line 20
    if-lt p1, p0, :cond_0

    .line 21
    .line 22
    const/16 p0, 0x39

    .line 23
    .line 24
    if-gt p1, p0, :cond_0

    .line 25
    .line 26
    add-int/lit8 p1, p1, -0x2c

    .line 27
    .line 28
    int-to-char p0, p1

    .line 29
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/16 p0, 0x41

    .line 34
    .line 35
    if-lt p1, p0, :cond_1

    .line 36
    .line 37
    const/16 p0, 0x5a

    .line 38
    .line 39
    if-gt p1, p0, :cond_1

    .line 40
    .line 41
    add-int/lit8 p1, p1, -0x33

    .line 42
    .line 43
    int-to-char p0, p1

    .line 44
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    invoke-static {p1}, Ll/z4l;->e(C)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 p0, 0x2

    .line 53
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_4
    const/4 p0, 0x3

    .line 62
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_5
    const/4 p0, 0x0

    .line 67
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    :goto_0
    return v0
.end method

.method public e()I
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    return p0
.end method

.method public f(Ll/w0f;Ljava/lang/StringBuilder;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/w0f;->p()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/w0f;->g()Ll/hoh0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/hoh0;->a()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-virtual {p1}, Ll/w0f;->a()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    sub-int/2addr p0, v0

    .line 17
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    iget v0, p1, Ll/w0f;->f:I

    .line 22
    .line 23
    sub-int/2addr v0, p2

    .line 24
    iput v0, p1, Ll/w0f;->f:I

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/w0f;->f()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    const/4 v0, 0x1

    .line 31
    if-gt p2, v0, :cond_0

    .line 32
    .line 33
    if-gt p0, v0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/w0f;->f()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eq p2, p0, :cond_1

    .line 40
    .line 41
    :cond_0
    const/16 p0, 0xfe

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Ll/w0f;->r(C)V

    .line 44
    .line 45
    .line 46
    :cond_1
    invoke-virtual {p1}, Ll/w0f;->e()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-gez p0, :cond_2

    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    invoke-virtual {p1, p0}, Ll/w0f;->o(I)V

    .line 54
    .line 55
    .line 56
    :cond_2
    return-void
.end method
