.class public Ll/sxq0;
.super Ljava/lang/Object;

# interfaces
.implements Ll/iwq0;


# instance fields
.field private a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sxq0;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static b()I
    .locals 1

    .line 1
    const/4 v0, 0x6

    .line 2
    return v0
.end method

.method public static synthetic c(Ll/sxq0;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sxq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a(JLjava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Z)V
    .locals 14

    .line 1
    const-string v0, "crash_cost"

    .line 2
    .line 3
    new-instance v11, Ljava/io/File;

    .line 4
    .line 5
    iget-object v1, p0, Ll/sxq0;->a:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v1}, Ll/j5r0;->b(Landroid/content/Context;)Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    move-object/from16 v10, p5

    .line 12
    .line 13
    invoke-direct {v11, v1, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/frq0;->e()Ll/frq0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v11}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Ll/frq0;->g(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v11}, Ljava/io/File;->mkdirs()Z

    .line 28
    .line 29
    .line 30
    invoke-static {v11}, Ll/r3r0;->F(Ljava/io/File;)V

    .line 31
    .line 32
    .line 33
    invoke-static/range {p4 .. p4}, Ll/d6r0;->w(Ljava/lang/Throwable;)Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    invoke-static {}, Ll/k0r0;->d()Ll/k0r0;

    .line 38
    .line 39
    .line 40
    move-result-object v12

    .line 41
    sget-object v13, Lcom/apm/lite/CrashType;->JAVA:Lcom/apm/lite/CrashType;

    .line 42
    .line 43
    new-instance v1, Ll/sxq0$a;

    .line 44
    .line 45
    move-object v2, p0

    .line 46
    move-wide v5, p1

    .line 47
    move-object/from16 v9, p3

    .line 48
    .line 49
    move-object/from16 v3, p4

    .line 50
    .line 51
    move-object/from16 v7, p7

    .line 52
    .line 53
    move/from16 v8, p8

    .line 54
    .line 55
    invoke-direct/range {v1 .. v11}, Ll/sxq0$a;-><init>(Ll/sxq0;Ljava/lang/Throwable;ZJLjava/lang/String;ZLjava/lang/Thread;Ljava/lang/String;Ljava/io/File;)V

    .line 56
    .line 57
    .line 58
    const/4 p0, 0x1

    .line 59
    const/4 v2, 0x0

    .line 60
    invoke-virtual {v12, v13, v2, v1, p0}, Ll/k0r0;->b(Lcom/apm/lite/CrashType;Ll/gsq0;Ll/bwq0$a;Z)Ll/gsq0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 65
    .line 66
    .line 67
    move-result-wide v1

    .line 68
    sub-long/2addr v1, p1

    .line 69
    :try_start_0
    const-string v3, "crash_type"

    .line 70
    .line 71
    const-string v4, "normal"

    .line 72
    .line 73
    invoke-virtual {p0, v3, v4}, Ll/gsq0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/gsq0;

    .line 74
    .line 75
    .line 76
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {p0, v0, v3}, Ll/gsq0;->q(Ljava/lang/String;Ljava/lang/String;)Ll/gsq0;

    .line 81
    .line 82
    .line 83
    const-wide/16 v3, 0x3e8

    .line 84
    .line 85
    div-long/2addr v1, v3

    .line 86
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {p0, v0, v1}, Ll/gsq0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/gsq0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :catchall_0
    move-exception v0

    .line 95
    move-object p0, v0

    .line 96
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 97
    .line 98
    .line 99
    const-string v0, "NPTH_CATCH"

    .line 100
    .line 101
    invoke-static {v0, p0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 102
    .line 103
    .line 104
    :goto_0
    const/4 p0, 0x4

    .line 105
    invoke-static {p0}, Ll/u5r0;->c(I)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-eqz p0, :cond_0

    .line 110
    .line 111
    return-void

    .line 112
    :cond_0
    const/16 p0, 0x800

    .line 113
    .line 114
    invoke-static {p0}, Ll/u5r0;->c(I)Z

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public a(Ljava/lang/Throwable;)Z
    .locals 0

    .line 118
    const/4 p0, 0x1

    return p0
.end method
