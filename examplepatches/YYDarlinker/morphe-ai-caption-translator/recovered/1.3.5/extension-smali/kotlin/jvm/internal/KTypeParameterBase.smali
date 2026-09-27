.class public abstract Lkotlin/jvm/internal/KTypeParameterBase;
.super Ljava/lang/Object;
.source "KTypeParameterBase.kt"

# interfaces
.implements Lkotlin/reflect/KTypeParameter;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008&\u0018\u00002\u00020\u0001B\u0015\u0008F\u0012\n\u0010\u0002\u001a\u00060\u0003j\u0002`\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0014\u0010\u000f\u001a\u00020\u00102\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0003H\u0096\u0082\u0004J\n\u0010\u0012\u001a\u00020\u0013H\u0096\u0080\u0004J\n\u0010\u0014\u001a\u00020\u0015H\u0096\u0080\u0004R\u0019\u0010\u0002\u001a\u00060\u0003j\u0002`\u0004X\u0080\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u001d\u0010\t\u001a\u0004\u0018\u00010\n8@X\u0080\u0084\n\u00a2\u0006\u000c\n\u0004\u0008\r\u0010\u000e\u001a\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\u0016"
    }
    d2 = {
        "Lkotlin/jvm/internal/KTypeParameterBase;",
        "Lkotlin/reflect/KTypeParameter;",
        "container",
        "",
        "Lkotlin/jvm/internal/TypeParameterContainer;",
        "<init>",
        "(Ljava/lang/Object;)V",
        "getContainer$kotlin_stdlib",
        "()Ljava/lang/Object;",
        "javaContainingDeclaration",
        "Ljava/lang/reflect/GenericDeclaration;",
        "getJavaContainingDeclaration$kotlin_stdlib",
        "()Ljava/lang/reflect/GenericDeclaration;",
        "javaContainingDeclaration$delegate",
        "Lkotlin/Lazy;",
        "equals",
        "",
        "other",
        "hashCode",
        "",
        "toString",
        "",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final container:Ljava/lang/Object;

.field private final javaContainingDeclaration$delegate:Lkotlin/Lazy;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3

    const-string v0, "container"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lkotlin/jvm/internal/KTypeParameterBase;->container:Ljava/lang/Object;

    .line 18
    sget-object p1, Lkotlin/LazyThreadSafetyMode;->PUBLICATION:Lkotlin/LazyThreadSafetyMode;

    new-instance v0, Lkotlin/jvm/internal/KTypeParameterBase$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lkotlin/jvm/internal/KTypeParameterBase$$ExternalSyntheticLambda0;-><init>(Lkotlin/jvm/internal/KTypeParameterBase;)V

    invoke-static {p1, v0}, Lkotlin/LazyKt;->lazy(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lkotlin/jvm/internal/KTypeParameterBase;->javaContainingDeclaration$delegate:Lkotlin/Lazy;

    return-void
.end method

.method static final javaContainingDeclaration_delegate$lambda$0(Lkotlin/jvm/internal/KTypeParameterBase;)Ljava/lang/reflect/GenericDeclaration;
    .registers 3

    .line 19
    iget-object p0, p0, Lkotlin/jvm/internal/KTypeParameterBase;->container:Ljava/lang/Object;

    instance-of v0, p0, Lkotlin/jvm/internal/KotlinGenericDeclaration;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    check-cast p0, Lkotlin/jvm/internal/KotlinGenericDeclaration;

    goto :goto_b

    :cond_a
    move-object p0, v1

    :goto_b
    if-eqz p0, :cond_12

    invoke-interface {p0}, Lkotlin/jvm/internal/KotlinGenericDeclaration;->findJavaDeclaration()Ljava/lang/reflect/GenericDeclaration;

    move-result-object p0

    return-object p0

    :cond_12
    return-object v1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 23
    instance-of v0, p1, Lkotlin/jvm/internal/KTypeParameterBase;

    if-eqz v0, :cond_20

    invoke-virtual {p0}, Lkotlin/jvm/internal/KTypeParameterBase;->getName()Ljava/lang/String;

    move-result-object v0

    check-cast p1, Lkotlin/jvm/internal/KTypeParameterBase;

    invoke-virtual {p1}, Lkotlin/jvm/internal/KTypeParameterBase;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    iget-object p0, p0, Lkotlin/jvm/internal/KTypeParameterBase;->container:Ljava/lang/Object;

    iget-object p1, p1, Lkotlin/jvm/internal/KTypeParameterBase;->container:Ljava/lang/Object;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_20

    const/4 p0, 0x1

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method

.method public final getContainer$kotlin_stdlib()Ljava/lang/Object;
    .registers 1

    .line 16
    iget-object p0, p0, Lkotlin/jvm/internal/KTypeParameterBase;->container:Ljava/lang/Object;

    return-object p0
.end method

.method public final getJavaContainingDeclaration$kotlin_stdlib()Ljava/lang/reflect/GenericDeclaration;
    .registers 1

    .line 18
    iget-object p0, p0, Lkotlin/jvm/internal/KTypeParameterBase;->javaContainingDeclaration$delegate:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/reflect/GenericDeclaration;

    return-object p0
.end method

.method public hashCode()I
    .registers 2

    .line 26
    iget-object v0, p0, Lkotlin/jvm/internal/KTypeParameterBase;->container:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {p0}, Lkotlin/jvm/internal/KTypeParameterBase;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 29
    sget-object v0, Lkotlin/jvm/internal/TypeParameterReference;->Companion:Lkotlin/jvm/internal/TypeParameterReference$Companion;

    check-cast p0, Lkotlin/reflect/KTypeParameter;

    invoke-virtual {v0, p0}, Lkotlin/jvm/internal/TypeParameterReference$Companion;->toString(Lkotlin/reflect/KTypeParameter;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
