.class public abstract Lnicoid/network238/kotlin/collections/AbstractMutableList;
.super Ljava/util/AbstractList;
.source "SourceFile"

# interfaces
.implements Ljava/util/List;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMutableList;


# direct methods
.method protected constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getSize()I
.end method

.method public final bridge remove(I)Ljava/lang/Object;
    .registers 2

    .line 15
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->removeAt(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public abstract removeAt(I)Ljava/lang/Object;
.end method

.method public final bridge size()I
    .registers 2

    .line 15
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->getSize()I

    move-result v0

    return v0
.end method
