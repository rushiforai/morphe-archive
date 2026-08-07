.class public Ll/c3i0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:I

.field private final b:I

.field private c:Z

.field private d:Landroid/graphics/Bitmap;

.field private e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private f:Ljava/lang/String;

.field private g:I

.field private h:Z

.field i:Ll/qpw;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/c3i0;->a:I

    .line 6
    .line 7
    const/16 v0, 0x10

    .line 8
    .line 9
    iput v0, p0, Ll/c3i0;->b:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/c3i0;->c:Z

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-object v1, p0, Ll/c3i0;->d:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    iput-object v1, p0, Ll/c3i0;->e:Ljava/util/HashMap;

    .line 18
    .line 19
    const-string v1, "/sdcard/tmp.png"

    .line 20
    .line 21
    iput-object v1, p0, Ll/c3i0;->f:Ljava/lang/String;

    .line 22
    .line 23
    iput-boolean v0, p0, Ll/c3i0;->h:Z

    .line 24
    .line 25
    return-void
.end method

.method private a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/c3i0;->e:Ljava/util/HashMap;

    .line 3
    .line 4
    iput-object v0, p0, Ll/c3i0;->d:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Ll/c3i0;->g:I

    .line 8
    .line 9
    return-void
.end method

.method private c()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/c3i0;->f:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/c3i0;->d:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    iget-object v2, p0, Ll/c3i0;->e:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Ll/a33;->c(Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/util/HashMap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ll/c3i0;->a()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    const/4 v1, 0x0

    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_1

    .line 18
    :catch_0
    move-exception v0

    .line 19
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Ll/c3i0;->a()V

    .line 23
    .line 24
    .line 25
    const/4 v1, -0x1

    .line 26
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v3, "Bitmap was already saved to storage, now callback with listener in sub thread [status="

    .line 29
    .line 30
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v3, "]"

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    const-string v3, "media"

    .line 46
    .line 47
    invoke-static {v3, v2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    new-instance v2, Ll/c3i0$a;

    .line 51
    .line 52
    invoke-direct {v2, p0, v1, v0}, Ll/c3i0$a;-><init>(Ll/c3i0;ILjava/lang/Exception;)V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x2

    .line 56
    invoke-static {p0, v2}, Ll/lyi0;->d(ILjava/lang/Runnable;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :goto_1
    invoke-direct {p0}, Ll/c3i0;->a()V

    .line 61
    .line 62
    .line 63
    throw v0
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/c3i0;->e:Ljava/util/HashMap;

    .line 3
    .line 4
    iput-object v0, p0, Ll/c3i0;->d:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    iput-object v0, p0, Ll/c3i0;->i:Ll/qpw;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/c3i0;->c:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/c3i0;->h:Z

    .line 12
    .line 13
    const-string v0, "/sdcard/tmp.png"

    .line 14
    .line 15
    iput-object v0, p0, Ll/c3i0;->f:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method

.method public d()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/c3i0;->c:Z

    .line 2
    .line 3
    iget v1, p0, Ll/c3i0;->g:I

    .line 4
    .line 5
    const-string v2, "]"

    .line 6
    .line 7
    const-string v3, "media"

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    const/16 v0, 0x11

    .line 12
    .line 13
    if-ne v1, v0, :cond_0

    .line 14
    .line 15
    invoke-direct {p0}, Ll/c3i0;->c()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v1, "[status="

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget v1, p0, Ll/c3i0;->g:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, "][needExif="

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-boolean v1, p0, Ll/c3i0;->c:Z

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v1, "][gotExif="

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-boolean v1, p0, Ll/c3i0;->h:Z

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v3, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-boolean v0, p0, Ll/c3i0;->h:Z

    .line 62
    .line 63
    if-nez v0, :cond_1

    .line 64
    .line 65
    iget v0, p0, Ll/c3i0;->g:I

    .line 66
    .line 67
    and-int/lit8 v0, v0, 0x10

    .line 68
    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    invoke-direct {p0}, Ll/c3i0;->c()V

    .line 72
    .line 73
    .line 74
    :cond_1
    return-void

    .line 75
    :cond_2
    and-int/lit8 v0, v1, 0x10

    .line 76
    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    invoke-direct {p0}, Ll/c3i0;->c()V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v1, "Status error, Do not have bitmap info [status="

    .line 86
    .line 87
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget p0, p0, Ll/c3i0;->g:I

    .line 91
    .line 92
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-static {v3, p0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public e(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c3i0;->d:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    iget p1, p0, Ll/c3i0;->g:I

    .line 4
    .line 5
    or-int/lit8 p1, p1, 0x10

    .line 6
    .line 7
    iput p1, p0, Ll/c3i0;->g:I

    .line 8
    .line 9
    return-void
.end method

.method public f(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/c3i0;->e:Ljava/util/HashMap;

    .line 2
    .line 3
    iget p1, p0, Ll/c3i0;->g:I

    .line 4
    .line 5
    or-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    iput p1, p0, Ll/c3i0;->g:I

    .line 8
    .line 9
    return-void
.end method

.method public g([B)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/c3i0;->h:Z

    .line 3
    .line 4
    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    const/16 v1, 0x18

    .line 7
    .line 8
    const-string v2, "exif.jpg"

    .line 9
    .line 10
    const-string v3, ".png"

    .line 11
    .line 12
    if-le v0, v1, :cond_0

    .line 13
    .line 14
    :try_start_1
    new-instance v0, Ljava/io/ByteArrayInputStream;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 17
    .line 18
    .line 19
    new-instance p1, Landroid/media/ExifInterface;

    .line 20
    .line 21
    invoke-direct {p1, v0}, Landroid/media/ExifInterface;-><init>(Ljava/io/InputStream;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, p0, Ll/c3i0;->f:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {p1, v0}, Ll/kki;->f([BLjava/lang/String;)V

    .line 32
    .line 33
    .line 34
    new-instance p1, Landroid/media/ExifInterface;

    .line 35
    .line 36
    iget-object v0, p0, Ll/c3i0;->f:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-direct {p1, v0}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :goto_0
    invoke-static {p1}, Ll/ykm;->a(Landroid/media/ExifInterface;)Ljava/util/HashMap;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Ll/c3i0;->f(Ljava/util/HashMap;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/c3i0;->f:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {p0}, Ll/kki;->b(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :catch_0
    move-exception p0

    .line 63
    const-string p1, "media"

    .line 64
    .line 65
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public h(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c3i0;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public i(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/c3i0;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public j(Ll/qpw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c3i0;->i:Ll/qpw;

    .line 2
    .line 3
    return-void
.end method
