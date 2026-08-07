.class public final Lcom/hellogroup/fep/feppkg/core/FepPackageManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000v\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0010\t\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0010$\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 E2\u00020\u0001:\u0001BB\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ!\u0010\r\u001a\u0004\u0018\u00010\u000c2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u0010\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u0003J%\u0010\u0017\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u0015\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J!\u0010\u001b\u001a\u0004\u0018\u00010\u00082\u0006\u0010\u001a\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ9\u0010\u001f\u001a\u0004\u0018\u00010\u00082\u0006\u0010\u001d\u001a\u00020\u00192\n\u0008\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u00192\n\u0008\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u00192\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u001f\u0010 J!\u0010\"\u001a\u00020!2\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u00192\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u0019\u00a2\u0006\u0004\u0008\"\u0010#J/\u0010%\u001a\u0004\u0018\u00010\u00082\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u00192\u0008\u0010$\u001a\u0004\u0018\u00010\u00192\n\u0008\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u0019\u00a2\u0006\u0004\u0008%\u0010&J7\u0010)\u001a\u0004\u0018\u00010(2\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u00192\u0008\u0010$\u001a\u0004\u0018\u00010\u00192\n\u0008\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u00192\u0006\u0010\'\u001a\u00020!\u00a2\u0006\u0004\u0008)\u0010*J)\u0010.\u001a\u00020\u000f2\u001a\u0010-\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0019\u0012\u0006\u0012\u0004\u0018\u00010\u00010,0+\u00a2\u0006\u0004\u0008.\u0010/J\u0017\u00101\u001a\u00020\u00112\u0008\u00100\u001a\u0004\u0018\u00010\u0008\u00a2\u0006\u0004\u00081\u00102J\u0017\u00104\u001a\u00020\u000f2\u0008\u00103\u001a\u0004\u0018\u00010\u0008\u00a2\u0006\u0004\u00084\u00105J#\u00106\u001a\u0004\u0018\u00010(2\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u00192\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u0019\u00a2\u0006\u0004\u00086\u00107J\r\u00108\u001a\u00020\u000f\u00a2\u0006\u0004\u00088\u0010\u0003J\u001f\u00109\u001a\u00020\u000f2\u0006\u0010\u001d\u001a\u00020\u00192\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u0019\u00a2\u0006\u0004\u00089\u0010:J\u0015\u0010=\u001a\u00020\u000f2\u0006\u0010<\u001a\u00020;\u00a2\u0006\u0004\u0008=\u0010>J\u0015\u0010?\u001a\u00020\u000f2\u0006\u0010<\u001a\u00020;\u00a2\u0006\u0004\u0008?\u0010>J#\u0010@\u001a\u0004\u0018\u00010(2\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u00192\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u0019\u00a2\u0006\u0004\u0008@\u00107R\u0014\u0010D\u001a\u00020A8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008B\u0010C\u00a8\u0006F"
    }
    d2 = {
        "Lcom/hellogroup/fep/feppkg/core/FepPackageManager;",
        "",
        "<init>",
        "()V",
        "Ll/fhi$a;",
        "parseResult",
        "Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;",
        "checkPolicy",
        "Ll/zgi;",
        "g",
        "(Ll/fhi$a;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;",
        "info",
        "Ll/ngi;",
        "f",
        "(Ll/fhi$a;Ll/zgi;)Ll/ngi;",
        "",
        "e",
        "",
        "debugMode",
        "Lcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;",
        "configuration",
        "Ll/tc60;",
        "provider",
        "u",
        "(ZLcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;Ll/tc60;)V",
        "",
        "url",
        "m",
        "(Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;",
        "bid",
        "baseVersion",
        "n",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;",
        "",
        "l",
        "(Ljava/lang/String;Ljava/lang/String;)J",
        "baseVer",
        "h",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/zgi;",
        "version",
        "Ljava/io/File;",
        "i",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Ljava/io/File;",
        "",
        "",
        "packageConfs",
        "p",
        "(Ljava/util/List;)V",
        "fepPackageInfo",
        "c",
        "(Ll/zgi;)Z",
        "packageInfo",
        "q",
        "(Ll/zgi;)V",
        "j",
        "(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;",
        "d",
        "s",
        "(Ljava/lang/String;Ljava/lang/String;)V",
        "Ll/ehi;",
        "observer",
        "r",
        "(Ll/ehi;)V",
        "t",
        "k",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "a",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "isSetup",
        "Companion",
        "FEP_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

.field private static volatile b:Lcom/hellogroup/fep/feppkg/core/FepPackageManager;


# instance fields
.field private final a:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;-><init>()V

    return-void
.end method

.method public static final synthetic a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->b:Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic b(Lcom/hellogroup/fep/feppkg/core/FepPackageManager;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->b:Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 2
    .line 3
    return-void
.end method

.method private final e()V
    .locals 7

    .line 1
    iget-object p0, p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    sget-object p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/16 v5, 0xc

    .line 16
    .line 17
    const/4 v6, 0x0

    .line 18
    const/16 v1, -0xbba

    .line 19
    .line 20
    const-string v2, "PackageManager not setup, call setup() first"

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    const/4 v4, 0x0

    .line 24
    invoke-static/range {v0 .. v6}, Ll/pgi;->d(Ll/pgi;ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;ILjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->e()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const-string p0, "PackageManager not setup, call setup() first"

    .line 35
    .line 36
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method

.method private final f(Ll/fhi$a;Ll/zgi;)Ll/ngi;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/fhi$a;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p1, Ll/hgi;->Companion:Ll/hgi$a;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/hgi$a;->a()Ll/hgi;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p2}, Ll/zgi;->g()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p1, p0, p2}, Ll/hgi;->d(Ljava/lang/String;Ljava/lang/Long;)Ll/ngi;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method private final g(Ll/fhi$a;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    sget-object v2, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->i()Ll/ahi;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {v3, v1}, Ll/ahi;->f(Ll/fhi$a;)Ll/zgi;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    new-instance v3, Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 16
    .line 17
    invoke-direct {v3}, Lkotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 18
    .line 19
    .line 20
    const/4 v5, 0x0

    .line 21
    iput-object v5, v3, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 22
    .line 23
    sget-object v6, Ll/dhi;->a:[I

    .line 24
    .line 25
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Enum;->ordinal()I

    .line 26
    .line 27
    .line 28
    move-result v7

    .line 29
    aget v6, v6, v7

    .line 30
    .line 31
    const/4 v7, 0x2

    .line 32
    if-eq v6, v7, :cond_4

    .line 33
    .line 34
    const/4 v7, 0x3

    .line 35
    if-eq v6, v7, :cond_1

    .line 36
    .line 37
    const/4 v7, 0x4

    .line 38
    if-eq v6, v7, :cond_0

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    invoke-direct {v0, v1, v4}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->f(Ll/fhi$a;Ll/zgi;)Ll/ngi;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, v3, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 46
    .line 47
    sget-object v0, Lcom/hellogroup/fep/base/FepContext;->INSTANCE:Lcom/hellogroup/fep/base/FepContext;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/hellogroup/fep/base/FepContext;->a()Ll/drb;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    new-instance v9, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$fepPackageInfo$2;

    .line 54
    .line 55
    invoke-direct {v9, v4, v3, v5}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$fepPackageInfo$2;-><init>(Ll/zgi;Lkotlin/jvm/internal/Ref$ObjectRef;Lkotlin/coroutines/Continuation;)V

    .line 56
    .line 57
    .line 58
    const/4 v10, 0x3

    .line 59
    const/4 v11, 0x0

    .line 60
    const/4 v7, 0x0

    .line 61
    const/4 v8, 0x0

    .line 62
    invoke-static/range {v6 .. v11}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    invoke-virtual {v2}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->r()Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    invoke-virtual {v4}, Ll/zgi;->e()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v7

    .line 74
    invoke-virtual {v4}, Ll/zgi;->d()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v8

    .line 78
    invoke-virtual {v6, v7, v8}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->t(Ljava/lang/String;Ljava/lang/String;)J

    .line 79
    .line 80
    .line 81
    move-result-wide v6

    .line 82
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 83
    .line 84
    .line 85
    move-result-wide v8

    .line 86
    invoke-virtual {v4}, Ll/zgi;->f()Lcom/hellogroup/fep/feppkg/model/FepPackageConfig;

    .line 87
    .line 88
    .line 89
    move-result-object v10

    .line 90
    const/4 v11, 0x1

    .line 91
    if-eqz v10, :cond_3

    .line 92
    .line 93
    sub-long/2addr v8, v6

    .line 94
    long-to-double v6, v8

    .line 95
    invoke-virtual {v10}, Lcom/hellogroup/fep/feppkg/model/FepPackageConfig;->getFrequency()D

    .line 96
    .line 97
    .line 98
    move-result-wide v8

    .line 99
    const-wide v12, 0x40ed4c0000000000L    # 60000.0

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    mul-double/2addr v8, v12

    .line 105
    cmpl-double v6, v6, v8

    .line 106
    .line 107
    if-lez v6, :cond_2

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    const/4 v11, 0x0

    .line 111
    :cond_3
    :goto_0
    invoke-direct {v0, v1, v4}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->f(Ll/fhi$a;Ll/zgi;)Ll/ngi;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iput-object v0, v3, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 116
    .line 117
    if-eqz v11, :cond_5

    .line 118
    .line 119
    sget-object v0, Lcom/hellogroup/fep/base/FepContext;->INSTANCE:Lcom/hellogroup/fep/base/FepContext;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/hellogroup/fep/base/FepContext;->a()Ll/drb;

    .line 122
    .line 123
    .line 124
    move-result-object v6

    .line 125
    new-instance v9, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$fepPackageInfo$1;

    .line 126
    .line 127
    invoke-direct {v9, v4, v3, v5}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$fepPackageInfo$1;-><init>(Ll/zgi;Lkotlin/jvm/internal/Ref$ObjectRef;Lkotlin/coroutines/Continuation;)V

    .line 128
    .line 129
    .line 130
    const/4 v10, 0x3

    .line 131
    const/4 v11, 0x0

    .line 132
    const/4 v7, 0x0

    .line 133
    const/4 v8, 0x0

    .line 134
    invoke-static/range {v6 .. v11}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_4
    invoke-direct {v0, v1, v4}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->f(Ll/fhi$a;Ll/zgi;)Ll/ngi;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iput-object v0, v3, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 143
    .line 144
    :cond_5
    :goto_1
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->LOCAL_NO_VISITOR:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 145
    .line 146
    move-object/from16 v1, p2

    .line 147
    .line 148
    if-eq v1, v0, :cond_6

    .line 149
    .line 150
    invoke-virtual {v2}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->r()Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {v0, v4}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->A(Ll/zgi;)V

    .line 155
    .line 156
    .line 157
    :cond_6
    const/16 v15, 0x1ff

    .line 158
    .line 159
    const/16 v16, 0x0

    .line 160
    .line 161
    const/4 v5, 0x0

    .line 162
    const/4 v6, 0x0

    .line 163
    const/4 v7, 0x0

    .line 164
    const-wide/16 v8, 0x0

    .line 165
    .line 166
    const/4 v10, 0x0

    .line 167
    const/4 v11, 0x0

    .line 168
    const/4 v12, 0x0

    .line 169
    const/4 v13, 0x0

    .line 170
    const/4 v14, 0x0

    .line 171
    invoke-static/range {v4 .. v16}, Ll/zgi;->c(Ll/zgi;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/hellogroup/fep/feppkg/model/FepPackageConfig;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;Lorg/json/JSONObject;Ll/ngi;ILjava/lang/Object;)Ll/zgi;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    iget-object v1, v3, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 176
    .line 177
    check-cast v1, Ll/ngi;

    .line 178
    .line 179
    if-eqz v1, :cond_7

    .line 180
    .line 181
    invoke-virtual {v0, v1}, Ll/zgi;->r(Ll/ngi;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v1}, Ll/ngi;->g()Z

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    if-eqz v1, :cond_7

    .line 189
    .line 190
    invoke-virtual {v0}, Ll/zgi;->a()V

    .line 191
    .line 192
    .line 193
    :cond_7
    invoke-virtual {v2}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->e()Z

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    if-eqz v1, :cond_8

    .line 198
    .line 199
    sget-object v1, Lcom/hellogroup/fep/base/FepLogModuleType;->offlinepkg:Lcom/hellogroup/fep/base/FepLogModuleType;

    .line 200
    .line 201
    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    new-instance v2, Ljava/lang/StringBuilder;

    .line 206
    .line 207
    const-string v3, "fepPackageInfo get ready\uff0coriginData="

    .line 208
    .line 209
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v4}, Ll/zgi;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v3

    .line 216
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    const-string v3, "\npackageInfoSnapchat="

    .line 220
    .line 221
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v0}, Ll/zgi;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    const-string v3, "\n"

    .line 232
    .line 233
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    new-instance v3, Ljava/lang/RuntimeException;

    .line 237
    .line 238
    invoke-direct {v3}, Ljava/lang/RuntimeException;-><init>()V

    .line 239
    .line 240
    .line 241
    invoke-static {v3}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v3

    .line 245
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    invoke-static {v1, v2}, Ll/jzv;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    :cond_8
    return-object v0
.end method

.method public static synthetic o(Lcom/hellogroup/fep/feppkg/core/FepPackageManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;ILjava/lang/Object;)Ll/zgi;
    .locals 1

    .line 1
    and-int/lit8 p6, p5, 0x2

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p6, :cond_0

    .line 5
    .line 6
    move-object p2, v0

    .line 7
    :cond_0
    and-int/lit8 p6, p5, 0x4

    .line 8
    .line 9
    if-eqz p6, :cond_1

    .line 10
    .line 11
    move-object p3, v0

    .line 12
    :cond_1
    and-int/lit8 p5, p5, 0x8

    .line 13
    .line 14
    if-eqz p5, :cond_2

    .line 15
    .line 16
    sget-object p4, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->NORMAL:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 17
    .line 18
    :cond_2
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method


# virtual methods
.method public final c(Ll/zgi;)Z
    .locals 12
    .param p1    # Ll/zgi;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->e()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->r()Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p1}, Ll/zgi;->e()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->u(Ljava/lang/String;)Ll/lhi;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/lhi;->a()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x1

    .line 28
    if-ne v1, v2, :cond_0

    .line 29
    .line 30
    move v7, v2

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v7, p0

    .line 33
    :goto_0
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->u()Ll/nhi;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {p1}, Ll/zgi;->e()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {p1}, Ll/zgi;->d()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-virtual {p1}, Ll/zgi;->i()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Ll/d8g0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    const/16 v10, 0x30

    .line 54
    .line 55
    const/4 v11, 0x0

    .line 56
    const/4 v8, 0x0

    .line 57
    const/4 v9, 0x0

    .line 58
    invoke-static/range {v3 .. v11}, Ll/nhi;->m(Ll/nhi;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/util/Map;ILjava/lang/Object;)Lkotlin/Pair;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    check-cast p0, Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    :cond_1
    return p0
.end method

.method public final d()V
    .locals 6

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->e()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/hellogroup/fep/base/FepContext;->INSTANCE:Lcom/hellogroup/fep/base/FepContext;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/fep/base/FepContext;->a()Ll/drb;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v3, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$clearAllPackages$1;

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    invoke-direct {v3, p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$clearAllPackages$1;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 14
    .line 15
    .line 16
    const/4 v4, 0x3

    .line 17
    const/4 v5, 0x0

    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static/range {v0 .. v5}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/zgi;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Ll/fhi;->INSTANCE:Ll/fhi;

    .line 2
    .line 3
    invoke-virtual {p0, p3, p1, p2}, Ll/fhi;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/fhi$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-virtual {p0, p1}, Ll/fhi$a;->d(Z)V

    .line 11
    .line 12
    .line 13
    sget-object p1, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->i()Ll/ahi;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2, p0}, Ll/ahi;->e(Ll/fhi$a;)Ll/zgi;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->r()Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1, p0}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->A(Ll/zgi;)V

    .line 28
    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public final i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Ljava/io/File;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Ll/fhi;->INSTANCE:Ll/fhi;

    .line 2
    .line 3
    invoke-virtual {p0, p3, p1, p2}, Ll/fhi;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/fhi$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p1, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->k()Ll/chi;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0}, Ll/fhi$a;->b()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p0}, Ll/fhi$a;->a()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p2, p0, p4, p5}, Ll/chi;->u(Ljava/lang/String;Ljava/lang/String;J)Ljava/io/File;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public final j(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    invoke-static {p1}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-eqz p2, :cond_1

    .line 11
    .line 12
    invoke-static {p2}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_2

    .line 17
    .line 18
    :cond_1
    const-string p2, "default"

    .line 19
    .line 20
    :cond_2
    sget-object p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->k()Ll/chi;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p2}, Ll/d8g0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p0, p1, p2}, Ll/chi;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_3
    :goto_0
    const/4 p0, 0x0

    .line 36
    return-object p0
.end method

.method public final k(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->k()Ll/chi;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p2}, Ll/d8g0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p0, p1, p2}, Ll/chi;->w(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public final l(Ljava/lang/String;Ljava/lang/String;)J
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->e()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-static {p1}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string p0, "0"

    .line 16
    .line 17
    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    sget-object p0, Ll/fhi;->INSTANCE:Ll/fhi;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {p0, p2, p1, v2}, Ll/fhi;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/fhi$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    sget-object p1, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->i()Ll/ahi;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1, p0}, Ll/ahi;->f(Ll/fhi$a;)Ll/zgi;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ll/zgi;->g()J

    .line 44
    .line 45
    .line 46
    move-result-wide p0

    .line 47
    return-wide p0

    .line 48
    :cond_2
    :goto_0
    return-wide v0
.end method

.method public final m(Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->e()V

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/fhi;->INSTANCE:Ll/fhi;

    .line 11
    .line 12
    const/4 v4, 0x6

    .line 13
    const/4 v5, 0x0

    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x0

    .line 16
    move-object v1, p1

    .line 17
    invoke-static/range {v0 .. v5}, Ll/fhi;->b(Ll/fhi;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ll/fhi$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->g(Ll/fhi$a;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public final n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->e()V

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/fhi;->INSTANCE:Ll/fhi;

    .line 11
    .line 12
    invoke-virtual {v0, p3, p1, p2}, Ll/fhi;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/fhi$a;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-direct {p0, p1, p4}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->g(Ll/fhi$a;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public final p(Ljava/util/List;)V
    .locals 6
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->e()V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lcom/hellogroup/fep/base/FepContext;->INSTANCE:Lcom/hellogroup/fep/base/FepContext;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/hellogroup/fep/base/FepContext;->a()Ll/drb;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v3, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$preload$1;

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    invoke-direct {v3, p1, p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$preload$1;-><init>(Ljava/util/List;Lkotlin/coroutines/Continuation;)V

    .line 17
    .line 18
    .line 19
    const/4 v4, 0x3

    .line 20
    const/4 v5, 0x0

    .line 21
    const/4 v1, 0x0

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-static/range {v0 .. v5}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final q(Ll/zgi;)V
    .locals 4
    .param p1    # Ll/zgi;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->r()Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1}, Ll/zgi;->e()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1}, Ll/zgi;->d()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p1}, Ll/zgi;->g()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->B(Ljava/lang/String;Ljava/lang/String;J)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final r(Ll/ehi;)V
    .locals 0
    .param p1    # Ll/ehi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->m()Ll/tl5;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Ll/tl5;->a(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final s(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/hellogroup/fep/base/FepContext;->INSTANCE:Lcom/hellogroup/fep/base/FepContext;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/fep/base/FepContext;->a()Ll/drb;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v3, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$removeBasePackage$1;

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    invoke-direct {v3, p1, p2, p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$removeBasePackage$1;-><init>(Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    .line 14
    .line 15
    .line 16
    const/4 v4, 0x3

    .line 17
    const/4 v5, 0x0

    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static/range {v0 .. v5}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final t(Ll/ehi;)V
    .locals 0
    .param p1    # Ll/ehi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->m()Ll/tl5;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Ll/tl5;->c(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final u(ZLcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;Ll/tc60;)V
    .locals 8
    .param p2    # Lcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/tc60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/16 v5, 0xe

    .line 22
    .line 23
    const/4 v6, 0x0

    .line 24
    const-string v1, "Already setup, will ignore repeat setup"

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    const/4 v3, 0x0

    .line 28
    const/4 v4, 0x0

    .line 29
    invoke-static/range {v0 .. v6}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->x(Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Lcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;->e()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const/16 v6, 0xc

    .line 49
    .line 50
    const/4 v7, 0x0

    .line 51
    const/16 v2, -0xbb9

    .line 52
    .line 53
    const-string v3, "Configuration Invalid"

    .line 54
    .line 55
    const/4 v4, 0x0

    .line 56
    const/4 v5, 0x0

    .line 57
    invoke-static/range {v1 .. v7}, Ll/pgi;->d(Ll/pgi;ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;ILjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->e()Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-nez p1, :cond_1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    const-string p0, "Configuration is invalid"

    .line 68
    .line 69
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    :goto_0
    sget-object p1, Lcom/hellogroup/fep/config/core/FepConfigManager;->Companion:Lcom/hellogroup/fep/config/core/FepConfigManager$a;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/hellogroup/fep/config/core/FepConfigManager$a;->a()Lcom/hellogroup/fep/config/core/FepConfigManager;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    new-instance v1, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$b;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$b;-><init>(Lcom/hellogroup/fep/feppkg/core/FepPackageManager;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, v1}, Lcom/hellogroup/fep/config/core/FepConfigManager;->o(Ll/bgi;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, p2}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->w(Lcom/hellogroup/fep/feppkg/core/FepPackageConfiguration;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, p3}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->y(Ll/tc60;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->r()Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->w()V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 101
    .line 102
    const/4 p1, 0x1

    .line 103
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    const/4 v5, 0x6

    .line 111
    const/4 v6, 0x0

    .line 112
    const-string v2, "PackageManager setup completed"

    .line 113
    .line 114
    const/4 v3, 0x0

    .line 115
    const/4 v4, 0x0

    .line 116
    invoke-static/range {v1 .. v6}, Ll/pgi;->f(Ll/pgi;Ljava/lang/String;Ljava/util/Map;IILjava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method
