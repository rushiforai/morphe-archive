.class public Ll/wo2;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wo2$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010$\n\u0002\u0008\t\u0008\u0016\u0018\u00002\u00020\u0001:\u0001\u0007B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0017\u0010\u000b\u001a\u00020\u00062\u0008\u0010\n\u001a\u0004\u0018\u00010\t\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0087\u0001\u0010\u001a\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u00112\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u00112\u0016\u0008\u0002\u0010\u0015\u001a\u0010\u0012\u0004\u0012\u00020\u0011\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00142\n\u0008\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00112\n\u0008\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00112\u0016\u0008\u0002\u0010\u0018\u001a\u0010\u0012\u0004\u0012\u00020\u0011\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00142\n\u0008\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u0011H\u0007\u00a2\u0006\u0004\u0008\u001a\u0010\u001bR\u0018\u0010\n\u001a\u0004\u0018\u00010\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0007\u0010\u001c\u00a8\u0006\u001d"
    }
    d2 = {
        "Ll/wo2;",
        "",
        "<init>",
        "()V",
        "Ll/wo2$a;",
        "args",
        "",
        "a",
        "(Ll/wo2$a;)V",
        "Lcom/hellogroup/mk/core/log/core/MKLogReporter;",
        "reporter",
        "d",
        "(Lcom/hellogroup/mk/core/log/core/MKLogReporter;)V",
        "Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;",
        "type",
        "Lcom/hellogroup/mk/core/log/core/MKLogSource;",
        "source",
        "",
        "bid",
        "url",
        "",
        "infoData",
        "secondBiz",
        "thirdBiz",
        "extraPutData",
        "module",
        "b",
        "(Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V",
        "Lcom/hellogroup/mk/core/log/core/MKLogReporter;",
        "MKCore_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field private volatile a:Lcom/hellogroup/mk/core/log/core/MKLogReporter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final a(Ll/wo2$a;)V
    .locals 17

    .line 1
    invoke-virtual/range {p1 .. p1}, Ll/wo2$a;->c()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    move-object/from16 v1, p1

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ll/wo2$a;->k(Ljava/util/Map;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move-object/from16 v1, p1

    .line 19
    .line 20
    :goto_0
    invoke-virtual {v1}, Ll/wo2$a;->c()Ljava/util/Map;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const-string v2, "mkModule"

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/wo2$a;->e()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    :cond_1
    move-object/from16 v0, p0

    .line 36
    .line 37
    iget-object v0, v0, Ll/wo2;->a:Lcom/hellogroup/mk/core/log/core/MKLogReporter;

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    new-instance v1, Ll/kkw;

    .line 42
    .line 43
    sget-object v2, Lcom/hellogroup/mk/core/log/core/MKLogLevel;->ERROR:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 44
    .line 45
    invoke-virtual/range {p1 .. p1}, Ll/wo2$a;->b()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual/range {p1 .. p1}, Ll/wo2$a;->h()Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual/range {p1 .. p1}, Ll/wo2$a;->e()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-virtual/range {p1 .. p1}, Ll/wo2$a;->a()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    invoke-virtual/range {p1 .. p1}, Ll/wo2$a;->j()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v7

    .line 65
    invoke-virtual/range {p1 .. p1}, Ll/wo2$a;->g()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v8

    .line 69
    invoke-virtual/range {p1 .. p1}, Ll/wo2$a;->i()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v9

    .line 73
    invoke-virtual/range {p1 .. p1}, Ll/wo2$a;->d()Ljava/util/Map;

    .line 74
    .line 75
    .line 76
    move-result-object v10

    .line 77
    invoke-virtual/range {p1 .. p1}, Ll/wo2$a;->c()Ljava/util/Map;

    .line 78
    .line 79
    .line 80
    move-result-object v11

    .line 81
    invoke-virtual/range {p1 .. p1}, Ll/wo2$a;->f()Z

    .line 82
    .line 83
    .line 84
    move-result v12

    .line 85
    const/16 v15, 0x800

    .line 86
    .line 87
    const/16 v16, 0x0

    .line 88
    .line 89
    const-wide/16 v13, 0x0

    .line 90
    .line 91
    invoke-direct/range {v1 .. v16}, Ll/kkw;-><init>(Lcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;ZJILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->e(Ll/kkw;)V

    .line 95
    .line 96
    .line 97
    :cond_2
    return-void
.end method

.method public static synthetic c(Ll/wo2;Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;ILjava/lang/Object;)V
    .locals 12

    .line 1
    move/from16 v0, p10

    .line 2
    .line 3
    if-nez p11, :cond_5

    .line 4
    .line 5
    and-int/lit8 v1, v0, 0x10

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    move-object v7, v1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object/from16 v7, p5

    .line 16
    .line 17
    :goto_0
    and-int/lit8 v1, v0, 0x20

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    move-object v8, v2

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    move-object/from16 v8, p6

    .line 25
    .line 26
    :goto_1
    and-int/lit8 v1, v0, 0x40

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    move-object v9, v2

    .line 31
    goto :goto_2

    .line 32
    :cond_2
    move-object/from16 v9, p7

    .line 33
    .line 34
    :goto_2
    and-int/lit16 v1, v0, 0x80

    .line 35
    .line 36
    if-eqz v1, :cond_3

    .line 37
    .line 38
    invoke-static {}, Lkotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    move-object v10, v1

    .line 43
    goto :goto_3

    .line 44
    :cond_3
    move-object/from16 v10, p8

    .line 45
    .line 46
    :goto_3
    and-int/lit16 v0, v0, 0x100

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    move-object v11, v2

    .line 51
    move-object v3, p1

    .line 52
    move-object v4, p2

    .line 53
    move-object v5, p3

    .line 54
    move-object/from16 v6, p4

    .line 55
    .line 56
    move-object v2, p0

    .line 57
    goto :goto_4

    .line 58
    :cond_4
    move-object/from16 v11, p9

    .line 59
    .line 60
    move-object v2, p0

    .line 61
    move-object v3, p1

    .line 62
    move-object v4, p2

    .line 63
    move-object v5, p3

    .line 64
    move-object/from16 v6, p4

    .line 65
    .line 66
    :goto_4
    invoke-virtual/range {v2 .. v11}, Ll/wo2;->b(Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_5
    const-string p0, "Super calls with default arguments not supported in this target, function: reportError"

    .line 71
    .line 72
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method


# virtual methods
.method public final b(Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V
    .locals 11
    .param p1    # Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/hellogroup/mk/core/log/core/MKLogSource;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p8    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p9    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;",
            "Lcom/hellogroup/mk/core/log/core/MKLogSource;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
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
    invoke-virtual/range {p5 .. p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual/range {p8 .. p8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/wo2$a;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;->getBizThird()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eqz p6, :cond_0

    .line 20
    .line 21
    move-object/from16 v5, p6

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move-object v5, p3

    .line 25
    :goto_0
    if-eqz p7, :cond_1

    .line 26
    .line 27
    move-object/from16 v6, p7

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;->getBizThird()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    move-object v6, v2

    .line 35
    :goto_1
    invoke-static/range {p8 .. p8}, Lkotlin/collections/MapsKt;->toMutableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 36
    .line 37
    .line 38
    move-result-object v8

    .line 39
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;->getOffline()Z

    .line 40
    .line 41
    .line 42
    move-result v9

    .line 43
    move-object v2, p2

    .line 44
    move-object v3, p3

    .line 45
    move-object v4, p4

    .line 46
    move-object/from16 v7, p5

    .line 47
    .line 48
    move-object/from16 v10, p9

    .line 49
    .line 50
    invoke-direct/range {v0 .. v10}, Ll/wo2$a;-><init>(Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;ZLjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-direct {p0, v0}, Ll/wo2;->a(Ll/wo2$a;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final d(Lcom/hellogroup/mk/core/log/core/MKLogReporter;)V
    .locals 0
    .param p1    # Lcom/hellogroup/mk/core/log/core/MKLogReporter;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/wo2;->a:Lcom/hellogroup/mk/core/log/core/MKLogReporter;

    .line 2
    .line 3
    return-void
.end method
