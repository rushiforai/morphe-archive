.class public final Lnicoid/network238/kotlin/jvm/internal/TypeReference;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/reflect/KType;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/jvm/internal/TypeReference$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/kotlin/jvm/internal/TypeReference$Companion;


# instance fields
.field private final arguments:Ljava/util/List;

.field private final classifier:Lnicoid/network238/kotlin/reflect/KClassifier;

.field private final flags:I

.field private final platformTypeUpperBound:Lnicoid/network238/kotlin/reflect/KType;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/kotlin/jvm/internal/TypeReference$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/TypeReference$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->Companion:Lnicoid/network238/kotlin/jvm/internal/TypeReference$Companion;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Lnicoid/network238/kotlin/reflect/KType;I)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->classifier:Lnicoid/network238/kotlin/reflect/KClassifier;

    .line 13
    iput-object p2, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->arguments:Ljava/util/List;

    .line 14
    iput-object p3, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->platformTypeUpperBound:Lnicoid/network238/kotlin/reflect/KType;

    .line 15
    iput p4, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->flags:I

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Z)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;-><init>(Lnicoid/network238/kotlin/reflect/KClassifier;Ljava/util/List;Lnicoid/network238/kotlin/reflect/KType;I)V

    return-void
.end method

.method private final asString(Z)Ljava/lang/String;
    .registers 13

    .line 41
    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getClassifier()Lnicoid/network238/kotlin/reflect/KClassifier;

    move-result-object v0

    instance-of v1, v0, Lnicoid/network238/kotlin/reflect/KClass;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    check-cast v0, Lnicoid/network238/kotlin/reflect/KClass;

    goto :goto_0

    :cond_0
    move-object v0, v2

    :goto_0
    if-eqz v0, :cond_1

    invoke-static {v0}, Lnicoid/network238/kotlin/jvm/JvmClassMappingKt;->getJavaClass(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object v2

    :cond_1
    if-nez v2, :cond_2

    .line 43
    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getClassifier()Lnicoid/network238/kotlin/reflect/KClassifier;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 44
    :cond_2
    iget v0, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_3

    const-string p1, "nicoid.network238.kotlin.Nothing"

    goto :goto_1

    .line 45
    :cond_3
    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0, v2}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getArrayClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_4
    if-eqz p1, :cond_5

    .line 46
    invoke-virtual {v2}, Ljava/lang/Class;->isPrimitive()Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getClassifier()Lnicoid/network238/kotlin/reflect/KClassifier;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p1, Lnicoid/network238/kotlin/reflect/KClass;

    invoke-static {p1}, Lnicoid/network238/kotlin/jvm/JvmClassMappingKt;->getJavaObjectType(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 47
    :cond_5
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    .line 50
    :goto_1
    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getArguments()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_6

    move-object v0, v1

    goto :goto_2

    .line 51
    :cond_6
    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getArguments()Ljava/util/List;

    move-result-object v2

    new-instance v8, Lnicoid/network238/kotlin/jvm/internal/TypeReference$0;

    invoke-direct {v8, p0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference$0;-><init>(Lnicoid/network238/kotlin/jvm/internal/TypeReference;)V

    const/16 v9, 0x18

    const/4 v10, 0x0

    const-string v3, ", "

    const-string v4, "<"

    const-string v5, ">"

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v2 .. v10}, Lnicoid/network238/kotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lnicoid/network238/kotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 52
    :goto_2
    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->isMarkedNullable()Z

    move-result v2

    const-string v3, "?"

    if-eqz v2, :cond_7

    move-object v1, v3

    .line 54
    :cond_7
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 56
    iget-object v0, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->platformTypeUpperBound:Lnicoid/network238/kotlin/reflect/KType;

    .line 57
    instance-of v1, v0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;

    if-eqz v1, :cond_a

    .line 58
    check-cast v0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->asString(Z)Ljava/lang/String;

    move-result-object v0

    .line 59
    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    goto :goto_3

    .line 64
    :cond_8
    invoke-virtual {p1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    const-string v0, "!"

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 65
    :cond_9
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ".."

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 v0, 0x29

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_a
    :goto_3
    return-object p1
.end method

.method static final asString$lambda$0(Lnicoid/network238/kotlin/jvm/internal/TypeReference;Lnicoid/network238/kotlin/reflect/KTypeProjection;)Ljava/lang/CharSequence;
    .registers 2

    const/4 p0, 0x0

    throw p0
.end method

.method private final getArrayClassName(Ljava/lang/Class;)Ljava/lang/String;
    .registers 3

    .line 74
    const-class v0, [Z

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 83
    const-string p1, "nicoid.network238.kotlin.BooleanArray"

    return-object p1

    .line 75
    :cond_0
    const-class v0, [C

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 83
    const-string p1, "nicoid.network238.kotlin.CharArray"

    return-object p1

    .line 76
    :cond_1
    const-class v0, [B

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 83
    const-string p1, "nicoid.network238.kotlin.ByteArray"

    return-object p1

    .line 77
    :cond_2
    const-class v0, [S

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 83
    const-string p1, "nicoid.network238.kotlin.ShortArray"

    return-object p1

    .line 78
    :cond_3
    const-class v0, [I

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 83
    const-string p1, "nicoid.network238.kotlin.IntArray"

    return-object p1

    .line 79
    :cond_4
    const-class v0, [F

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 83
    const-string p1, "nicoid.network238.kotlin.FloatArray"

    return-object p1

    .line 80
    :cond_5
    const-class v0, [J

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 83
    const-string p1, "nicoid.network238.kotlin.LongArray"

    return-object p1

    .line 81
    :cond_6
    const-class v0, [D

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    .line 83
    const-string p1, "nicoid.network238.kotlin.DoubleArray"

    return-object p1

    :cond_7
    const-string p1, "nicoid.network238.kotlin.Array"

    return-object p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 30
    instance-of v0, p1, Lnicoid/network238/kotlin/jvm/internal/TypeReference;

    if-eqz v0, :cond_0

    .line 31
    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getClassifier()Lnicoid/network238/kotlin/reflect/KClassifier;

    move-result-object v0

    check-cast p1, Lnicoid/network238/kotlin/jvm/internal/TypeReference;

    invoke-virtual {p1}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getClassifier()Lnicoid/network238/kotlin/reflect/KClassifier;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getArguments()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getArguments()Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->platformTypeUpperBound:Lnicoid/network238/kotlin/reflect/KType;

    iget-object v1, p1, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->platformTypeUpperBound:Lnicoid/network238/kotlin/reflect/KType;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 32
    iget v0, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->flags:I

    iget p1, p1, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->flags:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getArguments()Ljava/util/List;
    .registers 2

    .line 13
    iget-object v0, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->arguments:Ljava/util/List;

    return-object v0
.end method

.method public getClassifier()Lnicoid/network238/kotlin/reflect/KClassifier;
    .registers 2

    .line 12
    iget-object v0, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->classifier:Lnicoid/network238/kotlin/reflect/KClassifier;

    return-object v0
.end method

.method public final getFlags$kotlin_stdlib()I
    .registers 2

    .line 15
    iget v0, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->flags:I

    return v0
.end method

.method public final getPlatformTypeUpperBound$kotlin_stdlib()Lnicoid/network238/kotlin/reflect/KType;
    .registers 2

    .line 14
    iget-object v0, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->platformTypeUpperBound:Lnicoid/network238/kotlin/reflect/KType;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .line 35
    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getClassifier()Lnicoid/network238/kotlin/reflect/KClassifier;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->getArguments()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->flags:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isMarkedNullable()Z
    .registers 3

    .line 27
    iget v0, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->flags:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->asString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " (Kotlin reflection is not available)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
