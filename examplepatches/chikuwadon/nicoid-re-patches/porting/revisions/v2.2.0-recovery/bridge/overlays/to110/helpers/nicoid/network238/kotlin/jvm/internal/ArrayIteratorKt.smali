.class public abstract Lnicoid/network238/kotlin/jvm/internal/ArrayIteratorKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final iterator([Ljava/lang/Object;)Ljava/util/Iterator;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    new-instance v0, Lnicoid/network238/kotlin/jvm/internal/ArrayIterator;

    invoke-direct {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/ArrayIterator;-><init>([Ljava/lang/Object;)V

    return-object v0
.end method
