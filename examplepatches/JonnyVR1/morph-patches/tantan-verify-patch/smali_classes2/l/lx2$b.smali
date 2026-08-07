.class public Ll/lx2$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/lx2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field public static final f:[B


# instance fields
.field public final a:Ljava/lang/CharSequence;

.field public final b:Z

.field public final c:I

.field public d:I

.field public e:C


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/16 v0, 0x700

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    sput-object v1, Ll/lx2$b;->f:[B

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    sget-object v2, Ll/lx2$b;->f:[B

    .line 11
    .line 12
    invoke-static {v1}, Ljava/lang/Character;->getDirectionality(I)B

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    aput-byte v3, v2, v1

    .line 17
    .line 18
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lx2$b;->a:Ljava/lang/CharSequence;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/lx2$b;->b:Z

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput p1, p0, Ll/lx2$b;->c:I

    .line 13
    .line 14
    return-void
.end method

.method public static c(C)B
    .locals 1

    .line 1
    const/16 v0, 0x700

    .line 2
    .line 3
    if-ge p0, v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/lx2$b;->f:[B

    .line 6
    .line 7
    aget-byte p0, v0, p0

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {p0}, Ljava/lang/Character;->getDirectionality(C)B

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method


# virtual methods
.method public a()B
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lx2$b;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iget v1, p0, Ll/lx2$b;->d:I

    .line 4
    .line 5
    add-int/lit8 v1, v1, -0x1

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput-char v0, p0, Ll/lx2$b;->e:C

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Character;->isLowSurrogate(C)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/lx2$b;->a:Ljava/lang/CharSequence;

    .line 20
    .line 21
    iget v1, p0, Ll/lx2$b;->d:I

    .line 22
    .line 23
    invoke-static {v0, v1}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget v1, p0, Ll/lx2$b;->d:I

    .line 28
    .line 29
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    sub-int/2addr v1, v2

    .line 34
    iput v1, p0, Ll/lx2$b;->d:I

    .line 35
    .line 36
    invoke-static {v0}, Ljava/lang/Character;->getDirectionality(I)B

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0

    .line 41
    :cond_0
    iget v0, p0, Ll/lx2$b;->d:I

    .line 42
    .line 43
    add-int/lit8 v0, v0, -0x1

    .line 44
    .line 45
    iput v0, p0, Ll/lx2$b;->d:I

    .line 46
    .line 47
    iget-char v0, p0, Ll/lx2$b;->e:C

    .line 48
    .line 49
    invoke-static {v0}, Ll/lx2$b;->c(C)B

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iget-boolean v1, p0, Ll/lx2$b;->b:Z

    .line 54
    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    iget-char v1, p0, Ll/lx2$b;->e:C

    .line 58
    .line 59
    const/16 v2, 0x3e

    .line 60
    .line 61
    if-ne v1, v2, :cond_1

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/lx2$b;->h()B

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    return p0

    .line 68
    :cond_1
    const/16 v2, 0x3b

    .line 69
    .line 70
    if-ne v1, v2, :cond_2

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/lx2$b;->f()B

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    return p0

    .line 77
    :cond_2
    return v0
.end method

.method public b()B
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lx2$b;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iget v1, p0, Ll/lx2$b;->d:I

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput-char v0, p0, Ll/lx2$b;->e:C

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Character;->isHighSurrogate(C)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/lx2$b;->a:Ljava/lang/CharSequence;

    .line 18
    .line 19
    iget v1, p0, Ll/lx2$b;->d:I

    .line 20
    .line 21
    invoke-static {v0, v1}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget v1, p0, Ll/lx2$b;->d:I

    .line 26
    .line 27
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    add-int/2addr v1, v2

    .line 32
    iput v1, p0, Ll/lx2$b;->d:I

    .line 33
    .line 34
    invoke-static {v0}, Ljava/lang/Character;->getDirectionality(I)B

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_0
    iget v0, p0, Ll/lx2$b;->d:I

    .line 40
    .line 41
    add-int/lit8 v0, v0, 0x1

    .line 42
    .line 43
    iput v0, p0, Ll/lx2$b;->d:I

    .line 44
    .line 45
    iget-char v0, p0, Ll/lx2$b;->e:C

    .line 46
    .line 47
    invoke-static {v0}, Ll/lx2$b;->c(C)B

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iget-boolean v1, p0, Ll/lx2$b;->b:Z

    .line 52
    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget-char v1, p0, Ll/lx2$b;->e:C

    .line 56
    .line 57
    const/16 v2, 0x3c

    .line 58
    .line 59
    if-ne v1, v2, :cond_1

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/lx2$b;->i()B

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    return p0

    .line 66
    :cond_1
    const/16 v2, 0x26

    .line 67
    .line 68
    if-ne v1, v2, :cond_2

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/lx2$b;->g()B

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    return p0

    .line 75
    :cond_2
    return v0
.end method

.method public d()I
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/lx2$b;->d:I

    .line 3
    .line 4
    move v1, v0

    .line 5
    move v2, v1

    .line 6
    move v3, v2

    .line 7
    :cond_0
    :goto_0
    iget v4, p0, Ll/lx2$b;->d:I

    .line 8
    .line 9
    iget v5, p0, Ll/lx2$b;->c:I

    .line 10
    .line 11
    const/4 v6, -0x1

    .line 12
    const/4 v7, 0x1

    .line 13
    if-ge v4, v5, :cond_4

    .line 14
    .line 15
    if-nez v1, :cond_4

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/lx2$b;->b()B

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-eqz v4, :cond_2

    .line 22
    .line 23
    if-eq v4, v7, :cond_1

    .line 24
    .line 25
    const/4 v5, 0x2

    .line 26
    if-eq v4, v5, :cond_1

    .line 27
    .line 28
    const/16 v5, 0x9

    .line 29
    .line 30
    if-eq v4, v5, :cond_0

    .line 31
    .line 32
    packed-switch v4, :pswitch_data_0

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :pswitch_0
    add-int/lit8 v3, v3, -0x1

    .line 37
    .line 38
    move v2, v0

    .line 39
    goto :goto_0

    .line 40
    :pswitch_1
    add-int/lit8 v3, v3, 0x1

    .line 41
    .line 42
    move v2, v7

    .line 43
    goto :goto_0

    .line 44
    :pswitch_2
    add-int/lit8 v3, v3, 0x1

    .line 45
    .line 46
    move v2, v6

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    if-nez v3, :cond_3

    .line 49
    .line 50
    return v7

    .line 51
    :cond_2
    if-nez v3, :cond_3

    .line 52
    .line 53
    return v6

    .line 54
    :cond_3
    :goto_1
    move v1, v3

    .line 55
    goto :goto_0

    .line 56
    :cond_4
    if-nez v1, :cond_5

    .line 57
    .line 58
    return v0

    .line 59
    :cond_5
    if-eqz v2, :cond_6

    .line 60
    .line 61
    return v2

    .line 62
    :cond_6
    :goto_2
    iget v2, p0, Ll/lx2$b;->d:I

    .line 63
    .line 64
    if-lez v2, :cond_8

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/lx2$b;->a()B

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    packed-switch v2, :pswitch_data_1

    .line 71
    .line 72
    .line 73
    goto :goto_2

    .line 74
    :pswitch_3
    add-int/lit8 v3, v3, 0x1

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :pswitch_4
    if-ne v1, v3, :cond_7

    .line 78
    .line 79
    return v7

    .line 80
    :cond_7
    add-int/lit8 v3, v3, -0x1

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :pswitch_5
    if-ne v1, v3, :cond_7

    .line 84
    .line 85
    return v6

    .line 86
    :cond_8
    return v0

    .line 87
    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    :pswitch_data_1
    .packed-switch 0xe
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public e()I
    .locals 7

    .line 1
    iget v0, p0, Ll/lx2$b;->c:I

    .line 2
    .line 3
    iput v0, p0, Ll/lx2$b;->d:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    move v1, v0

    .line 7
    :goto_0
    move v2, v1

    .line 8
    :cond_0
    :goto_1
    iget v3, p0, Ll/lx2$b;->d:I

    .line 9
    .line 10
    if-lez v3, :cond_6

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/lx2$b;->a()B

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    const/4 v4, -0x1

    .line 17
    if-eqz v3, :cond_4

    .line 18
    .line 19
    const/4 v5, 0x1

    .line 20
    if-eq v3, v5, :cond_2

    .line 21
    .line 22
    const/4 v6, 0x2

    .line 23
    if-eq v3, v6, :cond_2

    .line 24
    .line 25
    const/16 v6, 0x9

    .line 26
    .line 27
    if-eq v3, v6, :cond_0

    .line 28
    .line 29
    packed-switch v3, :pswitch_data_0

    .line 30
    .line 31
    .line 32
    if-nez v2, :cond_0

    .line 33
    .line 34
    goto :goto_2

    .line 35
    :pswitch_0
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :pswitch_1
    if-ne v2, v1, :cond_1

    .line 39
    .line 40
    return v5

    .line 41
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :pswitch_2
    if-ne v2, v1, :cond_1

    .line 45
    .line 46
    return v4

    .line 47
    :cond_2
    if-nez v1, :cond_3

    .line 48
    .line 49
    return v5

    .line 50
    :cond_3
    if-nez v2, :cond_0

    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_4
    if-nez v1, :cond_5

    .line 54
    .line 55
    return v4

    .line 56
    :cond_5
    if-nez v2, :cond_0

    .line 57
    .line 58
    :goto_2
    goto :goto_0

    .line 59
    :cond_6
    return v0

    .line 60
    nop

    .line 61
    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final f()B
    .locals 4

    .line 1
    iget v0, p0, Ll/lx2$b;->d:I

    .line 2
    .line 3
    :cond_0
    iget v1, p0, Ll/lx2$b;->d:I

    .line 4
    .line 5
    const/16 v2, 0x3b

    .line 6
    .line 7
    if-lez v1, :cond_2

    .line 8
    .line 9
    iget-object v3, p0, Ll/lx2$b;->a:Ljava/lang/CharSequence;

    .line 10
    .line 11
    add-int/lit8 v1, v1, -0x1

    .line 12
    .line 13
    iput v1, p0, Ll/lx2$b;->d:I

    .line 14
    .line 15
    invoke-interface {v3, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput-char v1, p0, Ll/lx2$b;->e:C

    .line 20
    .line 21
    const/16 v3, 0x26

    .line 22
    .line 23
    if-ne v1, v3, :cond_1

    .line 24
    .line 25
    const/16 p0, 0xc

    .line 26
    .line 27
    return p0

    .line 28
    :cond_1
    if-ne v1, v2, :cond_0

    .line 29
    .line 30
    :cond_2
    iput v0, p0, Ll/lx2$b;->d:I

    .line 31
    .line 32
    iput-char v2, p0, Ll/lx2$b;->e:C

    .line 33
    .line 34
    const/16 p0, 0xd

    .line 35
    .line 36
    return p0
.end method

.method public final g()B
    .locals 3

    .line 1
    :goto_0
    iget v0, p0, Ll/lx2$b;->d:I

    .line 2
    .line 3
    iget v1, p0, Ll/lx2$b;->c:I

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/lx2$b;->a:Ljava/lang/CharSequence;

    .line 8
    .line 9
    add-int/lit8 v2, v0, 0x1

    .line 10
    .line 11
    iput v2, p0, Ll/lx2$b;->d:I

    .line 12
    .line 13
    invoke-interface {v1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput-char v0, p0, Ll/lx2$b;->e:C

    .line 18
    .line 19
    const/16 v1, 0x3b

    .line 20
    .line 21
    if-eq v0, v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/16 p0, 0xc

    .line 25
    .line 26
    return p0
.end method

.method public final h()B
    .locals 4

    .line 1
    iget v0, p0, Ll/lx2$b;->d:I

    .line 2
    .line 3
    :cond_0
    iget v1, p0, Ll/lx2$b;->d:I

    .line 4
    .line 5
    const/16 v2, 0x3e

    .line 6
    .line 7
    if-lez v1, :cond_4

    .line 8
    .line 9
    iget-object v3, p0, Ll/lx2$b;->a:Ljava/lang/CharSequence;

    .line 10
    .line 11
    add-int/lit8 v1, v1, -0x1

    .line 12
    .line 13
    iput v1, p0, Ll/lx2$b;->d:I

    .line 14
    .line 15
    invoke-interface {v3, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput-char v1, p0, Ll/lx2$b;->e:C

    .line 20
    .line 21
    const/16 v3, 0x3c

    .line 22
    .line 23
    if-ne v1, v3, :cond_1

    .line 24
    .line 25
    const/16 p0, 0xc

    .line 26
    .line 27
    return p0

    .line 28
    :cond_1
    if-ne v1, v2, :cond_2

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_2
    const/16 v2, 0x22

    .line 32
    .line 33
    if-eq v1, v2, :cond_3

    .line 34
    .line 35
    const/16 v2, 0x27

    .line 36
    .line 37
    if-ne v1, v2, :cond_0

    .line 38
    .line 39
    :cond_3
    :goto_0
    iget v2, p0, Ll/lx2$b;->d:I

    .line 40
    .line 41
    if-lez v2, :cond_0

    .line 42
    .line 43
    iget-object v3, p0, Ll/lx2$b;->a:Ljava/lang/CharSequence;

    .line 44
    .line 45
    add-int/lit8 v2, v2, -0x1

    .line 46
    .line 47
    iput v2, p0, Ll/lx2$b;->d:I

    .line 48
    .line 49
    invoke-interface {v3, v2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    iput-char v2, p0, Ll/lx2$b;->e:C

    .line 54
    .line 55
    if-eq v2, v1, :cond_0

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_4
    :goto_1
    iput v0, p0, Ll/lx2$b;->d:I

    .line 59
    .line 60
    iput-char v2, p0, Ll/lx2$b;->e:C

    .line 61
    .line 62
    const/16 p0, 0xd

    .line 63
    .line 64
    return p0
.end method

.method public final i()B
    .locals 5

    .line 1
    iget v0, p0, Ll/lx2$b;->d:I

    .line 2
    .line 3
    :cond_0
    iget v1, p0, Ll/lx2$b;->d:I

    .line 4
    .line 5
    iget v2, p0, Ll/lx2$b;->c:I

    .line 6
    .line 7
    if-ge v1, v2, :cond_3

    .line 8
    .line 9
    iget-object v2, p0, Ll/lx2$b;->a:Ljava/lang/CharSequence;

    .line 10
    .line 11
    add-int/lit8 v3, v1, 0x1

    .line 12
    .line 13
    iput v3, p0, Ll/lx2$b;->d:I

    .line 14
    .line 15
    invoke-interface {v2, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput-char v1, p0, Ll/lx2$b;->e:C

    .line 20
    .line 21
    const/16 v2, 0x3e

    .line 22
    .line 23
    if-ne v1, v2, :cond_1

    .line 24
    .line 25
    const/16 p0, 0xc

    .line 26
    .line 27
    return p0

    .line 28
    :cond_1
    const/16 v2, 0x22

    .line 29
    .line 30
    if-eq v1, v2, :cond_2

    .line 31
    .line 32
    const/16 v2, 0x27

    .line 33
    .line 34
    if-ne v1, v2, :cond_0

    .line 35
    .line 36
    :cond_2
    :goto_0
    iget v2, p0, Ll/lx2$b;->d:I

    .line 37
    .line 38
    iget v3, p0, Ll/lx2$b;->c:I

    .line 39
    .line 40
    if-ge v2, v3, :cond_0

    .line 41
    .line 42
    iget-object v3, p0, Ll/lx2$b;->a:Ljava/lang/CharSequence;

    .line 43
    .line 44
    add-int/lit8 v4, v2, 0x1

    .line 45
    .line 46
    iput v4, p0, Ll/lx2$b;->d:I

    .line 47
    .line 48
    invoke-interface {v3, v2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    iput-char v2, p0, Ll/lx2$b;->e:C

    .line 53
    .line 54
    if-eq v2, v1, :cond_0

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    iput v0, p0, Ll/lx2$b;->d:I

    .line 58
    .line 59
    const/16 v0, 0x3c

    .line 60
    .line 61
    iput-char v0, p0, Ll/lx2$b;->e:C

    .line 62
    .line 63
    const/16 p0, 0xd

    .line 64
    .line 65
    return p0
.end method
