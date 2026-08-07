.class public Ll/qre0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qre0$a;
    }
.end annotation


# static fields
.field private static volatile d:Ll/qre0;


# instance fields
.field private final a:Ljava/lang/reflect/Method;

.field private b:Ll/okq0;

.field private c:Ll/pkq0;


# direct methods
.method private constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x19

    .line 5
    .line 6
    :try_start_0
    new-array v0, v0, [B

    .line 7
    .line 8
    fill-array-data v0, :array_0

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/16 v1, 0xa

    .line 20
    .line 21
    new-array v1, v1, [B

    .line 22
    .line 23
    fill-array-data v1, :array_1

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-class v2, Ljava/lang/String;

    .line 31
    .line 32
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Ll/qre0;->a:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    return-void

    .line 43
    :catch_0
    move-exception p0

    .line 44
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    throw p0

    .line 49
    :array_0
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x5et
        0x44t
        0x4ft
        0x35t
        0x55t
        0x14t
        0x47t
        0x5et
        0x2t
        0x3t
        0x7dt
        0x7t
        0x5ft
        0x56t
        0x6t
        0x3t
        0x42t
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
    nop

    .line 67
    :array_1
    .array-data 1
        0x57t
        0x3t
        0x45t
        0x64t
        0x4t
        0x14t
        0x46t
        0xft
        0x52t
        0x52t
    .end array-data
.end method

.method public static a()Ll/qre0;
    .locals 2

    .line 1
    sget-object v0, Ll/qre0;->d:Ll/qre0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/qre0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/qre0;->d:Ll/qre0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/qre0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/qre0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/qre0;->d:Ll/qre0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/qre0;->d:Ll/qre0;

    .line 27
    .line 28
    return-object v0
.end method

.method private b(Ljava/lang/String;Ljava/lang/String;)Ll/qre0$a;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object p0, p0, Ll/qre0;->a:Ljava/lang/reflect/Method;

    .line 3
    .line 4
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, v0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroid/os/IBinder;

    .line 13
    .line 14
    new-instance p1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const/4 p2, 0x5

    .line 23
    new-array p2, p2, [B

    .line 24
    .line 25
    fill-array-data p2, :array_0

    .line 26
    .line 27
    .line 28
    invoke-static {p2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const/16 p2, 0xb

    .line 44
    .line 45
    new-array p2, p2, [B

    .line 46
    .line 47
    fill-array-data p2, :array_1

    .line 48
    .line 49
    .line 50
    invoke-static {p2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    const-class v1, Landroid/os/IBinder;

    .line 55
    .line 56
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {p1, p2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {p1, v0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Landroid/os/IInterface;

    .line 73
    .line 74
    new-instance p2, Ll/qre0$a;

    .line 75
    .line 76
    invoke-direct {p2}, Ll/qre0$a;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object p0, p2, Ll/qre0$a;->b:Landroid/os/IBinder;

    .line 80
    .line 81
    iput-object p1, p2, Ll/qre0$a;->a:Landroid/os/IInterface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .line 83
    return-object p2

    .line 84
    :catch_0
    move-exception p0

    .line 85
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 86
    .line 87
    .line 88
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    return-object v0

    .line 92
    nop

    .line 93
    :array_0
    .array-data 1
        0x14t
        0x35t
        0x45t
        0x42t
        0x3t
    .end array-data

    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    nop

    .line 101
    :array_1
    .array-data 1
        0x51t
        0x15t
        0x78t
        0x59t
        0x15t
        0x3t
        0x42t
        0x0t
        0x50t
        0x54t
        0x4t
    .end array-data
.end method


# virtual methods
.method public c()Ll/okq0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qre0;->b:Ll/okq0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/okq0;

    .line 6
    .line 7
    const/4 v1, 0x5

    .line 8
    new-array v1, v1, [B

    .line 9
    .line 10
    fill-array-data v1, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/16 v2, 0x29

    .line 18
    .line 19
    new-array v2, v2, [B

    .line 20
    .line 21
    fill-array-data v2, :array_1

    .line 22
    .line 23
    .line 24
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-direct {p0, v1, v2}, Ll/qre0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/qre0$a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {v0, v1}, Ll/okq0;-><init>(Ll/qre0$a;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/qre0;->b:Ll/okq0;

    .line 36
    .line 37
    :cond_0
    iget-object p0, p0, Ll/qre0;->b:Ll/okq0;

    .line 38
    .line 39
    return-object p0

    .line 40
    nop

    .line 41
    :array_0
    .array-data 1
        0x40t
        0xet
        0x5et
        0x59t
        0x4t
    .end array-data

    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    nop

    .line 49
    :array_1
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
        0x8t
        0x45t
        0x52t
        0x13t
        0x8t
        0x51t
        0xat
        0x1ft
        0x43t
        0x4t
        0xat
        0x55t
        0x16t
        0x59t
        0x58t
        0xft
        0x1ft
        0x1et
        0x2ft
        0x65t
        0x52t
        0xdt
        0x3t
        0x40t
        0xet
        0x5et
        0x59t
        0x18t
    .end array-data
.end method

.method public d()Ll/pkq0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qre0;->c:Ll/pkq0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/pkq0;

    .line 6
    .line 7
    const/4 v1, 0x6

    .line 8
    new-array v1, v1, [B

    .line 9
    .line 10
    fill-array-data v1, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/16 v2, 0x1b

    .line 18
    .line 19
    new-array v2, v2, [B

    .line 20
    .line 21
    fill-array-data v2, :array_1

    .line 22
    .line 23
    .line 24
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-direct {p0, v1, v2}, Ll/qre0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/qre0$a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {v0, v1}, Ll/pkq0;-><init>(Ll/qre0$a;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/qre0;->c:Ll/pkq0;

    .line 36
    .line 37
    :cond_0
    iget-object p0, p0, Ll/qre0;->c:Ll/pkq0;

    .line 38
    .line 39
    return-object p0

    .line 40
    nop

    .line 41
    :array_0
    .array-data 1
        0x47t
        0xft
        0x5ft
        0x53t
        0xet
        0x11t
    .end array-data

    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    nop

    .line 49
    :array_1
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x47t
        0x5et
        0x4t
        0x11t
        0x1et
        0x2ft
        0x66t
        0x5et
        0xft
        0x2t
        0x5ft
        0x11t
        0x7ct
        0x56t
        0xft
        0x7t
        0x57t
        0x3t
        0x43t
    .end array-data
.end method
