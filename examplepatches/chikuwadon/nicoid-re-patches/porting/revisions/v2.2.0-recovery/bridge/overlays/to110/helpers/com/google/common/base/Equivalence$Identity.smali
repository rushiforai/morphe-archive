.class final Lcom/google/common/base/Equivalence$Identity;
.super Lcom/google/common/base/Equivalence;
.source "Equivalence.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/Equivalence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Identity"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/base/Equivalence<",
        "Ljava/lang/Object;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field static final INSTANCE:Lcom/google/common/base/Equivalence$Identity;

.field private static final serialVersionUID:J = 0x1L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 393
    new-instance v0, Lcom/google/common/base/Equivalence$Identity;

    invoke-direct {v0}, Lcom/google/common/base/Equivalence$Identity;-><init>()V

    sput-object v0, Lcom/google/common/base/Equivalence$Identity;->INSTANCE:Lcom/google/common/base/Equivalence$Identity;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 391
    invoke-direct {p0}, Lcom/google/common/base/Equivalence;-><init>()V

    return-void
.end method

.method private readResolve()Ljava/lang/Object;
    .registers 1

    .line 406
    sget-object p0, Lcom/google/common/base/Equivalence$Identity;->INSTANCE:Lcom/google/common/base/Equivalence$Identity;

    return-object p0
.end method


# virtual methods
.method protected doEquivalent(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "a",
            "b"
        }
    .end annotation

    const/4 p0, 0x0

    return p0
.end method

.method protected doHash(Ljava/lang/Object;)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 402
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
