.class public Ll/vpy;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:[Landroid/os/Debug$MemoryInfo;

.field public static b:Ll/eqy;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/eqy;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/eqy;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/vpy;->b:Ll/eqy;

    .line 7
    .line 8
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

.method public static a(Landroid/content/Context;)Ll/eqy;
    .locals 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-le v0, v1, :cond_0

    .line 7
    .line 8
    sget-object p0, Ll/vpy;->b:Ll/eqy;

    .line 9
    .line 10
    invoke-static {}, Landroid/os/Debug;->getPss()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    long-to-int v0, v0

    .line 15
    iput v0, p0, Ll/eqy;->c:I

    .line 16
    .line 17
    sget-object p0, Ll/vpy;->b:Ll/eqy;

    .line 18
    .line 19
    iput v2, p0, Ll/eqy;->d:I

    .line 20
    .line 21
    iput v2, p0, Ll/eqy;->a:I

    .line 22
    .line 23
    iput v2, p0, Ll/eqy;->b:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string v0, "activity"

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Landroid/app/ActivityManager;

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    :try_start_0
    new-array v0, v0, [I

    .line 36
    .line 37
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    aput v1, v0, v2

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/app/ActivityManager;->getProcessMemoryInfo([I)[Landroid/os/Debug$MemoryInfo;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    sput-object p0, Ll/vpy;->a:[Landroid/os/Debug$MemoryInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    if-eqz p0, :cond_1

    .line 50
    .line 51
    array-length v0, p0

    .line 52
    if-lez v0, :cond_1

    .line 53
    .line 54
    sget-object v0, Ll/vpy;->b:Ll/eqy;

    .line 55
    .line 56
    aget-object p0, p0, v2

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/os/Debug$MemoryInfo;->getTotalPss()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    iput p0, v0, Ll/eqy;->c:I

    .line 63
    .line 64
    sget-object p0, Ll/vpy;->b:Ll/eqy;

    .line 65
    .line 66
    sget-object v0, Ll/vpy;->a:[Landroid/os/Debug$MemoryInfo;

    .line 67
    .line 68
    aget-object v0, v0, v2

    .line 69
    .line 70
    iget v1, v0, Landroid/os/Debug$MemoryInfo;->otherPss:I

    .line 71
    .line 72
    iput v1, p0, Ll/eqy;->d:I

    .line 73
    .line 74
    iget v1, v0, Landroid/os/Debug$MemoryInfo;->nativePss:I

    .line 75
    .line 76
    iput v1, p0, Ll/eqy;->a:I

    .line 77
    .line 78
    iget v0, v0, Landroid/os/Debug$MemoryInfo;->dalvikPss:I

    .line 79
    .line 80
    iput v0, p0, Ll/eqy;->b:I

    .line 81
    .line 82
    :cond_1
    :goto_0
    sget-object p0, Ll/vpy;->b:Ll/eqy;

    .line 83
    .line 84
    return-object p0

    .line 85
    :catchall_0
    sget-object p0, Ll/vpy;->b:Ll/eqy;

    .line 86
    .line 87
    return-object p0
.end method
