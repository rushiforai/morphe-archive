.class public abstract Lnicoid/network238/kotlin/internal/PlatformImplementationsKt;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final IMPLEMENTATIONS:Lnicoid/network238/kotlin/internal/PlatformImplementations;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 58
    new-instance v0, Lnicoid/network238/kotlin/internal/jdk8/JDK8PlatformImplementations;

    invoke-direct {v0}, Lnicoid/network238/kotlin/internal/jdk8/JDK8PlatformImplementations;-><init>()V

    sput-object v0, Lnicoid/network238/kotlin/internal/PlatformImplementationsKt;->IMPLEMENTATIONS:Lnicoid/network238/kotlin/internal/PlatformImplementations;

    return-void
.end method
