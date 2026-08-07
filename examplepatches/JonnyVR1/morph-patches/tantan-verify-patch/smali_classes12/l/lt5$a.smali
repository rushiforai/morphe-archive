.class Ll/lt5$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/lt5;->f(Landroid/graphics/Bitmap;Ljava/lang/String;Ll/lt5$c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/graphics/Bitmap;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ll/lt5$c;

.field final synthetic d:Ll/lt5;


# direct methods
.method public constructor <init>(Ll/lt5;Landroid/graphics/Bitmap;Ljava/lang/String;Ll/lt5$c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/lt5$a;->d:Ll/lt5;

    .line 2
    .line 3
    iput-object p2, p0, Ll/lt5$a;->a:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    iput-object p3, p0, Ll/lt5$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/lt5$a;->c:Ll/lt5$c;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/lt5$a;->a:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 9
    .line 10
    const/16 v3, 0x64

    .line 11
    .line 12
    invoke-virtual {v1, v2, v3, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    array-length v1, v1

    .line 20
    iget-object v2, p0, Ll/lt5$a;->d:Ll/lt5;

    .line 21
    .line 22
    invoke-static {v2}, Ll/lt5;->a(Ll/lt5;)Lcom/idv/identity/ocr/compress/CompressConfig;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Lcom/idv/identity/ocr/compress/CompressConfig;->getMaxSize()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-le v1, v2, :cond_2

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 33
    .line 34
    .line 35
    add-int/lit8 v3, v3, -0x5

    .line 36
    .line 37
    const/4 v1, 0x5

    .line 38
    if-gt v3, v1, :cond_1

    .line 39
    .line 40
    move v3, v1

    .line 41
    :cond_1
    iget-object v2, p0, Ll/lt5$a;->a:Landroid/graphics/Bitmap;

    .line 42
    .line 43
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 44
    .line 45
    invoke-virtual {v2, v4, v3, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 46
    .line 47
    .line 48
    if-ne v3, v1, :cond_0

    .line 49
    .line 50
    :cond_2
    :try_start_0
    iget-object v1, p0, Ll/lt5$a;->d:Ll/lt5;

    .line 51
    .line 52
    new-instance v2, Ljava/io/File;

    .line 53
    .line 54
    iget-object v3, p0, Ll/lt5$a;->b:Ljava/lang/String;

    .line 55
    .line 56
    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1, v2}, Ll/lt5;->b(Ll/lt5;Ljava/io/File;)Ljava/io/File;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    new-instance v2, Ljava/io/FileOutputStream;

    .line 64
    .line 65
    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v2, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/lt5$a;->d:Ll/lt5;

    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iget-object v2, p0, Ll/lt5$a;->c:Ll/lt5$c;

    .line 88
    .line 89
    const/4 v3, 0x1

    .line 90
    const/4 v4, 0x0

    .line 91
    invoke-static {v0, v3, v1, v4, v2}, Ll/lt5;->c(Ll/lt5;ZLjava/lang/String;Ljava/lang/String;Ll/lt5$c;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :catch_0
    move-exception v0

    .line 96
    iget-object v1, p0, Ll/lt5$a;->d:Ll/lt5;

    .line 97
    .line 98
    iget-object v2, p0, Ll/lt5$a;->b:Ljava/lang/String;

    .line 99
    .line 100
    const-string v3, "\u8d28\u91cf\u538b\u7f29\u5931\u8d25"

    .line 101
    .line 102
    iget-object p0, p0, Ll/lt5$a;->c:Ll/lt5$c;

    .line 103
    .line 104
    const/4 v4, 0x0

    .line 105
    invoke-static {v1, v4, v2, v3, p0}, Ll/lt5;->c(Ll/lt5;ZLjava/lang/String;Ljava/lang/String;Ll/lt5$c;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 109
    .line 110
    .line 111
    return-void
.end method
