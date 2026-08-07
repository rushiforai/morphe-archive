.class public Ll/phm;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final m:Ll/phm;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Z

.field public final d:Z

.field public final e:Z

.field public final f:Z

.field public final g:Z

.field public final h:Landroid/graphics/Bitmap$Config;

.field public final i:Landroid/graphics/Bitmap$Config;

.field public final j:Ll/shm;

.field public final k:Landroid/graphics/ColorSpace;

.field public final l:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ll/phm;->b()Ll/qhm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/qhm;->a()Ll/phm;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/phm;->m:Ll/phm;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Ll/qhm;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/qhm;->l()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Ll/phm;->a:I

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/qhm;->k()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Ll/phm;->b:I

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/qhm;->h()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput-boolean v0, p0, Ll/phm;->c:Z

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/qhm;->o()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput-boolean v0, p0, Ll/phm;->d:Z

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/qhm;->n()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput-boolean v0, p0, Ll/phm;->e:Z

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/qhm;->g()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput-boolean v0, p0, Ll/phm;->f:Z

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/qhm;->j()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iput-boolean v0, p0, Ll/phm;->g:Z

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/qhm;->c()Landroid/graphics/Bitmap$Config;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Ll/phm;->h:Landroid/graphics/Bitmap$Config;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/qhm;->b()Landroid/graphics/Bitmap$Config;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Ll/phm;->i:Landroid/graphics/Bitmap$Config;

    .line 57
    .line 58
    invoke-virtual {p1}, Ll/qhm;->f()Ll/shm;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Ll/phm;->j:Ll/shm;

    .line 63
    .line 64
    invoke-virtual {p1}, Ll/qhm;->d()Ll/f33;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Ll/qhm;->e()Landroid/graphics/ColorSpace;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Ll/phm;->k:Landroid/graphics/ColorSpace;

    .line 72
    .line 73
    invoke-virtual {p1}, Ll/qhm;->i()Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    iput-boolean p1, p0, Ll/phm;->l:Z

    .line 78
    .line 79
    return-void
.end method

.method public static a()Ll/phm;
    .locals 1

    .line 1
    sget-object v0, Ll/phm;->m:Ll/phm;

    .line 2
    .line 3
    return-object v0
.end method

.method public static b()Ll/qhm;
    .locals 1

    .line 1
    new-instance v0, Ll/qhm;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qhm;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public c()Ll/i950$a;
    .locals 3

    .line 1
    invoke-static {p0}, Ll/i950;->b(Ljava/lang/Object;)Ll/i950$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "minDecodeIntervalMs"

    .line 6
    .line 7
    iget v2, p0, Ll/phm;->a:I

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->a(Ljava/lang/String;I)Ll/i950$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "maxDimensionPx"

    .line 14
    .line 15
    iget v2, p0, Ll/phm;->b:I

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->a(Ljava/lang/String;I)Ll/i950$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "decodePreviewFrame"

    .line 22
    .line 23
    iget-boolean v2, p0, Ll/phm;->c:Z

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->c(Ljava/lang/String;Z)Ll/i950$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "useLastFrameForPreview"

    .line 30
    .line 31
    iget-boolean v2, p0, Ll/phm;->d:Z

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->c(Ljava/lang/String;Z)Ll/i950$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "useEncodedImageForPreview"

    .line 38
    .line 39
    iget-boolean v2, p0, Ll/phm;->e:Z

    .line 40
    .line 41
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->c(Ljava/lang/String;Z)Ll/i950$a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "decodeAllFrames"

    .line 46
    .line 47
    iget-boolean v2, p0, Ll/phm;->f:Z

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->c(Ljava/lang/String;Z)Ll/i950$a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "forceStaticImage"

    .line 54
    .line 55
    iget-boolean v2, p0, Ll/phm;->g:Z

    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->c(Ljava/lang/String;Z)Ll/i950$a;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v1, p0, Ll/phm;->h:Landroid/graphics/Bitmap$Config;

    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    const-string v2, "bitmapConfigName"

    .line 68
    .line 69
    invoke-virtual {v0, v2, v1}, Ll/i950$a;->b(Ljava/lang/String;Ljava/lang/Object;)Ll/i950$a;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-object v1, p0, Ll/phm;->i:Landroid/graphics/Bitmap$Config;

    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    const-string v2, "animatedBitmapConfigName"

    .line 80
    .line 81
    invoke-virtual {v0, v2, v1}, Ll/i950$a;->b(Ljava/lang/String;Ljava/lang/Object;)Ll/i950$a;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-string v1, "customImageDecoder"

    .line 86
    .line 87
    iget-object v2, p0, Ll/phm;->j:Ll/shm;

    .line 88
    .line 89
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->b(Ljava/lang/String;Ljava/lang/Object;)Ll/i950$a;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const-string v1, "bitmapTransformation"

    .line 94
    .line 95
    const/4 v2, 0x0

    .line 96
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->b(Ljava/lang/String;Ljava/lang/Object;)Ll/i950$a;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const-string v1, "colorSpace"

    .line 101
    .line 102
    iget-object p0, p0, Ll/phm;->k:Landroid/graphics/ColorSpace;

    .line 103
    .line 104
    invoke-virtual {v0, v1, p0}, Ll/i950$a;->b(Ljava/lang/String;Ljava/lang/Object;)Ll/i950$a;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_d

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Ll/phm;

    .line 20
    .line 21
    iget v2, p0, Ll/phm;->a:I

    .line 22
    .line 23
    iget v3, p1, Ll/phm;->a:I

    .line 24
    .line 25
    if-eq v2, v3, :cond_2

    .line 26
    .line 27
    return v1

    .line 28
    :cond_2
    iget v2, p0, Ll/phm;->b:I

    .line 29
    .line 30
    iget v3, p1, Ll/phm;->b:I

    .line 31
    .line 32
    if-eq v2, v3, :cond_3

    .line 33
    .line 34
    return v1

    .line 35
    :cond_3
    iget-boolean v2, p0, Ll/phm;->c:Z

    .line 36
    .line 37
    iget-boolean v3, p1, Ll/phm;->c:Z

    .line 38
    .line 39
    if-eq v2, v3, :cond_4

    .line 40
    .line 41
    return v1

    .line 42
    :cond_4
    iget-boolean v2, p0, Ll/phm;->d:Z

    .line 43
    .line 44
    iget-boolean v3, p1, Ll/phm;->d:Z

    .line 45
    .line 46
    if-eq v2, v3, :cond_5

    .line 47
    .line 48
    return v1

    .line 49
    :cond_5
    iget-boolean v2, p0, Ll/phm;->e:Z

    .line 50
    .line 51
    iget-boolean v3, p1, Ll/phm;->e:Z

    .line 52
    .line 53
    if-eq v2, v3, :cond_6

    .line 54
    .line 55
    return v1

    .line 56
    :cond_6
    iget-boolean v2, p0, Ll/phm;->f:Z

    .line 57
    .line 58
    iget-boolean v3, p1, Ll/phm;->f:Z

    .line 59
    .line 60
    if-eq v2, v3, :cond_7

    .line 61
    .line 62
    return v1

    .line 63
    :cond_7
    iget-boolean v2, p0, Ll/phm;->g:Z

    .line 64
    .line 65
    iget-boolean v3, p1, Ll/phm;->g:Z

    .line 66
    .line 67
    if-eq v2, v3, :cond_8

    .line 68
    .line 69
    return v1

    .line 70
    :cond_8
    iget-boolean v2, p0, Ll/phm;->l:Z

    .line 71
    .line 72
    if-nez v2, :cond_9

    .line 73
    .line 74
    iget-object v3, p0, Ll/phm;->h:Landroid/graphics/Bitmap$Config;

    .line 75
    .line 76
    iget-object v4, p1, Ll/phm;->h:Landroid/graphics/Bitmap$Config;

    .line 77
    .line 78
    if-eq v3, v4, :cond_9

    .line 79
    .line 80
    return v1

    .line 81
    :cond_9
    if-nez v2, :cond_a

    .line 82
    .line 83
    iget-object v2, p0, Ll/phm;->i:Landroid/graphics/Bitmap$Config;

    .line 84
    .line 85
    iget-object v3, p1, Ll/phm;->i:Landroid/graphics/Bitmap$Config;

    .line 86
    .line 87
    if-eq v2, v3, :cond_a

    .line 88
    .line 89
    return v1

    .line 90
    :cond_a
    iget-object v2, p0, Ll/phm;->j:Ll/shm;

    .line 91
    .line 92
    iget-object v3, p1, Ll/phm;->j:Ll/shm;

    .line 93
    .line 94
    if-eq v2, v3, :cond_b

    .line 95
    .line 96
    return v1

    .line 97
    :cond_b
    iget-object p0, p0, Ll/phm;->k:Landroid/graphics/ColorSpace;

    .line 98
    .line 99
    iget-object p1, p1, Ll/phm;->k:Landroid/graphics/ColorSpace;

    .line 100
    .line 101
    if-eq p0, p1, :cond_c

    .line 102
    .line 103
    return v1

    .line 104
    :cond_c
    return v0

    .line 105
    :cond_d
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Ll/phm;->a:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    iget v1, p0, Ll/phm;->b:I

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    mul-int/lit8 v0, v0, 0x1f

    .line 9
    .line 10
    iget-boolean v1, p0, Ll/phm;->c:Z

    .line 11
    .line 12
    add-int/2addr v0, v1

    .line 13
    mul-int/lit8 v0, v0, 0x1f

    .line 14
    .line 15
    iget-boolean v1, p0, Ll/phm;->d:Z

    .line 16
    .line 17
    add-int/2addr v0, v1

    .line 18
    mul-int/lit8 v0, v0, 0x1f

    .line 19
    .line 20
    iget-boolean v1, p0, Ll/phm;->e:Z

    .line 21
    .line 22
    add-int/2addr v0, v1

    .line 23
    mul-int/lit8 v0, v0, 0x1f

    .line 24
    .line 25
    iget-boolean v1, p0, Ll/phm;->f:Z

    .line 26
    .line 27
    add-int/2addr v0, v1

    .line 28
    mul-int/lit8 v0, v0, 0x1f

    .line 29
    .line 30
    iget-boolean v1, p0, Ll/phm;->g:Z

    .line 31
    .line 32
    add-int/2addr v0, v1

    .line 33
    iget-boolean v1, p0, Ll/phm;->l:Z

    .line 34
    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    mul-int/lit8 v0, v0, 0x1f

    .line 38
    .line 39
    iget-object v1, p0, Ll/phm;->h:Landroid/graphics/Bitmap$Config;

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    add-int/2addr v0, v1

    .line 46
    :cond_0
    iget-boolean v1, p0, Ll/phm;->l:Z

    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    mul-int/lit8 v0, v0, 0x1f

    .line 52
    .line 53
    iget-object v1, p0, Ll/phm;->i:Landroid/graphics/Bitmap$Config;

    .line 54
    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    goto :goto_0

    .line 62
    :cond_1
    move v1, v2

    .line 63
    :goto_0
    add-int/2addr v0, v1

    .line 64
    :cond_2
    mul-int/lit8 v0, v0, 0x1f

    .line 65
    .line 66
    iget-object v1, p0, Ll/phm;->j:Ll/shm;

    .line 67
    .line 68
    if-eqz v1, :cond_3

    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    goto :goto_1

    .line 75
    :cond_3
    move v1, v2

    .line 76
    :goto_1
    add-int/2addr v0, v1

    .line 77
    mul-int/lit16 v0, v0, 0x3c1

    .line 78
    .line 79
    iget-object p0, p0, Ll/phm;->k:Landroid/graphics/ColorSpace;

    .line 80
    .line 81
    if-eqz p0, :cond_4

    .line 82
    .line 83
    invoke-static {p0}, Ll/ohm;->a(Landroid/graphics/ColorSpace;)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    :cond_4
    add-int/2addr v0, v2

    .line 88
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ImageDecodeOptions{"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/phm;->c()Ll/i950$a;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/i950$a;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p0, "}"

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method
