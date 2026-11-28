.class public abstract Lnicoid/network238/kotlin/time/DurationJvmKt;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final durationAssertionsEnabled:Z

.field private static final precisionFormats:[Ljava/lang/ThreadLocal;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 12
    const-class v0, Lnicoid/network238/kotlin/time/Duration;

    const/4 v0, 0x0

    sput-boolean v0, Lnicoid/network238/kotlin/time/DurationJvmKt;->durationAssertionsEnabled:Z

    .line 14
    const/4 v1, 0x4

    new-array v2, v1, [Ljava/lang/ThreadLocal;

    :goto_0
    if-ge v0, v1, :cond_0

    new-instance v3, Ljava/lang/ThreadLocal;

    invoke-direct {v3}, Ljava/lang/ThreadLocal;-><init>()V

    aput-object v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    sput-object v2, Lnicoid/network238/kotlin/time/DurationJvmKt;->precisionFormats:[Ljava/lang/ThreadLocal;

    return-void
.end method

.method public static final getDurationAssertionsEnabled()Z
    .registers 1

    .line 12
    sget-boolean v0, Lnicoid/network238/kotlin/time/DurationJvmKt;->durationAssertionsEnabled:Z

    return v0
.end method
