.class public abstract Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadataKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method private static final checkDebugMetadataVersion(II)V
    .registers 5

    if-gt p1, p0, :cond_0

    return-void

    .line 102
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 103
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Debug metadata version mismatch. Expected: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, ", got "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ". Please update the Kotlin standard library."

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static final getDebugMetadataAnnotation(Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;)Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadata;
    .registers 2

    .line 90
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-class v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadata;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p0

    check-cast p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadata;

    return-object p0
.end method

.method private static final getLabel(Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;)I
    .registers 3

    .line 94
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "label"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 95
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 96
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    check-cast p0, Ljava/lang/Integer;

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :cond_1
    const/4 p0, 0x0

    :goto_1
    sub-int/2addr p0, v1

    return p0

    :catch_0
    move-exception p0

    const/4 p0, -0x1

    return p0
.end method

.method public static final getStackTraceElement(Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;)Ljava/lang/StackTraceElement;
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    invoke-static {p0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadataKt;->getDebugMetadataAnnotation(Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;)Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadata;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 43
    :cond_0
    invoke-interface {v0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadata;->v()I

    move-result v1

    const/4 v2, 0x1

    invoke-static {v2, v1}, Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadataKt;->checkDebugMetadataVersion(II)V

    .line 44
    invoke-static {p0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadataKt;->getLabel(Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;)I

    move-result v1

    if-gez v1, :cond_1

    const/4 v1, -0x1

    goto :goto_0

    .line 45
    :cond_1
    invoke-interface {v0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadata;->l()[I

    move-result-object v2

    aget v1, v2, v1

    .line 46
    :goto_0
    sget-object v2, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;->INSTANCE:Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;

    invoke-virtual {v2, p0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/ModuleNameRetriever;->getModuleName(Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_2

    .line 47
    invoke-interface {v0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadata;->c()Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 p0, 0x2f

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-interface {v0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadata;->c()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 48
    :goto_1
    new-instance v2, Ljava/lang/StackTraceElement;

    invoke-interface {v0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadata;->m()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadata;->f()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, p0, v3, v0, v1}, Ljava/lang/StackTraceElement;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v2
.end method
