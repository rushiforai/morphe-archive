.class public abstract Lnicoid/network238/kotlin/internal/jdk7/JDK7PlatformImplementations;
.super Lnicoid/network238/kotlin/internal/PlatformImplementations;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/internal/jdk7/JDK7PlatformImplementations$ReflectSdkVersion;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Lnicoid/network238/kotlin/internal/PlatformImplementations;-><init>()V

    return-void
.end method

.method private final sdkIsNullOrAtLeast(I)Z
    .registers 3

    .line 22
    sget-object v0, Lnicoid/network238/kotlin/internal/jdk7/JDK7PlatformImplementations$ReflectSdkVersion;->sdkVersion:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method


# virtual methods
.method public addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    const/16 v0, 0x13

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/internal/jdk7/JDK7PlatformImplementations;->sdkIsNullOrAtLeast(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 28
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    return-void

    .line 30
    :cond_0
    invoke-super {p0, p1, p2}, Lnicoid/network238/kotlin/internal/PlatformImplementations;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    return-void
.end method
