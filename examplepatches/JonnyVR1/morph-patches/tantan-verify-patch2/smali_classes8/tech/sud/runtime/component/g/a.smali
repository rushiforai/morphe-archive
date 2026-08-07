.class public Ltech/sud/runtime/component/g/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Landroid/content/res/AssetManager;

.field private b:Landroid/graphics/Canvas;

.field private c:Landroid/graphics/Bitmap;

.field private d:I

.field private e:I

.field private f:I

.field private g:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/res/AssetManager;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    iput v0, p0, Ltech/sud/runtime/component/g/a;->d:I

    .line 6
    .line 7
    iput v0, p0, Ltech/sud/runtime/component/g/a;->e:I

    .line 8
    .line 9
    const/16 v0, 0x400

    .line 10
    .line 11
    iput v0, p0, Ltech/sud/runtime/component/g/a;->f:I

    .line 12
    .line 13
    new-instance v0, Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ltech/sud/runtime/component/g/a;->g:Ljava/util/HashMap;

    .line 19
    .line 20
    iput-object p1, p0, Ltech/sud/runtime/component/g/a;->a:Landroid/content/res/AssetManager;

    .line 21
    .line 22
    return-void
.end method

.method private static a(Landroid/content/res/AssetManager;Ljava/lang/String;)Z
    .locals 5

    const/4 v0, 0x0

    .line 108
    :try_start_0
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 109
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    add-int/2addr v1, v3

    .line 110
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 111
    invoke-virtual {p0, v2}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 112
    array-length v1, p0

    move v2, v0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v4, p0, v2

    .line 113
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v4, :cond_0

    return v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    .line 114
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_1
    return v0
.end method


# virtual methods
.method public a(II)Landroid/graphics/Canvas;
    .locals 2

    .line 97
    iget v0, p0, Ltech/sud/runtime/component/g/a;->d:I

    if-gt p1, v0, :cond_1

    iget v1, p0, Ltech/sud/runtime/component/g/a;->e:I

    if-gt p2, v1, :cond_1

    iget-object v1, p0, Ltech/sud/runtime/component/g/a;->c:Landroid/graphics/Bitmap;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    if-le p1, v0, :cond_2

    .line 98
    iput p1, p0, Ltech/sud/runtime/component/g/a;->d:I

    .line 99
    :cond_2
    iget p1, p0, Ltech/sud/runtime/component/g/a;->e:I

    if-le p2, p1, :cond_3

    .line 100
    iput p2, p0, Ltech/sud/runtime/component/g/a;->e:I

    .line 101
    :cond_3
    iget-object p1, p0, Ltech/sud/runtime/component/g/a;->c:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_4

    .line 102
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 103
    :cond_4
    iget p1, p0, Ltech/sud/runtime/component/g/a;->d:I

    iget p2, p0, Ltech/sud/runtime/component/g/a;->e:I

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Ltech/sud/runtime/component/g/a;->c:Landroid/graphics/Bitmap;

    const/4 p1, 0x1

    .line 104
    :goto_1
    iget-object p2, p0, Ltech/sud/runtime/component/g/a;->b:Landroid/graphics/Canvas;

    if-nez p2, :cond_5

    .line 105
    new-instance p1, Landroid/graphics/Canvas;

    iget-object p2, p0, Ltech/sud/runtime/component/g/a;->c:Landroid/graphics/Bitmap;

    invoke-direct {p1, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object p1, p0, Ltech/sud/runtime/component/g/a;->b:Landroid/graphics/Canvas;

    goto :goto_2

    :cond_5
    if-eqz p1, :cond_6

    .line 106
    iget-object p1, p0, Ltech/sud/runtime/component/g/a;->c:Landroid/graphics/Bitmap;

    invoke-virtual {p2, p1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 107
    :cond_6
    :goto_2
    iget-object p0, p0, Ltech/sud/runtime/component/g/a;->b:Landroid/graphics/Canvas;

    return-object p0
.end method

.method public a(Ljava/lang/String;)Landroid/graphics/Typeface;
    .locals 3

    .line 1
    const-string v0, "/"

    .line 2
    .line 3
    const-string v1, "font: "

    .line 4
    .line 5
    iget-object v2, p0, Ltech/sud/runtime/component/g/a;->g:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-virtual {v2, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ltech/sud/runtime/component/g/a;->g:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Landroid/graphics/Typeface;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    :try_start_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    new-instance v2, Ljava/io/File;

    .line 29
    .line 30
    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    invoke-static {p1}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v2, "TextBitmap"

    .line 44
    .line 45
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v2, v1}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ltech/sud/runtime/component/g/a;->g:Ljava/util/HashMap;

    .line 53
    .line 54
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    return-object v0

    .line 58
    :catch_0
    move-exception p0

    .line 59
    goto :goto_0

    .line 60
    :cond_1
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    iget-object v0, p0, Ltech/sud/runtime/component/g/a;->a:Landroid/content/res/AssetManager;

    .line 67
    .line 68
    invoke-static {v0, p1}, Ltech/sud/runtime/component/g/a;->a(Landroid/content/res/AssetManager;Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    iget-object v0, p0, Ltech/sud/runtime/component/g/a;->a:Landroid/content/res/AssetManager;

    .line 75
    .line 76
    invoke-static {v0, p1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object p0, p0, Ltech/sud/runtime/component/g/a;->g:Ljava/util/HashMap;

    .line 81
    .line 82
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    .line 84
    .line 85
    return-object v0

    .line 86
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 87
    .line 88
    .line 89
    :cond_2
    const/4 p0, 0x0

    .line 90
    invoke-static {p1, p0}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0
.end method

.method public a()V
    .locals 0

    .line 95
    iget-object p0, p0, Ltech/sud/runtime/component/g/a;->g:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    return-void
.end method

.method public a(I)V
    .locals 0

    .line 96
    iput p1, p0, Ltech/sud/runtime/component/g/a;->f:I

    return-void
.end method

.method public b()I
    .locals 0

    .line 63
    iget p0, p0, Ltech/sud/runtime/component/g/a;->f:I

    return p0
.end method

.method public b(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "/"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/io/File;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    new-instance p1, Ljava/io/FileInputStream;

    .line 21
    .line 22
    invoke-direct {p1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1}, Ltech/sud/runtime/component/g/b;->a(Ljava/io/InputStream;)Ltech/sud/runtime/component/g/e;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ltech/sud/runtime/component/g/e;->a()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/g/a;->a:Landroid/content/res/AssetManager;

    .line 35
    .line 36
    invoke-static {v0, p1}, Ltech/sud/runtime/component/g/a;->a(Landroid/content/res/AssetManager;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Ltech/sud/runtime/component/g/a;->a:Landroid/content/res/AssetManager;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p0}, Ltech/sud/runtime/component/g/b;->a(Ljava/io/InputStream;)Ltech/sud/runtime/component/g/e;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ltech/sud/runtime/component/g/e;->a()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    return-object p0

    .line 57
    :catch_0
    move-exception p0

    .line 58
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 59
    .line 60
    .line 61
    :cond_1
    const/4 p0, 0x0

    .line 62
    return-object p0
.end method

.method public c()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/g/a;->c:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method
