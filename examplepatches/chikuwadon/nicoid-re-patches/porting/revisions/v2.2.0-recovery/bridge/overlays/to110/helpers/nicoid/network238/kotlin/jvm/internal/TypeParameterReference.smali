.class public final Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/reflect/KTypeParameter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference$Companion;


# instance fields
.field private volatile bounds:Ljava/util/List;

.field private final container:Ljava/lang/Object;

.field private final isReified:Z

.field private final name:Ljava/lang/String;

.field private final variance:Lnicoid/network238/kotlin/reflect/KVariance;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->Companion:Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference$Companion;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;Lnicoid/network238/kotlin/reflect/KVariance;Z)V
    .registers 5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->container:Ljava/lang/Object;

    .line 16
    iput-object p2, p0, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->name:Ljava/lang/String;

    .line 17
    iput-object p3, p0, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->variance:Lnicoid/network238/kotlin/reflect/KVariance;

    .line 18
    iput-boolean p4, p0, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->isReified:Z

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 37
    instance-of v0, p1, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->container:Ljava/lang/Object;

    check-cast p1, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;

    iget-object v1, p1, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->container:Ljava/lang/Object;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .line 16
    iget-object v0, p0, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getVariance()Lnicoid/network238/kotlin/reflect/KVariance;
    .registers 2

    .line 17
    iget-object v0, p0, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->variance:Lnicoid/network238/kotlin/reflect/KVariance;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .line 40
    iget-object v0, p0, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->container:Ljava/lang/Object;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public final setUpperBounds(Ljava/util/List;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    iget-object v0, p0, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->bounds:Ljava/util/List;

    if-nez v0, :cond_0

    .line 33
    iput-object p1, p0, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->bounds:Ljava/util/List;

    return-void

    .line 30
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Upper bounds of type parameter \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\' have already been initialized."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 42
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;->Companion:Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference$Companion;->toString(Lnicoid/network238/kotlin/reflect/KTypeParameter;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
