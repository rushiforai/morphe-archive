.class public Lkotlin/jvm/internal/FunctionReference;
.super Lkotlin/jvm/internal/CallableReference;
.source "FunctionReference.java"

# interfaces
.implements Lkotlin/jvm/internal/FunctionBase;
.implements Lkotlin/reflect/KFunction;


# instance fields
.field private final arity:I


# direct methods
.method public constructor <init>(I)V
    .registers 9

    .line 17
    sget-object v2, Lkotlin/jvm/internal/FunctionReference;->NO_RECEIVER:Ljava/lang/Object;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    invoke-direct/range {v0 .. v6}, Lkotlin/jvm/internal/FunctionReference;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(ILjava/lang/Object;)V
    .registers 10

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    .line 22
    invoke-direct/range {v0 .. v6}, Lkotlin/jvm/internal/FunctionReference;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 14

    const/4 v0, 0x1

    and-int/2addr p6, v0

    if-ne p6, v0, :cond_5

    goto :goto_6

    :cond_5
    const/4 v0, 0x0

    :goto_6
    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, v0

    .line 27
    invoke-direct/range {v1 .. v6}, Lkotlin/jvm/internal/CallableReference;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 28
    iput p1, v1, Lkotlin/jvm/internal/FunctionReference;->arity:I

    return-void
.end method


# virtual methods
.method protected computeReflected()Lkotlin/reflect/KCallable;
    .registers 1

    .line 45
    invoke-static {p0}, Lkotlin/jvm/internal/Reflection;->function(Lkotlin/jvm/internal/FunctionReference;)Lkotlin/reflect/KFunction;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p1, p0, :cond_4

    return v0

    .line 81
    :cond_4
    instance-of v1, p1, Lkotlin/jvm/internal/FunctionReference;

    const/4 v2, 0x0

    if-eqz v1, :cond_45

    .line 82
    check-cast p1, Lkotlin/jvm/internal/FunctionReference;

    .line 84
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lkotlin/jvm/internal/FunctionReference;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    .line 85
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getSignature()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lkotlin/jvm/internal/FunctionReference;->getSignature()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    .line 86
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getBoundReceiver()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1}, Lkotlin/jvm/internal/FunctionReference;->getBoundReceiver()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    .line 87
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getOwner()Lkotlin/reflect/KDeclarationContainer;

    move-result-object p0

    invoke-virtual {p1}, Lkotlin/jvm/internal/FunctionReference;->getOwner()Lkotlin/reflect/KDeclarationContainer;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_44

    return v0

    :cond_44
    return v2

    .line 89
    :cond_45
    instance-of v0, p1, Lkotlin/reflect/KFunction;

    if-eqz v0, :cond_52

    .line 90
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->compute()Lkotlin/reflect/KCallable;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_52
    return v2
.end method

.method public getArity()I
    .registers 1

    .line 33
    iget p0, p0, Lkotlin/jvm/internal/FunctionReference;->arity:I

    return p0
.end method

.method protected bridge synthetic getReflected()Lkotlin/reflect/KCallable;
    .registers 1

    .line 12
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getReflected()Lkotlin/reflect/KFunction;

    move-result-object p0

    return-object p0
.end method

.method protected getReflected()Lkotlin/reflect/KFunction;
    .registers 1

    .line 39
    invoke-super {p0}, Lkotlin/jvm/internal/CallableReference;->getReflected()Lkotlin/reflect/KCallable;

    move-result-object p0

    check-cast p0, Lkotlin/reflect/KFunction;

    return-object p0
.end method

.method public hashCode()I
    .registers 3

    .line 97
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getOwner()Lkotlin/reflect/KDeclarationContainer;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    goto :goto_12

    :cond_8
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getOwner()Lkotlin/reflect/KDeclarationContainer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    :goto_12
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getSignature()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public isExternal()Z
    .registers 1

    .line 57
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getReflected()Lkotlin/reflect/KFunction;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/reflect/KFunction;->isExternal()Z

    move-result p0

    return p0
.end method

.method public isInfix()Z
    .registers 1

    .line 69
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getReflected()Lkotlin/reflect/KFunction;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/reflect/KFunction;->isInfix()Z

    move-result p0

    return p0
.end method

.method public isInline()Z
    .registers 1

    .line 51
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getReflected()Lkotlin/reflect/KFunction;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/reflect/KFunction;->isInline()Z

    move-result p0

    return p0
.end method

.method public isOperator()Z
    .registers 1

    .line 63
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getReflected()Lkotlin/reflect/KFunction;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/reflect/KFunction;->isOperator()Z

    move-result p0

    return p0
.end method

.method public isSuspend()Z
    .registers 1

    .line 75
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getReflected()Lkotlin/reflect/KFunction;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/reflect/KFunction;->isSuspend()Z

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 102
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->compute()Lkotlin/reflect/KCallable;

    move-result-object v0

    if-eq v0, p0, :cond_b

    .line 104
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 108
    :cond_b
    const-string v0, "<init>"

    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    const-string p0, "constructor (Kotlin reflection is not available)"

    return-object p0

    :cond_1a
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "function "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    invoke-virtual {p0}, Lkotlin/jvm/internal/FunctionReference;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " (Kotlin reflection is not available)"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
