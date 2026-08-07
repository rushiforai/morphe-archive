.class public Lcom/uuzuche/lib_zxing/ZApplication;
.super Landroid/app/Application;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private a()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    .line 10
    .line 11
    sput v1, Ll/w5e;->c:F

    .line 12
    .line 13
    iget v1, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 14
    .line 15
    sput v1, Ll/w5e;->d:I

    .line 16
    .line 17
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 18
    .line 19
    sput v1, Ll/w5e;->a:I

    .line 20
    .line 21
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 22
    .line 23
    sput v1, Ll/w5e;->b:I

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 30
    .line 31
    int-to-float v2, v2

    .line 32
    invoke-static {v1, v2}, Ll/w5e;->a(Landroid/content/Context;F)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    int-to-float v1, v1

    .line 37
    sput v1, Ll/w5e;->e:F

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 44
    .line 45
    int-to-float v0, v0

    .line 46
    invoke-static {p0, v0}, Ll/w5e;->a(Landroid/content/Context;F)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    int-to-float p0, p0

    .line 51
    sput p0, Ll/w5e;->f:F

    .line 52
    .line 53
    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/uuzuche/lib_zxing/ZApplication;->a()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
