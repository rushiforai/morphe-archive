.class public Ll/fmq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/d1m;


# instance fields
.field private final a:Landroid/content/Context;

.field private b:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fmq0;->a:Landroid/content/Context;

    .line 5
    .line 6
    const/16 p1, 0x22

    .line 7
    .line 8
    :try_start_0
    new-array p1, p1, [B

    .line 9
    .line 10
    fill-array-data p1, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Ll/fmq0;->b:Ljava/lang/Class;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Ll/fmq0;->c:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    :catch_0
    return-void

    .line 30
    nop

    .line 31
    :array_0
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x0t
        0x8t
        0x54t
        0x14t
        0x5et
        0x5et
        0x5t
        0x48t
        0x59t
        0x2t
        0x1ft
        0x5et
        0xct
        0x16t
        0x5ct
        0x48t
        0x78t
        0x53t
        0x31t
        0x14t
        0x5ft
        0x10t
        0x58t
        0x53t
        0x4t
        0x14t
        0x79t
        0xbt
        0x41t
        0x5bt
    .end array-data
.end method

.method private c()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fmq0;->b:Ljava/lang/Class;

    .line 2
    .line 3
    const/4 v1, 0x7

    .line 4
    new-array v1, v1, [B

    .line 5
    .line 6
    fill-array-data v1, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-class v2, Landroid/content/Context;

    .line 14
    .line 15
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/fmq0;->c:Ljava/lang/Object;

    .line 24
    .line 25
    iget-object p0, p0, Ll/fmq0;->a:Landroid/content/Context;

    .line 26
    .line 27
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Ljava/lang/String;

    .line 36
    .line 37
    return-object p0

    .line 38
    nop

    .line 39
    :array_0
    .array-data 1
        0x57t
        0x3t
        0x45t
        0x78t
        0x20t
        0x2ft
        0x74t
    .end array-data
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fmq0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public b(Ll/pul;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fmq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    if-eqz p1, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Ll/fmq0;->b:Ljava/lang/Class;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Ll/fmq0;->c:Ljava/lang/Object;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :try_start_0
    invoke-direct {p0}, Ll/fmq0;->c()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const/16 v1, 0x14

    .line 34
    .line 35
    new-array v1, v1, [B

    .line 36
    .line 37
    fill-array-data v1, :array_0

    .line 38
    .line 39
    .line 40
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v0}, Ll/jmw;->a(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-interface {p1, p0}, Ll/pul;->a(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :catch_0
    move-exception p0

    .line 62
    goto :goto_0

    .line 63
    :cond_1
    new-instance p0, Lcom/immomo/momosec/device/oaid/OAIDException;

    .line 64
    .line 65
    const/16 v0, 0x11

    .line 66
    .line 67
    new-array v0, v0, [B

    .line 68
    .line 69
    fill-array-data v0, :array_1

    .line 70
    .line 71
    .line 72
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-direct {p0, v0}, Lcom/immomo/momosec/device/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    throw p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    :goto_0
    invoke-interface {p1, p0}, Ll/pul;->b(Ljava/lang/Exception;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    :goto_1
    new-instance p0, Lcom/immomo/momosec/device/oaid/OAIDException;

    .line 85
    .line 86
    const/16 v0, 0x1c

    .line 87
    .line 88
    new-array v0, v0, [B

    .line 89
    .line 90
    fill-array-data v0, :array_2

    .line 91
    .line 92
    .line 93
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-direct {p0, v0}, Lcom/immomo/momosec/device/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-interface {p1, p0}, Ll/pul;->b(Ljava/lang/Exception;)V

    .line 101
    .line 102
    .line 103
    :cond_3
    return-void

    .line 104
    nop

    .line 105
    :array_0
    .array-data 1
        0x7ft
        0x27t
        0x78t
        0x73t
        0x41t
        0x17t
        0x45t
        0x3t
        0x43t
        0x4et
        0x41t
        0x15t
        0x45t
        0x5t
        0x52t
        0x52t
        0x12t
        0x15t
        0xat
        0x46t
    .end array-data

    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    :array_1
    .array-data 1
        0x7ft
        0x27t
        0x78t
        0x73t
        0x41t
        0x17t
        0x45t
        0x3t
        0x43t
        0x4et
        0x41t
        0x0t
        0x51t
        0xft
        0x5dt
        0x52t
        0x5t
    .end array-data

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    nop

    .line 133
    :array_2
    .array-data 1
        0x68t
        0xft
        0x50t
        0x58t
        0xct
        0xft
        0x10t
        0x2ft
        0x55t
        0x67t
        0x13t
        0x9t
        0x46t
        0xft
        0x55t
        0x52t
        0x13t
        0x46t
        0x5et
        0x9t
        0x45t
        0x17t
        0x4t
        0x1et
        0x59t
        0x15t
        0x45t
        0x44t
    .end array-data
.end method
