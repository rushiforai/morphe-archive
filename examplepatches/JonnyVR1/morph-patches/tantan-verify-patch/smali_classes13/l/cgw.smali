.class public Ll/cgw;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/Boolean;

.field public static b:Ll/q3d0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(I)Ll/npy;
    .locals 6

    .line 1
    new-instance v0, Ll/npy;

    .line 2
    .line 3
    div-int/lit8 v3, p0, 0x2

    .line 4
    .line 5
    const/16 v4, 0x40

    .line 6
    .line 7
    const v5, 0x7fffffff

    .line 8
    .line 9
    .line 10
    const/16 v2, 0x80

    .line 11
    .line 12
    move v1, p0

    .line 13
    invoke-direct/range {v0 .. v5}, Ll/npy;-><init>(IIIII)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static synthetic b(II)Ll/npy;
    .locals 6

    .line 1
    new-instance v0, Ll/npy;

    .line 2
    .line 3
    div-int/lit8 v3, p0, 0x2

    .line 4
    .line 5
    div-int/lit8 v4, p1, 0x2

    .line 6
    .line 7
    const v5, 0x7fffffff

    .line 8
    .line 9
    .line 10
    move v1, p0

    .line 11
    move v2, p1

    .line 12
    invoke-direct/range {v0 .. v5}, Ll/npy;-><init>(IIIII)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public static c(Landroid/app/ActivityManager;)Ll/a7h0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/ActivityManager;",
            ")",
            "Ll/a7h0<",
            "Ll/npy;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/cgw;->e(Landroid/app/ActivityManager;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    new-instance v0, Ll/bgw;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/bgw;-><init>(I)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static d(Landroid/app/ActivityManager;)Ll/a7h0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/ActivityManager;",
            ")",
            "Ll/a7h0<",
            "Ll/npy;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/cgw;->e(Landroid/app/ActivityManager;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    div-int/lit8 p0, p0, 0x2

    .line 6
    .line 7
    new-instance v0, Ll/agw;

    .line 8
    .line 9
    const/16 v1, 0x40

    .line 10
    .line 11
    invoke-direct {v0, p0, v1}, Ll/agw;-><init>(II)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static e(Landroid/app/ActivityManager;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getMemoryClass()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x100000

    .line 6
    .line 7
    mul-int/2addr p0, v0

    .line 8
    const v0, 0x7fffffff

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/high16 v0, 0x2000000

    .line 16
    .line 17
    if-gt p0, v0, :cond_0

    .line 18
    .line 19
    const/high16 p0, 0x400000

    .line 20
    .line 21
    return p0

    .line 22
    :cond_0
    const/high16 v0, 0x4000000

    .line 23
    .line 24
    if-gt p0, v0, :cond_1

    .line 25
    .line 26
    const/high16 p0, 0x800000

    .line 27
    .line 28
    return p0

    .line 29
    :cond_1
    div-int/lit8 p0, p0, 0x4

    .line 30
    .line 31
    return p0
.end method

.method public static f(Landroid/content/Context;)Ll/q3d0;
    .locals 2

    .line 1
    sget-object v0, Ll/cgw;->b:Ll/q3d0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ll/q3d0;

    .line 14
    .line 15
    iget v1, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 16
    .line 17
    div-int/lit8 v1, v1, 0x2

    .line 18
    .line 19
    iget p0, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 20
    .line 21
    div-int/lit8 p0, p0, 0x2

    .line 22
    .line 23
    invoke-direct {v0, v1, p0}, Ll/q3d0;-><init>(II)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Ll/cgw;->b:Ll/q3d0;

    .line 27
    .line 28
    :cond_0
    sget-object p0, Ll/cgw;->b:Ll/q3d0;

    .line 29
    .line 30
    return-object p0
.end method

.method public static g(Landroid/content/Context;)J
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 1
    new-instance v0, Landroid/app/ActivityManager$MemoryInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "activity"

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroid/app/ActivityManager;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 15
    .line 16
    .line 17
    iget-wide v0, v0, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    .line 18
    .line 19
    return-wide v0
.end method

.method public static h(Landroid/content/Context;)Z
    .locals 9
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 1
    sget-object v0, Ll/cgw;->a:Ljava/lang/Boolean;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    invoke-static {p0}, Ll/cgw;->g(Landroid/content/Context;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v3

    .line 11
    const-wide/32 v5, 0x100000

    .line 12
    .line 13
    .line 14
    div-long/2addr v3, v5

    .line 15
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Runtime;->maxMemory()J

    .line 20
    .line 21
    .line 22
    move-result-wide v7

    .line 23
    div-long/2addr v7, v5

    .line 24
    const-wide/16 v5, 0x800

    .line 25
    .line 26
    cmp-long p0, v3, v5

    .line 27
    .line 28
    if-lez p0, :cond_1

    .line 29
    .line 30
    const-wide/16 v3, 0x80

    .line 31
    .line 32
    cmp-long p0, v7, v3

    .line 33
    .line 34
    if-gtz p0, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move p0, v2

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    :goto_0
    move p0, v1

    .line 40
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sput-object p0, Ll/cgw;->a:Ljava/lang/Boolean;

    .line 45
    .line 46
    :cond_2
    sget-object p0, Ll/cgw;->a:Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 55
    .line 56
    const/16 v0, 0x1a

    .line 57
    .line 58
    if-gt p0, v0, :cond_3

    .line 59
    .line 60
    return v1

    .line 61
    :cond_3
    return v2
.end method
