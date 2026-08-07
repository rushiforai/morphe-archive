.class public Ll/fu6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/d1m;


# instance fields
.field private final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Landroid/app/Application;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iput-object p1, p0, Ll/fu6;->a:Landroid/content/Context;

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/fu6;->a:Landroid/content/Context;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic c(Ll/fu6;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fu6;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a()Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/fu6;->a:Landroid/content/Context;

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
    const/16 v1, 0x1b

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
        0x2t
        0x9t
        0x5ft
        0xat
        0x41t
        0x56t
        0x5t
        0x48t
        0x54t
        0x3t
        0x47t
        0x5et
        0x2t
        0x3t
        0x59t
        0x2t
        0x42t
        0x42t
        0x11t
        0x16t
        0x5ft
        0x14t
        0x45t
    .end array-data
.end method

.method public b(Ll/pul;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fu6;->a:Landroid/content/Context;

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
    new-instance v1, Landroid/content/ComponentName;

    .line 13
    .line 14
    const/16 v2, 0x1b

    .line 15
    .line 16
    new-array v2, v2, [B

    .line 17
    .line 18
    fill-array-data v2, :array_0

    .line 19
    .line 20
    .line 21
    invoke-static {v2}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const/16 v3, 0x2b

    .line 26
    .line 27
    new-array v3, v3, [B

    .line 28
    .line 29
    fill-array-data v3, :array_1

    .line 30
    .line 31
    .line 32
    invoke-static {v3}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Ll/fu6;->a:Landroid/content/Context;

    .line 43
    .line 44
    new-instance v2, Ll/fu6$a;

    .line 45
    .line 46
    invoke-direct {v2, p0}, Ll/fu6$a;-><init>(Ll/fu6;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, v0, p1, v2}, Ll/w350;->a(Landroid/content/Context;Landroid/content/Intent;Ll/pul;Ll/w350$a;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void

    .line 53
    :array_0
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x2t
        0x9t
        0x5ft
        0xat
        0x41t
        0x56t
        0x5t
        0x48t
        0x54t
        0x3t
        0x47t
        0x5et
        0x2t
        0x3t
        0x59t
        0x2t
        0x42t
        0x42t
        0x11t
        0x16t
        0x5ft
        0x14t
        0x45t
    .end array-data

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
        0x2t
        0x9t
        0x5ft
        0xat
        0x41t
        0x56t
        0x5t
        0x48t
        0x54t
        0x3t
        0x47t
        0x5et
        0x2t
        0x3t
        0x59t
        0x2t
        0x42t
        0x42t
        0x11t
        0x16t
        0x5ft
        0x14t
        0x45t
        0x19t
        0x25t
        0x3t
        0x46t
        0xft
        0x52t
        0x52t
        0x28t
        0x2t
        0x63t
        0x3t
        0x43t
        0x41t
        0x8t
        0x5t
        0x55t
    .end array-data
.end method
