.class public abstract Lnicoid/network238/kotlin/jvm/internal/TypeIntrinsics;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static asMutableList(Ljava/lang/Object;)Ljava/util/List;
    .registers 2

    .line 151
    instance-of v0, p0, Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;

    if-eqz v0, :cond_0

    instance-of v0, p0, Lnicoid/network238/kotlin/jvm/internal/markers/KMutableList;

    if-nez v0, :cond_0

    .line 152
    const-string v0, "nicoid.network238.kotlin.collections.MutableList"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/TypeIntrinsics;->throwCce(Ljava/lang/Object;Ljava/lang/String;)V

    .line 154
    :cond_0
    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeIntrinsics;->castToList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static beforeCheckcastToFunctionOfArity(Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 4

    if-eqz p0, :cond_0

    .line 341
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/jvm/internal/TypeIntrinsics;->isFunctionOfArity(Ljava/lang/Object;I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 342
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "nicoid.network238.kotlin.jvm.functions.Function"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/jvm/internal/TypeIntrinsics;->throwCce(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_0
    return-object p0
.end method

.method public static castToList(Ljava/lang/Object;)Ljava/util/List;
    .registers 1

    .line 166
    :try_start_0
    check-cast p0, Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 169
    :catch_0
    move-exception p0

    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeIntrinsics;->throwCce(Ljava/lang/ClassCastException;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0
.end method

.method public static getFunctionArity(Ljava/lang/Object;)I
    .registers 2

    .line 258
    instance-of v0, p0, Lnicoid/network238/kotlin/jvm/internal/FunctionBase;

    if-eqz v0, :cond_0

    .line 259
    check-cast p0, Lnicoid/network238/kotlin/jvm/internal/FunctionBase;

    invoke-interface {p0}, Lnicoid/network238/kotlin/jvm/internal/FunctionBase;->getArity()I

    move-result p0

    return p0

    .line 261
    :cond_0
    instance-of v0, p0, Lnicoid/network238/kotlin/jvm/functions/Function0;

    if-eqz v0, :cond_1

    const/4 p0, 0x0

    return p0

    .line 264
    :cond_1
    instance-of v0, p0, Lnicoid/network238/kotlin/jvm/functions/Function1;

    if-eqz v0, :cond_2

    const/4 p0, 0x1

    return p0

    .line 267
    :cond_2
    instance-of p0, p0, Lnicoid/network238/kotlin/jvm/functions/Function2;

    if-eqz p0, :cond_3

    const/4 p0, 0x2

    return p0

    :cond_3
    const/4 p0, -0x1

    return p0
.end method

.method public static isFunctionOfArity(Ljava/lang/Object;I)Z
    .registers 3

    .line 336
    instance-of v0, p0, Lnicoid/network238/kotlin/Function;

    if-eqz v0, :cond_0

    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeIntrinsics;->getFunctionArity(Ljava/lang/Object;)I

    move-result p0

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static sanitizeStackTrace(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .registers 2

    .line 17
    const-class v0, Lnicoid/network238/kotlin/jvm/internal/TypeIntrinsics;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->sanitizeStackTrace(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/lang/Throwable;

    move-result-object p0

    return-object p0
.end method

.method public static throwCce(Ljava/lang/ClassCastException;)Ljava/lang/ClassCastException;
    .registers 1

    .line 30
    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeIntrinsics;->sanitizeStackTrace(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object p0

    check-cast p0, Ljava/lang/ClassCastException;

    throw p0
.end method

.method public static throwCce(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3

    if-nez p0, :cond_0

    .line 21
    const-string p0, "null"

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    .line 22
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, " cannot be cast to "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeIntrinsics;->throwCce(Ljava/lang/String;)V

    return-void
.end method

.method public static throwCce(Ljava/lang/String;)V
    .registers 2

    .line 26
    new-instance v0, Ljava/lang/ClassCastException;

    invoke-direct {v0, p0}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lnicoid/network238/kotlin/jvm/internal/TypeIntrinsics;->throwCce(Ljava/lang/ClassCastException;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0
.end method
