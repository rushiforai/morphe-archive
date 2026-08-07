.class public Ll/k0r0;
.super Ljava/lang/Object;


# static fields
.field private static volatile e:Ll/k0r0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field


# instance fields
.field private a:Landroid/content/Context;

.field private b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/apm/lite/CrashType;",
            "Ll/bwq0;",
            ">;"
        }
    .end annotation
.end field

.field private c:Ll/euq0;

.field private d:Ll/byq0;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/k0r0;->b:Ljava/util/Map;

    .line 10
    .line 11
    iput-object p1, p0, Ll/k0r0;->a:Landroid/content/Context;

    .line 12
    .line 13
    :try_start_0
    invoke-static {}, Ll/euq0;->A()Ll/euq0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/k0r0;->c:Ll/euq0;

    .line 18
    .line 19
    new-instance p1, Ll/byq0;

    .line 20
    .line 21
    iget-object v0, p0, Ll/k0r0;->a:Landroid/content/Context;

    .line 22
    .line 23
    invoke-direct {p1, v0}, Ll/byq0;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/k0r0;->d:Ll/byq0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 31
    .line 32
    .line 33
    const-string p1, "NPTH_CATCH"

    .line 34
    .line 35
    invoke-static {p1, p0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private c(Lcom/apm/lite/CrashType;)Ll/bwq0;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/k0r0;->b:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/bwq0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    sget-object v1, Ll/k0r0$a;->a:[I

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    aget v1, v1, v2

    .line 19
    .line 20
    packed-switch v1, :pswitch_data_0

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :pswitch_0
    new-instance v0, Ll/t2r0;

    .line 25
    .line 26
    iget-object v1, p0, Ll/k0r0;->a:Landroid/content/Context;

    .line 27
    .line 28
    iget-object v2, p0, Ll/k0r0;->c:Ll/euq0;

    .line 29
    .line 30
    iget-object v3, p0, Ll/k0r0;->d:Ll/byq0;

    .line 31
    .line 32
    invoke-direct {v0, v1, v2, v3}, Ll/t2r0;-><init>(Landroid/content/Context;Ll/euq0;Ll/byq0;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :pswitch_1
    new-instance v0, Ll/r1r0;

    .line 37
    .line 38
    iget-object v1, p0, Ll/k0r0;->a:Landroid/content/Context;

    .line 39
    .line 40
    iget-object v2, p0, Ll/k0r0;->c:Ll/euq0;

    .line 41
    .line 42
    iget-object v3, p0, Ll/k0r0;->d:Ll/byq0;

    .line 43
    .line 44
    invoke-direct {v0, v1, v2, v3}, Ll/r1r0;-><init>(Landroid/content/Context;Ll/euq0;Ll/byq0;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :pswitch_2
    new-instance v0, Ll/orq0;

    .line 49
    .line 50
    iget-object v1, p0, Ll/k0r0;->a:Landroid/content/Context;

    .line 51
    .line 52
    iget-object v2, p0, Ll/k0r0;->c:Ll/euq0;

    .line 53
    .line 54
    iget-object v3, p0, Ll/k0r0;->d:Ll/byq0;

    .line 55
    .line 56
    invoke-direct {v0, v1, v2, v3}, Ll/orq0;-><init>(Landroid/content/Context;Ll/euq0;Ll/byq0;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :pswitch_3
    new-instance v0, Ll/i4r0;

    .line 61
    .line 62
    iget-object v1, p0, Ll/k0r0;->a:Landroid/content/Context;

    .line 63
    .line 64
    iget-object v2, p0, Ll/k0r0;->c:Ll/euq0;

    .line 65
    .line 66
    iget-object v3, p0, Ll/k0r0;->d:Ll/byq0;

    .line 67
    .line 68
    invoke-direct {v0, v1, v2, v3}, Ll/i4r0;-><init>(Landroid/content/Context;Ll/euq0;Ll/byq0;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :pswitch_4
    new-instance v0, Ll/s3r0;

    .line 73
    .line 74
    iget-object v1, p0, Ll/k0r0;->a:Landroid/content/Context;

    .line 75
    .line 76
    iget-object v2, p0, Ll/k0r0;->c:Ll/euq0;

    .line 77
    .line 78
    iget-object v3, p0, Ll/k0r0;->d:Ll/byq0;

    .line 79
    .line 80
    invoke-direct {v0, v1, v2, v3}, Ll/s3r0;-><init>(Landroid/content/Context;Ll/euq0;Ll/byq0;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :pswitch_5
    new-instance v0, Ll/e3r0;

    .line 85
    .line 86
    iget-object v1, p0, Ll/k0r0;->a:Landroid/content/Context;

    .line 87
    .line 88
    iget-object v2, p0, Ll/k0r0;->c:Ll/euq0;

    .line 89
    .line 90
    iget-object v3, p0, Ll/k0r0;->d:Ll/byq0;

    .line 91
    .line 92
    invoke-direct {v0, v1, v2, v3}, Ll/e3r0;-><init>(Landroid/content/Context;Ll/euq0;Ll/byq0;)V

    .line 93
    .line 94
    .line 95
    :goto_0
    if-eqz v0, :cond_1

    .line 96
    .line 97
    iget-object p0, p0, Ll/k0r0;->b:Ljava/util/Map;

    .line 98
    .line 99
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    :cond_1
    return-object v0

    .line 103
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static d()Ll/k0r0;
    .locals 2

    .line 1
    sget-object v0, Ll/k0r0;->e:Ll/k0r0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v1, Ll/k0r0;

    .line 12
    .line 13
    invoke-direct {v1, v0}, Ll/k0r0;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    sput-object v1, Ll/k0r0;->e:Ll/k0r0;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string v0, "NpthBus not init"

    .line 20
    .line 21
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    return-object v0

    .line 26
    :cond_1
    :goto_0
    sget-object v0, Ll/k0r0;->e:Ll/k0r0;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a(Lcom/apm/lite/CrashType;Ll/gsq0;)Ll/gsq0;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-direct {p0, p1}, Ll/k0r0;->c(Lcom/apm/lite/CrashType;)Ll/bwq0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p2, p1, v0}, Ll/bwq0;->c(Ll/gsq0;Ll/bwq0$a;Z)Ll/gsq0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    return-object p2
.end method

.method public b(Lcom/apm/lite/CrashType;Ll/gsq0;Ll/bwq0$a;Z)Ll/gsq0;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-direct {p0, p1}, Ll/k0r0;->c(Lcom/apm/lite/CrashType;)Ll/bwq0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, p2, p3, p4}, Ll/bwq0;->c(Ll/gsq0;Ll/bwq0$a;Z)Ll/gsq0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_1
    :goto_0
    return-object p2
.end method
