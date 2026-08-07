.class public final Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0002\u0008\u0007\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J+\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0006\u0010\t\u001a\u00020\u0008H\u0007\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ#\u0010\r\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0007\u00a2\u0006\u0004\u0008\r\u0010\u000eR\u0014\u0010\u0010\u001a\u00020\u000f8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u0011R\u0014\u0010\u0012\u001a\u00020\u000f8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010\u0011R\u0014\u0010\u0013\u001a\u00020\u000f8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u0011R\u0018\u0010\u0014\u001a\u0004\u0018\u00010\n8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider$a;",
        "",
        "<init>",
        "()V",
        "Landroid/content/Context;",
        "context",
        "Ll/axl;",
        "logger",
        "Lcom/clevertap/android/sdk/network/NetworkMonitor;",
        "networkMonitor",
        "Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;",
        "b",
        "(Landroid/content/Context;Ll/axl;Lcom/clevertap/android/sdk/network/NetworkMonitor;)Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;",
        "a",
        "(Landroid/content/Context;Ll/axl;)Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;",
        "",
        "IMAGE_DIRECTORY_NAME",
        "Ljava/lang/String;",
        "GIF_DIRECTORY_NAME",
        "ALL_FILE_TYPES_DIRECTORY_NAME",
        "instance",
        "Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Ll/axl;)Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;->c()Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    monitor-enter p0

    .line 11
    :try_start_0
    invoke-static {}, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;->c()Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;

    .line 18
    .line 19
    invoke-direct {v0, p1, p2}, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;-><init>(Landroid/content/Context;Ll/axl;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;->d(Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit p0

    .line 29
    return-object v0

    .line 30
    :goto_1
    monitor-exit p0

    .line 31
    throw p1

    .line 32
    :cond_1
    return-object v0
.end method

.method public final b(Landroid/content/Context;Ll/axl;Lcom/clevertap/android/sdk/network/NetworkMonitor;)Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;
    .locals 15
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/clevertap/android/sdk/network/NetworkMonitor;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;->c()Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    monitor-enter p0

    .line 16
    :try_start_0
    invoke-static {}, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;->c()Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    new-instance v2, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;

    .line 23
    .line 24
    const-string v1, "CleverTap.Images."

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-virtual {v0, v1, v3}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    const-string v4, "CleverTap.Gif."

    .line 35
    .line 36
    invoke-virtual {v0, v4, v3}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    const-string v5, "CleverTap.Files."

    .line 44
    .line 45
    invoke-virtual {v0, v5, v3}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    new-instance v7, Ll/tii;

    .line 53
    .line 54
    move-object/from16 v0, p3

    .line 55
    .line 56
    invoke-direct {v7, v0}, Ll/tii;-><init>(Lcom/clevertap/android/sdk/network/NetworkMonitor;)V

    .line 57
    .line 58
    .line 59
    const/16 v13, 0x3e0

    .line 60
    .line 61
    const/4 v14, 0x0

    .line 62
    const/4 v8, 0x0

    .line 63
    const/4 v9, 0x0

    .line 64
    const/4 v10, 0x0

    .line 65
    const/4 v11, 0x0

    .line 66
    const/4 v12, 0x0

    .line 67
    move-object/from16 v6, p2

    .line 68
    .line 69
    move-object v3, v1

    .line 70
    invoke-direct/range {v2 .. v14}, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;-><init>(Ljava/io/File;Ljava/io/File;Ljava/io/File;Ll/axl;Ll/uii;Ll/mu3;Ll/yqm;Ll/wqm;Ll/aji;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v2}, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;->d(Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    .line 75
    .line 76
    move-object v1, v2

    .line 77
    goto :goto_0

    .line 78
    :catchall_0
    move-exception v0

    .line 79
    goto :goto_1

    .line 80
    :cond_0
    :goto_0
    monitor-exit p0

    .line 81
    return-object v1

    .line 82
    :goto_1
    monitor-exit p0

    .line 83
    throw v0

    .line 84
    :cond_1
    return-object v1
.end method
