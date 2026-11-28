.class public abstract Lnicoid/network238/kotlin/reflect/KClasses;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final cast(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    invoke-interface {p0, p1}, Lnicoid/network238/kotlin/reflect/KClass;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 26
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p1

    .line 25
    :cond_0
    new-instance p1, Ljava/lang/ClassCastException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Value cannot be cast to "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    invoke-interface {p0}, Lnicoid/network238/kotlin/reflect/KClass;->getQualifiedName()Ljava/lang/String;

    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
