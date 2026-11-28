.class abstract Lnicoid/network238/kotlin/collections/SetsKt__SetsJVMKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final setOf(Ljava/lang/Object;)Ljava/util/Set;
    .registers 1

    .line 20
    invoke-static {p0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method
