.class final Lcom/google/common/reflect/Types$TypeVariableImpl;
.super Ljava/lang/Object;
.source "Types.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/reflect/Types;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TypeVariableImpl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D::",
        "Ljava/lang/reflect/GenericDeclaration;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final bounds:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation
.end field

.field private final genericDeclaration:Ljava/lang/reflect/GenericDeclaration;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TD;"
        }
    .end annotation
.end field

.field private final name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/reflect/GenericDeclaration;Ljava/lang/String;[Ljava/lang/reflect/Type;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "genericDeclaration",
            "name",
            "bounds"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/reflect/Type;",
            ")V"
        }
    .end annotation

    .line 424
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 425
    const-string v0, "bound for type variable"

    # invokes: Lcom/google/common/reflect/Types;->disallowPrimitiveType([Ljava/lang/reflect/Type;Ljava/lang/String;)V
    invoke-static {p3, v0}, Lcom/google/common/reflect/Types;->access$200([Ljava/lang/reflect/Type;Ljava/lang/String;)V

    .line 426
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/reflect/GenericDeclaration;

    iput-object p1, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->genericDeclaration:Ljava/lang/reflect/GenericDeclaration;

    .line 427
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->name:Ljava/lang/String;

    .line 428
    invoke-static {p3}, Lcom/google/common/collect/ImmutableList;->copyOf([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->bounds:Lcom/google/common/collect/ImmutableList;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    .line 463
    sget-boolean v0, Lcom/google/common/reflect/Types$NativeTypeVariableEquals;->NATIVE_TYPE_VARIABLE_ONLY:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    .line 466
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/reflect/Proxy;->isProxyClass(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 467
    invoke-static {p1}, Ljava/lang/reflect/Proxy;->getInvocationHandler(Ljava/lang/Object;)Ljava/lang/reflect/InvocationHandler;

    move-result-object v0

    instance-of v0, v0, Lcom/google/common/reflect/Types$TypeVariableInvocationHandler;

    if-eqz v0, :cond_0

    .line 469
    invoke-static {p1}, Ljava/lang/reflect/Proxy;->getInvocationHandler(Ljava/lang/Object;)Ljava/lang/reflect/InvocationHandler;

    move-result-object p1

    check-cast p1, Lcom/google/common/reflect/Types$TypeVariableInvocationHandler;

    .line 470
    # getter for: Lcom/google/common/reflect/Types$TypeVariableInvocationHandler;->typeVariableImpl:Lcom/google/common/reflect/Types$TypeVariableImpl;
    invoke-static {p1}, Lcom/google/common/reflect/Types$TypeVariableInvocationHandler;->access$500(Lcom/google/common/reflect/Types$TypeVariableInvocationHandler;)Lcom/google/common/reflect/Types$TypeVariableImpl;

    move-result-object p1

    .line 471
    iget-object v0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->name:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/common/reflect/Types$TypeVariableImpl;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->genericDeclaration:Ljava/lang/reflect/GenericDeclaration;

    .line 472
    invoke-virtual {p1}, Lcom/google/common/reflect/Types$TypeVariableImpl;->getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->bounds:Lcom/google/common/collect/ImmutableList;

    iget-object p1, p1, Lcom/google/common/reflect/Types$TypeVariableImpl;->bounds:Lcom/google/common/collect/ImmutableList;

    .line 473
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableList;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    return v1

    :cond_0
    return v2

    .line 478
    :cond_1
    instance-of v0, p1, Ljava/lang/reflect/TypeVariable;

    if-eqz v0, :cond_2

    .line 479
    check-cast p1, Ljava/lang/reflect/TypeVariable;

    .line 480
    iget-object v0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->name:Ljava/lang/String;

    invoke-interface {p1}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object p0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->genericDeclaration:Ljava/lang/reflect/GenericDeclaration;

    .line 481
    invoke-interface {p1}, Ljava/lang/reflect/TypeVariable;->getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    return v1

    :cond_2
    return v2
.end method

.method public getBounds()[Ljava/lang/reflect/Type;
    .registers 1
    .annotation runtime Lcom/google/errorprone/annotations/Keep;
    .end annotation

    .line 433
    iget-object p0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->bounds:Lcom/google/common/collect/ImmutableList;

    # invokes: Lcom/google/common/reflect/Types;->toArray(Ljava/util/Collection;)[Ljava/lang/reflect/Type;
    invoke-static {p0}, Lcom/google/common/reflect/Types;->access$300(Ljava/util/Collection;)[Ljava/lang/reflect/Type;

    move-result-object p0

    return-object p0
.end method

.method public getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;
    .registers 1
    .annotation runtime Lcom/google/errorprone/annotations/Keep;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TD;"
        }
    .end annotation

    .line 438
    iget-object p0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->genericDeclaration:Ljava/lang/reflect/GenericDeclaration;

    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .registers 1
    .annotation runtime Lcom/google/errorprone/annotations/Keep;
    .end annotation

    .line 443
    iget-object p0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->name:Ljava/lang/String;

    return-object p0
.end method

.method public getTypeName()Ljava/lang/String;
    .registers 1
    .annotation runtime Lcom/google/errorprone/annotations/Keep;
    .end annotation

    .line 448
    iget-object p0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->name:Ljava/lang/String;

    return-object p0
.end method

.method public hashCode()I
    .registers 2

    .line 458
    iget-object v0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->genericDeclaration:Ljava/lang/reflect/GenericDeclaration;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-object p0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->name:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    xor-int/2addr v0, p0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 453
    iget-object p0, p0, Lcom/google/common/reflect/Types$TypeVariableImpl;->name:Ljava/lang/String;

    return-object p0
.end method
