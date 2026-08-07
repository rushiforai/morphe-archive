.class public Ll/bxd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/d1m;


# instance fields
.field private final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bxd0;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/bxd0;->a:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 v1, 0x23

    .line 12
    .line 13
    new-array v1, v1, [B

    .line 14
    .line 15
    fill-array-data v1, :array_0

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p0, v1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 23
    .line 24
    .line 25
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :catch_0
    :cond_1
    return v0

    .line 31
    :array_0
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x12t
        0x7t
        0x5dt
        0x15t
        0x44t
        0x59t
        0x6t
        0x48t
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x55t
        0x52t
        0x17t
        0xft
        0x53t
        0x3t
        0x58t
        0x53t
        0x12t
        0x3t
        0x42t
        0x10t
        0x58t
        0x54t
        0x4t
    .end array-data
.end method

.method public b(Ll/pul;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bxd0;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/content/Intent;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 10
    .line 11
    .line 12
    const/16 v1, 0x23

    .line 13
    .line 14
    new-array v1, v1, [B

    .line 15
    .line 16
    fill-array-data v1, :array_0

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/16 v2, 0x33

    .line 24
    .line 25
    new-array v2, v2, [B

    .line 26
    .line 27
    fill-array-data v2, :array_1

    .line 28
    .line 29
    .line 30
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/bxd0;->a:Landroid/content/Context;

    .line 38
    .line 39
    new-instance v2, Ll/bxd0$a;

    .line 40
    .line 41
    invoke-direct {v2, p0}, Ll/bxd0$a;-><init>(Ll/bxd0;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, v0, p1, v2}, Ll/w350;->a(Landroid/content/Context;Landroid/content/Intent;Ll/pul;Ll/w350$a;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void

    .line 48
    nop

    .line 49
    :array_0
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x12t
        0x7t
        0x5dt
        0x15t
        0x44t
        0x59t
        0x6t
        0x48t
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x55t
        0x52t
        0x17t
        0xft
        0x53t
        0x3t
        0x58t
        0x53t
        0x12t
        0x3t
        0x42t
        0x10t
        0x58t
        0x54t
        0x4t
    .end array-data

    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    :array_1
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x12t
        0x7t
        0x5dt
        0x15t
        0x44t
        0x59t
        0x6t
        0x48t
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x55t
        0x52t
        0x17t
        0xft
        0x53t
        0x3t
        0x58t
        0x53t
        0x12t
        0x3t
        0x42t
        0x10t
        0x58t
        0x54t
        0x4t
        0x48t
        0x74t
        0x3t
        0x47t
        0x5et
        0x2t
        0x3t
        0x79t
        0x2t
        0x62t
        0x52t
        0x13t
        0x10t
        0x59t
        0x5t
        0x54t
    .end array-data
.end method
