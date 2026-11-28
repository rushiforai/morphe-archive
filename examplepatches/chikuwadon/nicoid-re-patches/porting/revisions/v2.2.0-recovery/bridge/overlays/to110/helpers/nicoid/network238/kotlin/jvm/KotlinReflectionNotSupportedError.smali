.class public Lnicoid/network238/kotlin/jvm/KotlinReflectionNotSupportedError;
.super Ljava/lang/Error;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 11
    const-string v0, "Kotlin reflection implementation is not found at runtime. Make sure you have kotlin-reflect.jar in the classpath"

    invoke-direct {p0, v0}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    return-void
.end method
