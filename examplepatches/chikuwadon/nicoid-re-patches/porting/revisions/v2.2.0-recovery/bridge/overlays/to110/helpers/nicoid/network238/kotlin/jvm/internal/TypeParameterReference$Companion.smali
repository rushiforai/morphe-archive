.class public final Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference$Companion$WhenMappings;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final toString(Lnicoid/network238/kotlin/reflect/KTypeParameter;)Ljava/lang/String;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    invoke-interface {p1}, Lnicoid/network238/kotlin/reflect/KTypeParameter;->getVariance()Lnicoid/network238/kotlin/reflect/KVariance;

    move-result-object v1

    sget-object v2, Lnicoid/network238/kotlin/jvm/internal/TypeParameterReference$Companion$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v1, v2, v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 51
    const-string v1, "out "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 47
    :cond_0
    new-instance p1, Lnicoid/network238/kotlin/NoWhenBranchMatchedException;

    invoke-direct {p1}, Lnicoid/network238/kotlin/NoWhenBranchMatchedException;-><init>()V

    throw p1

    .line 50
    :cond_1
    const-string v1, "in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 47
    :cond_2
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    .line 54
    :goto_0
    invoke-interface {p1}, Lnicoid/network238/kotlin/reflect/KTypeParameter;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
