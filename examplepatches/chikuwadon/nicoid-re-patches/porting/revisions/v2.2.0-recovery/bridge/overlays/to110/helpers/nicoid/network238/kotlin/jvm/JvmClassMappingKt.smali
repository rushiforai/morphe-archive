.class public abstract Lnicoid/network238/kotlin/jvm/JvmClassMappingKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final getJavaClass(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Class;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    check-cast p0, Lnicoid/network238/kotlin/jvm/internal/ClassBasedDeclarationContainer;

    invoke-interface {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassBasedDeclarationContainer;->getJClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public static final getJavaObjectType(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Class;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    check-cast p0, Lnicoid/network238/kotlin/jvm/internal/ClassBasedDeclarationContainer;

    invoke-interface {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassBasedDeclarationContainer;->getJClass()Ljava/lang/Class;

    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 62
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v1, "short"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 66
    const-class p0, Ljava/lang/Short;

    goto :goto_1

    .line 62
    :sswitch_1
    const-string v1, "float"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 68
    const-class p0, Ljava/lang/Float;

    goto :goto_1

    .line 62
    :sswitch_2
    const-string v1, "boolean"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 63
    const-class p0, Ljava/lang/Boolean;

    goto :goto_1

    .line 62
    :sswitch_3
    const-string v1, "void"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 71
    const-class p0, Ljava/lang/Void;

    goto :goto_1

    .line 62
    :sswitch_4
    const-string v1, "long"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 69
    const-class p0, Ljava/lang/Long;

    goto :goto_1

    .line 62
    :sswitch_5
    const-string v1, "char"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 64
    const-class p0, Ljava/lang/Character;

    goto :goto_1

    .line 62
    :sswitch_6
    const-string v1, "byte"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 65
    const-class p0, Ljava/lang/Byte;

    goto :goto_1

    .line 62
    :sswitch_7
    const-string v1, "int"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 67
    const-class p0, Ljava/lang/Integer;

    goto :goto_1

    .line 62
    :sswitch_8
    const-string v1, "double"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    :goto_0
    goto :goto_1

    .line 70
    :cond_2
    const-class p0, Ljava/lang/Double;

    :goto_1
    return-object p0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x4f08842f -> :sswitch_8
        0x197ef -> :sswitch_7
        0x2e6108 -> :sswitch_6
        0x2e9356 -> :sswitch_5
        0x32c67c -> :sswitch_4
        0x375194 -> :sswitch_3
        0x3db6c28 -> :sswitch_2
        0x5d0225c -> :sswitch_1
        0x685847c -> :sswitch_0
    .end sparse-switch
.end method

.method public static final getKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 81
    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p0

    return-object p0
.end method
