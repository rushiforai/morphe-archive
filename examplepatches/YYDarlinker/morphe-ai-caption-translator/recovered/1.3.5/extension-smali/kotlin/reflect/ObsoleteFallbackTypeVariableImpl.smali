.class final Lkotlin/reflect/ObsoleteFallbackTypeVariableImpl;
.super Ljava/lang/Object;
.source "TypesJVM.kt"

# interfaces
.implements Ljava/lang/reflect/TypeVariable;
.implements Lkotlin/reflect/TypeImpl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/reflect/TypeVariable<",
        "Ljava/lang/reflect/GenericDeclaration;",
        ">;",
        "Lkotlin/reflect/TypeImpl;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTypesJVM.kt\nKotlin\n*S Kotlin\n*F\n+ 1 TypesJVM.kt\nkotlin/reflect/ObsoleteFallbackTypeVariableImpl\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n*L\n1#1,244:1\n1739#2:245\n1814#2,3:246\n37#3,2:249\n*S KotlinDebug\n*F\n+ 1 TypesJVM.kt\nkotlin/reflect/ObsoleteFallbackTypeVariableImpl\n*L\n130#1:245\n130#1:246,3\n130#1:249,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u001b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\u0008\u0003\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u00020\u0003B\u0011\u0008F\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0008\u0010\u0008\u001a\u00020\tH\u0016J\u0008\u0010\n\u001a\u00020\u0002H\u0016J\u0013\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000cH\u0016\u00a2\u0006\u0002\u0010\u000eJ\n\u0010\u000f\u001a\u00020\tH\u0096\u0080\u0004J\u0014\u0010\u0010\u001a\u00020\u00112\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u0013H\u0096\u0082\u0004J\n\u0010\u0014\u001a\u00020\u0015H\u0096\u0080\u0004J\n\u0010\u0016\u001a\u00020\tH\u0096\u0080\u0004J)\u0010\u0017\u001a\u0004\u0018\u0001H\u0018\"\u0008\u0008\u0000\u0010\u0018*\u00020\u00192\u000c\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u0002H\u00180\u001bH\u0086\u0080\u0004\u00a2\u0006\u0002\u0010\u001cJ\u0015\u0010\u001d\u001a\u0008\u0012\u0004\u0012\u00020\u00190\u000cH\u0086\u0080\u0004\u00a2\u0006\u0002\u0010\u001eJ\u0015\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020\u00190\u000cH\u0086\u0080\u0004\u00a2\u0006\u0002\u0010\u001eR\u000f\u0010\u0004\u001a\u00020\u0005X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000\u00ca\u0001\u0002\u0008!\u00a8\u0006 "
    }
    d2 = {
        "Lkotlin/reflect/ObsoleteFallbackTypeVariableImpl;",
        "Ljava/lang/reflect/TypeVariable;",
        "Ljava/lang/reflect/GenericDeclaration;",
        "Lkotlin/reflect/TypeImpl;",
        "typeParameter",
        "Lkotlin/reflect/KTypeParameter;",
        "<init>",
        "(Lkotlin/reflect/KTypeParameter;)V",
        "getName",
        "",
        "getGenericDeclaration",
        "getBounds",
        "",
        "Ljava/lang/reflect/Type;",
        "()[Ljava/lang/reflect/Type;",
        "getTypeName",
        "equals",
        "",
        "other",
        "",
        "hashCode",
        "",
        "toString",
        "getAnnotation",
        "T",
        "",
        "annotationClass",
        "Ljava/lang/Class;",
        "(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;",
        "getAnnotations",
        "()[Ljava/lang/annotation/Annotation;",
        "getDeclaredAnnotations",
        "kotlin-stdlib",
        "Lkotlin/ExperimentalStdlibApi;"
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
.field private final typeParameter:Lkotlin/reflect/KTypeParameter;


# direct methods
.method public constructor <init>(Lkotlin/reflect/KTypeParameter;)V
    .registers 3

    const-string v0, "typeParameter"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    iput-object p1, p0, Lkotlin/reflect/ObsoleteFallbackTypeVariableImpl;->typeParameter:Lkotlin/reflect/KTypeParameter;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 135
    instance-of v0, p1, Ljava/lang/reflect/TypeVariable;

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Lkotlin/reflect/ObsoleteFallbackTypeVariableImpl;->getName()Ljava/lang/String;

    move-result-object v0

    check-cast p1, Ljava/lang/reflect/TypeVariable;

    invoke-interface {p1}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Lkotlin/reflect/ObsoleteFallbackTypeVariableImpl;->getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;

    move-result-object p0

    invoke-interface {p1}, Ljava/lang/reflect/TypeVariable;->getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_24

    const/4 p0, 0x1

    return p0

    :cond_24
    const/4 p0, 0x0

    return p0
.end method

.method public final getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/annotation/Annotation;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    const-string p0, "annotationClass"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final getAnnotations()[Ljava/lang/annotation/Annotation;
    .registers 1

    const/4 p0, 0x0

    .line 148
    new-array p0, p0, [Ljava/lang/annotation/Annotation;

    return-object p0
.end method

.method public getBounds()[Ljava/lang/reflect/Type;
    .registers 4

    .line 130
    iget-object p0, p0, Lkotlin/reflect/ObsoleteFallbackTypeVariableImpl;->typeParameter:Lkotlin/reflect/KTypeParameter;

    invoke-interface {p0}, Lkotlin/reflect/KTypeParameter;->getUpperBounds()Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    .line 245
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p0, v1}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v0, Ljava/util/Collection;

    .line 246
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_19
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 247
    check-cast v1, Lkotlin/reflect/KType;

    const/4 v2, 0x1

    .line 130
    # invokes: Lkotlin/reflect/TypesJVMKt;->computeJavaType(Lkotlin/reflect/KType;Z)Ljava/lang/reflect/Type;
    invoke-static {v1, v2}, Lkotlin/reflect/TypesJVMKt;->access$computeJavaType(Lkotlin/reflect/KType;Z)Ljava/lang/reflect/Type;

    move-result-object v1

    .line 247
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_19

    .line 248
    :cond_2e
    check-cast v0, Ljava/util/List;

    .line 245
    check-cast v0, Ljava/util/Collection;

    const/4 p0, 0x0

    .line 250
    new-array p0, p0, [Ljava/lang/reflect/Type;

    invoke-interface {v0, p0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/reflect/Type;

    return-object p0
.end method

.method public final getDeclaredAnnotations()[Ljava/lang/annotation/Annotation;
    .registers 1

    const/4 p0, 0x0

    .line 151
    new-array p0, p0, [Ljava/lang/annotation/Annotation;

    return-object p0
.end method

.method public getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;
    .registers 4

    .line 125
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 126
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getGenericDeclaration() is not supported for type variables created from KType: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lkotlin/reflect/ObsoleteFallbackTypeVariableImpl;->typeParameter:Lkotlin/reflect/KTypeParameter;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ".\nUpdate kotlin-reflect dependency to 2.3.20+."

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 125
    invoke-direct {v0, p0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getName()Ljava/lang/String;
    .registers 1

    .line 122
    iget-object p0, p0, Lkotlin/reflect/ObsoleteFallbackTypeVariableImpl;->typeParameter:Lkotlin/reflect/KTypeParameter;

    invoke-interface {p0}, Lkotlin/reflect/KTypeParameter;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getTypeName()Ljava/lang/String;
    .registers 1

    .line 132
    invoke-virtual {p0}, Lkotlin/reflect/ObsoleteFallbackTypeVariableImpl;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public hashCode()I
    .registers 2

    .line 138
    invoke-virtual {p0}, Lkotlin/reflect/ObsoleteFallbackTypeVariableImpl;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    invoke-virtual {p0}, Lkotlin/reflect/ObsoleteFallbackTypeVariableImpl;->getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    xor-int/2addr p0, v0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 140
    invoke-virtual {p0}, Lkotlin/reflect/ObsoleteFallbackTypeVariableImpl;->getTypeName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
