.class public Ll/m21;
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
    iput-object p1, p0, Ll/m21;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/m21;->a:Landroid/content/Context;

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
    const/16 v1, 0x1d

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
        0x0t
        0x15t
        0x45t
        0x15t
        0x1ft
        0x5at
        0x12t
        0x7t
        0x1et
        0x35t
        0x44t
        0x47t
        0x11t
        0xat
        0x55t
        0xbt
        0x54t
        0x59t
        0x15t
        0x7t
        0x42t
        0x1ft
        0x75t
        0x7et
        0x25t
    .end array-data
.end method

.method public b(Ll/pul;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/m21;->a:Landroid/content/Context;

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
    const/16 v1, 0x1e

    .line 10
    .line 11
    new-array v1, v1, [B

    .line 12
    .line 13
    fill-array-data v1, :array_0

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Landroid/content/ComponentName;

    .line 24
    .line 25
    const/16 v2, 0x1d

    .line 26
    .line 27
    new-array v2, v2, [B

    .line 28
    .line 29
    fill-array-data v2, :array_1

    .line 30
    .line 31
    .line 32
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const/16 v3, 0x35

    .line 37
    .line 38
    new-array v3, v3, [B

    .line 39
    .line 40
    fill-array-data v3, :array_2

    .line 41
    .line 42
    .line 43
    invoke-static {v3}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Ll/m21;->a:Landroid/content/Context;

    .line 54
    .line 55
    new-instance v2, Ll/m21$a;

    .line 56
    .line 57
    invoke-direct {v2, p0}, Ll/m21$a;-><init>(Ll/m21;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v1, v0, p1, v2}, Ll/w350;->a(Landroid/content/Context;Landroid/content/Intent;Ll/pul;Ll/w350$a;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void

    .line 64
    nop

    .line 65
    :array_0
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x0t
        0x15t
        0x45t
        0x15t
        0x1ft
        0x5at
        0x12t
        0x7t
        0x1et
        0x7t
        0x52t
        0x43t
        0x8t
        0x9t
        0x5et
        0x48t
        0x70t
        0x74t
        0x22t
        0x23t
        0x63t
        0x35t
        0x6et
        0x73t
        0x28t
        0x22t
    .end array-data

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    nop

    .line 85
    :array_1
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x0t
        0x15t
        0x45t
        0x15t
        0x1ft
        0x5at
        0x12t
        0x7t
        0x1et
        0x35t
        0x44t
        0x47t
        0x11t
        0xat
        0x55t
        0xbt
        0x54t
        0x59t
        0x15t
        0x7t
        0x42t
        0x1ft
        0x75t
        0x7et
        0x25t
    .end array-data

    .line 86
    .line 87
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
    .line 102
    .line 103
    .line 104
    nop

    .line 105
    :array_2
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x0t
        0x15t
        0x45t
        0x15t
        0x1ft
        0x5at
        0x12t
        0x7t
        0x1et
        0x35t
        0x44t
        0x47t
        0x11t
        0xat
        0x55t
        0xbt
        0x54t
        0x59t
        0x15t
        0x7t
        0x42t
        0x1ft
        0x75t
        0x7et
        0x25t
        0x48t
        0x63t
        0x13t
        0x41t
        0x47t
        0xdt
        0x3t
        0x5dt
        0x3t
        0x5ft
        0x43t
        0x0t
        0x14t
        0x49t
        0x22t
        0x78t
        0x73t
        0x32t
        0x3t
        0x42t
        0x10t
        0x58t
        0x54t
        0x4t
    .end array-data
.end method
