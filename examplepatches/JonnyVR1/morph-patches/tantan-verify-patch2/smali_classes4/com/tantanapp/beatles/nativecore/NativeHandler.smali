.class public Lcom/tantanapp/beatles/nativecore/NativeHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "StaticFieldLeak"
    }
.end annotation


# static fields
.field private static final sInstance:Lcom/tantanapp/beatles/nativecore/NativeHandler;


# instance fields
.field private mAnrCallback:Ll/zol;

.field private mCommonInited:Z

.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/beatles/nativecore/NativeHandler;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/beatles/nativecore/NativeHandler;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantanapp/beatles/nativecore/NativeHandler;->sInstance:Lcom/tantanapp/beatles/nativecore/NativeHandler;

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

.method public static a()Lcom/tantanapp/beatles/nativecore/NativeHandler;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/beatles/nativecore/NativeHandler;->sInstance:Lcom/tantanapp/beatles/nativecore/NativeHandler;

    .line 2
    .line 3
    return-object v0
.end method

.method private static crashCallback(Ljava/lang/String;Ljava/lang/String;ZZZLjava/lang/String;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/duj0;->d()Ll/duj0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    move-object v1, p0

    .line 6
    move-object v2, p1

    .line 7
    move v3, p2

    .line 8
    move v4, p3

    .line 9
    move v5, p4

    .line 10
    move-object v6, p5

    .line 11
    invoke-virtual/range {v0 .. v6}, Ll/duj0;->f(Ljava/lang/String;Ljava/lang/String;ZZZLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static native initAnr(ZIIIZLjava/lang/String;Z)I
.end method

.method private static native initCommon(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private static native initCrash(ZIIIZZZZZZI[Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private static traceCallback(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tantanapp/beatles/nativecore/NativeHandler;->a()Lcom/tantanapp/beatles/nativecore/NativeHandler;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantanapp/beatles/nativecore/NativeHandler;->mAnrCallback:Ll/zol;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p0, p1}, Ll/zol;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public b(Ll/et0;Ll/zol;Ljava/lang/String;)I
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/beatles/nativecore/NativeHandler;->mCommonInited:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x3

    .line 6
    return p0

    .line 7
    :cond_0
    if-nez p1, :cond_1

    .line 8
    .line 9
    new-instance p1, Ll/et0;

    .line 10
    .line 11
    invoke-direct {p1}, Ll/et0;-><init>()V

    .line 12
    .line 13
    .line 14
    :cond_1
    iput-object p2, p0, Lcom/tantanapp/beatles/nativecore/NativeHandler;->mAnrCallback:Ll/zol;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/et0;->f()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p1}, Ll/et0;->c()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p1}, Ll/et0;->a()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {p1}, Ll/et0;->b()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {p1}, Ll/et0;->d()Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    invoke-virtual {p1}, Ll/et0;->e()Z

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    move-object v5, p3

    .line 41
    invoke-static/range {v0 .. v6}, Lcom/tantanapp/beatles/nativecore/NativeHandler;->initAnr(ZIIIZLjava/lang/String;Z)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0
.end method

.method public c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    .locals 11

    .line 1
    :try_start_0
    const-string v0, "xcrash"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/tantanapp/beatles/nativecore/NativeHandler;->mContext:Landroid/content/Context;

    .line 7
    .line 8
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 9
    .line 10
    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Ll/af20;->a()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    sget-object v4, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 17
    .line 18
    sget-object v5, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 19
    .line 20
    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 21
    .line 22
    sget-object v7, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    .line 23
    .line 24
    iget-object p1, p0, Lcom/tantanapp/beatles/nativecore/NativeHandler;->mContext:Landroid/content/Context;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object v10, p1, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    .line 31
    .line 32
    move-object v8, p2

    .line 33
    move-object v9, p3

    .line 34
    invoke-static/range {v1 .. v10}, Lcom/tantanapp/beatles/nativecore/NativeHandler;->initCommon(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    const/4 p2, 0x1

    .line 41
    iput-boolean p2, p0, Lcom/tantanapp/beatles/nativecore/NativeHandler;->mCommonInited:Z

    .line 42
    .line 43
    :cond_0
    return p1

    .line 44
    :catchall_0
    move-exception v0

    .line 45
    move-object p0, v0

    .line 46
    new-instance p1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string p2, "NativeHandler System.loadLibrary failed -> e = "

    .line 49
    .line 50
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p1, "NativeHandler"

    .line 65
    .line 66
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    const/4 p0, -0x2

    .line 70
    return p0
.end method

.method public d(Ll/ptb;Ll/rrl;Ljava/lang/String;)I
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    iget-boolean v2, v0, Lcom/tantanapp/beatles/nativecore/NativeHandler;->mCommonInited:Z

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    const/4 v0, -0x3

    .line 10
    return v0

    .line 11
    :cond_0
    if-nez p1, :cond_1

    .line 12
    .line 13
    new-instance v2, Ll/ptb;

    .line 14
    .line 15
    invoke-direct {v2}, Ll/ptb;-><init>()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    move-object/from16 v2, p1

    .line 20
    .line 21
    :goto_0
    if-eqz v1, :cond_2

    .line 22
    .line 23
    invoke-static {}, Ll/duj0;->d()Ll/duj0;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    new-instance v4, Lcom/tantanapp/beatles/nativecore/NativeHandler$a;

    .line 28
    .line 29
    invoke-direct {v4, v0, v1}, Lcom/tantanapp/beatles/nativecore/NativeHandler$a;-><init>(Lcom/tantanapp/beatles/nativecore/NativeHandler;Ll/rrl;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3, v4}, Ll/duj0;->j(Ll/u4m;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    invoke-virtual {v2}, Ll/ptb;->l()Z

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    invoke-virtual {v2}, Ll/ptb;->e()I

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    invoke-virtual {v2}, Ll/ptb;->c()I

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    invoke-virtual {v2}, Ll/ptb;->d()I

    .line 48
    .line 49
    .line 50
    move-result v8

    .line 51
    invoke-virtual {v2}, Ll/ptb;->h()Z

    .line 52
    .line 53
    .line 54
    move-result v9

    .line 55
    invoke-virtual {v2}, Ll/ptb;->j()Z

    .line 56
    .line 57
    .line 58
    move-result v10

    .line 59
    invoke-virtual {v2}, Ll/ptb;->i()Z

    .line 60
    .line 61
    .line 62
    move-result v11

    .line 63
    invoke-virtual {v2}, Ll/ptb;->k()Z

    .line 64
    .line 65
    .line 66
    move-result v12

    .line 67
    invoke-virtual {v2}, Ll/ptb;->g()Z

    .line 68
    .line 69
    .line 70
    move-result v13

    .line 71
    invoke-virtual {v2}, Ll/ptb;->f()Z

    .line 72
    .line 73
    .line 74
    move-result v14

    .line 75
    invoke-virtual {v2}, Ll/ptb;->a()I

    .line 76
    .line 77
    .line 78
    move-result v15

    .line 79
    invoke-virtual {v2}, Ll/ptb;->b()[Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v16

    .line 83
    move-object/from16 v17, p3

    .line 84
    .line 85
    invoke-static/range {v5 .. v17}, Lcom/tantanapp/beatles/nativecore/NativeHandler;->initCrash(ZIIIZZZZZZI[Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    return v0
.end method
