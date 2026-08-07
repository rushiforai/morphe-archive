.class public final Ll/pji$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/pji;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\'\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008H\u0007\u00a2\u0006\u0004\u0008\u000b\u0010\u000cR\u0014\u0010\u000e\u001a\u00020\r8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0010"
    }
    d2 = {
        "Ll/pji$a;",
        "",
        "<init>",
        "()V",
        "Landroid/content/Context;",
        "context",
        "Lcom/clevertap/android/sdk/Logger;",
        "logger",
        "Ll/h6g0;",
        "storeRegistry",
        "Ll/vji;",
        "b",
        "(Landroid/content/Context;Lcom/clevertap/android/sdk/Logger;Ll/h6g0;)Ll/vji;",
        "",
        "USE_COROUTINES",
        "Z",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pji$a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/clevertap/android/sdk/Logger;)Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;->Companion:Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider$a;

    .line 8
    .line 9
    invoke-virtual {v0, p0, p1}, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider$a;->a(Landroid/content/Context;Ll/axl;)Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public final b(Landroid/content/Context;Lcom/clevertap/android/sdk/Logger;Ll/h6g0;)Ll/vji;
    .locals 16
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/clevertap/android/sdk/Logger;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/h6g0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual/range {p3 .. p3}, Ll/h6g0;->c()Ll/cqm;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual/range {p3 .. p3}, Ll/h6g0;->a()Ll/aki;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    invoke-virtual/range {p3 .. p3}, Ll/h6g0;->e()Ll/ncr;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    new-instance v7, Ll/oji;

    .line 23
    .line 24
    move-object/from16 v0, p1

    .line 25
    .line 26
    move-object/from16 v8, p2

    .line 27
    .line 28
    invoke-direct {v7, v0, v8}, Ll/oji;-><init>(Landroid/content/Context;Lcom/clevertap/android/sdk/Logger;)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Lcom/clevertap/android/sdk/inapp/images/cleanup/FileCleanupStrategyCoroutine;

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    const/4 v2, 0x2

    .line 35
    invoke-direct {v1, v7, v0, v2, v0}, Lcom/clevertap/android/sdk/inapp/images/cleanup/FileCleanupStrategyCoroutine;-><init>(Lkotlin/jvm/functions/Function0;Ll/q5e;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 36
    .line 37
    .line 38
    new-instance v2, Lcom/clevertap/android/sdk/inapp/images/preload/FilePreloaderCoroutine;

    .line 39
    .line 40
    const/16 v14, 0x3c

    .line 41
    .line 42
    const/4 v15, 0x0

    .line 43
    const/4 v9, 0x0

    .line 44
    const/4 v10, 0x0

    .line 45
    const-wide/16 v11, 0x0

    .line 46
    .line 47
    const/4 v13, 0x0

    .line 48
    move-object v6, v2

    .line 49
    invoke-direct/range {v6 .. v15}, Lcom/clevertap/android/sdk/inapp/images/preload/FilePreloaderCoroutine;-><init>(Lkotlin/jvm/functions/Function0;Ll/axl;Ll/q5e;Lcom/clevertap/android/sdk/inapp/images/preload/a;JZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 50
    .line 51
    .line 52
    new-instance v0, Ll/vji;

    .line 53
    .line 54
    invoke-direct/range {v0 .. v5}, Ll/vji;-><init>(Ll/mii;Ll/fji;Ll/cqm;Ll/aki;Ll/ncr;)V

    .line 55
    .line 56
    .line 57
    return-object v0
.end method
