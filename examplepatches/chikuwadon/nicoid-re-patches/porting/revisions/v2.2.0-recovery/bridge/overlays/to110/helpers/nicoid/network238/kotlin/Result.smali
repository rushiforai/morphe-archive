.class public final Lnicoid/network238/kotlin/Result;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/Result$Companion;,
        Lnicoid/network238/kotlin/Result$Failure;
    }
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/kotlin/Result$Companion;


# instance fields
.field private final value:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/kotlin/Result$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/Result$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/kotlin/Result;->Companion:Lnicoid/network238/kotlin/Result$Companion;

    return-void
.end method

.method private synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/Result;->value:Ljava/lang/Object;

    return-void
.end method

.method public static final synthetic box-impl(Ljava/lang/Object;)Lnicoid/network238/kotlin/Result;
    .registers 2

    new-instance v0, Lnicoid/network238/kotlin/Result;

    invoke-direct {v0, p0}, Lnicoid/network238/kotlin/Result;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public static constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 1

    return-object p0
.end method

.method public static equals-impl(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3

    instance-of v0, p1, Lnicoid/network238/kotlin/Result;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/kotlin/Result;

    invoke-virtual {p1}, Lnicoid/network238/kotlin/Result;->unbox-impl()Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public static hashCode-impl(Ljava/lang/Object;)I
    .registers 1

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public static toString-impl(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    .line 75
    instance-of v0, p0, Lnicoid/network238/kotlin/Result$Failure;

    if-eqz v0, :cond_0

    check-cast p0, Lnicoid/network238/kotlin/Result$Failure;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/Result$Failure;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 76
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Success("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    const/16 v0, 0x29

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3

    iget-object v0, p0, Lnicoid/network238/kotlin/Result;->value:Ljava/lang/Object;

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/Result;->equals-impl(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public hashCode()I
    .registers 2

    iget-object v0, p0, Lnicoid/network238/kotlin/Result;->value:Ljava/lang/Object;

    invoke-static {v0}, Lnicoid/network238/kotlin/Result;->hashCode-impl(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 73
    iget-object v0, p0, Lnicoid/network238/kotlin/Result;->value:Ljava/lang/Object;

    invoke-static {v0}, Lnicoid/network238/kotlin/Result;->toString-impl(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final synthetic unbox-impl()Ljava/lang/Object;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/kotlin/Result;->value:Ljava/lang/Object;

    return-object v0
.end method
