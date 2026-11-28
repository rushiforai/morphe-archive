.class public final Lcom/google/common/base/Functions;
.super Ljava/lang/Object;
.source "Functions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/base/Functions$ToStringFunction;,
        Lcom/google/common/base/Functions$IdentityFunction;,
        Lcom/google/common/base/Functions$FunctionForMapNoDefault;,
        Lcom/google/common/base/Functions$ForMapWithDefault;,
        Lcom/google/common/base/Functions$FunctionComposition;,
        Lcom/google/common/base/Functions$PredicateFunction;,
        Lcom/google/common/base/Functions$ConstantFunction;,
        Lcom/google/common/base/Functions$SupplierFunction;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static compose(Lcom/google/common/base/Function;Lcom/google/common/base/Function;)Lcom/google/common/base/Function;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "g",
            "f"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Ljava/lang/Object;",
            "B:",
            "Ljava/lang/Object;",
            "C:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/base/Function<",
            "TB;TC;>;",
            "Lcom/google/common/base/Function<",
            "TA;+TB;>;)",
            "Lcom/google/common/base/Function<",
            "TA;TC;>;"
        }
    .end annotation

    .line 250
    new-instance v0, Lcom/google/common/base/Functions$FunctionComposition;

    invoke-direct {v0, p0, p1}, Lcom/google/common/base/Functions$FunctionComposition;-><init>(Lcom/google/common/base/Function;Lcom/google/common/base/Function;)V

    return-object v0
.end method

.method public static constant(Ljava/lang/Object;)Lcom/google/common/base/Function;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(TE;)",
            "Lcom/google/common/base/Function<",
            "Ljava/lang/Object;",
            "TE;>;"
        }
    .end annotation

    .line 357
    new-instance v0, Lcom/google/common/base/Functions$ConstantFunction;

    invoke-direct {v0, p0}, Lcom/google/common/base/Functions$ConstantFunction;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public static forMap(Ljava/util/Map;)Lcom/google/common/base/Function;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "map"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "TK;TV;>;)",
            "Lcom/google/common/base/Function<",
            "TK;TV;>;"
        }
    .end annotation

    .line 130
    new-instance v0, Lcom/google/common/base/Functions$FunctionForMapNoDefault;

    invoke-direct {v0, p0}, Lcom/google/common/base/Functions$FunctionForMapNoDefault;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public static forMap(Ljava/util/Map;Ljava/lang/Object;)Lcom/google/common/base/Function;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "map",
            "defaultValue"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "TK;+TV;>;TV;)",
            "Lcom/google/common/base/Function<",
            "TK;TV;>;"
        }
    .end annotation

    .line 150
    new-instance v0, Lcom/google/common/base/Functions$ForMapWithDefault;

    invoke-direct {v0, p0, p1}, Lcom/google/common/base/Functions$ForMapWithDefault;-><init>(Ljava/util/Map;Ljava/lang/Object;)V

    return-object v0
.end method

.method public static forPredicate(Lcom/google/common/base/Predicate;)Lcom/google/common/base/Function;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "predicate"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/base/Predicate<",
            "TT;>;)",
            "Lcom/google/common/base/Function<",
            "TT;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 304
    new-instance v0, Lcom/google/common/base/Functions$PredicateFunction;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/base/Functions$PredicateFunction;-><init>(Lcom/google/common/base/Predicate;Lcom/google/common/base/Functions$1;)V

    return-object v0
.end method

.method public static forSupplier(Lcom/google/common/base/Supplier;)Lcom/google/common/base/Function;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "supplier"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<F:",
            "Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/base/Supplier<",
            "TT;>;)",
            "Lcom/google/common/base/Function<",
            "TF;TT;>;"
        }
    .end annotation

    .line 407
    new-instance v0, Lcom/google/common/base/Functions$SupplierFunction;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/base/Functions$SupplierFunction;-><init>(Lcom/google/common/base/Supplier;Lcom/google/common/base/Functions$1;)V

    return-object v0
.end method

.method public static identity()Lcom/google/common/base/Function;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/common/base/Function<",
            "TE;TE;>;"
        }
    .end annotation

    .line 96
    sget-object v0, Lcom/google/common/base/Functions$IdentityFunction;->INSTANCE:Lcom/google/common/base/Functions$IdentityFunction;

    return-object v0
.end method

.method public static toStringFunction()Lcom/google/common/base/Function;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Function<",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 68
    sget-object v0, Lcom/google/common/base/Functions$ToStringFunction;->INSTANCE:Lcom/google/common/base/Functions$ToStringFunction;

    return-object v0
.end method
