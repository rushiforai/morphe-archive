.class public Ll/nxv;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/nxv$b;
    }
.end annotation


# static fields
.field private static c:Ll/nxv;


# instance fields
.field private a:Ll/nxv$b;

.field private b:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/nxv$b;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/nxv$b;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/nxv;->a:Ll/nxv$b;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/nxv;->b:Landroid/content/Context;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a(Ll/nxv;)Ll/nxv$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxv;->a:Ll/nxv$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public static b(Landroid/content/Context;)Ll/nxv;
    .locals 1

    .line 1
    sget-object v0, Ll/nxv;->c:Ll/nxv;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/nxv;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/nxv;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/nxv;->c:Ll/nxv;

    .line 11
    .line 12
    :cond_0
    sget-object p0, Ll/nxv;->c:Ll/nxv;

    .line 13
    .line 14
    return-object p0
.end method


# virtual methods
.method public c()Ll/nxv$b;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/nxv;->a:Ll/nxv$b;

    .line 2
    .line 3
    iget v1, v0, Ll/nxv$b;->a:F

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    cmpl-float v1, v1, v2

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget v1, v0, Ll/nxv$b;->b:F

    .line 11
    .line 12
    cmpl-float v1, v1, v2

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    iget-object v0, p0, Ll/nxv;->b:Landroid/content/Context;

    .line 18
    .line 19
    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_6

    .line 26
    .line 27
    iget-object v0, p0, Ll/nxv;->b:Landroid/content/Context;

    .line 28
    .line 29
    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_6

    .line 36
    .line 37
    iget-object v0, p0, Ll/nxv;->b:Landroid/content/Context;

    .line 38
    .line 39
    const-string v1, "location"

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Landroid/location/LocationManager;

    .line 46
    .line 47
    const-string v1, "Preview_Location"

    .line 48
    .line 49
    if-eqz v0, :cond_5

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/location/LocationManager;->getAllProviders()Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    if-nez v2, :cond_1

    .line 56
    .line 57
    iget-object p0, p0, Ll/nxv;->a:Ll/nxv$b;

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_1
    const-string v3, "network"

    .line 61
    .line 62
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-eqz v4, :cond_2

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    const-string v3, "gps"

    .line 70
    .line 71
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-eqz v2, :cond_4

    .line 76
    .line 77
    :goto_0
    invoke-virtual {v0, v3}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    if-eqz v1, :cond_3

    .line 82
    .line 83
    iget-object v0, p0, Ll/nxv;->a:Ll/nxv$b;

    .line 84
    .line 85
    invoke-virtual {v1}, Landroid/location/Location;->getLongitude()D

    .line 86
    .line 87
    .line 88
    move-result-wide v2

    .line 89
    double-to-float v2, v2

    .line 90
    iput v2, v0, Ll/nxv$b;->b:F

    .line 91
    .line 92
    iget-object v0, p0, Ll/nxv;->a:Ll/nxv$b;

    .line 93
    .line 94
    invoke-virtual {v1}, Landroid/location/Location;->getLatitude()D

    .line 95
    .line 96
    .line 97
    move-result-wide v1

    .line 98
    double-to-float v1, v1

    .line 99
    iput v1, v0, Ll/nxv$b;->a:F

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_3
    new-instance v1, Landroid/os/Handler;

    .line 103
    .line 104
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 109
    .line 110
    .line 111
    new-instance v2, Ll/nxv$a;

    .line 112
    .line 113
    invoke-direct {v2, p0, v0, v3}, Ll/nxv$a;-><init>(Ll/nxv;Landroid/location/LocationManager;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_4
    const-string v0, "no provide is available"

    .line 121
    .line 122
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Ll/nxv;->a:Ll/nxv$b;

    .line 126
    .line 127
    return-object p0

    .line 128
    :cond_5
    const-string v0, "getLocation: location service is not available"

    .line 129
    .line 130
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    :cond_6
    :goto_1
    iget-object p0, p0, Ll/nxv;->a:Ll/nxv$b;

    .line 134
    .line 135
    return-object p0
.end method
