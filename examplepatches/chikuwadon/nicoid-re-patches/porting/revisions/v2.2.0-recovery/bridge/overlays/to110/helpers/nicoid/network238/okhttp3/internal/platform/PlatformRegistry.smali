.class public final Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0006\u0010\u0004\u001a\u00020\u0005R\u0011\u0010\u0006\u001a\u00020\u00078F\u00a2\u0006\u0006\u001a\u0004\u0008\u0006\u0010\u0008R(\u0010\u000b\u001a\u0004\u0018\u00010\n2\u0008\u0010\t\u001a\u0004\u0018\u00010\n8F@FX\u0086\u000e\u00a2\u0006\u000c\u001a\u0004\u0008\u000c\u0010\r\"\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0010"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;",
        "",
        "<init>",
        "()V",
        "findPlatform",
        "Lnicoid/network238/okhttp3/internal/platform/Platform;",
        "isAndroid",
        "",
        "()Z",
        "value",
        "Landroid/content/Context;",
        "applicationContext",
        "getApplicationContext",
        "()Landroid/content/Context;",
        "setApplicationContext",
        "(Landroid/content/Context;)V",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;->INSTANCE:Lnicoid/network238/okhttp3/internal/platform/PlatformRegistry;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final findPlatform()Lnicoid/network238/okhttp3/internal/platform/Platform;
    .registers 5

    .line 25
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;->INSTANCE:Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidLog;->enable()V

    .line 28
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/Android10Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Android10Platform$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Android10Platform$Companion;->buildIfSupported()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v0

    if-nez v0, :cond_0

    .line 29
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->Companion:Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$Companion;->buildIfSupported()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    .line 34
    return-object v0

    .line 33
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 38
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Expected Android API level 21+ but was "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final getApplicationContext()Landroid/content/Context;
    .registers 4

    .line 45
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v0

    instance-of v1, v0, Lnicoid/network238/okhttp3/internal/platform/ContextAwarePlatform;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    check-cast v0, Lnicoid/network238/okhttp3/internal/platform/ContextAwarePlatform;

    goto :goto_0

    :cond_0
    move-object v0, v2

    :goto_0
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/platform/ContextAwarePlatform;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    return-object v0

    :cond_1
    return-object v2
.end method

.method public final isAndroid()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public final setApplicationContext(Landroid/content/Context;)V
    .registers 4

    .line 47
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v0

    instance-of v1, v0, Lnicoid/network238/okhttp3/internal/platform/ContextAwarePlatform;

    if-eqz v1, :cond_0

    check-cast v0, Lnicoid/network238/okhttp3/internal/platform/ContextAwarePlatform;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-interface {v0, p1}, Lnicoid/network238/okhttp3/internal/platform/ContextAwarePlatform;->setApplicationContext(Landroid/content/Context;)V

    :cond_1
    return-void
.end method
